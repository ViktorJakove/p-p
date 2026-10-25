local air = require "scripts.player.shared.air"

local M = {}

function M.enter(vars)
	print("twirl")
	vars.twirled = true
	--vars.velocity.y = 0
	M.timer = 0
end

function M.update(vars,dt, fsm)
	M.timer = M.timer + dt
	
	if vars.velocity.y < 0 then vars.velocity.y =  vars.velocity.y/1.9 end--math.min(0, vars.velocity.y + 30) end
	air.apply(vars,dt)
	
	vars.velocity.x = vars.moveDir * vars.cfg.speed
	if M.timer >= vars.cfg.twirlTime then
		fsm:change("m_fall")
	end
end

return M