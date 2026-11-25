local M = {}

local function play(blips)
	sound.play("/sfx#" .. tostring(blips[math.random(#blips)]))
end

function M.playBlips(len,style)

	if len == 0 then return end
		
	local times = len / style.cps / style.blipLen
	times = math.min(1, times)
	print(times)

	local blips = style.blips 

	for i = 1, times +1 do
		timer.delay(style.blipLen*i,false,function()play(blips)end)
	end
end

return M