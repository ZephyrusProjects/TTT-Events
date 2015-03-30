--Event: Shrink
--Desc: Shrinks all players


--Set to true to disable the event
local disableEvent = false


local function ShrinkPlayers()

	for k, _pl in pairs(player.GetAll()) do
		_pl:SetModelScale( 0.60)
	end

	GlobalChatMsg("Honey I shrunk the kids!")
	
end


if !disableEvent then
	table.insert(Round_Events, ShrinkPlayers)
end