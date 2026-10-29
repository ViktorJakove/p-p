local ground = require("scripts.player.shared.ground")
local air = require("scripts.player.shared.air")
local M = {}

local waitTime = 0
local falloff = 0.9

function M.enter(vars,from)
	print("crash")
	vars.keepX = true
	waitTime = vars.cfg.crashTime
	if from == "m_bounce" or from == "m_pound"or from == "m_swim" then 
		local neededVelocity = vars.velocity.y
		if from == "m_swim" then neededVelocity = vars.velocity.x end
		waitTime = waitTime + math.abs(neededVelocity / 750) falloff = 0.93
	else falloff = 0.8 end
	vars.velocity.y = 0
	if from == "m_swim" then vars.velocity.x = 0 end
	print(waitTime)
	M.timer = 0
end

function M.update(vars,dt, fsm)
	M.timer = M.timer + dt
	if M.timer > waitTime and vars.isGrounded then vars.keepX = false fsm:change("m_idle") end
	vars.velocity.x = vars.velocity.x * falloff
	ground.noControl(vars, dt)
end

function M.esit(vars,from)
	vars.keepX = false
end
return M