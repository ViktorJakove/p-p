local M = {}

function M.enter()
	print("swim")
end

function M.update(vars,dt, fsm)
	fsm:change("m_idle")
end

return M