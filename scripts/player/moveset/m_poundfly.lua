local air = require("scripts.player.shared.air")
local M = {}

function M.enter(vars, from)
	print("poundfly")
	vars.keepX = true
	vars.velocity.x = vars.velocity.x * 0.75
	if vars.velocity.y > 0 then vars.velocity.y = vars.velocity.y/2 end
end

function M.update(vars, dt, fsm)
	air.apply(vars, dt)
	vars.velocity.x = vars.velocity.x - (vars.velocity.x * 0.01)
end

function M.handle_input(vars, action_id, action, fsm)
	air.try_twirl(vars, action_id, action, fsm)
end

function M.exit(vars, dt, fsm)
	vars.keepX=false
end

return M