--Event: Disguise
--Desc: Gives all players a disguiser


--Set to true to disable the event
local disableEvent = false


local function Disguiser()

	for k, _pl in pairs(player.GetAll()) do
		_pl:SetNWBool("disguised", true)
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