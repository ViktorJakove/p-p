local c = require "scripts.player.conditions"

return {
	m_idle = {
		{to = "m_crouch", when = c.crouching},
		{to = "m_run", when = c.moving_on_ground},
	},
	m_run = {
		{to = "m_crouch", when = c.crouching},
		{to = "m_idle", when = c.idle_on_ground},
	},
	m_jump = {
		{to = "m_fall", when = c.peaked},
	},
	m_highjump = {
		{to = "m_fall", when = c.peaked},
	},
	m_fall = {
		{to = "m_crouch", when = c.crouching},
		{to = "m_run", when = c.moving_on_ground},
		{to = "m_idle", when = c.idle_on_ground},
	},
	m_crouch = {
		{to = "m_idle", when = c.stand_up_idle},
		{to = "m_run", when = c.stand_up_moving},
	},
	any = {
		{to = "m_fall", tag = "grounded", when = c.airborne},
	},
}
