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
			poundForce = props.poundForce,
			speedupTime = props.speedupTime,
			speed2 = props.speed2,
			crouchSpeed = props.crouchSpeed,
			highjumpForce = props.highjumpForce,
			highjumpUnlockTime = props.highjumpUnlockTime
		},
		velocity = vmath.vector3(),
		moveDir = 0,
		dirKeys = {left = false, right = false},
		isGrounded = false,
		isAttacking = false,
		crouchHeld = false,
		twirled = true,
	}
end

return M