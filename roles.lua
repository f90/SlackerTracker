local addon, ST = ...

ST.role = {
TANK = 1, -- Warrior Tank or Druid Tank
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

-- Special role overrides for certain people (tanks, cat, enhancer, elemental, moonkin, shadow)
ST.specialRoleByName = {}
ST.specialRoleByName["Tyranox"] = ST.role["TANK"]
ST.specialRoleByName["Skogtroll"] = ST.role["TANK"]
ST.specialRoleByName["Mudcrawler"] = ST.role["TANK"]
ST.specialRoleByName["Kronk"] = ST.role["TANK"]
ST.specialRoleByName["Mafox"] = ST.role["CAT"]
ST.specialRoleByName["Pakuun"] = ST.role["CAT"]
ST.specialRoleByName["Durator"] = ST.role["ENHANCER"]
ST.specialRoleByName["Hämpi"] = ST.role["ENHANCER"]
ST.specialRoleByName["Hanutamatata"] = ST.role["ELEMENTAL"]

-- Build "inverse" table so that for each special role, we can directly get a list of players playing that role
ST.specialRoleByRole = {}
for name, role in pairs(ST.specialRoleByName) do
    if ST.specialRoleByRole[role] then
        table.insert(ST.specialRoleByRole[role], name)
    else
        ST.specialRoleByRole[role] = {name}
    end
end