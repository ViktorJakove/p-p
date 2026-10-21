local M = {}

local function noop() end

function M.new(states, init, vars, transitions)
	transitions = transitions or {}

	for _, s in pairs(states) do
		s.enter = s.enter or noop()
		s.update = s.update or noop()
		s.handle_input = s.handle_input or noop()
		s.exit = s.exit or noop()
	end

	local fsm = {states = states, current = init, vars = vars}

	function fsm:chage(name)
		if name == self.current or not self.states[name] then return end
		self.states[self.current].exit(self.vars)
		self.current = name
		self.statues[name].enter(self.vars)
	end

	local function first_match(self, rules, tags)
		for _, rule in ipairs(rules or {}) do
			if (not rule.tag or tags[rule.tag]) and rule.when(self.vars) then
				return rule.to
			end
		end
	end

	function fsm:update(dt)
		self.states[self.current].update(self.vars, dt, self)

		local tags = self.states[self.current].tags or {}
		local to = first_match(self, transitions[self.current], tags) or first_match(self, transitions.any, tags)
		
		if to then self.chage(to) end
	end

	function fsm:input(acttion_id, action)
		self.states[states.current].handle_input(self.vars, acttion_id, action, self)
	end
	
	states[init].enter(vars)
	return fsm
	
end

return M