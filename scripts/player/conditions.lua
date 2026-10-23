local M = {}

function M.airborne(vars) return not vars.isGrounded end
function M.peaked(vars) return vars.velocity.y <= 0 end
function M.idle_on_ground(vars) return vars.isGrounded and vars.moveDir == 0 end
function M.moving_on_ground(vars) return vars.isGrounded and vars.moveDir ~= 0 end
function M.crouching(vars) return vars.isGrounded and vars.crouchHeld end
function M.stand_up_idle(vars) return not vars.crouchHeld and vars.moveDir == 0 end
function M.stand_up_moving(vars) return not vars.crouchHeld and vars.moveDir ~= 0 end

return M