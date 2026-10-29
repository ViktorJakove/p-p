local air = require("scripts.player.shared.air")
local M = {}

function M.enter(vars, from)
	print("šipkaa")
	vars.keepX = true
	vars.cfg.gravity = vars.cfg.gravity*3/4
	vars.velocity.x = vars.velocity.x * 1.2
	vars.velocity.y = vars.velocity.y + 500
end

function M.update(vars, dt, fsm)
	air.apply(vars, dt)
	vars.velocity.x = vars.velocity.x - (vars.velocity.x * 0.01)
end

function M.handle_input(vars, action_id, action, fsm)
	air.try_twirl(vars, action_id, action, fsm)
	air.try_pound(vars, action_id, action, fsm)
end

function M.exit(vars, dt, fsm)
	vars.keepX=false
	vars.cfg.gravity = vars.cfg.gravity *4/3 
end

return M