local ground = require("scripts.player.shared.ground")
local M = {}

local waitTime = 0

function M.enter(vars,from)
	print("crash")
	waitTime = vars.cfg.crashTime
	if from == "m_bounce" then waitTime = waitTime + math.abs(vars.velocity.y / 750) end
	print(waitTime)
	vars.velocity.y = 0
	vars.velocity.x = 0
	M.timer = 0
end

function M.update(vars,dt, fsm)
	M.timer = M.timer + dt
	if M.timer > waitTime then fsm:change("m_idle") end
	--dojezd
	--pridat transition z crashe do fall
	ground.stick(vars)
end

return M