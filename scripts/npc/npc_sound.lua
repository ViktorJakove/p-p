local M = {}
local utf_helper = require("scripts.npc.utf_helper")

local DELAY = 0.05
local handles = {}

local function play(blips)
	local url = "/sfx#" .. tostring(blips[math.random(#blips)])
	local id = sound.play(url)
end

function M.playBlips(text,style,omit, initDelay)

	local pos = 1
	local startTime = 0

	while pos < #text do
		local startIndex, endIndex, digit = text:find("~(%d)", pos)
		local chunk = startIndex and text:sub(pos, startIndex - 1) or text:sub(pos)

		local length = utf_helper.utf8Len(chunk, omit)

		local delay = pos == 1 and DELAY + initDelay or initDelay
		
		if length > 0 then
			local count = ((length / style.cps) - delay) / style.blipLen
			count = math.max(1,count)
			
			local blips = style.blips

			--pokud je to hodně krátký tak jenom FAKT jeden zvuk
			if length / style.cps < style.blipLen * 1.4 then count = count -1 end

			--spustí o jeden víc - zní to míň prázdně
			for i = 0, count do
				handles[#handles+1] = timer.delay(startTime + delay + style.blipLen*i,false,function()play(blips)end)
			end
		end
		
		if not startIndex then break end
		startTime = startTime + delay + length / style.cps + tonumber(digit) *0.1
		
		pos = endIndex + 1
	end

	return handles
end

function M.stop()
	for _, h in ipairs(handles or {}) do timer.cancel(h) end
	handles = {}
end

return M