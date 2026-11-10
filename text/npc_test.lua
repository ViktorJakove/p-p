-- LOCK, RESET, END - endings
--recruit = add kaching !
return{
	style = {
		cps = 10,
		-- blip = "/sounds#skeleton_blip",
	},
	
	blocked_states = { locked = true },
	
	thumbnails = {
		default = {"eyyoooooo wassuppp babymama", "t0"},
		completed = {"come again anytime babymama", "t0"},
		locked = {"yo fuckermama", ""}
	},
	start = {
		default = {"t0"},
		completed = {"afterend"}
	},
	nodes ={
		t0 = {"nazdaaar baby", "t1"},
		t1 = {"dlouho jsme se neviděli... mama", "ask0"},
		ask0 = { "co se dějě babyMAMA?",
			{"nic", "RESET"},
			{ "Come to war with me", "recruit" },
			{ "chcípni kundo",  "insult" }
		},
		recruit = {"hell yeah baby mama", "END"},
		insult = {"sám si naser!!!!!! fucker", "LOCK"},
		afterend = {"mgfitman babymama"}
	}
}