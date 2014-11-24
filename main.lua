
local name, addon = ...

--------------------------------------------------------------------------------
-- Locals
--

-- id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(category, index) or GetAchievementInfo(id)
-- link = GetAchievementLink(id)

-- Slag Mines
--[964] = {
--	8993 = true, -- Magmolatus: A Gift of Earth and Fire
--	9056 = true, -- Ragewing: Bridge Over Troubled Fire
--	9005 = true, -- Trash: Come With Me If You Want To Live
--	9008 = true, -- Gug'rokk
--}  
---- Auchindoun
--[984] = { 
--	-- Nyami: ...They All Fall Down 9023
--	-- Azzakel 9551
--	-- Teron 9552
--}	
---- UBRS
--[995] = { 
--	-- Zaela 9057
--	-- Trash 9058
--	-- Gorashan 9045
--}
---- Iron Docks
--[987] = { 
--	-- Trash (well, fk) 9081
--	-- Nok'gar 9083
--	-- Skulloc 9082
--}
---- Skyreach
--[989] = { 
--	-- Rukhran 9035
--	-- Endboss+ 9034
--	-- Viryx 9036
--	-- Ranjit 9033
--}
----Burial Grounds
--[969] = { 
--	-- Bonemaw 9025
--	-- Nerzul 9026
--	-- Sadana Bloodfury 9018
--}
---- Grimrail
--[993] = { 
--	-- nitrogg 9007
--	-- Rocketspark 9024
--}
---- Everbloom
--[1008] = {
--	-- Sol 9493
--	-- Witherbark 9017
--	-- Yalnu 9223
--} 

local journalToAchievement = {
	[1216] = 9551, -- Azzakel
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
		print("|cFF33FF99BigWigs_Achievements:|r ", L.achievement_hint:format(name, module.displayName))
		--print breakdown?
	end 
end


BigWigsLoader.RegisterMessage(addon, "BigWigs_OnBossEnable", handler) 

