local addon, ST = ...

ST.currBuffPackage = "small"
ST.buffPackages = {}

-- Str = 1,
-- Agi = 2,
-- AP = 3,
-- Armor = 4,
-- SP = 5,
-- SpecSP = 6,
-- MP5Pot = 7,
-- TankFood = 8,
-- MeleeFood = 9,
-- HunterFood = 10,
-- CasterFood = 11,
-- HealerFood = 12,
-- SpiritAlc = 13

-- FULL PACKAGE
ST.buffPackages["full"] = {}
ST.buffPackages["full"][ST.category["Str"]] = {				-- 1
	ST.consumableIdsByName["ElixirOfTheGiants"],
	ST.consumableIdsByName["JujuPower"]
}
ST.buffPackages["full"][ST.category["Agi"]] = {				-- 2
	ST.consumableIdsByName["ElixirOfTheMongoose"]
}
ST.buffPackages["full"][ST.category["AP"]] = {				-- 3
	ST.consumableIdsByName["JujuMight"],
	ST.consumableIdsByName["WinterfallFirewater"]
}
ST.buffPackages["full"][ST.category["Armor"]] = {			-- 4
	ST.consumableIdsByName["ElixirOfSuperiorDefense"]
}
ST.buffPackages["full"][ST.category["SP"]] = {				-- 5
	ST.consumableIdsByName["GreaterArcaneElixir"],
}
ST.buffPackages["full"][ST.category["SpecSP"]] = {			-- 6
	ST.consumableIdsByName["ElixirOfGreaterFirepower"],
	ST.consumableIdsByName["ElixirOfShadowPower"],
}
ST.buffPackages["full"][ST.category["MP5Pot"]] = {			-- 7
	ST.consumableIdsByName["MagebloodPotion"]
}
ST.buffPackages["full"][ST.category["TankFood"]] = {		-- 8
	ST.consumableIdsByName["ChimaerokChopsStamiFood"],
	ST.consumableIdsByName["IncreasedStami10"],
	ST.consumableIdsByName["WellFedSpiritAndStami12"],
	ST.consumableIdsByName["WellFedSpiritAndStami14"],
	ST.consumableIdsByName["WellFedSpiritAndStami25p"],
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["BlessedSunfruitStr"],
	ST.consumableIdsByName["SmokedDesertDumplingsStr"]
}
ST.buffPackages["full"][ST.category["MeleeFood"]] = {		-- 9
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["BlessedSunfruitStr"],
	ST.consumableIdsByName["SmokedDesertDumplingsStr"],
	ST.consumableIdsByName["ChimaerokChopsStamiFood"]
}
ST.buffPackages["full"][ST.category["HunterFood"]] = {		-- 10
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"]
}
ST.buffPackages["full"][ST.category["CasterFood"]] = {		-- 11
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"]
}
ST.buffPackages["full"][ST.category["HealerFood"]] = {		-- 12
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"],
	ST.consumableIdsByName["WellFedSpiritAndStami12"],
	ST.consumableIdsByName["WellFedSpiritAndStami14"],
	ST.consumableIdsByName["WellFedSpiritAndStami25p"]
}
ST.buffPackages["full"][ST.category["SpiritAlc"]] = {		-- 13
	ST.consumableIdsByName["KreegsStoutSpiritAlc"]
}

------------------------------------------------------------------------------
-- Set Consumable Categories for Small Package

ST.buffPackages["small"] = {}
ST.buffPackages["small"][ST.category["Str"]] = {		-- 1
	ST.consumableIdsByName["ElixirOfTheGiants"],
	ST.consumableIdsByName["JujuPower"]
}
ST.buffPackages["small"][ST.category["Agi"]] = {		-- 2
	ST.consumableIdsByName["ElixirOfTheMongoose"],
	ST.consumableIdsByName["ElixirOfGreaterAgility"]
}
ST.buffPackages["small"][ST.category["Armor"]] = {		-- 4
	ST.consumableIdsByName["ElixirOfSuperiorDefense"]
}
ST.buffPackages["small"][ST.category["SP"]] = {		-- 5
	ST.consumableIdsByName["GreaterArcaneElixir"],
	ST.consumableIdsByName["ArcaneElixir"],
	ST.consumableIdsByName["FlaskOfSupremePower"] -- Flask may replace SP Pot in small config
}
ST.buffPackages["small"][ST.category["SpecSP"]] = {		-- 6
	ST.consumableIdsByName["ElixirOfGreaterFirepower"],
	ST.consumableIdsByName["ElixirOfFirepower"],
	ST.consumableIdsByName["ElixirOfShadowPower"]
}
ST.buffPackages["small"][ST.category["MP5Pot"]] = {		-- 7
	ST.consumableIdsByName["MagebloodPotion"]
}
ST.buffPackages["small"][ST.category["TankFood"]] = {		-- 8
	ST.consumableIdsByName["ChimaerokChopsStamiFood"],
	ST.consumableIdsByName["IncreasedStami10"],
	ST.consumableIdsByName["WellFedSpiritAndStami12"],
	ST.consumableIdsByName["WellFedSpiritAndStami14"],
	ST.consumableIdsByName["WellFedSpiritAndStami25p"],
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["BlessedSunfruitStr"],
	ST.consumableIdsByName["SmokedDesertDumplingsStr"]
}
ST.buffPackages["small"][ST.category["MeleeFood"]] = {		-- 9
	ST.consumableIdsByName["ChimaerokChopsStamiFood"],
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["BlessedSunfruitStr"],
	ST.consumableIdsByName["SmokedDesertDumplingsStr"]
}
ST.buffPackages["small"][ST.category["HunterFood"]] = {		-- 10
	ST.consumableIdsByName["WinterCalmarAgi"],
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"]
}
ST.buffPackages["small"][ST.category["CasterFood"]] = {		-- 11
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"]
}
ST.buffPackages["small"][ST.category["HealerFood"]] = {		-- 12
	ST.consumableIdsByName["NightfinSoupManaregFood"],
	ST.consumableIdsByName["RunnTumTuberIntFood"],
	ST.consumableIdsByName["WellFedSpiritAndStami12"],
	ST.consumableIdsByName["WellFedSpiritAndStami14"],
	ST.consumableIdsByName["WellFedSpiritAndStami25p"]
}