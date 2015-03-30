--Event: Winchester
--Desc: Gives all players a winchester


--Set to true to disable the event
local disableEvent = false


local function Give_Winchester()

	for k, _pl in pairs(ents.GetAll()) do
		if _pl:IsWeapon() then
			_pl:Remove()
		end
	end

	for k, _pl in pairs(player.GetAll()) do
		_pl:StripWeapons()
		_pl:Give("weapon_zm_improvised")
		_pl:Give("weapon_zm_carry")
		_pl:Give("weapon_ttt_unarmed")
		_pl:Give("weapon_ttt_winchester")
		_pl:GiveAmmo(32, "Buckshot")
	end
	
	GlobalChatMsg("All players have been given a winchester!")

end


if !disableEvent then
	table.insert(Round_Events, Give_Winchester)
end