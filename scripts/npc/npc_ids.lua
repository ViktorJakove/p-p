local ids = {
	"test"
}

local names = {}

for _, id in ipairs(ids) do
	names[hash(id)] = id
end

return names