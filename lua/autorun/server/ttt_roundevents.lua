--TTT Round Events
--Created by: Swifty
--Date: 3/25/15


--Global table of round event functions
Round_Events = {}

--Advert time in minutes
local advertTime = 8		



--Recursively includes all events
local files = file.Find("lua/events/*.lua", "GAME")
for k, _file in pairs(files) do
	include("events/".._file)
end


--Global chat MSG
function GlobalChatMsg(msg)
	for k, v in pairs(player.GetAll()) do
		v:SendLua("chat.AddText( Color(255,128,0), [[  []], Color(255,128,0), [[ Round Events ]], Color(255,128,0), [[] - ]], Color(128,255,0), [[".. msg .."]] )")
	end
end


--An advert to let players know about the round events.
timer.Create("kbz_roundevents", 60*advertTime, 0, function()
	GlobalChatMsg("This server has round events enabled.")
	GlobalChatMsg("On the last round something exciting will happen!")
end)


--Round checker, checks to see if it's time to call a
--random event.
local function CheckRound()

	local rounds_left = GetGlobalInt("ttt_rounds_left", 6)
	
	if rounds_left <= 6 then 
		GlobalChatMsg("Round event started!")	
	
		local randomEvent = table.Random(Round_Events)
		randomEvent()
	end

end
hook.Add("TTTBeginRound", "RoundEvents_CheckRound", CheckRound)