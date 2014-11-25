
local name, addon = ...

--------------------------------------------------------------------------------
-- Locals
--

-- id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(category, index) or GetAchievementInfo(id)
-- link = GetAchievementLink(id)



local journalToAchievement = {
	-- Auchindoun
	[1186] = 9023, -- Nyami
	[1216] = 9551, -- Azzakel
	[1225] = 9552, -- Teron
	-- Slag Mines
	[893] = 8993, -- Magmolatus: A Gift of Earth and Fire
	[888] = 9005, -- Trash, Activate on Crushto: Come With Me If You Want To Live
	[889] = 9008, -- Gug'rokk
	-- UBRS
	[1226] = 9045, -- Gorashan
	[1227] = 9058, -- Trash, Activate on Kyrak: Leeeeeroy!
	[1229] = 9056, -- Ragewing: Bridge Over Troubled Fire
	[1234] = 9057, -- Zaela
	-- Iron Docks
	[1235] = 9083, -- Nok'gar 
	[1236] = 9081, -- Trash, Activate on Enforcers
	[1238] = 9082, -- Skulloc 
	-- Skyreach
	[965] = 9033, -- Ranjit
	[967] = 9035, -- Rukhran
	[968] = 9034, -- Viryx
	[968] = 9036, -- Viryx	
	--Burial Grounds
	[1139] = 9018, -- Sadana Bloodfury
	[1140] = 9025, -- Bonemaw	
	[1160] = 9026, -- Ner'zul
	-- Grimrail
	[1163] = 9007, --Nitrogg
	[1138] = 9024, -- Rocketspark
	-- Everbloom
	[1214] = 9017, -- Witherbark
	[1208] = 9493, -- Sol
	[1210] = 9223, -- Yalnu
}

--------------------------------------------------------------------------------
-- Localization
--

addon.L = {
	achievement_hint = "I noticed that you are missing the achievement '%s' for the boss you are about to fight, %s."
}
local L = addon.L
local CL = LibStub("AceLocale-3.0"):GetLocale("Big Wigs: Common")

--------------------------------------------------------------------------------
-- Event Handlers
--

local function handler(module)
	local achievId = module.journalId and journalToAchievement[module.journalId]
	if achievId then
		local _, name = GetAchievementInfo(achievId)
		print("|cFF33FF99BigWigs:|r ", L.achievement_hint:format(name, module.displayName))
		--print breakdown?
	end 
end


BigWigsLoader.RegisterMessage(addon, "BigWigs_OnBossEnable", handler) 

