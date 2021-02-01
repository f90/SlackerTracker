local addon, ST = ...

function ST:reverseMap(assocTable)
    local reversed = {}
	for key, val in pairs(assocTable) do
		reversed[val] = key
	end
    return reversed
end

function ST:tabLength(assocTable)
    if assocTable == nil then
        return 0
    end

    if type(assocTable) ~= "table" then
        return 0
    end

    local n = 0
    for k,v in pairs(assocTable) do
        n = n+1
    end
    return n
end

function ST:PrintTo(msg, targetChannel)
    if targetChannel == "CONSOLE" then
        ST:Print(msg)
    else -- Public output to raid/group
        if IsInRaid() then
            ST:SendChatMessage(msg, "RAID", nil, nil)
        elseif IsInGroup() then
            ST:SendChatMessage(msg, "PARTY", nil, nil)
        end
    end
end

function ST:SendChatMessage(msg, chatType, language, channel)
    if msg ~= nil and string.utf8len(msg) > 0 then -- Check if message is non-nil and not empty (disabled in settings)
        SendChatMessage(ST._ChatString .. " " .. msg, chatType, language, channel)
    end
end

function ST:printConsumableOverview(buffPackage) -- Prints out a buff package in readable form, listing for each role the list of categories to buff up, and which buffs fulfil these categories
    print("BUFF PACKAGE: " .. buffPackage)
	for role,roleInd in pairs(ST.role) do -- Go through each role
		local roleString = role
        if ST.specialRoleByRole[roleInd] then -- List specific names assigned to special roles too, if we have them
            roleString = roleString .. " (" .. table.concat(ST.specialRoleByRole[roleInd], ", ") .. ")"
        end
        print(roleString)

        for reqName, req in pairs(ST.buffPackages[buffPackage]) do -- Go through all requirements for this role
            if req.roleGroup:contains(roleInd) then -- Check if this requirement affects this role
                local conString = ""
                for _, conId in pairs(req.buffs) do
                    conString = conString .. ST.consumableIds[conId] .. " or "
                end
                conString = conString:sub(1,string.utf8len(conString)-4) -- Cut off last "or"
                print(reqName .. ":", conString)
            end
		end
        print("")
	end
end

function ST:mergeBuffPackages(p1, p2) -- Creates a new buff package independent of previous ones
    local newReq = {}
    for reqName, req in pairs(p1) do
        assert(p2[reqName] == nil) --TODO At the moment, can not merge overlapping requirements.
        newReq[reqName] = req:deepcopy()
    end
    for reqName, req in pairs(p2) do
        assert(p1[reqName] == nil) --TODO At the moment, can not merge overlapping requirements.
        newReq[reqName] = req:deepcopy()
    end
    return newReq
end

function ST:getSortedTableKeys(t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    return a
end

function ST:pairsByKeys(t, f)
    local a = ST:getSortedTableKeys(t, f)
    local i = 0
    local iter = function()
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
		end
	end
	return iter
end