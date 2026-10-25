local air = require "scripts.player.shared.air"
local M = {}

function M.enter(vars,from)
	print("bounce")
	vars.keepX = true

	local dir = vmath.vector3(vars.velocity.x, vars.velocity.y, 0)
	if vmath.length(dir) == 0 then dir = vmath.vector3(-vars.wallNormalX, 0, 0) end
	vars.bounceDir = vmath.normalize(dir)
end

function M.update(vars,dt, fsm)
	--fsm:change("m_fall")
end

function M.handle_input(vars, action_id, action, fsm)
	air.try_twirl(vars, action_id, action, fsm)
end

function M.exit(vars)
	vars.keepX = false
end

return M