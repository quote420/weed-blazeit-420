--code is highly unstable, I wouldn't reccommend using it.
if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HoldType			= "knife"
	

end

if ( CLIENT ) then
	SWEP.PrintName			= "C4 Explosive (bugged)"	
	SWEP.Author				= "cheesylard"
	SWEP.Slot				= 4
	SWEP.ViewModelFlip		= false
	--Just fucking around
	--[[function SWEP:DrawHUD()
		for i = 1,14 do
			local lorkeo = math.random(0,5)
			if lorkeo == 0 then
				penor = "LOLOLOL"
			elseif lorkeo == 1 then
				penor = "BOOM HEADSHOT"
			elseif lorkeo == 2 then
				penor = "HHAHAHHAHHA"
			elseif lorkeo == 3 then
				penor = "8=======D"
			elseif lorkeo == 4 then
				penor = "asdfasdfasdf"
			elseif lorkeo == 5 then
				penor = "no u"
			end
			
			surface.SetDrawColor(math.random(0,255), math.random(0,255), math.random(0,255), 255)
			surface.DrawRect(math.random(1,ScrW()), math.random(1,ScrH()), math.random(1,ScrW()), math.random(1,ScrH()))
			if penor == "no u" then
				draw.DrawText(penor, "OMGARIALRUSERIOUSS", math.random(1,ScrW()), math.random(1,ScrH()), Color(math.random(0,255), math.random(0,255), math.random(0,255), 255),TEXT_ALIGN_CENTER)
			else
				draw.DrawText(penor, "OMGARIALRUSERIOUS", math.random(1,ScrW()), math.random(1,ScrH()), Color(math.random(0,255), math.random(0,255), math.random(0,255), 255),TEXT_ALIGN_CENTER)
			end
		end]]
--[[		if self.defusing == 1 then
			local w, h, x, y, v, topleftoutlinex, topleftx, topleftoutliney, toplefty, dp
			w = surface.ScreenWidth( )
			h = surface.ScreenHeight( )
			x = h/2.5
			y = h/40
			v = 4
			dp = (1-(defusetime/10))*x
		    topleftoutlinex = ((w-x)-v)/2
			topleftx = (w-x)/2
			topleftoutliney = (((h/1.5)-y)-v)/2
			toplefty = ((h/1.5)-y)/2

		    
		    surface.SetDrawColor( 255, 200, 000, 190 )
		    surface.DrawRect( topleftx, toplefty, dp, y )
			surface.SetDrawColor( 255, 200, 000, 190 )
			surface.DrawOutlinedRect( topleftoutlinex, topleftoutliney, x+v, y+v )
		end
	end
	local function SetDEFUSETIME(um)
		SWEP.defusetime = um:ReadString()
	end
	-- hook it
	usermessage.Hook( "DEFUSETIME", GetClientGGLevel )
	local function GetISITDEFUSING(um)
		SWEP.defusing = um:ReadString()
	end
	-- hook it
	usermessage.Hook( "ISDEFUSING", GetISITDEFUSING )
	usermessage.Hook( "DEFUSETIME", SetDEFUSETIME )
]]

	--[[function SWEP:Initialize()
		surface.CreateFont("Impact", ScreenScale( 30 ), 400, true, false, "OMGARIALRUSERIOUS")
		surface.CreateFont("Impact", ScreenScale( 60 ), 400, true, false, "OMGARIALRUSERIOUSS")
	end]]
end
SWEP.Base = "rcs_base";
SWEP.Category = "RealCS";

--I'm still testing it
SWEP.Spawnable				= false;
SWEP.AdminSpawnable			= false;

SWEP.ViewModel				= "models/weapons/v_c4.mdl";
SWEP.WorldModel				= "models/weapons/w_c4.mdl";

SWEP.Primary.Automatic = false;
SWEP.Primary.Ammo = "none";
SWEP.Secondary.Ammo = "none";
SWEP.Primary.ClipSize = -1;
SWEP.Secondary.ClipSize = -1;
SWEP.Primary.DefaultClip = -1;
SWEP.Secondary.DefaultClip = -1;
SWEP.Weight					= 5;
SWEP.AutoSwitchTo			= false;
SWEP.AutoSwitchFrom			= false;
local defusetime = 0;
local planting = 0;
local timetoplant = 0;
local inited = false;

function SWEP:RCSDeploy()
	if (!inited) then
		for i=1,3 do
			self.Owner:PrintMessage(HUD_PRINTTALK, "WARNING: C4 CODE IS HIGHLY UNSTABLE, WOULD NOT ADVISE TO USE.");
		end
		inited = true;
	end
	self.Weapon:SendWeaponAnim(ACT_VM_DEPLOY);
end
function SWEP:PrimaryAttack()
	if ( self.ShootafterTakeout > CurTime() ) then return end
	if (!self.Owner:IsOnGround()) then
		self.Owner:PrintMessage(HUD_PRINTCENTER, "Planting a bomb in the air isn't a good idea.");
		return false;
	else
		timetoplant = 2.33 + CurTime();
		planting = 1;
	end
	self.Primary.Automatic = false;
end
function SWEP:Think()
	if (timetoplant <= CurTime()) then
		if (planting == 1) then
			self.Weapon:SendWeaponAnim(ACT_VM_SECONDARYATTACK);
			planting = 2;
			timetoplant = CurTime() + 30/25;
		elseif (planting == 2) then
			local owner = self.Owner;
			local c4 = ents.Create( "rcs_c4pack" );
				c4:SetPos( owner:GetPos() );
				c4:SetAngles( Angle(0, self.Owner:EyeAngles().y, self.Owner:EyeAngles().r))-- + Angle( 0, 0,0 ) )
			c4:Spawn( );
			c4:SetCollisionGroup( COLLISION_GROUP_NONE ) 
			c4:SetMoveType(MOVETYPE_NONE);
			c4.CollisionGroup = COLLISION_GROUP_NONE 
			planting = 0
			timetoplant = 0
			owner:ConCommand("lastinv");
			self.Weapon:Remove();
		end
	end
	
	if planting and not self.Owner:KeyDown(IN_ATTACK) then
		planting = 0;
		self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK);
	end
end
