-- Admin Money printer.
-- needs a fucking penguin icon
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local PrintMore
function ENT:Initialize()
	self:SetModel("models/props_lab/reciever01a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()

	self.sparking = false
	self.damage = 100
	self.IsMoneyPrinter = true
	timer.Simple(math.random(10, 150), function() PrintMore(self) end)
end

PrintMore = function(ent)
	if not IsValid(ent) then return end

	ent.sparking = true
	timer.Simple(3, function()
		if not IsValid(ent) then return end
		ent:CreateMoneybag()
	end)
end

function ENT:CreateMoneybag()
	if not IsValid(self) then return end

	local MoneyPos = self:GetPos()

	local amount = GAMEMODE.Config.psmprintamount
	if amount == 0 then
		amount = 250
	end

	DarkRPCreateMoneyBag(Vector(MoneyPos.x + 15, MoneyPos.y, MoneyPos.z + 15), amount)
	
	self.sparking = false
	timer.Simple(math.random(10, 150), function() PrintMore(self) end)
end

function ENT:Think()

	if not self.sparking then return end

	local effectdata = EffectData()
	effectdata:SetOrigin(self:GetPos())
	effectdata:SetMagnitude(1)
	effectdata:SetScale(1)
	effectdata:SetRadius(2)
	util.Effect("Sparks", effectdata)
end
