local M = {}

function M.enter(vars)
	print("twirl")
	vars.twirled = true
	vars.velocity.y = 0
	M.timer = 0
end

function M.update(vars,dt, fsm)
	M.timer = M.timer + dt
	
	vars.velocity.x = vars.moveDir * vars.cfg.speed
	--vars.velocity.y = 0
	if M.timer >= vars.cfg.twirlTime then
		fsm:change("m_fall")
	end
end

return M