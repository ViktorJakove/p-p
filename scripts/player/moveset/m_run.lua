local ground = require("scripts.player.shared.ground")
local M = {}
M.tags = {grounded = true}

function M.enter(vars)
	--animacerun
	print("run")
end

function M.update(vars, dt, fsm)
	vars.velocity.x = vars.moveDir * vars.cfg.speed
	
	ground.stick(vars)
end

function M.handle_input(vars, action_id, action, fsm)
	ground.try_jump(vars,action_id, action, fsm)
end

function M.exit(stateVars)
end

return M