function LevelsTweakData:get_ai_group_type() -- We can use this to easily swap visuals for "factions" based on difficulty.
	local group_to_use = "zeal" 			 -- Aka, instead of 1500 difficulty if's to change the group based on what difficulty it is, we can just instead change what faction it's looking for.
											 -- This makes swapping difficulties on the fly much, much easier, along with maintaining a clean codebase.
	local level_id
	if Global.level_data and Global.level_data.level_id then
		level_data = Global.level_data.level_id
	end
	
	if not Global.game_settings then
		return group_to_use
	end
	local difficulties = {
		"easy",
		"normal",
		"hard",
		"overkill",
		"overkill_145",
		"easy_wish",
		"overkill_290",
		"sm_wish"
	}
	local map_faction_override = {} -- todo: setup akan on BP, murky on all murky heists, and classics on classic heists
	local diff_index = table.index_of(difficulties, Global.game_settings.difficulty)
	if diff_index <= 3 then
		group_to_use = "cop"
	elseif diff_index <= 5 then
		group_to_use = "fbi"
	elseif diff_index <= 7 then
		group_to_use = "gensec"
	end
	if level_id then
		if map_faction_override[level_id] then
			group_to_use = map_faction_override[level_id]
		end
	end
	if diff_index == 8 then -- kataru's reach is true
		group_to_use = "zeal"
	end
	return group_to_use
end