if (SERVER) then --the init.lua stuff goes in here
   AddCSLuaFile ("shared.lua")

end

if (CLIENT) then --the cl_init.lua stuff goes in here


	SWEP.PrintName = "Hand grenade"
	SWEP.SlotPos = 1
	SWEP.IconLetter			= "h"
	SWEP.NameOfSWEP			= "rcs_hegrenade" --always make this the name of the folder the SWEP is in.
	killicon.AddFont( SWEP.NameOfSWEP, "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )

end

SWEP.Primary.NumNades = 3 --number of throwable grenades at your disposal
SWEP.Grenade = "rcs_thrownhegrenade" --self explanitory

local here = true
SWEP.Author = "cheesylard"
SWEP.Category = "RealCS"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Base = "rcs_base_grenade"

SWEP.ViewModel = "models/weapons/v_eq_fraggrenade.mdl"
SWEP.WorldModel = "models/weapons/w_eq_fraggrenade.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.IronSightsPos = Vector (7.3161, 0, 0.6718)
SWEP.IronSightsAng = Vector (7.2937, 9.6773, 51.2462)
