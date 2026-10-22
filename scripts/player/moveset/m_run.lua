local ground = require("scripts.player.shared.ground")
local M = {}

function M.enter(stateVars)
	--animacerun
end

function M.update(vars, dt, fsm)
	
end

function M.handle_input(vars, action_id, action, fsm)
	ground.try_jump(vars,action_id, action, fsm)
end

function M.exit(stateVars)
end

return M