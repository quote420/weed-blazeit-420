AddCSLuaFile("shared.lua")

DEFINE_BASECLASS("base_anim")

ENT.PrintName		= "Armor"
ENT.Author			= "da bones"
ENT.Information		= "Equip player with 100 armor"

ENT.Spawnable			= false
ENT.AdminSpawnable		= true
ENT.RenderGroup 		= RENDERGROUP_OPAQUE

function ENT:SpawnFunction( ply, tr )

	if ( !tr.Hit ) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	
	local ent = ents.Create( "rp_armor100" )
		ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	
	return ent
	
end

--[[---------------------------------------------------------
   Name: Initialize
-----------------------------------------------------------]]
function ENT:Initialize()

	if ( SERVER ) then
	
		-- Use the helibomb model just for the shadow (because it's about the same size)
		self:SetModel( "models/items/hevsuit.mdl" )
		
		self:PhysicsInit( SOLID_VPHYSICS )
  	self:SetMoveType( MOVETYPE_VPHYSICS )
  	self:SetSolid( SOLID_BBOX )
		
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON)
		
		self:DropToFloor()
		
		local b = 16
     self:SetCollisionBounds(Vector(-b, -b, -b), Vector(b,b,b))
  
     if SERVER then
        self:SetTrigger(true)
     end
		
		-- Wake the physics object up. It's time to have fun!
		local phys = self:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:Wake()
			phys:EnableMotion( false )
		end
		
		-- Set collision bounds exactly
		--self:SetCollisionBounds( Vector( -16, -16, -16 ), Vector( 16, 16, 16 ) )
	else
	  self.lastDrawTime = CurTime()	
	end
	
end


if(CLIENT) then
  
  
  function ENT:Draw()
    self:DrawModel()
    local angles = self:GetAngles()
    
    local time = CurTime()
    local dt = time - self.lastDrawTime
    self.lastDrawTime = time
    
    angles.y = angles.y + (90 * dt)
    
    
    
    self:SetAngles(angles)
    
  end
end

function ENT:StartTouch(activator)
  
	
	if ( activator:IsValid() and activator:IsPlayer() ) then
	  
	  local ap = activator:Armor()
	  if(ap < 100) then
	    
	    self:Remove()
	  
  		activator:SetArmor( 100 )
  		activator:EmitSound("items/battery_pickup.wav",100,100)
  		
		end
		
	end

end