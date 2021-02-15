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
    ST.consumableIdsByName["ElixirOfGiants"],
    ST.consumableIdsByName["JujuPower"]
})
ST.buffPackages["full"]["Agi"] = ST.Requirement(ST.RoleGroup("PHYSICAL"), {                -- 2
    ST.consumableIdsByName["ElixirOfTheMongoose"]
})
ST.buffPackages["full"]["Armor"] = ST.Requirement(ST.RoleGroup("TANK"), {           -- 4
    ST.consumableIdsByName["ElixirOfSuperiorDefense"]
})
ST.buffPackages["full"]["SP"] = ST.Requirement(ST.RoleGroup("CASTER"), {               -- 5
    ST.consumableIdsByName["GreaterArcaneElixir"],
    ST.consumableIdsByName["FlaskOfSupremePower"] -- Flask may replace SP Pots
})
ST.buffPackages["full"]["SpecSP"] = ST.Requirement(ST.RoleGroup("CASTER"), {            -- 6
    ST.consumableIdsByName["ElixirOfGreaterFirepower"],
    ST.consumableIdsByName["ElixirOfShadowPower"],
    ST.consumableIdsByName["FlaskOfSupremePower"] -- Flask may replace SP Pots
})
ST.buffPackages["full"]["MP5Pot/Flask"] = ST.Requirement(ST.RoleGroup("HEALER"), {            -- 7
    ST.consumableIdsByName["MagebloodPotion"],
    ST.consumableIdsByName["FlaskOfDistilledWisdom"]
})
ST.buffPackages["full"]["TankFood"] = ST.Requirement(ST.RoleGroup("TANK"), {        -- 8
    ST.consumableIdsByName["ChimaerokChops"],
    ST.consumableIdsByName["StamiSpirit12"],
    ST.consumableIdsByName["StamiSpirit14"],
    ST.consumableIdsByName["StamiSpirit25perc"],
    ST.consumableIdsByName["GrilledSquid"],
    ST.consumableIdsByName["BlessedSunfruitStr"],
    ST.consumableIdsByName["SmokedDesertDumplings"]
})
ST.buffPackages["full"]["MeleeFood"] = ST.Requirement(ST.RoleGroup("MELEEDPS"), {        -- 9
    ST.consumableIdsByName["GrilledSquid"],
    ST.consumableIdsByName["BlessedSunfruitStr"],
    ST.consumableIdsByName["SmokedDesertDumplings"],
    ST.consumableIdsByName["ChimaerokChops"]
})
ST.buffPackages["full"]["HunterFood"] = ST.Requirement(ST.RoleGroup("HUNTER"), {        -- 10
    ST.consumableIdsByName["GrilledSquid"],
    ST.consumableIdsByName["NightfinSoup"],
    ST.consumableIdsByName["RunnTumTuberInt"]
})
ST.buffPackages["full"]["CasterFood"] = ST.Requirement(ST.RoleGroup("CASTER"), {        -- 11
    ST.consumableIdsByName["NightfinSoup"],
    ST.consumableIdsByName["RunnTumTuberInt"],
    ST.consumableIdsByName["StamiSpirit12"],
    ST.consumableIdsByName["StamiSpirit14"],
    ST.consumableIdsByName["StamiSpirit25perc"],
    ST.consumableIdsByName["VeryBerryCream"],
    ST.consumableIdsByName["LoveIsInTheAir"]
})
ST.buffPackages["full"]["HealerFood"] = ST.Requirement(ST.RoleGroup("HEALER"), {        -- 12
    ST.consumableIdsByName["NightfinSoup"],
    ST.consumableIdsByName["RunnTumTuberInt"],
    ST.consumableIdsByName["StamiSpirit12"],
    ST.consumableIdsByName["StamiSpirit14"],
    ST.consumableIdsByName["StamiSpirit25perc"]
})

-- SMALL PACKAGE
ST.buffPackages["small"] = {}
ST.buffPackages["small"]["Str"] = ST.Requirement(ST.RoleGroup("MELEE"), {                -- 1 Melee + Tanks
    ST.consumableIdsByName["ElixirOfGiants"],
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
	ST.consumableIdsByName["FlaskOfSupremePower"] -- Flask may replace SP Pots
})
ST.buffPackages["small"]["SpecSP"] = ST.Requirement(ST.RoleGroup("CASTER"), {            -- 6
	ST.consumableIdsByName["ElixirOfGreaterFirepower"],
	ST.consumableIdsByName["ElixirOfFirepower"],
	ST.consumableIdsByName["ElixirOfShadowPower"],
    ST.consumableIdsByName["FlaskOfSupremePower"] -- Flask may replace SP Pots
})
ST.buffPackages["small"]["TankFood"] = ST.Requirement(ST.RoleGroup("TANK"), {        -- 8
    ST.consumableIdsByName["ChimaerokChops"],
    ST.consumableIdsByName["StamiSpirit12"],
    ST.consumableIdsByName["StamiSpirit14"],
    ST.consumableIdsByName["StamiSpirit25perc"],
    ST.consumableIdsByName["GrilledSquid"],
    ST.consumableIdsByName["BlessedSunfruitStr"],
    ST.consumableIdsByName["SmokedDesertDumplings"]
})
ST.buffPackages["small"]["MeleeFood"] = ST.Requirement(ST.RoleGroup("MELEEDPS"), {        -- 9
    ST.consumableIdsByName["GrilledSquid"],
    ST.consumableIdsByName["BlessedSunfruitStr"],
    ST.consumableIdsByName["SmokedDesertDumplings"],
    ST.consumableIdsByName["ChimaerokChops"]
})
ST.buffPackages["small"]["HunterFood"] = ST.Requirement(ST.RoleGroup("HUNTER"), {        -- 10
    ST.consumableIdsByName["GrilledSquid"],
    ST.consumableIdsByName["NightfinSoup"],
    ST.consumableIdsByName["RunnTumTuberInt"]
})
ST.buffPackages["small"]["CasterFood"] = ST.Requirement(ST.RoleGroup("CASTER"), {        -- 11
    ST.consumableIdsByName["NightfinSoup"],
    ST.consumableIdsByName["RunnTumTuberInt"],
    ST.consumableIdsByName["StamiSpirit12"],
    ST.consumableIdsByName["StamiSpirit14"],
    ST.consumableIdsByName["StamiSpirit25perc"],
    ST.consumableIdsByName["VeryBerryCream"],
    ST.consumableIdsByName["LoveIsInTheAir"],
})
ST.buffPackages["small"]["HealerFood"] = ST.Requirement(ST.RoleGroup("HEALER"), {        -- 12
    ST.consumableIdsByName["NightfinSoup"],
    ST.consumableIdsByName["RunnTumTuberInt"],
    ST.consumableIdsByName["StamiSpirit12"],
    ST.consumableIdsByName["StamiSpirit14"],
    ST.consumableIdsByName["StamiSpirit25perc"]
})

-- ONLY BUFF-FOOD PACKAGE
ST.buffPackages["food"] = {}
ST.buffPackages["food"]["TankFood"] = ST.buffPackages["full"]["TankFood"]:deepcopy()
ST.buffPackages["food"]["MeleeFood"] = ST.buffPackages["full"]["MeleeFood"]:deepcopy()
ST.buffPackages["food"]["HunterFood"] = ST.buffPackages["full"]["HunterFood"]:deepcopy()
ST.buffPackages["food"]["CasterFood"] = ST.buffPackages["full"]["CasterFood"]:deepcopy()
ST.buffPackages["food"]["HealerFood"] = ST.buffPackages["full"]["HealerFood"]:deepcopy()

-- SMALL SHADOW PROT PACKAGE
ST.buffPackages["shadowprot"] = {}
ST.buffPackages["shadowprot"]["ShadowProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")), {           -- Everyone but tanks
    ST.consumableIdsByName["ShadowProtectionPotion"],
    ST.consumableIdsByName["GreaterShadowProtectionPotion"],
})

-- GREATER SHADOW PROT PACKAGE
ST.buffPackages["greatershadowprot"] = {}
ST.buffPackages["greatershadowprot"]["GreaterShadowProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")), {          -- Everyone but tanks
    ST.consumableIdsByName["GreaterShadowProtectionPotion"],
})

-- GREATER FIRE PROT PACKAGE
ST.buffPackages["greaterfireprot"] = {}
ST.buffPackages["greaterfireprot"]["GreaterFireProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")), {           -- Everyone but tanks
    ST.consumableIdsByName["GreaterFireProtectionPotion"],
})

-- GREATER FROST PROT PACKAGE
ST.buffPackages["greaterfrostprot"] = {}
ST.buffPackages["greaterfrostprot"]["GreaterFrostProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")), {           -- Everyone but tanks
    ST.consumableIdsByName["GreaterFrostProtectionPotion"],
})

-- GREATER NATURE PROT PACKAGE
--ST.buffPackages["greaternatureprot"] = {}
--ST.buffPackages["greaternatureprot"]["GreaterNatureProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")), {           -- Everyone but tanks
--    ST.consumableIdsByName["GreaterNatureProtectionPotion"],
--})

-- FROST JUJU PACKAGE
ST.buffPackages["frostjuju"] = {}
ST.buffPackages["frostjuju"]["ExtraFrostProt"] = ST.Requirement(ST.RoleGroup(), {           -- Everyone
    ST.consumableIdsByName["JujuChill"],
})

-- FULL+SHADOWPROT (LOATHEB)
ST.buffPackages["loatheb-full"] = ST:mergeBuffPackages(ST.buffPackages["full"], ST.buffPackages["greatershadowprot"])
ST.buffPackages["loatheb-full"]["MP5Pot/Flask"] = nil -- No mp5 or healer flask necessary for this boss
ST.buffPackages["loatheb-full"]["HealerFood"] = nil -- No healer food necessary for this boss

-- SMALL+SHADOWPROT (LOATHEB)
ST.buffPackages["loatheb-small"] = ST:mergeBuffPackages(ST.buffPackages["small"], ST.buffPackages["greatershadowprot"])

-- FULL+SHADOWPROT+MELEE FIREPROT (4HM)
ST.buffPackages["4hm-full"] = ST:mergeBuffPackages(ST.buffPackages["full"], ST.buffPackages["greatershadowprot"])

-- SMALL+SHADOWPROT+MELEE FIREPROT (4HM)
ST.buffPackages["4hm-small"] = ST:mergeBuffPackages(ST.buffPackages["small"], ST.buffPackages["greatershadowprot"])

-- FULL+FROST (KEL)
ST.buffPackages["kt-full"] = ST:mergeBuffPackages(ST.buffPackages["full"], ST.buffPackages["greaterfrostprot"])

-- SMALL+FROST (KEL)
ST.buffPackages["kt-small"] = ST:mergeBuffPackages(ST.buffPackages["small"], ST.buffPackages["greaterfrostprot"])

-- FULL+FROST+FROSTJUJU+SHADOW (SAPH)
ST.buffPackages["saph-full"] = ST:mergeBuffPackages(ST.buffPackages["full"],
        ST.buffPackages["greaterfrostprot"],
        ST.buffPackages["frostjuju"],
        ST.buffPackages["greatershadowprot"])

-- SMALL+FROST+FROSTJUJU+SHADOW (SAPH)
ST.buffPackages["saph-small"] = ST:mergeBuffPackages(ST.buffPackages["small"],
        ST.buffPackages["greaterfrostprot"],
        ST.buffPackages["frostjuju"],
        ST.buffPackages["greatershadowprot"])