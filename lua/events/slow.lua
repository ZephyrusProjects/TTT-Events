--Event: Slow
--Desc: Retards players run speed, lol


--Set to true to disable the event
local disableEvent = false


local function Slow()

	hook.Add("TTTPlayerSpeed", "RoundEvents_Slow", function(ply, slowed)	
		return 0.75
	end)

	GlobalChatMsg("Everyone's run speed has been decreased!")
	
end


if !disableEvent then
	table.insert(Round_Events, Slow)
end