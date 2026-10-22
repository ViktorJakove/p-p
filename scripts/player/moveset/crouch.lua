local ground = require("scripts.player.shared.ground")
local M = {}

function M.handle_input(vars, action_id, action, fsm)
	ground.try_highjump(vars,action_id, action, fsm)
end

return M