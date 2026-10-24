local air = require("scripts.player.shared.air")
local M = {}

function M.enter(vars)
	vars.isGrounded = false
	vars.velocity.y = vars.cfg.highjumpForce
	print("jump")
end

function M.update(vars,dt, fsm)
	air.apply(vars, dt)
end
return M