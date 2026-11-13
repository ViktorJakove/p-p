-- LOCK, RESET, END - endings
--recruit = add kaching !
local h = require "scripts/npc/npc_text_helper"
local say, ask = h.say, h.ask
return{
	style = {
		cps = 35,
		-- blip = "/sounds#skeleton_blip",
	},
	
	blocked_states = { locked = true },
	
	thumbnails = {
		default = {"eyyoooooo wassuppp babymama", "t0"},
		completed = {"come again anytime babymama", "t0"},
		locked = {"yo fuckermama", ""}
	},
	start = {
		default = "t0",
		completed = "afterend"
	},
	nodes ={
		t0 = say("nazdaaar baby", "t1"),
		t1 = say("dlouho jsme se neviděli... mama", "ask0"),
		ask0 = ask( "co se dějě babyMAMA?",
			{"nic", "RESET"},
			{ "Come to war with me", "recruit" },
			{ "chcípni kundo",  "insult" }
		),
		recruit = say("hell yeah baby mama",nil, "END"),
		insult = say("sám si naser!!!!!! fucker",nil, "LOCK"),
		afterend = say("mgfitman babymama")
	}
}