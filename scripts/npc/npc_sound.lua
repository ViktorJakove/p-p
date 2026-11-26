local M = {}
local utf_helper = require("scripts.npc.utf_helper")

local DELAY = 0.25

local function play(blips)
	sound.play("/sfx#" .. tostring(blips[math.random(#blips)]))
end

function M.playBlips(text,style,omit)

	local handles = {}
	local pos = 1
	local startTime = 0

	while pos < #text do
		local startIndex, endIndex, digit = text:find("~(%d)", pos)
		local chunk = startIndex and text:sub(pos, startIndex - 1) or text:sub(pos)

		local length = utf_helper.utf8Len(chunk, omit)
		
		if length > 0 then
			local count = length / style.cps / style.blipLen
			count = math.max(1,count)
			
			local blips = style.blips

			if length / style.cps < style.blipLen * 1.4 then count = count -1 end
			
			for i = 0, count do
				handles[#handles+1] = timer.delay(startTime + style.blipLen*i,false,function()play(blips)end)
				--print(startTime + style.blipLen*i)
				print(length / style.cps)
			end
		end
		
		if not startIndex then break end
		startTime = startTime + length / style.cps + tonumber(digit) *0.1
		
		pos = endIndex + 1
	end

	return handles
end

return M