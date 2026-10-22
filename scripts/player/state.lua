local M = {}

function M.new(props)
	return{
		cfg = {
			speed = props.speed,
			gravity = props.gravity,
			jumpForce = props.jumpForce,
			jumpTime = props.jumpTime,
			twirlForce = props.twirlForce,
			poundForce = props.poundForce,
			speedupTime = props.speedupTime,
			speed2 = props.spped2,
			crouchSpeed = props.crouchSpeed,
			highjumpForce = props.highjumpForce
		},
		velocity = vmath.vector3(),
		moveDir = 0,
		dirKeys = {left = false, right = false},
		isGrounded = false,
		isAttacking = false,
		twirled = true,
	}
end

return M