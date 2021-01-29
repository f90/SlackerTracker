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
            ST:SendChatMessage(msg, "GROUP", nil, nil)
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

        for _, catInd in pairs(ST.categoriesByRole[roleInd]) do -- Go through all potentially required categories for this role
            if ST.buffPackages[buffPackage][catInd] then -- This category might not be required for this role under this buffPackage
                local conString = ""
                for _, conId in pairs(ST.buffPackages[buffPackage][catInd]) do
                    -- print(ST.consumableIds[conId])
                    conString = conString .. ST.consumableIds[conId] .. " or "
                end
                conString = conString:sub(1,string.utf8len(conString)-4) -- Cut off last "or"
                print(ST.categoryNameById[catInd]..":", conString)
            end
		end
        print("")
	end
end