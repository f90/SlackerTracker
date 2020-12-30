-- /console scriptErrors 1

function ST:getRole(name, class)
	if ST.specialRoleByName[name] then
		assert(ST.specialRoleByName[name] ~= nil)
		return ST.specialRoleByName[name]
	else
		assert(ST.role[class] ~= nil)
		return ST.role[class]
	end
end

function ST:getBuffsOfPlayer(name)
	local buffs = {}
	-- local buffName, icon, count, debuffType, duration, expirationTime, source, isStealable, 
	-- nameplateShowPersonal, buffSpellId = UnitBuff(activeUnit, i)
	local i = 1
	local buff, _, _, _, _, _, _, _, _, buffSpellId = UnitBuff(name, i);
	while buff do
		buffs[buffSpellId] = buff
		i = i + 1
		buff, _, _, _, _, _, _, _, _, buffSpellId = UnitBuff(name, i);
	end
	return buffs
end

function ST:getBuffsOfActiveUnit(activeUnit)
	return ST:getBuffsOfPlayer(GetUnitName(activeUnit))
end

-- TODO: choose buff package -> bessere Implementierung
function ST:processPlayer(name, class, buffPackage)
	-- Get list of buffs on this player
	local buffs = ST:getBuffsOfPlayer(name, class)

	-- Find out role for this player
	local role = ST:getRole(name, class)

	-- Find out which consumables are required
	local consumeCategories = ST.categoriesByRole[role]
	assert(consumeCategories ~= nil) -- We HAVE to have a category for each role

	-- Iterate over each category
	local out = {}
	for _,category in pairs(consumeCategories) do
		local spellIds = {}
		if buffPackage == ST.buffPackage["full"] then
			spellIds = ST.consumableIdsByCategoryFull[category] -- Retrieve buffs for this category
		elseif buffPackage == ST.buffPackage["small"] then
			spellIds = ST.consumableIdsByCategorySmall[category] -- Retrieve buffs for this category
		end
		
		local buffed = false
		if spellIds[1] then
			for _,buffId in pairs(spellIds) do
				if buffs[buffId] then
					-- Player has this buff
					buffed = true
				end
			end
		else buffed = true
		end
		-- Now we know whether this player has at least one buff from the category
		out[category] = buffed
		-- print(name .. ": " .. ST.categoryNameById[category] .. ": " .. tostring(buffed))
	end
	return out
end

-- buffPackage is one of
-- ST.buffPackage["full"]
-- ST.buffPackage["small"]
function ST:checkConsumablesOfGroup(buffPackage)
	ST.missingConsumes = {}
	for _,val in pairs(ST.category) do
		ST.missingConsumes[val] = {}
	end
	local playerHasConsumes = {}
	local missingCounter = 0
	if (IsInGroup() or IsInRaid()) then
		-- Raid loop
		for ci=1, MAX_RAID_MEMBERS do
        	local name, rank, subgroup, level, class, classFileName, zone, online, isDead, role, isML = GetRaidRosterInfo(ci)
			if name then
				-- get list of {category1 = true, category2 = false, ...} specific for player
				playerHasConsumes = ST:processPlayer(name, classFileName, buffPackage)
				-- loop over player specific 
				for cat,buffed in pairs(playerHasConsumes) do
					-- print(cat,buffed)
					if not buffed then
						table.insert(ST.missingConsumes[cat], name)
						missingCounter = missingCounter + 1
					end
				end
			end
		end
	else
		-- Just check ourselves
		local _, classFileName, _ = UnitClass("player")
		local name = GetUnitName("player")
		playerHasConsumes = ST:processPlayer(name, classFileName, buffPackage)
		for cat,buffed in pairs(playerHasConsumes) do
			-- print(cat,buffed)
			if not buffed then
				table.insert(ST.missingConsumes[cat], name)
				missingCounter = missingCounter + 1
			end
		end
	end
	-- local NCategories = ST:tableLength(ST.category)
	-- print(NCategories)
	
	-- for n = 1, NCategories do
		-- print(ST.categoryNameById[n]..": ", table.concat(ST.missingConsumes[n], " "))
	-- end
	
	-- print missingConsumes by Category
	-- local groupStatus = ST.getGroupStatus()
	if missingCounter == 0 then
		ST:messageToGroup("No consumes are missing")
	else
		local string1 = "Missing Consumables"
		if buffPackage == ST.buffPackage["full"] then
			string1 = string1.." (full buff package):"
		elseif buffPackage == ST.buffPackage["small"] then
			string1 = string1.." (small buff package):"
		end		
		ST:messageToGroup(string1)
		-- print("Missing Consumables:")
		for cat,pNames in pairs(ST.missingConsumes) do
			if pNames[1] then
				ST:messageToGroup(ST.categoryNameById[cat]..":  "..table.concat(pNames, " "))
				-- print(ST.categoryNameById[cat]..":  "..table.concat(pNames, " "))
			end
		end
	end
end