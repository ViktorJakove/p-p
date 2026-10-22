--sharovany grounded stavama (idle, run,...)
local M = {}
local JUMP = hash("jump")

function M.try_jump(vars, action_id, action, fsm)
	if action_id == JUMP and action.pressed then
		fsm:change("m_jump")
	end
end

function M.try_highjump(vars, action_id, action, fsm)
	
end

return M