function EFFECT:Init(data)
	local e = ParticleEmitter( data:GetOrigin() );
		for i=1, 32 do
			--declare variables
			local smokesize = 20;
			local pos = Vector(math.Rand(-smokesize, smokesize), math.Rand(-smokesize, smokesize), math.Rand(-smokesize, smokesize) + 30);
			local p = e:Add( "particle/particle_smokegrenade", data:GetOrigin() + pos );
			if (p) then
				local gravsideways = math.Rand(-10,10);
				local shade = math.random(220,240);
				--set the stuff
				p:SetVelocity(VectorRand() * math.Rand(2000,2300));
				
				p:SetLifeTime(0);
				p:SetDieTime(math.Rand(10,16));
				
				p:SetColor(shade,shade,shade);
				p:SetStartAlpha(math.Rand(160,180));
				p:SetEndAlpha(0);
				
				p:SetStartSize(math.Rand(100,120));
				p:SetEndSize(math.Rand(100, 120));
				
				p:SetRoll(math.Rand(-180, 180));
				p:SetRollDelta(math.Rand(-0.2,0.2));
				
				p:SetAirResistance(math.Rand(520,620));
				p:SetGravity(   Vector( gravsideways, gravsideways, math.Rand(-20, -40) )    );

				p:SetCollide( true );
				p:SetBounce( 0.42 );

				p:SetLighting(1);
			end
		end
		
	e:Finish()
	
end

function EFFECT:Think( )
	return false
end
function EFFECT:Render()
end

