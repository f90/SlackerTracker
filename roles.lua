local addon, ST = ...

ST.role = {
PROT = 1, -- Warrior Tank
BEAR = 2, -- Druid Tank
DRUID = 3, -- Heal Druid
PRIEST = 4, -- Heal Priest
SHAMAN = 5, -- Heal Shaman
WARRIOR = 6, -- DD Warrior
ROGUE = 7,
HUNTER = 8,
CAT = 9,
ENHANCER = 10,
MAGE = 11,
WARLOCK = 12,
SHADOW = 13,
ELEMENTAL = 14, -- Ele Shaman
MOONKIN = 15
}

-- Special role overrides for certain people (tanks, cat, enhancer, elemental, moonkin, shadow)
ST.specialRoleByName = {}
ST.specialRoleByName["Tyranox"] = ST.role["PROT"]
ST.specialRoleByName["Skogtroll"] = ST.role["PROT"]
ST.specialRoleByName["Arák"] = ST.role["PROT"]
ST.specialRoleByName["Mudcrawler"] = ST.role["BEAR"]
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

-- Role groups
ST.RoleGroup = class(function(cls, roles)
    -- Process roles input
    if type(roles) == "string" then
        -- Shorthand definitions for most commonly used groups of roles (caster, tanks, etc.)
        if roles == "CASTER" then
            cls.roles = {ST.role["MAGE"], ST.role["WARLOCK"], ST.role["SHADOW"], ST.role["ELEMENTAL"], ST.role["MOONKIN"]}
        elseif roles == "TANK" then
            cls.roles = {ST.role["PROT"], ST.role["BEAR"]}
        elseif roles == "HEALER" then
            cls.roles = {ST.role["DRUID"], ST.role["PRIEST"], ST.role["SHAMAN"]}
        elseif roles == "MELEE" then
            cls.roles = {ST.role["PROT"], ST.role["BEAR"], ST.role["WARRIOR"], ST.role["ROGUE"], ST.role["CAT"], ST.role["ENHANCER"]}
        elseif roles == "MELEEDPS" then
            cls.roles = {ST.role["WARRIOR"], ST.role["ROGUE"], ST.role["CAT"], ST.role["ENHANCER"]}
        elseif roles == "PHYSICAL" then
            cls.roles = {ST.role["PROT"], ST.role["BEAR"], ST.role["WARRIOR"], ST.role["ROGUE"], ST.role["CAT"], ST.role["ENHANCER"], ST.role["HUNTER"]}
        elseif roles == "PHYSICALDPS" then
            cls.roles = {ST.role["WARRIOR"], ST.role["ROGUE"], ST.role["CAT"], ST.role["ENHANCER"], ST.role["HUNTER"]}
        else
            -- Try to find this string in class list
            local singleClass = false
            for role,idx in pairs(ST.role) do
                if role == roles then
                    singleClass = true
                    cls.roles = {idx}
                end
            end
            if not singleClass then
                error("Could not find role group " .. roles)
            end
        end
    elseif roles == nil then
        -- This role group covers ALL roles
        cls.roles = {}
        for roleName,idx in pairs(ST.role) do
            table.insert(cls.roles, idx)
        end
    else
        assert(type(roles) == "table")
        assert(#roles > 0)
        -- Roles has to be a non-empty list of roles, we can save that directly
        cls.roles = roles
    end
end)

function ST.RoleGroup:contains(role)
    for _, currRole in ipairs(self.roles) do
        if currRole == role then
            return true
        end
    end
    return false
end

function ST.RoleGroup:deepcopy()
    -- Copy role table
    local newRoles = {}
    for k,v in pairs(self.roles) do
        newRoles[k] = v
    end
    return ST.RoleGroup(newRoles)
end