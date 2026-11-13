local function utf8Len(s)
	local _, count = s:gsub("[^\128-\191]","")
	return count
end

local function utf8Sub(s, chars)
	if chars <= 0 then return end
	local i, count = 1, 0
	while i <= #s do
		local b = s:byte(i)
		local size = b < 0x80 and 1 or b < 0xE0 and 2 or b < 0xF0 and 3 or 4
		count = count + 1
		if count == chars then return s:sub(1,i+size-1)end
		i = i+ size
	end
	return s
end