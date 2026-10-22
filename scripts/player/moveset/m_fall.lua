local air = require "scripts.player.shared.air"
local M = {}

function M.enter(stateVars)
	--anim
end

function M.update(vars,dt, fsm)
	air.apply(vars,dt)
end

function M.exit(vars)
	vars.velocity.y = 0
end

return M