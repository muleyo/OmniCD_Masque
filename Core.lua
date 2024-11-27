-- Masque Support
local Masque, MSQ_Version = LibStub("Masque", true)
local masqueGroup = Masque:Group("OmniCD", "Icons")

if Masque then
    local function applyMasque()
        for i = 1, 200 do
            local icon = _G["OmniCDIcon" .. i]
            if icon and (not icon.masqued) then
                masqueGroup:AddButton(icon)
                icon.masqued = true
            end
        end
    end

    -- Party Updates
    hooksecurefunc("CompactUnitFrame_OnEvent", applyMasque)

    -- In case player isn't in group and uses 'Test' mode
    local eventHandler = CreateFrame("Frame")
    eventHandler:RegisterEvent("PLAYER_ENTERING_WORLD")
    eventHandler:RegisterEvent('UI_SCALE_CHANGED')
    eventHandler:RegisterEvent("UPDATE_UI_WIDGET")
    eventHandler:HookScript("OnEvent", applyMasque)
end
