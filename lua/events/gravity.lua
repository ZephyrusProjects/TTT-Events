--Event: Low Gravity
--Desc: Lowers the servers gravity


--Set to true to disable the event
local disableEvent = false



local function LowGravity()
	local gravity = GetConVarNumber( "sv_gravity" )
	
	RunConsoleCommand("sv_gravity", "100")
	
	GlobalChatMsg("Gravity has been lowered!")
	
	

	
	hook.Add("TTTEndRound", "RoundEvents_Gravity", function()
		RunConsoleCommand( "sv_gravity", tostring(gravity) )
	end)
	
end


if !disableEvent then
	table.insert(Round_Events, LowGravity)
end