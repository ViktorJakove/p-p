local ground = require "scripts.player.shared.ground"
local anim = require("scripts.animations")
local M = {}

M.tags = {grounded = true}

local INTRO = {
	m_run = "run_stop",
	m_fall = "land"
}

function M.enter(vars, from)
	vars.velocity.x = 0
	--anim doběhnutí ?????
	--anim.play(vars, "idle", INTRO[from])
	print("idle")
	
end

function M.handle_input(vars, action_id, action, fsm)
	ground.try_jump(vars,action_id, action, fsm)
end

function M.exit(stateVars)
	--anim frame rozeběhnutí
end

return M