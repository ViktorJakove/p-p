local air = require("scripts.player.shared.air")
local M = {}

function M.enter(vars)
	vars.isGrounded = false
	vars.velocity.y = vars.cfg.jumpForce
	print("jump")
end

function M.update(vars,dt, fsm)
	air.apply(vars, dt)
end

function M.handle_input(vars, action_id, action, fsm)
	air.try_jump_cut(vars, action_id, action)
	air.try_twirl(vars, action_id, action)
end

return M