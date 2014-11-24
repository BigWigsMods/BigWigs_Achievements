--------------------------------------------------------------------------------
-- Module Declaration
--

if BigWigsLoader then 
	BigWigsLoader.RegisterMessage(self, "BigWigs_OnBossEnable", function(module) 
		if module.journalId == 1216 then 
			print(L.achievement_hint) 
		end 
	end) 
end

--------------------------------------------------------------------------------
-- Locals
--

local CL = LibStub("AceLocale-3.0"):GetLocale("Big Wigs: Common")

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.achievement_hint = "Hey there, |cFF33FF99Big Wigs|r here! We noticed that you are missing a few achievements for that boss that you are about to fight, here, have a list: %%s"
end
L = mod:GetLocale()


--------------------------------------------------------------------------------
-- Event Handlers
--


