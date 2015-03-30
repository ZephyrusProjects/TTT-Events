--Event: Stalker
--Desc: Makes all of the traitors invisible


--Set to true to disable the event
local disableEvent = false


local function Stalker()

	for k, _pl in pairs(player.GetAll()) do
		if _pl:GetRole() == ROLE_TRAITOR then
			_pl:SetRenderMode( RENDERMODE_TRANSALPHA )
			_pl:SetColor( Color(255, 255, 255, 0) )
			_pl:DrawShadow(false)
			_pl:SetNWBool("disguised", true) --TTT Bool, removes the Player Name when looking at them.
			
			timer.Create( "RoundEvents_InvisWeapons:".._pl:SteamID(), .2, 0, function()		--Gets a list of the players weapons and makes them invisible.
				for k2,_wep in pairs(_pl:GetWeapons()) do
					_wep:SetNoDraw(true)
				end
			end)	
			
		end
	end
	
	hook.Add("EntityFireBullets", "RoundEvents_IsAttacking", function(ent, data)
		if ent:GetRole() == ROLE_TRAITOR then
			ent:SetColor( Color(255, 255, 255, 50) )
			ent:DrawShadow(true)
			timer.Simple(.2, function()
				ent:SetColor( Color(255, 255, 255, 0) )
				ent:DrawShadow(false)
			end)
		end
	end)
	
	
	
	hook.Add("TTTEndRound", "RoundEvents_InvisTimer_Destroy", function()
		for k, _pl in pairs(player.GetAll()) do
			timer.Destroy( "RoundEvents_InvisWeapons:"..v:SteamID() )
			_pl:SetNWBool("disguised", false)
		end	
	end)

	GlobalChatMsg("All traitors are now invisible!")
	
end


if !disableEvent then
	table.insert(Round_Events, Stalker)
end

