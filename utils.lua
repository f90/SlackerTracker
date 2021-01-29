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

function ST:printConsumableOverview(buffPackage) --TODO wofür is das
	for role,roleInd in pairs(ST.role) do
		print(role)
		for _, catInd in pairs(ST.categoriesByRole[roleInd]) do
			local conString = ""
			for _, conId in pairs(ST.buffPackages[buffPackage][catInd]) do
				-- print(ST.consumableIds[conId])
				conString = conString..ST.consumableIds[conId]..", "
			end
			print(ST.categoryNameById[catInd]..":", conString)
		end
	end
end