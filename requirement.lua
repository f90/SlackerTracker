local addon, ST = ...

ST.Requirement = class(function(cls, roleGroup, buffs)
    assert(roleGroup ~= nil and buffs ~= nil)
    assert(type(roleGroup) == "table")
    cls.roleGroup = roleGroup

    -- Process consumables input
    assert(buffs ~= nil and type(buffs) == "table" and #buffs > 0)
    cls.buffs = buffs
end)

function ST.Requirement:isFulfilled(role, buffs)
    if not self.roleGroup:contains(role) then
        return true -- Requirement is "fulfilled" if this role is not adressed by this requirement
    else
        -- Check whether the current buffs contain one of the required consumables
        for _, buffID in ipairs(self.buffs) do
            if buffs[buffID] then
                return true
            end
        end
    end
    return false -- No buff found that satifies the requirements!
end

function ST.Requirement:deepcopy()
    local newBuffs = {}
    -- Copy buff list
    for k,v in pairs(self.buffs) do
        newBuffs[k] = v
    end
    return ST.Requirement(self.roleGroup:deepcopy(), newBuffs)
end