-- MADE BY STEFANUK12, NOT ME

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Vars
local tablefind = table.find
local MainEvent = ReplicatedStorage.MainEvent

-- // Configuration
local Flags = {
    "CHECKER_1",
    "TeleportDetect",
    "OneMoreTime"
}

-- // __namecall hook
local __namecall
__namecall = hookmetamethod(game, "__namecall", function(...)
    -- // Vars
    local args = {...}
    local self = args[1]
    local method = getnamecallmethod()
    local caller = getcallingscript()

    -- // See if the game is trying to alert the server
    if (method == "FireServer" and self == MainEvent and tablefind(Flags, args[2])) then
        return
    end

    -- // Anti Crash
    if (not checkcaller() and getfenv(2).crash) then
        -- // Set the crash function (hooking can cause stutters)
        local fenv = getfenv(2)
        fenv.crash = function() end
        setfenv(2, fenv)
    end
    
    -- //
    return __namecall(...)
end)
