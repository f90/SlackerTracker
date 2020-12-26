-- /console scriptErrors 1
ST = {}

local consumableIds = {}
consumableIds[10157] = "ArcaneIntellect"

-- PROTECTION POTIONS
consumableIds[17543] = "GreaterFireProtectionPotion"
consumableIds[17544] = "GreaterFrostProtectionPotion"
consumableIds[17546] = "GreaterNatureProtectionPotion"
consumableIds[17548] = "GreaterShadowProtectionPotion"
consumableIds[17549] = "GreaterArcaneProtectionPotion"

consumableIds[7233] = "FireProtectionPotion"
consumableIds[7239] = "FrostProtectionPotion"
consumableIds[7242] = "ShadowProtectionPotion"
consumableIds[7254] = "NatureProtectionPotion"

-- PROTECTION JUJUS
consumableIds[16325] = "JujuChill" -- NEED TO CHECK SPELL ID
consumableIds[16326] = "JujuEmber" -- NEED TO CHECK SPELL ID

-- MELEE/HUNTER CONSUMES
consumableIds[11405] = "ElixirOfTheGiants"
consumableIds[16329] = "JujuMight" -- NEED TO CHECK SPELL ID
consumableIds[11334] = "ElixirOfGreaterAgility"
consumableIds[17538] = "ElixirOfTheMongoose"
consumableIds[17038] = "WinterfallFirewater"
consumableIds[16323] = "JujuPower" -- NEED TO CHECK SPELL ID
-- food
consumableIds[18192] = "WinterCalmarAgi" -- NEED TO CHECK SPELL ID
consumableIds[18125] = "BlessedSunfruitStr" -- NEED TO CHECK SPELL ID

-- CASTER CONSUMES
consumableIds[17539] = "GreaterArcaneElixir"
consumableIds[11390] = "ArcaneElixir"
consumableIds[11474] = "ElixirOfShadowPower"
consumableIds[26276] = "ElixirOfGreaterFirepower"
--food
consumableIds[22730] = "RumTumTuberIntFood" -- NEED TO CHECK SPELL ID

-- HEALER CONSUMES
consumableIds[24363] = "MagebloodPotion" -- NEED TO CHECK SPELL ID
-- food
consumableIds[18194] = "NightfinSoupManaregFood" -- NEED TO CHECK SPELL ID
consumableIds[22790] = "KreegsStoutSpiritDrink" -- NEED TO CHECK SPELL ID

-- FLASKS
consumableIds[17626] = "FlaskOfTheTitans"
consumableIds[17627] = "FlaskOfDistilledWisdom"
consumableIds[17628] = "FlaskOfSupremePower"

function ST:getGroupStatus()
	local groupStatus
	if UnitInRaid("player") then
		groupStatus = "raid"
		print("player is in raid with", GetNumGroupMembers(), "members");
	elseif UnitInParty("player") then
		groupStatus = "party"
		print("player is in party with", GetNumGroupMembers(), "members");
	else
		print("player is not in party or raid")
		groupStatus = "solo"
	end
	return groupStatus
end

function ST:getBuffsOfActiveUnit(activeUnit)
	local buffs, i = { }, 1;
	local buffSpellIds = {};
	-- local buffName, icon, count, debuffType, duration, expirationTime, source, isStealable, 
	-- nameplateShowPersonal, buffSpellId = UnitBuff(activeUnit, i)
	local buff, _, _, _, _, _, _, _, _, buffSpellId = UnitBuff(activeUnit, i);
	while buff do
		buffs[#buffs + 1] = buff;
		buffSpellIds[#buffSpellIds + 1] = buffSpellId;
		i = i + 1;
		buff, _, _, _, _, _, _, _, _, buffSpellId = UnitBuff(activeUnit, i);
	end
	return buffs, buffSpellIds
end

function ST:genActiveUnit(n, groupStatus)
	if groupStatus == "raid" then
		return "raid"..n
	elseif groupStatus == "party" then
		if n == 1 then
			return "player"
		else
			return "party"..n-1
		end
	elseif groupStatus == "solo" then
		return "player"
	end
end

function ST:checkConsumablesOfGroup()
    local currentTarget = UnitName("target");
    local currentZone = GetZoneText();
    local currentRealZone = GetRealZoneText();
	local groupStatus = ST:getGroupStatus()
	local numGroupMembers = GetNumGroupMembers()
	if groupStatus == "solo" then
		numGroupMembers = 1
	end
	local activeUnitName
	local activeUnitBuffs
	local buffSpellIds
	local groupBuffTable = {};
	local groupBuffSpellIdTable = {};
	local groupNameTable = {};
	local groupConsumesCheckTable = {};
	local n = 1
	while n <= numGroupMembers do
		activeUnit = ST:genActiveUnit(n, groupStatus)
		activeUnitName = UnitName(activeUnit)
		buffs, buffSpellIds = ST:getBuffsOfActiveUnit(activeUnit)
		groupNameTable[n] = activeUnitName
		groupBuffTable[n] = activeUnitBuffs
		groupBuffSpellIdTable[n] = buffSpellIds
		groupConsumesCheckTable[n] = {}
		for index,value in pairs(consumableIds) do
			groupConsumesCheckTable[n][index] = false
		end
		for index,value in pairs(buffSpellIds) do
			if (consumableIds[value] ~= nil) then
				groupConsumesCheckTable[n][value] = true
			end
		end
		n = n + 1
	end
	
    print(date("%y-%m-%d %H:%M:%S"), currentZone, currentRealZone, currentTarget)
	for i = 1,#groupNameTable do
		-- print(table.concat(groupBuffTable[i], ", "))
		-- print(table.concat(groupBuffSpellIdTable[i], ", "))
		print(groupNameTable[i])
		for index,value in pairs(groupConsumesCheckTable[i]) do
			print(index, consumableIds[index], value)
		end
	end
end