--Event: Speed
--Desc: Increases players run speed


--Set to true to disable the event
local disableEvent = false


local function Speed()

	hook.Add("TTTPlayerSpeed", "RoundEvents_Speed", function(ply, slowed)	
		return 2
	end)

	GlobalChatMsg("Everyone's run speed has been increased!")
	
end


if !disableEvent then
	table.insert(Round_Events, Speed)
end