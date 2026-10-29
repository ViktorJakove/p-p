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
	m_pound = {
		{to = "m_swim", when = c.pound_landed},
		{to = "m_crash", when = c.pound_crashed},
	},
	m_poundfly = {
		{to = "m_crash", when = c.grounded},
	},
	m_bounce = {
		{to = "m_crash", when = c.landed_flat},
	},
	m_swim = {
		{to = "m_crash", when = c.hit_wall},
		{to = "m_swimfly", when = c.airborne},
	},
	m_swimfly = {
		{to = "m_swim", when = c.grounded},
	},
	any = {
		{to = "m_fall", tag = "grounded", when = c.airborne},
	},
}
