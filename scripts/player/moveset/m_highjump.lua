local air = require("scripts.player.shared.air")
local M = {}

function M.enter(vars)
	vars.isGrounded = false
	vars.velocity.y = vars.cfg.highjumpForce
	print("hijump")
end

function M.update(vars,dt, fsm)
	air.apply(vars, dt)
end

function M.handle_input(vars,action_id,action,fsm)
	air.try_pound(vars, action_id, action,fsm)
end

return M