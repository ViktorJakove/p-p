local cache = {}

return function(id)
	if not cache[id] then
		cache[id] = require("text/npc_" .. id)
	end
	return cache[id]
end