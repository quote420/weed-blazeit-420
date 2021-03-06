if (SERVER) then
	AddCSLuaFile("shared.lua")
end

SWEP.PrintName = "Ultra Medic Kit"
SWEP.Author = "Jake Johnson"
SWEP.Slot = 4
SWEP.SlotPos = 3
SWEP.Description = "Heals the wounded."
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions = "Left Click to heal player infront of user."

SWEP.Spawnable = false       -- Change to false to make Admin only.
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/v_c4.mdl"
SWEP.WorldModel = "models/weapons/w_package.mdl"

SWEP.Primary.Recoil = 0
SWEP.Primary.ClipSize  = -1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic  = true
SWEP.Primary.Delay = 0.05
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Recoil = 0
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Delay = 0.15
SWEP.Secondary.Ammo = "none"


function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	local found
	local lastDot = -1 -- the opposite of what you're looking at
	local aimVec = self.Owner:GetAimVector()

	for k,v in pairs(player.GetAll()) do
		local maxhealth = v.StartHealth or 100
		if v == self.Owner or v:GetShootPos():Distance(self.Owner:GetShootPos()) > 85 or v:Health() >= maxhealth then continue end

		local direction = v:GetShootPos() - self.Owner:GetShootPos()
		direction:Normalize()
		local dot = direction:Dot(aimVec)

		-- Looking more in the direction of this player
		if dot > lastDot then
			lastDot = dot
			found = v
		end
	end

	if found then
		found:SetHealth(found:Health() + 5)
	end
end

function SWEP:SecondaryAttack()
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
	local maxhealth = self.Owner.StartHealth or 100
	if self.Owner:Health() < maxhealth and SERVER then
		self.Owner:SetHealth(self.Owner:Health() + 5)
	end
end