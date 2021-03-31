local addon, ST = ...

-- Hides outgoing whispers made by this addon to other users
local function hideSTWhispers(self, event, msg, recipient, ...)
    if msg:find(ST._ChatString,1,true) then -- Search for the ST string exactly, (no regex search)
        return true
    end
    return false -- Show everything else
end

function ST.setupFilter()
    ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", hideSTWhispers)
end