local c = require "scripts.player.conditions"

return {
	m_idle = {
		{to = "m_run", when = c.moving_on_ground},
	},
	m_run = {
		{to = "m_idle", when = c.idle_on_ground},
	},
	m_jump = {
		{to = "m_fall", when = c.peaked},
	},
	m_fall = {
		{to = "m_run", when = c.moving_on_ground},
		{to = "m_idle", when = c.idle_on_ground},
	},
	any = {
		{to = "m_fall", tag = "grounded", when = c.airborne},
	},
}
