-- LOCK, RESET, END - endings
--recruit = add kaching !
return{
	style = {
		cps = 10,
		-- blip = "/sounds#skeleton_blip",
	},
	
	blocked_states = { locked = true },
	
	thumbnails = {
		default = {"eyyoooooo wassuppp", "t0"},
		completed = {"come again anytime", "t0"},
		locked = {"...", ""}
	},
	start = {
		default = {"t0"},
		completed = {"afterend"}
	},
	nodes ={
		t0 = {"nazdaaar", "t1"},
		t1 = {"dlouho jsme se neviděli...", "ask0"},
		ask0 = { "co se dějě?",
			{"nic", "RESET"},
			{ "Come to war with me", "recruit" },
			{ "chcípni kundo",  "insult" }
		},
		recruit = {"hell yeah", "END"},
		insult = {"sám si naser!!!!!!", "LOCK"},
		afterend = {"mgfitman"}
	}
}