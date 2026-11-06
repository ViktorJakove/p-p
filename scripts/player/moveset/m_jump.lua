local air = require("scripts.player.shared.air")
local speed = require("scripts.player.shared.speed")
local M = {}


function M.enter(vars,from)
	print("jump")
	vars.isGrounded = false
	vars.velocity.y = vars.cfg.jumpForce
	
	if from == "m_swim" and vars.moveDir == vars.facing then
		speed.boost(vars,vars.cfg.poundForce * 1.2,0)
	end
	
end

function M.update(vars,dt, fsm)
	print(vars.moveDir)
	air.apply(vars, dt)
end

function M.handle_input(vars, action_id, action, fsm)

	--if vars.facing ~= vars.moveDir and action.released and action_id ~= hash("attack") then
	--	vars.cfg.speed = origSpeed
	--end
	
	air.try_pound(vars, action_id, action,fsm)
	air.try_jump_cut(vars, action_id, action)
end

function M.exit(vars)
end

return M