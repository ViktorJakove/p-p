local air = require "scripts.player.shared.air"
local M = {}

local bounceSpeed = 0

function M.enter(vars,from)
	print("bounce")
	vars.keepX = true

	local dir = vmath.vector3(vars.velocity.x, vars.velocity.y, 0)
	if vmath.length(dir) == 0 then dir = vmath.vector3(-vars.wallNormalX, 0, 0) end
	vars.bounceDir = vmath.normalize(dir)

	bounceSpeed = vars.cfg.poundForce * vars.cfg.poundBounceMultiplier / 1.2
end

function M.update(vars,dt, fsm)
	
	if vars.wallNormalX ~= 0 and vars.bounceDir.x * vars.wallNormalX < 0 then
		vars.bounceDir.x = -vars.bounceDir.x
		bounceSpeed = bounceSpeed * 0.5
	end
	vars.velocity.x = vars.bounceDir.x * bounceSpeed
	--vars.velocity.y = vars.bounceDir.y * bounceSpeed

	air.apply(vars,dt)
end

function M.handle_input(vars, action_id, action, fsm)
	air.try_twirl(vars, action_id, action, fsm)
end

function M.exit(vars)
	vars.keepX = false
end

return M