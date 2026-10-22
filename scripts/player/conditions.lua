local M = {}

function M.airborne(v) return not v.isGrounded end
function M.peaked(v) return v.velocity <= 0 end
function M.idle_on_ground(v) return v.isGrounded and v.moveDir == 0 end
function M.moving_on_ground(v) return not v.isGrounded and v.moveDir ~= 0 end

return M