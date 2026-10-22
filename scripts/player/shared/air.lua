--sharovany aitbourne stavama (jump, fall...)

local M = {}

function M.apply(vars,dt)
	vars.velocity.y = vars.velocity.y - vars.cfg.gravity *dt
	vars.velocity.x = vars.moveDir * vars.cfg.speed
end

function M.try_twirl(vars,dt)
end

function M.try_pound(vars,dt)
end

return M