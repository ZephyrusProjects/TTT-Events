--Event: Shrink
--Desc: Shrinks all players


--Set to true to disable the event
local disableEvent = false


local function ShrinkPlayers()

	for k, _pl in pairs(player.GetAll()) do
		if _pl:Alive() and !_pl:IsSpec() then
			_pl:SetModelScale( 0.60)
		end
	end

	GlobalChatMsg("Honey I shrunk the kids!")
	
end


if !disableEvent then
	table.insert(Round_Events, ShrinkPlayers)
end