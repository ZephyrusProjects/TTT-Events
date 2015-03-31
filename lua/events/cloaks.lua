--Event: Cloak
--Desc: Gives all players a cloaking device


--Set to true to disable the event
local disableEvent = false


local function Give_Cloaks()

	for k, _pl in pairs(player.GetAll()) do
		if _pl:Alive() and !_pl:IsSpec() then
			_pl:Give("weapon_ttt_cloak")
		end
	end
	
	GlobalChatMsg("All players have been given a cloak!")

end


if !disableEvent then
	table.insert(Round_Events, Give_Cloaks)
end