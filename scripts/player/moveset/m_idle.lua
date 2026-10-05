local M = {}

function M.enter(stateVars)
	stateVars.velocity.x = 0
	--anim doběhnutí ?????
end

function M.update(stateVars,dt, switchAPI)
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
	
	if stateVars.dirKeys.right or stateVars.dirKeys.left then
		switchAPI.changeMovement("m_run")
	elseif action_id == hash("jump") and action.pressed and stateVars.isGrounded then
		switchAPI.changeMovement("m_jump")
	end
end	

function M.exit(stateVars)
	--anim frame rozeběhnutí
end

return M