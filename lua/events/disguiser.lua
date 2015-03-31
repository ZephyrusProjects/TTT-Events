--Event: Disguise
--Desc: Gives all players a disguiser


--Set to true to disable the event
local disableEvent = false


local function Disguiser()

	for k, _pl in pairs(player.GetAll()) do
		if _pl:Alive() and !_pl:IsSpec() then
			_pl:SetNWBool("disguised", true)
		end
	end
	
	hook.Add("TTTEndRound", "RoundEvents_Remove_Disguise", function()
		for k, _pl in pairs(player.GetAll()) do
			_pl:SetNWBool("disguised", false)
		end	
	end)

	GlobalChatMsg("All players are now disguised!")
	
end


if !disableEvent then
	table.insert(Round_Events, Disguiser)
end