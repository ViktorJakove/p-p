local M = {}
function M.reset(vars)
	vars.currentSpeed = vars.cfg.speed
	--vars.boostDir = 0
end
function M.boost(vars, speed, dir)
	vars.currentSpeed = speed
	--vars.boostDir = vars.moveDir
	print("reset")
end
function M.onDirChange(vars)
	if vars.moveDir ~= vars.facing then
		M.reset(vars)
	end
end
return M