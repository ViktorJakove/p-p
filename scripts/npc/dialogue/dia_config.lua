local M = {}

M.SMALL = vmath.vector3(120, 40, 0)
M.BIG = vmath.vector3(320, 140, 0)
M.BASE_Y = 60
M.PAD = 14
M.LINE_H = 20
M.POINTER_X = 12
M.GROW_TIME = 0.2

M.MAX_CHOICES = 3
M.CHOICES_TOP = M.BASE_Y + M.PAD + M.LINE_H * M.MAX_CHOICES

M.IGNORE = {
	" ", ".", ",", "!", "?", ":", ";", "-", "*", "~", '"', "'", "(", ")",
}

return M