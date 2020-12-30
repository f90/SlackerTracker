function ST.reverseMap(assocTable)
    local reversed = {}
	for key, val in pairs(assocTable) do
		reversed[val] = key
	end
    return reversed
end

function ST:tableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

ST.groupStatusTable = {
	RAID = 1,
	PARTY = 2,
	SOLO = 3
}
ST.groupStatusById = ST.reverseMap(ST.groupStatusTable)

function ST:getGroupStatus()
	if IsInRaid() then
		return ST.groupStatusTable["RAID"]
	elseif IsInGroup() then
		return ST.groupStatusTable["PARTY"]
	else return ST.groupStatusTable["SOLO"]
	end
end

function ST:messageToGroup(message)
	local groupStatus = ST:getGroupStatus()
	if groupStatus == ST.groupStatusTable["RAID"] or groupStatus == ST.groupStatusTable["PARTY"] then
		SendChatMessage(message, ST.groupStatusById[groupStatus])
	elseif groupStatus == ST.groupStatusTable["SOLO"] then
		print(message)
	end
end

function ST:printConsumableOverview(buffPackage)
	if buffPackage == ST.buffPackage["full"] then
		for role,roleInd in pairs(ST.role) do
			print(role)
			for _, catInd in pairs(ST.categoriesByRole[roleInd]) do
				local conString = ""
				for _, conId in pairs(ST.consumableIdsByCategoryFull[catInd]) do
					-- print(ST.consumableIds[conId])
					conString = conString..ST.consumableIds[conId]..", "
				end
				print(ST.categoryNameById[catInd]..":", conString)
			end
		end
	end
end