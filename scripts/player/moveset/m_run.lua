local M = {}

function M.enter(stateVars)
	--animacerun
end

function M.update(stateVars, dt, switchAPI)
	local moveDir = (stateVars.dirKeys.right and 1 or 0) - (stateVars.dirKeys.left and 1 or 0)
	stateVars.velocity.x = moveDir * stateVars.speed
	
end

function M.handle_input(stateVars, action_id, action, switchAPI)
end

function M.exit(stateVars)
end

return M