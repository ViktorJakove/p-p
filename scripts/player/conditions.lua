local M = {}

function M.airborne(vars) return not vars.isGrounded end
function M.grounded(vars) return vars.isGrounded end
function M.peaked(vars) return vars.velocity.y <= 0 end
function M.idle_on_ground(vars) return vars.isGrounded and vars.moveDir == 0 end
function M.moving_on_ground(vars) return vars.isGrounded and vars.moveDir ~= 0 end
function M.crouching(vars) return vars.isGrounded and vars.crouchHeld end
function M.stand_up_idle(vars) return not vars.crouchHeld and vars.moveDir == 0 end
function M.stand_up_moving(vars) return not vars.crouchHeld and vars.moveDir ~= 0 end
function M.pound_landed(vars) return vars.isGrounded and vars.saveData.canSwim == true end
function M.pound_crashed(vars) return vars.isGrounded and vars.saveData.canSwim == false end
function M.landed_flat(vars)return vars.isGrounded and vars.wallNormal.x == 0 and vars.wallNormal.y == 0 end

return M