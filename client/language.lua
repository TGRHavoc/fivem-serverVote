-- Load the JSON file (should be dynamic) and pop all the kvp into the GTA string system

local tbl = {
    "american", "french",
    "german",   "italian",
    "spanish",  "portuguese",
    "polish",   "russian",
    "korean",   "chinese",
    "japanese", "mexican"
}

--[[
function showSubtitle(label, args)
    print("label: " .. label)
    BeginTextCommandPrint(label)
    EndTextCommandPrint(5000, true) -- top right
end

RegisterCommand("test_vote", function(src, args, raw)
    Citizen.Trace("Showing subtitle..")
    showSubtitle("vote_steam_not_found")
end, false)
]]

Citizen.CreateThread(function()
    local file = LoadResourceFile(GetCurrentResourceName(), "locales/" .. tbl[GetCurrentLanguageId()+1] .. ".json")
    Citizen.Trace(tbl[GetCurrentLanguageId()+1] .. ".json")

    local keyTabl = json.decode(file)

    for k,v in pairs(keyTabl) do
        AddTextEntry("vote_" .. k, v)
    end
end)
