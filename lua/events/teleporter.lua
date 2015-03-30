--Event: Teleporter
--Desc: Gives all players a teleporter


--Set to true to disable the event
local disableEvent = false


local function Give_Teleporters()

	for k, _pl in pairs(player.GetAll()) do
		if _pl:Alive() and !_pl:IsSpec() then
			_pl:Give("weapon_ttt_teleport")
		end
	end
	
	GlobalChatMsg("All players have been given a teleporter!")

end


if !disableEvent then
	table.insert(Round_Events, Give_Teleporters)
end