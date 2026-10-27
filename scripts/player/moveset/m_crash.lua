local ground = require("scripts.player.shared.ground")
local air = require("scripts.player.shared.air")
local M = {}

local waitTime = 0
local falloff = 0.975

function M.enter(vars,from)
	print("crash")
	vars.keepX = true
	waitTime = vars.cfg.crashTime
	if from == "m_bounce" or from == "m_pound" then waitTime = waitTime + math.abs(vars.velocity.y / 750)
	else falloff = 0.8 end
	vars.velocity.y = 0
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