--sharovany airbourne stavama (jump, fall...)

local M = {}
local JUMP = hash("jump")

function M.apply(vars,dt)
	
	local gravVar = vars.cfg.gravity
	if vars.velocity.y < 200 and vars.velocity.y > -200 then 
		gravVar = gravVar + vars.cfg.jumpEndPushdown
		print("uwu")
	--elseif vars.velocity.y < 0 then
		--print(gravVar)
	end
	
	vars.velocity.y = vars.velocity.y - gravVar *dt
	vars.velocity.x = vars.moveDir * vars.cfg.speed
end

function M.init_gravity_pushdown(vars)
	vars.velocity.y = vars.velocity.y - vars.cfg.initFallForce
end

function M.try_jump_cut(vars, action_id, action)
	--zpomaleni po releasu
	if action_id == JUMP and action.released and vars.velocity.y > 0 then
		vars.velocity.y = vars.velocity.y * 0.33
	end
end

function M.try_twirl(vars, action_id, action,fsm)
	if action_id == JUMP and action.pressed and not vars.twirled then
		fsm:change("m_twirl")
		--vars.velocity.y = math.max(vars.cfg.twirlForce, vars.velocity.y + vars.cfg.twirlForce)
	end
end

function M.try_pound(vars,dt)
end

return M