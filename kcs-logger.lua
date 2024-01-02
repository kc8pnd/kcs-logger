local frame = CreateFrame("Frame")

local zonesToCheck = {
    "Blackfathom Deeps",
    "Gnomeregan",
    "Onyxia's Lair",
	"Molten Core",
	"Zul'Gurub",
	"Blackwing Lair",
	"Ruins of Ahn'Qiraj",
	"Temple of Ahn'Qiraj",
	"Naxxramas"
}

local function isInZoneList(zoneName)
    for _, v in ipairs(zonesToCheck) do
        if v == zoneName then
            return true
        end
    end
    return false
end

function frame:OnEvent(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
    if event == "ZONE_CHANGED_NEW_AREA" then
        local zoneName = GetRealZoneText()
        if isInZoneList(zoneName) then
            -- Enable combat logging
            DEFAULT_CHAT_FRAME:AddMessage("Combat logging enabled in " .. zoneName)
            LoggingCombat(1)
        else
            -- Disable combat logging
            DEFAULT_CHAT_FRAME:AddMessage("Combat logging disabled in " .. zoneName)
            LoggingCombat(0)
        end
    end
end

-- Register events
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")

-- Set up event handler
frame:SetScript("OnEvent", frame.OnEvent)
