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
ST.buffPackages["full"]["Str"] = ST.Requirement(ST.RoleGroup("MELEE"), {                -- 1 Melee + Tanks
    ST.consumableIdsByName["ElixirOfTheGiants"],
    ST.consumableIdsByName["JujuPower"]
})
ST.buffPackages["full"]["Agi"] = ST.Requirement(ST.RoleGroup("PHYSICAL"), {                -- 2
    ST.consumableIdsByName["ElixirOfTheMongoose"]
})
ST.buffPackages["full"]["AP"] = ST.Requirement(ST.RoleGroup("PHYSICALDPS"), {                -- 3
    ST.consumableIdsByName["JujuMight"],
    ST.consumableIdsByName["WinterfallFirewater"]
})
ST.buffPackages["full"]["Armor"] = ST.Requirement(ST.RoleGroup("TANK"), {           -- 4
    ST.consumableIdsByName["ElixirOfSuperiorDefense"]
})
ST.buffPackages["full"]["SP"] = ST.Requirement(ST.RoleGroup("CASTER"), {               -- 5
    ST.consumableIdsByName["GreaterArcaneElixir"],
})
ST.buffPackages["full"]["SpecSP"] = ST.Requirement(ST.RoleGroup("CASTER"), {            -- 6
    ST.consumableIdsByName["ElixirOfGreaterFirepower"],
    ST.consumableIdsByName["ElixirOfShadowPower"],
})
ST.buffPackages["full"]["MP5Pot"] = ST.Requirement(ST.RoleGroup("HEALER"), {            -- 7
    ST.consumableIdsByName["MagebloodPotion"]
})
ST.buffPackages["full"]["TankFood"] = ST.Requirement(ST.RoleGroup("TANK"), {        -- 8
    ST.consumableIdsByName["ChimaerokChopsStamiFood"],
    ST.consumableIdsByName["IncreasedStami10"],
    ST.consumableIdsByName["WellFedSpiritAndStami12"],
    ST.consumableIdsByName["WellFedSpiritAndStami14"],
    ST.consumableIdsByName["WellFedSpiritAndStami25p"],
    ST.consumableIdsByName["WinterCalmarAgi"],
    ST.consumableIdsByName["BlessedSunfruitStr"],
    ST.consumableIdsByName["SmokedDesertDumplingsStr"]
})
ST.buffPackages["full"]["MeleeFood"] = ST.Requirement(ST.RoleGroup("MELEEDPS"), {        -- 9
    ST.consumableIdsByName["WinterCalmarAgi"],
    ST.consumableIdsByName["BlessedSunfruitStr"],
    ST.consumableIdsByName["SmokedDesertDumplingsStr"],
    ST.consumableIdsByName["ChimaerokChopsStamiFood"]
})
ST.buffPackages["full"]["HunterFood"] = ST.Requirement(ST.RoleGroup("HUNTER"), {        -- 10
    ST.consumableIdsByName["WinterCalmarAgi"],
    ST.consumableIdsByName["NightfinSoupManaregFood"],
    ST.consumableIdsByName["RunnTumTuberIntFood"]
})
ST.buffPackages["full"]["CasterFood"] = ST.Requirement(ST.RoleGroup("CASTER"), {        -- 11
    ST.consumableIdsByName["NightfinSoupManaregFood"],
    ST.consumableIdsByName["RunnTumTuberIntFood"]
})
ST.buffPackages["full"]["HealerFood"] = ST.Requirement(ST.RoleGroup("HEALER"), {        -- 12
    ST.consumableIdsByName["NightfinSoupManaregFood"],
    ST.consumableIdsByName["RunnTumTuberIntFood"],
    ST.consumableIdsByName["WellFedSpiritAndStami12"],
    ST.consumableIdsByName["WellFedSpiritAndStami14"],
    ST.consumableIdsByName["WellFedSpiritAndStami25p"]
})
ST.buffPackages["full"]["SpiritAlc"] = ST.Requirement(ST.RoleGroup({ST.role["DRUID"], ST.role["PRIEST"]}), {        -- 13
    ST.consumableIdsByName["KreegsStoutSpiritAlc"]
})

-- SMALL PACKAGE
ST.buffPackages["small"] = {}
ST.buffPackages["small"]["Str"] = ST.Requirement(ST.RoleGroup("MELEE"), {                -- 1 Melee + Tanks
    ST.consumableIdsByName["ElixirOfTheGiants"],
    ST.consumableIdsByName["JujuPower"]
})
ST.buffPackages["small"]["Agi"] = ST.Requirement(ST.RoleGroup("PHYSICAL"), {                -- 2
    ST.consumableIdsByName["ElixirOfTheMongoose"],
    ST.consumableIdsByName["ElixirOfGreaterAgility"]
})
ST.buffPackages["small"]["Armor"] = ST.Requirement(ST.RoleGroup("TANK"), {           -- 4
    ST.consumableIdsByName["ElixirOfSuperiorDefense"]
})
ST.buffPackages["small"]["SP"] = ST.Requirement(ST.RoleGroup("CASTER"), {               -- 5
    ST.consumableIdsByName["GreaterArcaneElixir"],
	ST.consumableIdsByName["ArcaneElixir"],
	ST.consumableIdsByName["FlaskOfSupremePower"] -- Flask may replace SP Pot in small config
})
ST.buffPackages["small"]["SpecSP"] = ST.Requirement(ST.RoleGroup("CASTER"), {            -- 6
	ST.consumableIdsByName["ElixirOfGreaterFirepower"],
	ST.consumableIdsByName["ElixirOfFirepower"],
	ST.consumableIdsByName["ElixirOfShadowPower"]
})
ST.buffPackages["small"]["MP5Pot"] = ST.Requirement(ST.RoleGroup("HEALER"), {            -- 7
    ST.consumableIdsByName["MagebloodPotion"]
})
ST.buffPackages["small"]["TankFood"] = ST.Requirement(ST.RoleGroup("TANK"), {        -- 8
    ST.consumableIdsByName["ChimaerokChopsStamiFood"],
    ST.consumableIdsByName["IncreasedStami10"],
    ST.consumableIdsByName["WellFedSpiritAndStami12"],
    ST.consumableIdsByName["WellFedSpiritAndStami14"],
    ST.consumableIdsByName["WellFedSpiritAndStami25p"],
    ST.consumableIdsByName["WinterCalmarAgi"],
    ST.consumableIdsByName["BlessedSunfruitStr"],
    ST.consumableIdsByName["SmokedDesertDumplingsStr"]
})
ST.buffPackages["small"]["MeleeFood"] = ST.Requirement(ST.RoleGroup("MELEEDPS"), {        -- 9
    ST.consumableIdsByName["WinterCalmarAgi"],
    ST.consumableIdsByName["BlessedSunfruitStr"],
    ST.consumableIdsByName["SmokedDesertDumplingsStr"],
    ST.consumableIdsByName["ChimaerokChopsStamiFood"]
})
ST.buffPackages["small"]["HunterFood"] = ST.Requirement(ST.RoleGroup("HUNTER"), {        -- 10
    ST.consumableIdsByName["WinterCalmarAgi"],
    ST.consumableIdsByName["NightfinSoupManaregFood"],
    ST.consumableIdsByName["RunnTumTuberIntFood"]
})
ST.buffPackages["small"]["CasterFood"] = ST.Requirement(ST.RoleGroup("CASTER"), {        -- 11
    ST.consumableIdsByName["NightfinSoupManaregFood"],
    ST.consumableIdsByName["RunnTumTuberIntFood"]
})
ST.buffPackages["small"]["HealerFood"] = ST.Requirement(ST.RoleGroup("HEALER"), {        -- 12
    ST.consumableIdsByName["NightfinSoupManaregFood"],
    ST.consumableIdsByName["RunnTumTuberIntFood"],
    ST.consumableIdsByName["WellFedSpiritAndStami12"],
    ST.consumableIdsByName["WellFedSpiritAndStami14"],
    ST.consumableIdsByName["WellFedSpiritAndStami25p"]
})

-- GREATER SHADOW PROT PACKAGE
ST.buffPackages["greatershadowprot"] = {}
ST.buffPackages["greatershadowprot"]["GreaterShadowProt"] = ST.Requirement(ST.RoleGroup(), {           -- Everyone
    ST.consumableIdsByName["GreaterShadowProtectionPotion"],
})

-- GREATER FIRE PROT PACKAGE
ST.buffPackages["greaterfireprot"] = {}
ST.buffPackages["greaterfireprot"]["GreaterFireProt"] = ST.Requirement(ST.RoleGroup(), {           -- Everyone
    ST.consumableIdsByName["GreaterFireProtectionPotion"],
})

-- GREATER FROST PROT PACKAGE
ST.buffPackages["greaterfrostprot"] = {}
ST.buffPackages["greaterfrostprot"]["GreaterFrostProt"] = ST.Requirement(ST.RoleGroup(), {           -- Everyone
    ST.consumableIdsByName["GreaterFrostProtectionPotion"],
})

-- FULL+SHADOWPROT (LOATHEB)
ST.buffPackages["full+greatershadowprot"] = ST:mergeBuffPackages(ST.buffPackages["full"], ST.buffPackages["greatershadowprot"])

-- SMALL+SHADOWPROT (LOATHEB)
ST.buffPackages["small+greatershadowprot"] = ST:mergeBuffPackages(ST.buffPackages["small"], ST.buffPackages["greatershadowprot"])

-- TODO 4HM - GreaterShadowProt+GreaterFireProt(for whom?)+full/small

-- FULL+FROST (SAPH, KEL)
ST.buffPackages["full+greaterfrostprot"] = ST:mergeBuffPackages(ST.buffPackages["full"], ST.buffPackages["greaterfrostprot"])