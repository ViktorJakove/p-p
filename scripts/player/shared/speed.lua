local M = {}
function M.reset(vars)
	vars.currentSpeed = vars.cfg.speed
	vars.boostDir = 0
end
function M.boost(vars, speed, dir)
	vars.currentSpeed = speed
	vars.boostDir = vars.moveDir
end
function M.onDirChange(vars)
	if vars.boostDir ~= 0 and vars.moveDir ~= 0 and vars.moveDir ~= vars.boostDir then
		M.reset(vars)
	end
end
return M