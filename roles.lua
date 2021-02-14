local addon, ST = ...

ST.role = {
PROT = 1, -- Warrior Tank
BEAR = 2, -- Druid Tank
HEALDRUID = 3,
HEALPRIEST = 4,
HEALSHAMAN = 5,
OFFWARRIOR = 6, -- DD Warrior
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
ST.specialRoleByName["Mafox"] = ST.role["CAT"]
ST.specialRoleByName["Pakuun"] = ST.role["CAT"]
ST.specialRoleByName["Durator"] = ST.role["ENHANCER"]
ST.specialRoleByName["Hämpi"] = ST.role["ENHANCER"]
ST.specialRoleByName["Hanutamatata"] = ST.role["ELEMENTAL"]

-- Default roles for each class - used if character is not in a special role override
ST.classToDefaultRole = {
    WARRIOR = "OFFWARRIOR",
    DRUID = "HEALDRUID",
    PRIEST = "HEALPRIEST",
    SHAMAN = "HEALSHAMAN",
    ROGUE = "ROGUE",
    HUNTER = "HUNTER",
    MAGE = "MAGE",
    WARLOCK = "WARLOCK"
}

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
            cls.roles = {[ST.role["MAGE"]]=1, [ST.role["WARLOCK"]]=1, [ST.role["SHADOW"]]=1, [ST.role["ELEMENTAL"]]=1, [ST.role["MOONKIN"]]=1}
        elseif roles == "TANK" then
            cls.roles = {[ST.role["PROT"]]=1, [ST.role["BEAR"]]=1}
        elseif roles == "HEALER" then
            cls.roles = {[ST.role["HEALDRUID"]]=1, [ST.role["HEALPRIEST"]]=1, [ST.role["HEALSHAMAN"]]=1}
        elseif roles == "MELEE" then
            cls.roles = {[ST.role["PROT"]]=1, [ST.role["BEAR"]]=1, [ST.role["OFFWARRIOR"]]=1, [ST.role["ROGUE"]]=1, [ST.role["CAT"]]=1, [ST.role["ENHANCER"]]=1}
        elseif roles == "MELEEDPS" then
            cls.roles = {[ST.role["OFFWARRIOR"]]=1, [ST.role["ROGUE"]]=1, [ST.role["CAT"]]=1, [ST.role["ENHANCER"]]=1}
        elseif roles == "PHYSICAL" then
            cls.roles = {[ST.role["PROT"]]=1, [ST.role["BEAR"]]=1, [ST.role["OFFWARRIOR"]]=1, [ST.role["ROGUE"]]=1, [ST.role["CAT"]]=1, [ST.role["ENHANCER"]]=1, [ST.role["HUNTER"]]=1}
        elseif roles == "PHYSICALDPS" then
            cls.roles = {[ST.role["OFFWARRIOR"]]=1, [ST.role["ROGUE"]]=1, [ST.role["CAT"]]=1, [ST.role["ENHANCER"]]=1, [ST.role["HUNTER"]]=1}
        else
            -- Try to find this string in class list
            local singleClass = false
            for role,idx in pairs(ST.role) do
                if role == roles then
                    singleClass = true
                    cls.roles = {[idx]=1}
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
            cls.roles[idx] = 1
        end
    else
        assert(type(roles) == "table")
        assert(ST:tabLength(roles) > 0)
        -- Roles has to be a non-empty list of roles, we can save that directly
        cls.roles = roles
    end
end)

function ST.RoleGroup:contains(role)
    return (self.roles[role] ~= nil)
end

function ST.RoleGroup:deepcopy()
    -- Copy role table
    local newRoles = {}
    for k,v in pairs(self.roles) do
        newRoles[k] = v
    end
    return ST.RoleGroup(newRoles)
end

function ST.RoleGroup:add(roleGroup)
    -- Add roles from other role group to this role group (merge)
    for k,v in pairs(roleGroup.roles) do
        self.roles[k] = v
    end
    return self
end

function ST.RoleGroup:subtract(roleGroup)
    -- Remove roles that are present in the other group
    for k,v in pairs(roleGroup.roles) do
        self.roles[k] = nil
    end
    return self
end