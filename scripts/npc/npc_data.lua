local modules = {
	test = require("text.npc_test"),
}

return function(id)
	local data = modules[id]
	assert(data, "no NPC text registered for id: " .. tostring(id))
	return data
end