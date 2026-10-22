local ground = require "scripts.player.shared.ground"
local M = {}

function M.enter(vars)
	vars.velocity.x = 0
	--anim doběhnutí ?????
end

function M.handle_input(vars, action_id, action, fsm)
	ground.try_jump(vars,action_id, action, fsm)
end

function M.exit(stateVars)
	--anim frame rozeběhnutí
end

return M