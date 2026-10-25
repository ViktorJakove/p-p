--sharovany aitbourne stavama (jump, fall...)

local M = {}

function M.apply(vars,dt)
	
	local gravVar = vars.cfg.gravity
	if vars.velocity.y < 200 and vars.velocity.y > -100 then 
		gravVar = gravVar + vars.cfg.jumpEndPushdown
		print("uwu")
	elseif vars.velocity.y < 0 then
		print(gravVar)
	end
	
	vars.velocity.y = vars.velocity.y - gravVar *dt
	vars.velocity.x = vars.moveDir * vars.cfg.speed
end

function M.init_gravity_pushdown(vars)
	vars.velocity.y = vars.velocity.y - vars.cfg.initFallForce
end

function M.try_twirl(vars,dt)
end

function M.try_pound(vars,dt)
end

return M