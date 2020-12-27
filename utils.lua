function reverseMap(assocTable)
    local reversed = {}
	for key, val in pairs(assocTable) do
		reversed[val] = key
	end
    return reversed
end