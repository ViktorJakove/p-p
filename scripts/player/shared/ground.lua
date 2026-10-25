--sharovany grounded stavama (idle, run,...)
local M = {}
local JUMP = hash("jump")

function M.enter(vars,from)
	--if from == "m_pound" and (dostatecne brzo) then fsm:change("m_swim") end
	--anim
end

function M.try_jump(vars, action_id, action, fsm)
	if action_id == JUMP and action.pressed then
		fsm:change("m_jump")
	end
end

function M.try_highjump(vars, action_id, action, fsm, crouchTimer)
	if action_id == JUMP and action.pressed then
		if crouchTimer > vars.cfg.highjumpUnlockTime then
			fsm:change("m_highjump")
		else fsm:change("m_jump") end
	end
end

function M.stick(vars)
	vars.velocity.y = -10
end

return M