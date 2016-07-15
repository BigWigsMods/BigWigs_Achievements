
local name, addon = ...
local isCompleted = false
local legion_700 = select(4, GetBuildInfo()) >= 70000

--------------------------------------------------------------------------------
-- Locals
--

local journalToAchievement = {
	-- Auchindoun
	[1186] = 9023, -- Nyami
	[1216] = 9551, -- Azzakel
	[1225] = 9552, -- Teron

	-- Slag Mines
	[893] = 8993, -- Magmolatus: A Gift of Earth and Fire
	[888] = 9005, -- Trash, Activate on Crushto: Come With Me If You Want To Live
	[889] = 9008, -- Gug'rokk

	-- Upper Blackrock Spire
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
	[968] = {9034, 9036}, -- High Sage Viryx	

	--Burial Grounds
	[1139] = 9018, -- Sadana Bloodfury
	[1140] = 9025, -- Bonemaw	
	[1160] = 9026, -- Ner'zul

	-- Grimrail
	[1163] = 9007, -- Nitrogg
	[1138] = 9024, -- Rocketspark

	-- Everbloom
	[1214] = 9017, -- Witherbark
	[1208] = 9493, -- Sol
	[1210] = 9223, -- Yalnu

	-- [[ Legion ]] -- 
	-- Eye of Azshara
	[1480] = 10456, -- Warlord Parjesh
	[1490] = 10457, -- Lady Hatecoil
	--[1491] = 0, -- King Deepbeard
	--[1479] = 0, -- Serpentrix
	[1492] = 10458, -- Wrath of Azshara

	-- Halls of Valor
	--[1485] = 0, -- Hymdall
	--[1486] = 0, -- Hyrja
	[1487] = 10544, -- Fenryr
	--[1488] = 0, -- God-King Skovald
	[1489] = 10543, -- Odyn

	-- The Arcway
	[1497] = 10773, -- Ivanyr
	[1498] = 10775, -- Corstilax
	--[1499] = 0, -- General Xakal
	--[1500] = 0, -- Nal'tira
	[1501] = 10776, -- Advisor Vandros

	-- Maw of Souls
	[1502] = 10413, -- Ymiron, the Fallen King
	--[1512] = 0, -- Harbaron
	[1663] = 10412, -- Helya

	-- Darkheart Thicket
	--[1654] = 0, -- Archdruid Glaidalis
	--[1655] = 0, -- Oakheart
	[1656] = 10766, -- Dresaron
	[1657] = 10769, -- Shade of Xavius

	-- Court of Stars
	[1718] = 10610, -- Patrol Captain Gerdo
	--[1719] = 0, -- Talixae Flamewreath
	[1720] = 10611, -- Advisor Melandrus

	-- Vault of the Wardens
	--[1467] = 0, -- Tirathon Saltheril
	--[1695] = 0, -- Inquisitor Tormentorum
	[1468] = 10679, -- Ash'golm
	--[1469] = 0, -- Glazer
	[1470] = 10680, -- Cordana Felsong

	-- Assault on Violet Hold
	--[1694] = 0, -- Shivermaw
	--[1702] = 0, -- Blood-Princess Thal'ena
	[1693] = 10554, -- Festerface
	[1688] = 10553, -- Millificent Manastorm
	--[1686] = 0, -- Mindflayer Kaahrj
	--[1696] = 0, -- Anub'esset
	--[1697] = 0, -- Sael'orn
	--[1711] = 0, -- Fel Lord Betrug

	-- Black Rook Hold
	-- 10709 (no boss)
	[1518] = 10710, -- The Amalgam of Souls
	[1653] = 10711, -- Illysanna Ravencrest
	--[1664] = 0, -- Smashspite the Hateful
	--[1672] = 0, -- Lord Kur'talos Ravencrest

	-- Neltharion's Lair
	[1662] = 10996, -- Rokmora
	--[1665] = 0, -- Ularogg Cragshaper
	[1673] = 10875, -- Naraxas
	--[1687] = 0, -- Dargrul the Underking
}

--------------------------------------------------------------------------------
-- Localization
--

addon.L = {
	achievement_hint = "We noticed that you are missing the achievement '%s' for the boss you are about to fight, %s.",
	achievement_multi = "We noticed that you are missing a few achievements for the boss you are about to fight, %s:"
}
local L = addon.L
local CL = LibStub("AceLocale-3.0"):GetLocale("Big Wigs: Common")

--------------------------------------------------------------------------------
-- Event Handlers
--

local function handler(event, module)
	local achievId = journalToAchievement[module.journalId]
	local _, _, difficulty = GetInstanceInfo()    
	if difficulty == 2 and legion_700 or difficulty == 23 and achievId then
		if type(achievId) == "table" then
			local links = ""
			for key, value in pairs(achievId) do
				_, _, _, isCompleted = GetAchievementInfo(value)
				if not isCompleted then
					links = links .. " " .. GetAchievementLink(value) 
				end	
			end
			if links ~= "" then
				print("|cFF33FF99BigWigs:|r", L.achievement_multi:format(module.displayName) .. links)
			end
		else
			_, _, _, isCompleted = GetAchievementInfo(achievId)
			if not isCompleted then
				local link = GetAchievementLink(achievId)
				print("|cFF33FF99BigWigs:|r", L.achievement_hint:format(link, module.displayName))
			end
		end
	end 
end

BigWigsLoader.RegisterMessage(addon, "BigWigs_OnBossEnable", handler) 
