--Event: DNA
--Desc: Gives all players a DNA scanner


--Set to true to disable the event
local disableEvent = false


local function Give_DNAScanner()

	for k, _pl in pairs(player.GetAll()) do
		if _pl:Alive() and !_pl:IsSpec() then
			_pl:Give("weapon_ttt_wtester")
		end
	end
	
	GlobalChatMsg("All players have been given a DNA scanner!")

end


if !disableEvent then
	table.insert(Round_Events, Give_DNAScanner)
end