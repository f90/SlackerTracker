ST.role = {
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

ST.specialRoleByName = {}
ST.specialRoleByName["Tyranox"] = ST.role["TANK"]
ST.specialRoleByName["Steveyo"] = ST.role["TANK"]
ST.specialRoleByName["Skogtroll"] = ST.role["TANK"]
ST.specialRoleByName["Mudcrawler"] = ST.role["TANK"]
ST.specialRoleByName["Kronk"] = ST.role["TANK"]
ST.specialRoleByName["Mafox"] = ST.role["CAT"]
ST.specialRoleByName["Pakuun"] = ST.role["CAT"]
ST.specialRoleByName["Durator"] = ST.role["ENHANCER"]
ST.specialRoleByName["Hämpi"] = ST.role["ENHANCER"]
ST.specialRoleByName["Hanutamatata"] = ST.role["ELEMENTAL"]