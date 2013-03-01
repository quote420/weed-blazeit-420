/*--------------------------------------------------------
Default teams. If you make a team above the citizen team, people will spawn with that team!
--------------------------------------------------------*/
TEAM_CITIZEN = AddExtraTeam("Citizen", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group01/Female_01.mdl",
		"models/player/Group01/Female_02.mdl",
		"models/player/Group01/Female_03.mdl",
		"models/player/Group01/Female_04.mdl",
		"models/player/Group01/Female_06.mdl",
		"models/player/group01/male_01.mdl",
		"models/player/Group01/Male_02.mdl",
		"models/player/Group01/male_03.mdl",
		"models/player/Group01/Male_04.mdl",
		"models/player/Group01/Male_05.mdl",
		"models/player/Group01/Male_06.mdl",
		"models/player/Group01/Male_07.mdl",
		"models/player/Group01/Male_08.mdl",
		"models/player/Group01/Male_09.mdl"
	},
	description = [[The Citizen is the most basic level of society you can hold.
		You have no specific role in city life.
		Raiding: No.]],
	weapons = {},
	command = "citizen",
	max = 0,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_POLICE = AddExtraTeam("Civil Protection", {
	color = Color(25, 25, 170, 255),
	model = "models/player/police.mdl",
	description = [[You are either the mayor's enforcer of justice, or the evil
		dictator's lacky. Either way, you must have a reason to arrest. 
		KOS revolutionaries during a revolution, but only during revolutions. 
		Killing them outside of revolutions earns you a demotion. 
		You may kill if someone is breaking a big law 
		(they're raiding, killing civilians, ect), but stick to
		arrest for something minor (such as guns in public, ect).
		Raiding: Yes, if you have a warrant.]],
	weapons = {"arrest_stick", "unarrest_stick", "rcs_p228", "weapon_stunstick", "door_ram", "weaponchecker"},
	command = "cp",
	max = 8,
	salary = 65,
	admin = 0,
	vote = true,
	hasLicense = true
})

TEAM_GANG = AddExtraTeam("Gangster", {
	color = Color(75, 75, 75, 255),
	model = {
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl",
		"models/player/Group03/Female_03.mdl",
		"models/player/Group03/Female_04.mdl",
		"models/player/Group03/Female_06.mdl",
		"models/player/group03/male_01.mdl",
		"models/player/Group03/Male_02.mdl",
		"models/player/Group03/male_03.mdl",
		"models/player/Group03/Male_04.mdl",
		"models/player/Group03/Male_05.mdl",
		"models/player/Group03/Male_06.mdl",
		"models/player/Group03/Male_07.mdl",
		"models/player/Group03/Male_08.mdl",
		"models/player/Group03/Male_09.mdl"},
	description = [[You are a member of the gang.
		Follow the agenda the mob boss sets.
		Raiding: Yes.]],
	weapons = {},
	command = "gangster",
	max = 10,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_MOB = AddExtraTeam("Mob boss", {
	color = Color(25, 25, 25, 255),
	model = "models/player/gman_high.mdl",
	description = [[You lead the gangsters.
		You spawn with a lockpick to raid, 
		and an unarrest baton to break your gangsters out of prison.
		Use /agenda <message> to set the agenda.
		Raiding: Yes.]],
	weapons = {"lockpick", "unarrest_stick"},
	command = "mobboss",
	max = 1,
	salary = 60,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_GUN = AddExtraTeam("Gun Dealer", {
	color = Color(255, 140, 0, 255),
	model = "models/player/monk.mdl",
	description = [[You must sell to anyone who wants a gun. You sell pistols.
		SMGs, Rifles, and M249's. You can align to a faction, as long
		as there will still be 1 non-faction Gun Dealer.
		Raiding: Yes, if aligned.]],
	weapons = {},
	command = "gundealer",
	max = 4,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_MEDIC = AddExtraTeam("Medic", {
	color = Color(47, 79, 79, 255),
	model = "models/player/kleiner.mdl",
	description = [[Heal people with your medkit. You can have a hospital, 
		where you heal everyone for a fee, or you can align to a faction,
		as long as there will still be 1 non-faction Medic.
		Raiding: Yes, to heal your faction members.]],
	weapons = {"med_kit"},
	command = "medic",
	max = 3,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_CHIEF = AddExtraTeam("Civil Protection Chief", {
	color = Color(20, 20, 255, 255),
	model = "models/player/combine_soldier_prisonguard.mdl",
	description = [[You are also an enforcer of the law. Usually, you are the
		leader's right hand man. Your rules are pretty much the same as Civil
		Protection, but you get to call the shots.
		Raiding: Yes, if you have a warrant.]],
	weapons = {"arrest_stick", "unarrest_stick", "rcs_deagle", "weapon_stunstick", "door_ram", "weaponchecker"},
	command = "chief",
	max = 1,
	salary = 75,
	admin = 0,
	vote = false,
	hasLicense = true,
	NeedToChangeFrom = TEAM_POLICE
})

TEAM_MAYOR = AddExtraTeam("Mayor", {
	color = Color(150, 20, 20, 255),
	model = "models/player/breen.mdl",
	description = [[Be the leader of the city. Make the laws, and have your Civil
		Protection enforce them. You will fight crime, for the greater good. Put the
		aws in an easy to see area. If that's not your type of thing, change to
		Dictator.
		Raiding: No.]],
	weapons = {},
	command = "mayor",
	max = 1,
	salary = 85,
	admin = 0,
	vote = true,
	hasLicense = false
})

TEAM_HOBO = AddExtraTeam("Hobo", {
	color = Color(80, 45, 0, 255),
	model = {
	"models/player/zombie_classic.mdl",
	"models/player/zombie_fast.mdl"},
	description = [[Bugbait is allowed. You also may punch people for no reason, just be
		sure not to kill them or put them in real danger. If you are being punched by a
		hobo and you are not one, ask them to stop. If they do not, kill them. Hobos
		may own printers, but it is still against the law. Hobos also cannot own doors,
		they have to make small hobo huts/houses/shelters on the sidewalks.
		Raiding: Yes.]],
	weapons = {"weapon_bugbait"},
	command = "hobo",
	max = 15,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_RLEADER = AddExtraTeam("Revolutionary Leader", {
	color = Color(200, 50, 50, 255),
	model = "models/player/eli.mdl",
	description = [[You are the main contributor to the revolution. You can
		supply your soldiers with rifles and knives. You also must call on a
		revolution. Say ''/advert REVOLUTION'' or something closer, as long as it
		clearly shows there is a revolution starting. You must have a dictator to
		start a revolution, but you can still stock up while there is a mayor.
		Raiding: Only PD and government buildings.]],
	weapons = {},
	command = "rleader",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_REVOLUTIONARY = AddExtraTeam("Revolutionary", {
	color = Color(150, 150, 150, 255),
	model = "models/player/guerilla.mdl",
	description = [[Start an uprising to destroy the corrupt government. Obey your
		leader. You may KOS CPs during a revolution, but be careful, they can also
		kill you.
		Raiding: Only PD and government buildings.]],
	weapons = {},
	command = "revolutionary",
	max = 12,
	salary = 20,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_TERRORIST = AddExtraTeam("Terrorist", {
	color = Color(30, 30, 30, 255),
	model = "models/player/phoenix.mdl",
	description = [[Cause terror among the citizens! RDM is allowed but ONLY using your
		suicide bomb weapon. You also can buy explosives.
		Raiding: To blow people up in the building.]],
	weapons = {},
	command = "terrorist",
	max = 3,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_ENGINEER = AddExtraTeam("Engineer", {
	color = Color(30, 99, 30, 255),
	model = "models/player/gasmask.mdl",
	description = [[Sell very high-tech items to people.
		You can align to a faction, as long
		as there will still be 1 non-faction Engineer.
		Raiding: Yes, if algined.]],
	weapons = {},
	command = "engineer",
	max = 4,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_DRUG = AddExtraTeam("Drug Deal Man", {
	color = Color(30, 230, 30, 255),
	model = "models/player/odessa.mdl",
	description = [[Sell drugs don't get caught. (Moron)
		Raiding: No]],
	weapons = {},
	command = "drugdealer",
	max = 2,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_BLACK = AddExtraTeam("Black Market Dealer", {
	color = Color(0, 216, 0, 255),
	model = "models/player/Hostage/Hostage_01.mdl",
	description = [[Give good deals on illegalities.
		Raiding: No]],
	weapons = {},
	command = "bmdealer",
	max = 2,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_HITMAN = AddExtraTeam("Hitman", {
	color = Color(87, 74, 34, 255),
	model = "models/player/leet.mdl",
	description = [[Get paid to murder.
		You must be paid or else it's RDM.
		Once you have a hit, shoot the target until they die.
		Use /advert to say when a hit is accepted or completed.
		Raiding: Only if it is needed to get to your target.]],
	weapons = {"rcs_usp"},
	command = "hitman",
	max = 2,
	salary = 0,
	admin = 0,
	vote = true,
	hasLicense = true
})

TEAM_GUARD = AddExtraTeam("Guard", {
	color = Color(15, 0, 70, 255),
	model = "models/player/barney.mdl",
	description = [[Have people hire you for protection.
		You must charge a minimum of 100$.
		Guards are not associated with the CPs.
		Raiding: No.]],
	weapons = {"rcs_usp"},
	command = "guard",
	max = 2,
	salary = 45,
	admin = 0,
	vote = true,
	hasLicense = true
})

TEAM_CAMERA = AddExtraTeam("\"Photographer\"", {
	color = Color(205, 205, 205, 255),
	model = "models/player/arctic.mdl",
	description = [[You are actually a thief. You spawn with a lockpick.
		Take pictures of places and sneak into them later.
		Also blind people with flashes.
		You can also stick up stores, demand shipments/money, and mug people.
		People can call 911 if they need help, so be extra careful. 
		Try not to get caught while you are doing it.
		Raiding: Yes]],
	weapons = {"lockpick"},
	command = "thief",
	max = 6,
	salary = 50,
	admin = 0,
	vote = false,
	hasLicense = false
})

TEAM_MILI = AddExtraTeam("Civil Protection Military", {
	color = Color(0, 90, 255, 255),
	model = "models/player/combine_soldier.mdl",
	description = [[You are the elite officers, to deal with those law-breaking scumbags.
		You are used for big missions, or a main defence from revolutionaries. 
		You spawn with a Battering Ram, Stunstick and M4A1.
		Other than that, same rules as CP.
		Raiding: Yes, if you have a warrant.]],
	weapons = {"rcs_m4a1", "weapon_stunstick", "door_ram"},
	command = "military",
	max = 3,
	salary = 65,
	admin = 0,
	vote = false,
	hasLicense = true,
	NeedToChangeFrom = TEAM_POLICE
})

TEAM_SNIPER = AddExtraTeam("Civil Protection Military Sniper", {
	color = Color(0, 160, 255, 255),
	model = "models/player/combine_super_soldier.mdl",
	description = [[You are the elite officers, to deal with those law-breaking scumbags.
		You are used for big missions, or a main defence from revolutionaries. 
		You spawn with a Battering Ram, Stunstick and Scout.
		Other than that, same rules as CP.
		Raiding: Yes, if you have a warrant.]],
	weapons = {"rcs_scout", "weapon_stunstick", "door_ram"},
	command = "sniper",
	max = 2,
	salary = 65,
	admin = 0,
	vote = false,
	hasLicense = true,
	NeedToChangeFrom = TEAM_MILI
})

TEAM_ADMIN = AddExtraTeam("Administrator", {
	color = Color(255, 0, 0, 255),
	model = "models/player/combine_super_soldier.mdl",
	description = [[LE BAN MAN FACE
		LE CLOAKING MAN
		LE MLG MAN
		Raiding: LE YES]],
	weapons = {"unarrest_stick", "rcs_m249", "weapon_keypadchecker", "ultra_med_kit"},
	command = "admina",
	max = 10,
	salary = 0,
	admin = 1,
	hasLicense = true,
})

TEAM_TREE = AddExtraTeam("Snoop Tree", {
	color = Color(0, 255, 0, 255),
	model = "models/props_foliage/tree_pine_large.mdl",
	description = [[Get burned
		Raiding: lol you're a tree]],
	weapons = {"unarrest_stick", "weapon_keypadchecker", "ultra_med_kit"},
	command = "trees",
	max = 10,
	salary = 0,
	admin = 1,
	hasLicense = true,
})

TEAM_COMMANDER = AddExtraTeam("Civil Protection Military Commander", {
	color = Color(0, 0, 111, 255),
	model = "models/player/urban.mdl",
	description = [[You are the leader of the Military.
		Tell the other militants what to do.
		You spawn with a Battering Ram, Stunstick and AUG.
		Other than that, same rules as CP.
		Raiding: Yes, if you have a warrant.]],
	weapons = {"rcs_aug", "weapon_stunstick", "door_ram"},
	command = "commander",
	max = 1,
	salary = 75,
	admin = 0,
	vote = false,
	hasLicense = true,
	NeedToChangeFrom = TEAM_MILI
})

TEAM_LAWYER = AddExtraTeam("Lawyer", {
	color = Color(0, 20, 0, 255),
	model = "models/player/Hostage/Hostage_02.mdl",
	description = [[Get permission from the mayor to come in the PD, 
		and get money off of bails. You can secretly unarrest people
		for free, but there will be major punishment. 
		Minimal bail is $150.
		Raiding: No.]],
	weapons = {"unarrest_baton"},
	command = "lawyer",
	max = 1,
	salary = 45,
	admin = 0,
	vote = false,
	hasLicense = false
})

//ADD CUSTOM TEAMS UNDER THIS LINE:

/*
--------------------------------------------------------
HOW TO MAKE A DOOR GROUP
--------------------------------------------------------
AddDoorGroup("NAME OF THE GROUP HERE, you see this when looking at a door", Team1, Team2, team3, team4, etc.)

WARNING: THE DOOR GROUPS HAVE TO BE UNDER THE TEAMS IN SHARED.LUA. IF THEY ARE NOT, IT MIGHT MUCK UP!


The default door groups, can also be used as examples:
*/
AddDoorGroup("Cops and Mayor only", TEAM_CHIEF, TEAM_POLICE, TEAM_MAYOR, TEAM_SNIPER, TEAM_MILI, TEAM_COMMANDER)
AddDoorGroup("Gundealer only", TEAM_GUN)


/*
--------------------------------------------------------
HOW TO MAKE AN AGENDA
--------------------------------------------------------
AddAgenda(Title of the agenda, Manager (who edits it), Listeners (the ones who just see and follow the agenda))

WARNING: THE AGENDAS HAVE TO BE UNDER THE TEAMS IN SHARED.LUA. IF THEY ARE NOT, IT MIGHT MUCK UP!

The default agenda's, can also be used as examples:
*/
AddAgenda("Gangster's agenda", TEAM_MOB, {TEAM_GANG})
AddAgenda("Police agenda", TEAM_MAYOR, {TEAM_CHIEF, TEAM_POLICE, TEAM_SNIPER, TEAM_MILI, TEAM_COMMANDER})


/*
---------------------------------------------------------------------------
HOW TO MAKE A GROUP CHAT
---------------------------------------------------------------------------
Pick one!
GAMEMODE:AddGroupChat(List of team variables separated by comma)

or

GAMEMODE:AddGroupChat(a function with ply as argument that returns whether a random player is in one chat group)
This one is for people who know how to script Lua.

*/
GM:AddGroupChat(function(ply) return ply:IsCP() end)
GM:AddGroupChat(TEAM_MOB, TEAM_GANG)