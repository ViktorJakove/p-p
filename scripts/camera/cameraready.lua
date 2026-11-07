go.property("target", msg.url("/player"))

local cameraState = require("scripts.camera.camera_state")

go.property("maxLagX",0)
go.property("maxLagY",0)
go.property("lagSpeed",0)
go.property("catchupSpeed",0)

go.property("follow_speed_x", 0)
go.property("follow_speed_y", 0)

-- NOVÉ
go.property("view_w", 1280)              -- šířka záběru kamery ve world jednotkách
go.property("view_h", 720)              -- výška záběru
go.property("transition_time", 0.6)
go.property("map_offset", vmath.vector3()) -- pozice tilemap game objectu
go.property("map_scale", 1)             -- scale tilemapy, pokud není 1

local function damp(k,dt)
	return 1 - math.exp(-k * dt)
end

local ROOM_LAYER = "rooms"

local function clamp(v, a, b) return math.max(a, math.min(b, v)) end

local function build_rooms(self)
	local map = require("maps/bezjmena")
	local map_h = map.height * map.tileheight
	local s, off = self.map_scale, self.map_offset
	local rooms = {}
	for _, layer in ipairs(map.layers) do
		if layer.type == "objectgroup" and layer.name == ROOM_LAYER then
			for _, o in ipairs(layer.objects) do
				rooms[#rooms + 1] = {
					x = off.x + o.x * s,
					y = off.y + (map_h - o.y - o.height) * s,
					w = o.width * s,
					h = o.height * s,
				}
			end
		end
	end
	return rooms
end

local function room_at(rooms, p)
	for i, r in ipairs(rooms) do
		if p.x >= r.x and p.x < r.x + r.w and p.y >= r.y and p.y < r.y + r.h then
			return i
		end
	end
end

-- ořízne pozici kamery tak, aby záběr nevyšel ze screen
local function clamp_to_room(self, room, x, y)
	local hx, hy = self.view_w / 2, self.view_h / 2
	if room.w <= self.view_w then x = room.x + room.w / 2
	else x = clamp(x, room.x + hx, room.x + room.w - hx) end
	if room.h <= self.view_h then y = room.y + room.h / 2
	else y = clamp(y, room.y + hy, room.y + room.h - hy) end
	return x, y
end

function init(self)
	local p = go.get_world_position(self.target)
	self.prev = p
	self.base = vmath.vector3(p)
	self.offset = vmath.vector3()
	self.z = go.get_position().z

	self.rooms = build_rooms(self)
	self.current = room_at(self.rooms, p)
	self.transitioning = false

	local c = vmath.vector3(p)
	if self.current then
		c.x, c.y = clamp_to_room(self, self.rooms[self.current], p.x, p.y)
		self.base.x, self.base.y = c.x, c.y
	end
	c.z = self.z
	go.set_position(c)
end

local function start_transition(self, new_room, pos)
	self.current = new_room
	self.transitioning = true
	self.t = 0
	self.from = go.get_position()
	local x, y = clamp_to_room(self, self.rooms[new_room], pos.x, pos.y)
	self.to = vmath.vector3(x, y, self.z)
	msg.post(self.target, "freeze")
end

function update(self, dt)
	if dt <= 0 then return end

	local pos = go.get_world_position(self.target)

	-- přechod mezi screens
	if self.transitioning then
		self.t = self.t + dt
		local k = math.min(self.t / self.transition_time, 1)
		local e = k * k * (3 - 2 * k)               -- smoothstep
		local c = vmath.lerp(e, self.from, self.to)
		c.z = self.z
		go.set_position(c)
		self.prev = pos
		if k >= 1 then
			self.base.x, self.base.y = c.x, c.y     -- navázat sledování bez skoku
			self.offset = vmath.vector3()
			self.transitioning = false
			msg.post(self.target, "unfreeze")
		end
		return
	end

	local idx = room_at(self.rooms, pos)
	if idx and idx ~= self.current then
		start_transition(self, idx, pos)
		return
	end

	-- původní logika
	local vel = (pos-self.prev)/dt
	self.prev = pos

	self.base.x = self.base.x + (pos.x - self.base.x) * damp(self.follow_speed_x, dt)
	self.base.y = self.base.y + (pos.y - self.base.y) * damp(self.follow_speed_y, dt)

	local desired = vmath.vector3()
	local multiplicator = cameraState.lagStates[cameraState.state]
	if multiplicator then
		local speed = vmath.length(vel)
		if speed > 50 then
			local dir = vel / speed
			desired = vmath.vector3(-dir.x *multiplicator *self.maxLagX, -dir.y *multiplicator* self.maxLagY, 0)
		end
	end

	local growing = vmath.length(desired) > vmath.length(self.offset)
	local k = growing and self.lagSpeed or self.catchupSpeed
	self.offset = self.offset + (desired - self.offset) *damp(k, dt)

	local cam = self.base + self.offset
	if self.current then
		cam.x, cam.y = clamp_to_room(self, self.rooms[self.current], cam.x, cam.y)
	end
	cam.z = self.z
	go.set_position(cam)
end