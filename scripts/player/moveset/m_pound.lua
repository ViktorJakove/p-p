local air = require("scripts.player.shared.air")
local M = {}

function M.enter(vars,from)
	print("pound")
	
	vars.pounded = true

	--vars.keepX = true
	
	--vars.isGrounded = false
	M.timer = 0 

	local y = (vars.upHeld and 1 or 0) - (vars.crouchHeld and 1 or 0)
	local dir = vmath.vector3(vars.moveDir,y,0)
	if dir.x == 0 and dir.y == 0 then dir.y = -1 end
	vars.poundDir = vmath.normalize(dir)
end

function M.update(vars,dt, fsm)
	--postupne zpomalit
	M.timer = M.timer + dt

	if vars.wallNormalX ~= 0 and vars.poundDir.x * vars.wallNormalX < 0 then
		vars.poundDir.x = -vars.poundDir.x * vars.poundBounceMultiplier
		vars.poundDir = vmath.normalize(vars.poundDir)
	end
	
	vars.velocity.x = vars.poundDir.x *vars.cfg.poundForce
	vars.velocity.y = vars.poundDir.y *vars.cfg.poundForce

	if M.timer >= vars.cfg.poundTime then fsm:change("m_poundfly") end
end

function M.handle_input(vars, action_id, action, fsm)
	air.try_twirl(vars, action_id, action,fsm)
end

function M.exit(vars)
	vars.pounded = false
	vars.twirled = false
	
	--if vars.velocity.y > 0 then vars.velocity.y = 0 end

	vars.poundDir.x = 0
	vars.poundDir.y = 0
	
end

return M