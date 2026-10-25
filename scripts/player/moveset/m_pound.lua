local M = {}

function M.enter(vars,from)
	vars.pounded = true
	
end

function M.update(vars,dt, fsm)
	--* vars.moveDir
end

function M.exit(vars)
	vars.pounded = false
end

return M