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

function ST:processPlayer(name, class)
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
		local spellIds = ST.consumableIdsByCategory[category] -- Retrieve buffs for this category
		local buffed = false
		for _,buffId in pairs(spellIds) do
			if buffs[buffId] then
				-- Player has this buff
				buffed = true
			end
		end
		-- Now we know whether this player has at least one buff from the category
		out[category] = buffed
		-- print(name .. ": " .. ST.categoryNameById[category] .. ": " .. tostring(buffed))
	end
	return out
end



function ST:checkConsumablesOfGroup()
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
				playerHasConsumes = ST:processPlayer(name, classFileName)
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
		playerHasConsumes = ST:processPlayer(name, classFileName)
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
		ST:messageToGroup("Missing Consumables:")
		for cat,pNames in pairs(ST.missingConsumes) do
			if pNames[1] then
				ST:messageToGroup(ST.categoryNameById[cat]..":  "..table.concat(pNames, " "))
			end
		end
	end
end