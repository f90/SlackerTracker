local addon, ST = ...

function ST:OnUpdate()
	--TODO update UI here somehow?
end

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
		local spellIds = ST.buffPackages[buffPackage][category] -- Retrieve buffs for this category
		local buffed = false
		if spellIds then
			for _,buffId in pairs(spellIds) do
				if buffs[buffId] then
					-- Player has this buff
					buffed = true
				end
			end
		else
			buffed = true -- This category is not required by the buff package => "buffed"
		end
		-- Now we know whether this player has at least one buff from the category
		out[category] = buffed
		--print(name .. ": " .. ST.categoryNameById[category] .. ": " .. tostring(buffed))
	end
	return out
end

function ST:printMissingConsumables(missingConsumesByCategory, targetChannel)
	-- Output missingConsumes by Category
	if ST:tabLength(missingConsumesByCategory) == 0 then
		ST:PrintTo("No consumes are missing for package " .. ST.currBuffPackage, targetChannel)
	else
		ST:PrintTo("Missing consumes for package " .. ST.currBuffPackage .. ":", targetChannel)
		for cat,players in pairs(missingConsumesByCategory) do
			ST:PrintTo(ST.categoryNameById[cat]..":  "..table.concat(players, ", "), targetChannel)
		end
	end
end

function ST:warnPlayers(missingConsumesByPlayer)
	-- Send whispers to each player that is missing some buffs, with a list of categories that are missing
	if not (IsInGroup() or IsInRaid()) then
		ST:Print("ERROR: You tried to warn the group/raid about missing ")
		return
	end

	for player, categories in pairs(missingConsumesByPlayer) do
		local categoryNames = {}
		for _, cat in ipairs(categories) do
			table.insert(categoryNames, ST.categoryNameById[cat])
		end
		local warnText = "You are missing buffs for categories: " .. table.concat(categoryNames, ", ")
		if player == GetUnitName("player") then
			-- Exception case: Print this warning to ourselves since we can't whisper to ourselves
			ST:Print(warnText)
		else
			-- Whisper player with missing consume categories
			ST:SendChatMessage(warnText, "WHISPER", nil, player)
		end
	end
end

function ST:checkConsumables(outputTarget)
	-- START CHECKING BUFFS ON PLAYERS
	local buffPackage = ST.currBuffPackage
	local missingConsumesByCategory = {}
	if (IsInGroup() or IsInRaid()) then
		-- Raid loop
		for ci=1, MAX_RAID_MEMBERS do
        	local name, rank, subgroup, level, class, classFileName, zone, online, isDead, role, isML = GetRaidRosterInfo(ci)
			if name and online then -- Ignore offline players since we cant detect their buff status
				-- get list of {category1 = true, category2 = false, ...} specific for player
				local playerConsumes = ST:processPlayer(name, classFileName, buffPackage)
				for cat,buffed in pairs(playerConsumes) do
					if not buffed then
						-- Remember missing buff
						if missingConsumesByCategory[cat] then
							table.insert(missingConsumesByCategory[cat], name)
						else
							missingConsumesByCategory[cat] = {name}
						end
					end
				end
			end
		end
	else
		-- Just check ourselves
		local _, classFileName, _ = UnitClass("player")
		local name = GetUnitName("player")
		local playerConsumes = ST:processPlayer(name, classFileName, buffPackage)
		for cat,buffed in pairs(playerConsumes) do
			-- ST:Print(cat,buffed)
			if not buffed then
				-- Remember missing buff
				if missingConsumesByCategory[cat] then
					table.insert(missingConsumesByCategory[cat], name)
				else
					missingConsumesByCategory[cat] = {name}
				end
			end
		end
	end

	-- BUFF CHECK FINISHED
	-- Build table of missing consumes for each player
	local missingConsumesByPlayer = {}
	for cat,players in pairs(missingConsumesByCategory) do
		for _, player in ipairs(players) do
			if missingConsumesByPlayer[player] then
				table.insert(missingConsumesByPlayer[player], cat)
			else
				missingConsumesByPlayer[player] = {cat}
			end
		end
	end

	-- OUTPUT MISSING CONSUMES
	if outputTarget == "WHISPER" then
		-- Warn each raid/group member that has missing buffs by whisper
		ST:warnPlayers(missingConsumesByPlayer)
	else
		-- Output just to ourselves via default chat
		ST:printMissingConsumables(missingConsumesByCategory, outputTarget)
	end
end