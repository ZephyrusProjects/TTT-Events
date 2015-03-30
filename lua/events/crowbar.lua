--Event: Gordon Freeman
--Desc: Everybody spawns with 20hp and a crowbar


--Set to true to disable the event
local disableEvent = false


local function Crowbar()

	for k, _ent in pairs(ents.GetAll()) do
		if _ent:IsWeapon() then
			_ent:Remove()
		end
	end

	for k, _pl in pairs(player.GetAll()) do
		_pl:StripWeapons()
		_pl:Give("weapon_zm_improvised")
		_pl:Give("weapon_zm_carry")
	end

	GlobalChatMsg("All players have 20 hp and a crowbar!")
	
end


if !disableEvent then
	table.insert(Round_Events, Crowbar)
end