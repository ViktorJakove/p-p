local ground = require("scripts.player.shared.ground")
local M = {}

local waitTime = 0
local falloff = 0.99

function M.enter(vars,from)
	print("crash")
	waitTime = vars.cfg.crashTime
	if from == "m_bounce" then waitTime = waitTime + math.abs(vars.velocity.y / 750)
	else falloff = 0.8 end
	vars.velocity.y = 0
	print(waitTime)
	M.timer = 0
end

function M.update(vars,dt, fsm)
	M.timer = M.timer + dt
	if M.timer > waitTime then fsm:change("m_idle") end
	vars.velocity.x = vars.velocity.x * falloff
	ground.stick(vars)
end

return M