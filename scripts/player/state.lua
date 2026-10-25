local M = {}

function M.new(props)
	return{
		cfg = {
			speed = props.speed,
			jumpForce = props.jumpForce,
			jumpTime = props.jumpTime,
			gravity = props.gravity,
			initFallForce = props.initFallForce,
			jumpEndPushdown = props.jumpEndPushdown,
			twirlForce = props.twirlForce,
			twirlTime = props.twirlTime,
			poundForce = props.poundForce,
			poundTime = props.poundTime,
			speedupTime = props.speedupTime,
			speed2 = props.speed2,
			crouchSpeed = props.crouchSpeed,
			highjumpForce = props.highjumpForce,
			highjumpUnlockTime = props.highjumpUnlockTime
		},
		savedata = {
			maxHealth = 0,
			pounds = 0,
			canSwim = false,
		},
		velocity = vmath.vector3(),
		moveDir = 0,
		dirKeys = {left = false, right = false},
		poundDir = vmath.vector3(),
		isGrounded = false,
		isAttacking = false,
		crouchHeld = false,
		upHeld = false,
		twirled = true,
		pounded = true,
		health = 0,
	}
end

return M