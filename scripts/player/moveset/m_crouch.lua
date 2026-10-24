local ground = require("scripts.player.shared.ground")
local anim = require("scripts.animations")
local M = {}
M.tags = {grounded = true}

local INTRO = {
	m_idle = "crouch_down",
	m_run = "crouch_down_run",
	m_fall = "land_crouch",
}

local crouchTimer = 0

function M.enter(vars,from)
	print("crouch")
	crouchTimer = 0
	--anim.play(vars,"crouch", INTRO[from])
end

function M.update(vars,dt, fsm)
	crouchTimer = crouchTimer + dt
	if crouchTimer<vars.cfg.highjumpUnlockTime then print(crouchTimer) end
	
	vars.velocity.x = vars.moveDir * vars.cfg.crouchSpeed
	
	ground.stick(vars)
end

function M.handle_input(vars, action_id, action, fsm)
	ground.try_highjump(vars,action_id, action, fsm, crouchTimer)
end

return M