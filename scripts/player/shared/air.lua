--sharovany airbourne stavama (jump, fall...)

local M = {}
local JUMP = hash("jump")
local ATTACK = hash("attack")

function M.apply(vars,dt)
	
	local gravVar = vars.cfg.gravity
	if vars.velocity.y < 200 and vars.velocity.y > -200 then 
		gravVar = gravVar + vars.cfg.jumpEndPushdown
	end
	
	vars.velocity.y = vars.velocity.y - gravVar *dt
	if not vars.keepX then vars.velocity.x = vars.moveDir * vars.cfg.speed end
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
	if action_id == JUMP and action.pressed and vars.twirlCooldown <= 0 then
		fsm:change("m_twirl")
	end
end

function M.try_pound(vars, action_id, action,fsm)
	if action_id == ATTACK and action.pressed and not vars.pounded then 
		fsm:change("m_pound")
	end
	
end

return M