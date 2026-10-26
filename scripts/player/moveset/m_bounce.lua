local air = require "scripts.player.shared.air"
local M = {}

local b2bMultiplier = 1.15 

local function reflect(vars, mult)
	local n = vars.wallNormal
	if n.x == 0 and n.y == 0 then return end
	local vx, vy = vars.velocity.x, vars.velocity.y
	local dot = vx * n.x + vy * n.y
	if dot < 0 then
		vars.velocity.x = (vx - 2 * dot * n.x) * mult
		vars.velocity.y = (vy - 2 * dot * n.y) * mult
	end
end

function M.enter(vars, from)
	print("bounce")
	vars.keepX = true
	vars.cfg.gravity = vars.cfg.gravity * 2
	reflect(vars, vars.cfg.poundBounceMultiplier)
end

function M.update(vars, dt, fsm)
	reflect(vars, b2bMultiplier)
	air.apply(vars, dt)
end

function M.handle_input(vars, action_id, action, fsm)
	air.try_twirl(vars, action_id, action, fsm)
end

function M.exit(vars)
	vars.keepX = false
	vars.cfg.gravity = vars.cfg.gravity / 2
end

return M