local f=CreateFrame("Frame");
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")


click_to_move="AutoInteract"
f:SetScript("OnEvent", function(self, event)
    if event=="PLAYER_REGEN_DISABLED" then
        SetCVar(click_to_move, 0)
    elseif event=="PLAYER_REGEN_ENABLED" then
        SetCVar(click_to_move, 1)
    end
end)

local function CTMAddonCommands(msg, editbox)

    local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")

    if cmd == "e" then
        SetCVar(click_to_move, 1)
        print("Click-to-move enabled")
    elseif cmd == "d" then
        SetCVar(click_to_move, 0)
        print("Click-to-move disabled")
    end
end

SLASH_CM1 = "/cm"
SlashCmdList["CM"] = CTMAddonCommands
