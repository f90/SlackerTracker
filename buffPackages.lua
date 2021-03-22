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
    ST:getConsumableID("ElixirOfGiants"),
    ST:getConsumableID("JujuPower")
})
ST.buffPackages["full"]["Agi"] = ST.Requirement(ST.RoleGroup("PHYSICAL"), {                -- 2
    ST:getConsumableID("ElixirOfTheMongoose")
})
ST.buffPackages["full"]["Armor"] = ST.Requirement(ST.RoleGroup("TANK"), {           -- 4
    ST:getConsumableID("ElixirOfSuperiorDefense")
})
ST.buffPackages["full"]["SP"] = ST.Requirement(ST.RoleGroup("CASTER"), {               -- 5
    ST:getConsumableID("GreaterArcaneElixir"),
    ST:getConsumableID("FlaskOfSupremePower") -- Flask may replace SP Pots
})
ST.buffPackages["full"]["SpecSP"] = ST.Requirement(ST.RoleGroup("CASTER"), {            -- 6
    ST:getConsumableID("ElixirOfGreaterFirepower"),
    ST:getConsumableID("ElixirOfShadowPower"),
    ST:getConsumableID("FlaskOfSupremePower") -- Flask may replace SP Pots
})
ST.buffPackages["full"]["MP5Pot/Flask"] = ST.Requirement(ST.RoleGroup("HEALER"), {            -- 7
    ST:getConsumableID("MagebloodPotion"),
    ST:getConsumableID("FlaskOfDistilledWisdom")
})
ST.buffPackages["full"]["TankFood"] = ST.Requirement(ST.RoleGroup("TANK"), {        -- 8
    ST:getConsumableID("ChimaerokChops"),
    ST:getConsumableID("StamiSpirit12"),
    ST:getConsumableID("StamiSpirit14"),
    ST:getConsumableID("StamiSpirit25perc"),
    ST:getConsumableID("GrilledSquid"),
    ST:getConsumableID("BlessedSunfruitStr"),
    ST:getConsumableID("SmokedDesertDumplings")
})
ST.buffPackages["full"]["MeleeFood"] = ST.Requirement(ST.RoleGroup("MELEEDPS"), {        -- 9
    ST:getConsumableID("GrilledSquid"),
    ST:getConsumableID("BlessedSunfruitStr"),
    ST:getConsumableID("SmokedDesertDumplings"),
    ST:getConsumableID("ChimaerokChops")
})
ST.buffPackages["full"]["HunterFood"] = ST.Requirement(ST.RoleGroup("HUNTER"), {        -- 10
    ST:getConsumableID("GrilledSquid"),
    ST:getConsumableID("NightfinSoup"),
    ST:getConsumableID("RunnTumTuberInt")
})
ST.buffPackages["full"]["CasterFood"] = ST.Requirement(ST.RoleGroup("CASTER"), {        -- 11
    ST:getConsumableID("NightfinSoup"),
    ST:getConsumableID("RunnTumTuberInt"),
    ST:getConsumableID("StamiSpirit12"),
    ST:getConsumableID("StamiSpirit14"),
    ST:getConsumableID("StamiSpirit25perc"),
    ST:getConsumableID("VeryBerryCream"),
    ST:getConsumableID("LoveIsInTheAir")
})
ST.buffPackages["full"]["HealerFood"] = ST.Requirement(ST.RoleGroup("HEALER"), {        -- 12
    ST:getConsumableID("BlessedSunfruitJuice"),
    ST:getConsumableID("NightfinSoup"),
    ST:getConsumableID("RunnTumTuberInt"),
    ST:getConsumableID("StamiSpirit12"),
    ST:getConsumableID("StamiSpirit14"),
    ST:getConsumableID("StamiSpirit25perc")
})

-- SMALL PACKAGE
ST.buffPackages["small"] = {}
ST.buffPackages["small"]["Str"] = ST.Requirement(ST.RoleGroup("MELEE"), {                -- 1 Melee + Tanks
    ST:getConsumableID("ElixirOfGiants"),
    ST:getConsumableID("JujuPower")
})
ST.buffPackages["small"]["Agi"] = ST.Requirement(ST.RoleGroup("PHYSICAL"), {                -- 2
    ST:getConsumableID("ElixirOfTheMongoose"),
    ST:getConsumableID("ElixirOfGreaterAgility")
})
ST.buffPackages["small"]["Armor"] = ST.Requirement(ST.RoleGroup("TANK"), {           -- 4
    ST:getConsumableID("ElixirOfSuperiorDefense")
})
ST.buffPackages["small"]["SP"] = ST.Requirement(ST.RoleGroup("CASTER"), {               -- 5
    ST:getConsumableID("GreaterArcaneElixir"),
	ST:getConsumableID("ArcaneElixir"),
	ST:getConsumableID("FlaskOfSupremePower") -- Flask may replace SP Pots
})
ST.buffPackages["small"]["SpecSP"] = ST.Requirement(ST.RoleGroup("CASTER"), {            -- 6
	ST:getConsumableID("ElixirOfGreaterFirepower"),
	ST:getConsumableID("ElixirOfFirepower"),
	ST:getConsumableID("ElixirOfShadowPower"),
    ST:getConsumableID("FlaskOfSupremePower") -- Flask may replace SP Pots
})
ST.buffPackages["small"]["TankFood"] = ST.Requirement(ST.RoleGroup("TANK"), {        -- 8
    ST:getConsumableID("ChimaerokChops"),
    ST:getConsumableID("StamiSpirit12"),
    ST:getConsumableID("StamiSpirit14"),
    ST:getConsumableID("StamiSpirit25perc"),
    ST:getConsumableID("GrilledSquid"),
    ST:getConsumableID("BlessedSunfruitStr"),
    ST:getConsumableID("SmokedDesertDumplings")
})
ST.buffPackages["small"]["MeleeFood"] = ST.Requirement(ST.RoleGroup("MELEEDPS"), {        -- 9
    ST:getConsumableID("GrilledSquid"),
    ST:getConsumableID("BlessedSunfruitStr"),
    ST:getConsumableID("SmokedDesertDumplings"),
    ST:getConsumableID("ChimaerokChops")
})
ST.buffPackages["small"]["HunterFood"] = ST.Requirement(ST.RoleGroup("HUNTER"), {        -- 10
    ST:getConsumableID("GrilledSquid"),
    ST:getConsumableID("NightfinSoup"),
    ST:getConsumableID("RunnTumTuberInt")
})
ST.buffPackages["small"]["CasterFood"] = ST.Requirement(ST.RoleGroup("CASTER"), {        -- 11
    ST:getConsumableID("NightfinSoup"),
    ST:getConsumableID("RunnTumTuberInt"),
    ST:getConsumableID("StamiSpirit12"),
    ST:getConsumableID("StamiSpirit14"),
    ST:getConsumableID("StamiSpirit25perc"),
    ST:getConsumableID("VeryBerryCream"),
    ST:getConsumableID("LoveIsInTheAir"),
})
ST.buffPackages["small"]["HealerFood"] = ST.Requirement(ST.RoleGroup("HEALER"), {        -- 12
    ST:getConsumableID("BlessedSunfruitJuice"),
    ST:getConsumableID("NightfinSoup"),
    ST:getConsumableID("RunnTumTuberInt"),
    ST:getConsumableID("StamiSpirit12"),
    ST:getConsumableID("StamiSpirit14"),
    ST:getConsumableID("StamiSpirit25perc")
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
    ST:getConsumableID("ShadowProtectionPotion"),
    ST:getConsumableID("GreaterShadowProtectionPotion"),
})

-- GREATER SHADOW PROT PACKAGE
ST.buffPackages["greatershadowprot"] = {}
ST.buffPackages["greatershadowprot"]["GreaterShadowProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")), {          -- Everyone but tanks
    ST:getConsumableID("GreaterShadowProtectionPotion"),
})

-- GREATER FIRE PROT PACKAGE
ST.buffPackages["greaterfireprot"] = {}
ST.buffPackages["greaterfireprot"]["GreaterFireProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")), {           -- Everyone but tanks
    ST:getConsumableID("GreaterFireProtectionPotion"),
})

-- GREATER FROST PROT PACKAGE
ST.buffPackages["greaterfrostprot"] = {}
ST.buffPackages["greaterfrostprot"]["GreaterFrostProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")), {           -- Everyone but tanks
    ST:getConsumableID("GreaterFrostProtectionPotion"),
})

-- GREATER NATURE PROT PACKAGE
ST.buffPackages["greaternatureprot"] = {}
ST.buffPackages["greaternatureprot"]["GreaterNatureProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")), {           -- Everyone but tanks
    ST:getConsumableID("GreaterNatureProtectionPotion"),
})

-- FROST JUJU PACKAGE
ST.buffPackages["frostjuju"] = {}
ST.buffPackages["frostjuju"]["ExtraFrostProt"] = ST.Requirement(ST.RoleGroup(), {           -- Everyone
    ST:getConsumableID("JujuChill"),
})

-- FULL+SHADOWPROT (LOATHEB)
ST.buffPackages["loatheb-full"] = ST:mergeBuffPackages(ST.buffPackages["full"], ST.buffPackages["greatershadowprot"])
ST.buffPackages["loatheb-full"]["MP5Pot/Flask"] = nil -- No mp5 or healer flask necessary for this boss
ST.buffPackages["loatheb-full"]["HealerFood"] = nil -- No healer food necessary for this boss

-- SMALL+SHADOWPROT (LOATHEB)
ST.buffPackages["loatheb-small"] = ST:mergeBuffPackages(ST.buffPackages["small"], ST.buffPackages["greatershadowprot"])
ST.buffPackages["loatheb-small"]["MP5Pot/Flask"] = nil -- No mp5 or healer flask necessary for this boss
ST.buffPackages["loatheb-small"]["HealerFood"] = nil -- No healer food necessary for this boss

-- FULL+SHADOWPROT (4HM)
ST.buffPackages["greatershadowprotnohealer"] = {}
ST.buffPackages["greatershadowprotnohealer"]["GreaterShadowProt"] = ST.Requirement(ST.RoleGroup():subtract(ST.RoleGroup("TANK")):subtract(ST.RoleGroup("HEALER")), {
    ST:getConsumableID("GreaterShadowProtectionPotion"),
})
ST.buffPackages["4hm-full"] = ST:mergeBuffPackages(ST.buffPackages["full"], ST.buffPackages["greatershadowprotnohealer"])
ST.buffPackages["4hm-small"] = ST:mergeBuffPackages(ST.buffPackages["small"], ST.buffPackages["greatershadowprotnohealer"])

-- BUFF-FOOD+FROST (KEL)
ST.buffPackages["kt-food"] = ST:mergeBuffPackages(ST.buffPackages["food"], ST.buffPackages["greaterfrostprot"])

-- FULL+FROST+FROSTJUJU+SHADOW (SAPH)
ST.buffPackages["saph-full"] = ST:mergeBuffPackages(ST.buffPackages["full"],
        ST.buffPackages["greaterfrostprot"],
        ST.buffPackages["frostjuju"],
        ST.buffPackages["greatershadowprot"])
ST.buffPackages["saph-full"]["ExtraHP"] = ST.Requirement(ST.RoleGroup(), { -- Additional HP buff that stacks with everything else since Saph hits hard
    ST:getConsumableID("ElixirOfFortitude120HP"),
    ST:getConsumableID("GordokGrog"),
    ST:getConsumableID("RumseyRumBlack"),
    ST:getConsumableID("SpiritOfZanza")
})

-- SMALL+FROST+FROSTJUJU+SHADOW (SAPH)
ST.buffPackages["saph-small"] = ST:mergeBuffPackages(ST.buffPackages["small"],
        ST.buffPackages["greaterfrostprot"],
        ST.buffPackages["frostjuju"],
        ST.buffPackages["greatershadowprot"])