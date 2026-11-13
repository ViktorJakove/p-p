local npc_data = require "scripts.npc.npc_data"
local M = {}

local states = {}

function M.getState(id)
	return states[id] or "default"
end

function M.canInteract(id)
	return M.getState(id) ~= "locked"
end

function M.getThumb(id)
	local thumbs = npc_data(id).thumbnails
	local t = thumbs[M.getState(id)] or thumbs.default
	return t[1], t[2]
end

function M.getStart(id)
	local n = npc_data(id)
	return n.start[M.getState(id)] or n.start.default
end

function M.applyEnding(id,ending)
	if ending == "END" then states[id] = "completed"
	elseif ending == "LOCK" then states[id] = "locked" end
end

return M