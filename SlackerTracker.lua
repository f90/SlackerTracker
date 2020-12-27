-- /console scriptErrors 1
ST = {}

local role = {
TANK = 1,
DRUID = 2, -- Heal Druid
PRIEST = 3, -- Heal Priest
SHAMAN = 4, -- Heal Shaman
WARRIOR = 5, -- DD Warrior
ROGUE = 6,
HUNTER = 7,
CAT = 8,
ENHANCER = 9,
MAGE = 10,
WARLOCK = 11,
SHADOW = 12,
ELEMENTAL = 13, -- Ele Shaman
MOONKIN = 14
}

local category = {
Str = 1,
Agi = 2,
AP = 3,
Armor = 4,
TankFood = 5,
MeleeFood = 6,
SP = 7,
SpecSP = 8,
CasterFood = 10,
MP5Pot = 11,
HealerFood = 12,
SpiritAlc = 13
}

local categoriesByRole = {
	role["TANK"] = {category["Str"], category["Agi"], category["AP"], category["Armor"], category["TankFood"]},
	role["DRUID"] = {category["MP5Pot"], category["HealerFood"], category["SpiritAlc"]},
	role["PRIEST"] = {category["MP5Pot"], category["HealerFood"], category["SpiritAlc"]},
	role["SHAMAN"] = {category["MP5Pot"], category["HealerFood"]},
	role["WARRIOR"] = {category["Str"], category["Agi"], category["AP"], category["MeleeFood"]},
	role["HUNTER"] = {category["Agi"], category["AP"], category["CasterFood"]},
	role["MAGE"] = {category["SP"], category["SpecSP"], category["CasterFood"]},
}
categoriesByRole[role["ROGUE"]] = categoryByRole[role["WARRIOR"]]
categoriesByRole[role["CAT"]] = categoryByRole[role["WARRIOR"]]
categoriesByRole[role["ENHANCER"]] = categoryByRole[role["WARRIOR"]]
categoriesByRole[role["WARLOCK"]] = categoryByRole[role["MAGE"]]
categoriesByRole[role["SHADOW"]] = categoryByRole[role["MAGE"]]
categoriesByRole[role["ELEMENTAL"]] = categoryByRole[role["MAGE"]]
categoriesByRole[role["MOONKIN"]] = categoryByRole[role["MAGE"]]

local specialRoleByName = {
	Tyranox = role["TANK"],
	Steveyo = role["TANK"],
	Skogtroll = role["TANK"],
	Mudcrawler = role["TANK"],
	Kronk = role["TANK"],
	Mafox = role["CAT"],
	Pakuun = role["CAT"],
	Durator = role["ENHANCER"],
	Hämpi = role["ENHANCER"],
	Hanutamatata = role["ELEMENTAL"]
}

function ST:getRole(name, class)
	if specialRoleByName[name] do
		return specialRoleByName[name]
	else
		return role[class]
	end
end

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
consumableIds[16323] = "JujuPower" -- NEED TO CHECK SPELL ID
consumableIds[11334] = "ElixirOfGreaterAgility"
consumableIds[17538] = "ElixirOfTheMongoose"
consumableIds[17038] = "WinterfallFirewater"
consumableIds[16329] = "JujuMight" -- NEED TO CHECK SPELL ID
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

local consumableIdsByName = {}

for index, value in pairs(consumableIds) do
	consumableIdsByName[value] = index
end

-- function ST:testConsTable()
	print(consumableIdsByName["MagebloodPotion"])
	-- for index, value in pairs(consumableIdsByName) do
		-- print(index, value)
	-- end
-- end

local consumableIdsByCategory = {}
-- Str = 1,
-- Agi = 2,
-- AP = 3,
-- Armor = 4,
-- TankFood = 5,
-- MeleeFood = 6,
-- SP = 7,
-- SpecSP = 8,
-- CasterFood = 10,
-- MP5Pot = 11,
-- HealerFood = 12,
consumableIdsByCategory[category["Str"]] = {
	consumableIdsByName["ElixirOfTheGiants"],
	consumableIdsByName["JujuMight"]
}

consumableIdsByCategory[category["Agi"]] = {
	consumableIdsByName["ElixirOfGreaterAgility"],
	consumableIdsByName["ElixirOfTheMongoose"]
}

consumableIdsByCategory[category["AP"]] = {
	consumableIdsByName["JujuMight"],
	consumableIdsByName["JujuMight"]
}


-- local consumableIdsByRole = {}

-- consumableIdsByRole[role["WARRIOR"]] = {
	-- {
	-- consumableIdsByName["ElixirOfTheGiants"],
	-- consumableIdsByName["JujuMight"]
	-- },
	-- {consumableIdsByName["ElixirOfTheMongoose"]}

-- }

-- consumableIdsByRole[role["ROGUE"]] = {
	-- {
	-- consumableIdsByName["ElixirOfTheGiants"],
	-- consumableIdsByName["JujuMight"]
	-- },
	-- {consumableIdsByName["ElixirOfTheMongoose"]}

-- }

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
	local activeUnitName, activeUnitClass, activeUnitBuffs
	local buffs, buffSpellIds
	local groupNameTable = {};
	local groupClassTable = {};
	local groupBuffTable = {};
	local groupBuffSpellIdTable = {};
	local groupConsumesCheckTable = {};
	local n = 1
	while n <= numGroupMembers do
		activeUnit = ST:genActiveUnit(n, groupStatus)
		activeUnitName = UnitName(activeUnit)
		_, activeUnitClass, _ = UnitClass(activeUnit)
		buffs, buffSpellIds = ST:getBuffsOfActiveUnit(activeUnit)
		groupNameTable[n] = activeUnitName
		groupClassTable[n] = activeUnitClass
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
		print(groupNameTable[i], groupClassTable[i])
		for index,value in pairs(groupConsumesCheckTable[i]) do
			print(index, consumableIds[index], value)
		end
	end
end