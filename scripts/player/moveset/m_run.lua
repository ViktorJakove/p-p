local M = {}

function M.enter(stateVars)
	--animacerun
end

function M.update(stateVars, dt, switchAPI)
	local moveDir = (stateVars.dirKeys.right and 1 or 0) - (stateVars.dirKeys.left and 1 or 0)

	if moveDir == 0 then
		switchAPI.changeMovement("m_idle")
	else
		stateVars.velocity.x = moveDir * stateVars.speed
	end

	if not stateVars.isGrounded then
		switchAPI.changeMovement("m_jump")
	end
	
end

function M.handle_input(stateVars, action_id, action, switchAPI)
	
	if action_id == hash("right") then 
		stateVars.dirKeys.right = not action.released
	elseif action_id == hash("left") then
		stateVars.dirKeys.left = not action.released
	end

	if action_id == hash("jump") then
		switchAPI.changeMovement("m_jump")
	end
end

function M.exit(stateVars)
end

return M