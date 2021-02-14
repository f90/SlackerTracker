local addon, ST = ...

------------------------------------------------------------------------------
-- CREATE CONSUMABLE ID INFO

local consumableIds = {}

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
consumableIds[16325] = "JujuChill"
consumableIds[16326] = "JujuEmber" -- TODO NEED TO CHECK SPELL ID

-- TANK CONSUMES
consumableIds[11348] = "ElixirOfSuperiorDefense"
consumableIds[3593] = "ElixirOfFortitude120HP"
consumableIds[17540] = "GreaterStoneshield"
-- food
consumableIds[25661] = "ChimaerokChops" -- +25 Stami
consumableIds[18191] = "Stami10" -- +10
-- alc
consumableIds[22789] = "GordokGrog" -- +10 Stami
consumableIds[25804] = "RumseyRumBlack" -- +15 Stami

-- MELEE/HUNTER CONSUMES
consumableIds[11405] = "ElixirOfGiants"
consumableIds[16323] = "JujuPower" -- TODO NEED TO CHECK SPELL ID
consumableIds[11334] = "ElixirOfGreaterAgility"
consumableIds[17538] = "ElixirOfTheMongoose"
consumableIds[17038] = "WinterfallFirewater"
consumableIds[16329] = "JujuMight" -- TODO NEED TO CHECK SPELL ID
-- food
consumableIds[18192] = "GrilledSquid" -- +10 Agi
consumableIds[18125] = "BlessedSunfruitStr" -- +10 Str, not to be confused with BlessedSunfruitJuice
consumableIds[24799] = "SmokedDesertDumplings" -- +20 Str, TODO NEED TO CHECK SPELL ID

-- rage of ages 10667

-- CASTER CONSUMES
consumableIds[17539] = "GreaterArcaneElixir" -- +35 SP
consumableIds[11390] = "ArcaneElixir" -- +20 SP
consumableIds[11474] = "ElixirOfShadowPower" -- +40 SP
consumableIds[26276] = "ElixirOfGreaterFirepower" -- +40 SP
consumableIds[7844] = "ElixirOfFirepower" -- +10 SP
consumableIds[21920] = "ElixirOfFrostPower" -- +15 SP
--food
consumableIds[22730] = "RunnTumTuberInt" -- +10 Int TODO NEED TO CHECK SPELL ID

-- HEALER CONSUMES
consumableIds[24363] = "MagebloodPotion" -- +12 MP5
-- food
consumableIds[18194] = "NightfinSoup" -- +8 MP5
consumableIds[18141] = "BlessedSunfruitJuice"
consumableIds[19710] = "StamiSpirit12" -- +12 Spirit+Stami. From Heavy Kodo Stew, Monster Omelette, Tender Wolf Steak, Spiced Chili Crab, Spider Sausage, Savory Sausage (Brewfest,TBC+), Thunderbrew Ale (Brewfest,TBC+) TODO NEED TO CHECK SPELL ID
consumableIds[19711] = "StamiSpirit14" -- +14 Spirit+Stami. From Pickled Sausage (Brewfest), Thunderbrew Stout (Brewfest) TODO NEED TO CHECK SPELL ID
consumableIds[24870] = "StamiSpirit25perc" -- + level/4 Spirit+Stami. From Winter Veil Cookie (Patch 1.13), Bobbing Apple (Patch 1.13) TODO NEED TO CHECK SPELL ID
consumableIds[27721] = "VeryBerryCream" -- +23 SP - Very berry cream - Seasonal --TODO check spell ID
consumableIds[27741] = "LoveIsInTheAir" -- +23 SP - Seasonal --TODO check spell ID
-- alc
consumableIds[22790] = "KreegsStoutAlc" -- +25 Spirit TODO NEED TO CHECK SPELL ID

-- FLASKS
consumableIds[17626] = "FlaskOfTheTitans"
consumableIds[17627] = "FlaskOfDistilledWisdom"
consumableIds[17628] = "FlaskOfSupremePower"

ST.consumableIds = consumableIds
ST.consumableIdsByName = ST:reverseMap(consumableIds)
