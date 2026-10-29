local ground = require("scripts.player.shared.ground")
local M = {}

function M.sign(x)
	if x < 0 then
		return -1
	elseif x > 0 then
		return 1
	else
		return 0
	end
end


function M.enter(vars,from)
	print("swim")
	vars.keepX = true
	vars.velocity.x = M.sign(vars.velocity.x) * vars.cfg.poundForce * 1.2
end

function M.update(vars,dt, fsm)
	--bump = zastavit
	if math.abs(vars.velocity.x) < 50 then fsm:change("m_idle") end
	ground.stick(vars)
end

function M.handle_input(vars, action_id, action, fsm)
	ground.try_jump(vars, action_id, action, fsm)
end

function M.exit(vars,from)
	vars.keepX = false
end

return M