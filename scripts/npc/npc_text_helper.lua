local M = {}
function M.say (text, next, ending)
	return{text = text, next = next, ending = ending}
end
function M.ask (text,...)
	return{text = text, choices = {...}}
end
return M