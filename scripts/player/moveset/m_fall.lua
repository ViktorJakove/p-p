local air = require "scripts.player.shared.air"
local M = {}

function M.enter(vars,from)
	--anim
	print("fall")
	--if not from == hash("m_twirl") then air.init_gravity_pushdown(vars) end
	air.init_gravity_pushdown(vars)
end

function M.update(vars,dt, fsm)
	air.apply(vars,dt)
end

function M.handle_input(vars, action_id, action, fsm)
	air.try_twirl(vars, action_id, action,fsm)
end

function M.exit(vars)
	--vars.velocity.y = 0
end

return M