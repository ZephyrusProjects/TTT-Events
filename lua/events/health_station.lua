--Event: Health Station
--Desc: All Innocents spawn with a health station. Traitors spawn with
--      a pain station.


--Set to true to disable the event
local disableEvent = false


local function HealthStation()

	for k, _pl in pairs(player.GetAll()) do
		if _pl:Alive() and !_pl:IsSpec() then
			if _pl:GetRole() == ROLE_TRAITOR then
				_pl:Give("weapon_ttt_painstation")
			else
				_pl:Give("weapon_ttt_health_station")
			end
		end
	end

	GlobalChatMsg("All Innocents have been given a health station. All Traitors have been given a pain station!")
	
end


if !disableEvent then
	table.insert(Round_Events, HealthStation)
end