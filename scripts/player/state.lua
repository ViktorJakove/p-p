local M = {}

function M.new(props)
	return{
		cfg = {
			speed = props.speed,
			jumpForce = props.jumpForce,
			gravity = props.gravity,
			initFallForce = props.initFallForce,
			jumpEndPushdown = props.jumpEndPushdown,
			twirlForce = props.twirlForce,
			twirlTime = props.twirlTime,
			poundForce = props.poundForce,
			poundTime = props.poundTime,
			poundFlyDecay = props.poundFlyDecay,
			poundBounceMultiplier = props.poundBounceMultiplier,
			crashTime = props.crashTime,
			speedupTime = props.speedupTime,
			speed2 = props.speed2,
			crouchSpeed = props.crouchSpeed,
			highjumpForce = props.highjumpForce,
			highjumpUnlockTime = props.highjumpUnlockTime
		},
		saveData = {
			maxHealth = 0,
			pounds = 0,
			canSwim = true,
		},
		velocity = vmath.vector3(),
		moveDir = 0,
		dirKeys = {left = false, right = false},
		poundDir = vmath.vector3(),
		bounceDir = vmath.vector3(),
		crashSpeed = 0,
		keepX = false,
		isGrounded = false,
		isAttacking = false,
		crouchHeld = false,
		upHeld = false,
		twirled = true,
		pounded = true,
		wallNormal = vmath.vector3(),
		health = 0,
	}
end

return M