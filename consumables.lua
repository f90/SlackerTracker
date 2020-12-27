ST.category = {
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

ST.categoryNameById = reverseMap(ST.category)

local categoriesByRole = {}
categoriesByRole[ST.role["TANK"]] = {ST.category["Str"], ST.category["Agi"], ST.category["AP"], ST.category["Armor"], ST.category["TankFood"]}
categoriesByRole[ST.role["DRUID"]] = {ST.category["MP5Pot"], ST.category["HealerFood"], ST.category["SpiritAlc"]}
categoriesByRole[ST.role["PRIEST"]] = {ST.category["MP5Pot"], ST.category["HealerFood"], ST.category["SpiritAlc"]}
categoriesByRole[ST.role["SHAMAN"]] = {ST.category["MP5Pot"], ST.category["HealerFood"]}
categoriesByRole[ST.role["WARRIOR"]] = {ST.category["Str"], ST.category["Agi"]} -- TODO , ST.category["AP"], ST.category["MeleeFood"]}
categoriesByRole[ST.role["HUNTER"]] = {ST.category["Agi"], ST.category["AP"], ST.category["CasterFood"]}
categoriesByRole[ST.role["MAGE"]] = {ST.category["SP"], ST.category["SpecSP"], ST.category["CasterFood"]}

categoriesByRole[ST.role["ROGUE"]] = categoriesByRole[ST.role["WARRIOR"]]
categoriesByRole[ST.role["CAT"]] = categoriesByRole[ST.role["WARRIOR"]]
categoriesByRole[ST.role["ENHANCER"]] = categoriesByRole[ST.role["WARRIOR"]]
categoriesByRole[ST.role["WARLOCK"]] = categoriesByRole[ST.role["MAGE"]]
categoriesByRole[ST.role["SHADOW"]] = categoriesByRole[ST.role["MAGE"]]
categoriesByRole[ST.role["ELEMENTAL"]] = categoriesByRole[ST.role["MAGE"]]
categoriesByRole[ST.role["MOONKIN"]] = categoriesByRole[ST.role["MAGE"]]
ST.categoriesByRole = categoriesByRole

-- CREATE CONSUMABLE ID INFO

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

ST.consumableIds = consumableIds

ST.consumableIdsByName = reverseMap(consumableIds)

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
consumableIdsByCategory[ST.category["Str"]] = {
	ST.specialRoleByName["ElixirOfTheGiants"],
	ST.specialRoleByName["JujuMight"]
}

consumableIdsByCategory[ST.category["Agi"]] = {
	ST.specialRoleByName["ElixirOfGreaterAgility"],
	ST.specialRoleByName["ElixirOfTheMongoose"]
}

consumableIdsByCategory[ST.category["AP"]] = {
	ST.specialRoleByName["JujuMight"],
	ST.specialRoleByName["JujuMight"]
}

consumableIdsByCategory[ST.category["SP"]] = {
	ST.specialRoleByName["ArcaneElixir"],
	ST.specialRoleByName["GreaterArcaneElixir"]
}

consumableIdsByCategory[ST.category["SpecSP"]] = {
	ST.specialRoleByName["ElixirOfGreaterFirepower"],
	ST.specialRoleByName["ElixirOfShadowPower"] --TODO frost power, small firepower...
}

consumableIdsByCategory[ST.category["CasterFood"]] = {
	ST.specialRoleByName["NightfinSoupManaregFood"],
	ST.specialRoleByName["RumTumTuberIntFood"]
}
ST.consumableIdsByCategory = consumableIdsByCategory