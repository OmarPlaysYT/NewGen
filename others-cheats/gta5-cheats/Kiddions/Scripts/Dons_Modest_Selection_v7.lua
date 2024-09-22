local scriptName = "Dons Modest Selection"
local version = " V7"
local gameVersion = 3274

scriptName = scriptName .. version
---@diagnostic disable: lowercase-global, undefined-global, undefined-field

--#region Variables

--#region Settings Variables

-- user settings to be saved and updated
local settings = {
    enablePrints = true,        -- controls user help print outs
    debugMode = true,           -- controls debugging print outs
    timesLoaded = 0,            -- tracks the amount of times the script was loaded
    memory = {
        usageLimit = 15000,     -- KB Limit for memory usage
        defaultThreshold = 5000 -- Iterations before checking memory
    },
    pvp = {
        autoHeal = {
            running = false,   -- controls the loop
            threshold = 20,    -- minimum health, in percent of 100
            healRate = 10,     -- health per loop
            fullyHeal = false, -- if false, use healRate over time
            speed = 1,         -- 1-10
            onStartUp = false  -- controls if it auto resumes on startup
        }
    },
    rgb = {
        noVehicleTimeLimit = 10, -- amount of seconds before stopping rgb loop in not in vehicle
        autoStop = false         -- controls whether or not to auto stop rgb mode if not in vehicle
    }
}

--#endregion

--#region RGB Mode Variables

-- rgb variables
local rgb = {
    running = false,
    speed = 1,
    originalPrimary = { R = nil, G = nil, B = nil },
    originalSecondary = { R = nil, G = nil, B = nil },
    hue = 0,
    RGBCounter = 0,
    currentVehicle = nil,
    transitionSpeed = 0.05
}

-- speed array
local RGBSpeeds = {
    [1] = "Extra Slow",
    [2] = "Slow",
    [3] = "Default",
    [4] = "Fast",
    [5] = "Extra Fast",
    [6] = "Extra Extra Fast"
}

-- delay array
local RGBSpeedValues = {
    [1] = 2,
    [2] = 1.5,
    [3] = 1,
    [4] = 0.5,
    [5] = 0.1,
    [6] = 0.05
}

local currentRGBSpeedIndex = 3  -- current index
--#endregion

--#endregion

--#region Function Definitions

--#region Utility Functions

-- returns x amount of blank spaces
function blankSpace(amount)
    return string.rep(' ', amount)
end

-- popup that halts script execution
function errorPopup(message, var)
    error(message, var or 0)
end

-- returns true
function born()
    return true
end

-- returns false
function rip()
    return false
end

-- checks if localplayer is in vehicle
function carCheck()
    if localplayer then
        return localplayer:is_in_vehicle()
    else
        return false
    end
end

-- for developer debugging
function debugPrint(message)
    if settings.debugMode then
        print("[DEBUG] " .. tostring(message))
    end
end

-- notifies user of helpful info
function notify(message)
    if settings.enablePrints then
        print("[NOTIFY] " .. tostring(message))
    end
end

-- saves current settings table
function saveUserSettings()
    json.savefile("UserSettings", settings)
    debugPrint("User settings saved successfully.")
end

-- loads user settings or inits default table
function loadUserSettings()
    local success, loadedTable = pcall(function()
        return json.loadfile("UserSettings")
    end)
    if success and loadedTable then
        settings = loadedTable
        debugPrint("User settings loaded successfully.")
    else
        saveUserSettings()
        notify("No previous settings found. Default settings have been applied.")
    end
end

-- toggles notify prints for user help
function toggleUserPrints(bool)
    settings.enablePrints = bool
    saveUserSettings()
    notify("Console print-outs have been " .. (bool and "enabled." or "disabled."))
end

-- toggles debug prints
function toggleDebugMode(bool)
    settings.debugMode = bool
    saveUserSettings()
    notify("Debug mode has been " .. (bool and "enabled." or "disabled."))
end

-- checks the iteration count against the threshold and memory against the limit
function manageGarbageCollection(iterationCount, threshold)
    threshold = threshold or settings.memory.defaultThreshold
    local currentUsage = collectgarbage("count")
    if iterationCount >= threshold and currentUsage > settings.memory.usageLimit then
        debugPrint("Performing garbage collection due to high memory usage.")
        collectgarbage("collect")
        debugPrint("Garbage collection completed. Current Memory Usage: " .. collectgarbage("count") .. " KB")
        notify("Memory cleanup performed to optimize performance.")
        return 0
    end
    return iterationCount
end

--#endregion

--#region Script Initialization Functions

-- welcome message
function loadWelcomeMessage()
    if settings.timesLoaded == 0 then
        local b = blankSpace
        settings.timesLoaded = 1
        saveUserSettings()

        local welcomeMessage = b(14) .. "Welcome To Don's Modest Collection\n\n\n" ..
            b(6) .. "Considering This Is Your First Time Using My Script\n" ..
            "I Strongly Suggest You Use It With The Lua Debug Console\n\n" ..
            "   You Can Find The Option To Open It In Modest Menu's\n" ..
            b(36) .. "Settings Section.\n\n" ..
            "If You Ever Have Questions Or Suggestions Please Contact Me\n" ..
            b(30) .. "Discord:" .. b(11) .. "ronnie.r.1989"

        print(welcomeMessage)
        errorPopup(welcomeMessage)
    else
        settings.timesLoaded = settings.timesLoaded + 1
        saveUserSettings()
        notify("You have loaded " .. scriptName .. " a total of " .. tostring(settings.timesLoaded) .. " time(s).")
    end
end

--#endregion

--#region RGB Mode Functions

-- sanity checker
function isValidColor(color)
    return color.R and color.G and color.B
end

-- converts hsv colour values into rgb values
function hsv_to_rgb(h, s, v)
    local c = v * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))
    local m = v - c
    local r, g, b =
        (h < 60 and c or h < 120 and x or h < 180 and 0 or h < 240 and 0 or h < 300 and x or c),
        (h < 60 and x or h < 120 and c or h < 180 and c or h < 240 and x or h < 300 and 0 or 0),
        (h < 60 and 0 or h < 120 and 0 or h < 180 and x or h < 240 and c or h < 300 and c or x)
    return (r + m) * 255, (g + m) * 255, (b + m) * 255
end

-- saves current colours for reversion
function saveOriginalColours(vehicle)
    debugPrint("Saving original colors of the vehicle.")
    rgb.originalPrimary.R, rgb.originalPrimary.G, rgb.originalPrimary.B = vehicle:get_custom_primary_colour()
    rgb.originalSecondary.R, rgb.originalSecondary.G, rgb.originalSecondary.B = vehicle:get_custom_secondary_colour()
    debugPrint(string.format(
        "Saved Original Colours - Primary: R: %d, G: %d, B: %d | Secondary: R: %d, G: %d, B: %d",
        rgb.originalPrimary.R, rgb.originalPrimary.G, rgb.originalPrimary.B,
        rgb.originalSecondary.R, rgb.originalSecondary.G, rgb.originalSecondary.B
    ))
end

-- also reverts the stored paint values to nil
function restorePaint(vehicle)
    if vehicle ~= nil and isValidColor(rgb.originalPrimary) and isValidColor(rgb.originalSecondary) then
        debugPrint("Restoring vehicle paint to original colors.")
        vehicle:set_custom_primary_colour(rgb.originalPrimary.R, rgb.originalPrimary.G, rgb.originalPrimary.B)
        vehicle:set_custom_secondary_colour(rgb.originalSecondary.R, rgb.originalSecondary.G, rgb.originalSecondary.B)
        rgb.originalPrimary = { R = nil, G = nil, B = nil }
        rgb.originalSecondary = { R = nil, G = nil, B = nil }
    else
        debugPrint("Error: Cannot restore paint. Original colors are nil or vehicle is invalid.")
        notify("Failed to restore original paint colors. Please check vehicle status.")
    end
end

-- main rgb loop
function runRGBLoop()
    rgb.running = true
    debugPrint("Entering RGB loop.")
    local exitCounter = 0
    while rgb.running do
        if carCheck() then
            exitCounter = 0 -- Reset exit counter if back in the vehicle
            if rgb.currentVehicle ~= localplayer:get_current_vehicle() then
                local previousVehicle = rgb.currentVehicle
                local newVehicle = localplayer:get_current_vehicle()
                restorePaint(previousVehicle)
                rgb.currentVehicle = newVehicle
                saveOriginalColours(newVehicle)
                notify("Vehicle changed, applying RGB mode to the new vehicle.")
            end

            if rgb.currentVehicle == nil then
                debugPrint("Error: rgb.currentVehicle is nil. Exiting RGB loop.")
                notify("Unexpected Error:\nCurrent vehicle is not detected, stopping RGB mode.\n")
                stopRGBMode()
                return
            end

            local r, g, b = hsv_to_rgb(rgb.hue, 1, 1)
            r, g, b = math.floor(r + 0.5), math.floor(g + 0.5), math.floor(b + 0.5)

            rgb.currentVehicle:set_custom_primary_colour(r, g, b)
            rgb.currentVehicle:set_custom_secondary_colour(r, g, b)

            rgb.hue = (rgb.hue + 1) % 360
            debugPrint("Applied RGB colors - Hue: " .. rgb.hue)

            rgb.RGBCounter = rgb.RGBCounter + 1
            if rgb.RGBCounter > 1000 then
                debugPrint("Garbage Collection Initiated. Current Memory Usage: " .. collectgarbage("count") .. " KB")
                collectgarbage("collect")
                rgb.RGBCounter = 0
                debugPrint("Garbage Collection Completed. Updated Memory Usage: " .. collectgarbage("count") .. " KB")
            end
            sleep(RGBSpeedValues[currentRGBSpeedIndex])
        else
            sleep(0.1)
            exitCounter = exitCounter + 0.1
            if exitCounter > settings.rgb.noVehicleTimeLimit and settings.rgb.autoStop == true then
                debugPrint("Player left vehicle, stopping RGB mode due to timeout.")
                stopRGBMode()
            end
        end
    end
end

-- start button function
function startRGBMode()
    if rgb.running then
        notify("RGB Mode is already running.")
    else
        runRGBLoop()
        notify("RGB Mode has started.")
    end
end

-- stop button function
function stopRGBMode()
    if rgb.running then
        debugPrint("Stopping RGB Mode...")
        rgb.running = false
        if rgb.currentVehicle then
            restorePaint(rgb.currentVehicle)
            notify("RGB Mode stopped, and vehicle paint has been restored.")
            rgb.currentVehicle = nil
        end
    else
        notify("RGB Mode is not running.")
    end
end

--#endregion

--#region PVP Functions

-- auto heal loop
function startAutoHeal(bool)
    if bool == true then
        settings.pvp.autoHeal.running = true
        notify("Auto Heal has started.")
        local iterationCount = 0
        repeat
            sleep(convertSpeedIntoDelay(settings.pvp.autoHeal.speed))
            if localplayer == nil then return end
            local currentHealth = localplayer:get_health()
            local maxHealth = localplayer:get_max_health()
            local healthPercentage = (currentHealth / maxHealth) * 100
            if healthPercentage < settings.pvp.autoHeal.threshold then
                if settings.pvp.autoHeal.fullyHeal then
                    localplayer:set_health(maxHealth)
                    debugPrint("Fully healed player to maximum health.")
                else
                    localplayer:set_health(math.min(currentHealth + settings.pvp.autoHeal.healRate, maxHealth))
                    debugPrint("Incrementally healed player. Current Health: " .. localplayer:get_health())
                end
            end
            iterationCount = iterationCount + 1
            iterationCount = manageGarbageCollection(iterationCount, settings.memory.defaultThreshold)
        until settings.pvp.autoHeal.running == false
    else
        settings.pvp.autoHeal.running = false
        notify("Auto Heal has been disabled.")
    end
end

-- converts an speed (1-10) into a delay (0.5 - 0.05)
function convertSpeedIntoDelay(int)
    -- thank you Gaymer, my implementation was stupid
    local speedArray = { 0.5, 0.4, 0.3, 0.2, 0.1, 0.09, 0.08, 0.7, 0.06, 0.05 }
    return speedArray[int]
end

-- auto heal toggle button function
function toggleAutoHeal(bool)
    if bool == true then
        startAutoHeal(bool)
    else
        settings.pvp.autoHeal.running = false
        notify("Auto Heal has been turned off.")
    end
end

--#endregion

--#endregion

--#region Menu Items

--#region Main Menu Initialization
local mainMenu = menu.add_submenu(scriptName)
--#endregion

--#region PVP Menu
local pvpMenu = mainMenu:add_submenu("PVP")

--#region AutoHeal Menu
local autoHealMenu = pvpMenu:add_submenu("Auto Heal")

autoHealMenu:add_toggle("Resume On Startup",
    function()
        return settings.pvp.autoHeal.onStartUp
    end,
    function(bool)
        settings.pvp.autoHeal.onStartUp = bool
        saveUserSettings()
        notify("Auto Heal will " .. (bool and "resume" or "not resume") .. " on startup.")
    end
)

autoHealMenu:add_toggle("Fully Heal instead of Regeneration",
    function()
        return settings.pvp.autoHeal.fullyHeal
    end,
    function(toggleState)
        settings.pvp.autoHeal.fullyHeal = toggleState
        saveUserSettings()
        notify("Auto Heal is set to " .. (toggleState and "fully heal." or "incremental healing."))
    end
)

autoHealMenu:add_int_range("Speed :", 1, 1, 10,
    function()
        return settings.pvp.autoHeal.speed
    end,
    function(integer)
        settings.pvp.autoHeal.speed = integer
        saveUserSettings()
        notify("Auto Heal speed set to " .. tostring(integer))
    end
)

autoHealMenu:add_int_range("Minimum Health %: ", 10, 1, 100,
    function()
        return settings.pvp.autoHeal.threshold
    end,
    function(integer)
        settings.pvp.autoHeal.threshold = integer
        saveUserSettings()
        notify("Auto Heal will trigger at " .. tostring(integer) .. "% health.")
    end
)

autoHealMenu:add_toggle("Toggle Auto Heal",
    function()
        return settings.pvp.autoHeal.running
    end,
    function(bool)
        toggleAutoHeal(bool)
        notify("Auto Heal has been " .. (bool and "enabled." or "disabled."))
    end
)

--#region AutoHeal Help Menu
local autoHealHelpMenu = autoHealMenu:add_submenu("Auto Heal Help")

autoHealHelpMenu:add_action("Resume On Startup:", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    Automatically resumes Auto Heal", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    when the script starts, based", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    on the user's last settings.", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("", function() print("this is a text only menu item") end)

autoHealHelpMenu:add_action("Fully Heal:", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    Fully heals the player instead", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    of incrementally regenerating.", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("", function() print("this is a text only menu item") end)

autoHealHelpMenu:add_action("Speed:", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    Adjusts the frequency of healing", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    actions. Higher values heal", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    faster.", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("", function() print("this is a text only menu item") end)

autoHealHelpMenu:add_action("Minimum Health %:", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    Sets the threshold for when", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    Auto Heal activates. If health", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    drops below this percentage,", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    healing will begin.", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("", function() print("this is a text only menu item") end)

autoHealHelpMenu:add_action("Toggle Auto Heal:", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    Turns the Auto Heal function on", function() print("this is a text only menu item") end)
autoHealHelpMenu:add_action("    or off based on user input.", function() print("this is a text only menu item") end)

--#endregion

--#endregion

--#endregion

--#region RGB Menu
local rgbMenu = mainMenu:add_submenu("RGB Mode")

rgbMenu:add_action("Start RGB Mode", function() startRGBMode() end)
rgbMenu:add_action("Stop RGB Mode", function() stopRGBMode() end)

rgbMenu:add_array_item("RGB Speed", RGBSpeeds,
    function() return currentRGBSpeedIndex end,
    function(index)
        currentRGBSpeedIndex = index
        saveUserSettings()
        notify("RGB Speed set to " .. RGBSpeeds[currentRGBSpeedIndex])
    end
)

rgbMenu:add_action("Enable Auto Stop", function()
    settings.rgb.autoStop = true
    saveUserSettings()
    notify("Auto Stop has been enabled.")
end)

rgbMenu:add_action("Disable Auto Stop", function()
    settings.rgb.autoStop = false
    saveUserSettings()
    notify("Auto Stop has been disabled.")
end)

rgbMenu:add_int_range("Auto Stop Time Limit", 1, 1, 100,
    function()
        return settings.rgb.noVehicleTimeLimit
    end,
    function(newInt)
        settings.rgb.noVehicleTimeLimit = newInt
        saveUserSettings()
        notify("Auto Stop Time Limit set to " .. tostring(newInt) .. " seconds.")
    end
)

--#region RGB Help Menu
local rgbHelpMenu = rgbMenu:add_submenu("RGB Help")

rgbHelpMenu:add_action("RGB Speed:", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    Adjusts the speed of the color", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    transition for the vehicle.", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    Higher values will result in", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    faster transitions.", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("", function() print("this is a text only menu item") end)

rgbHelpMenu:add_action("Auto Stop:", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    Automatically stops the RGB loop", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    if the player is out of a vehicle", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    for the set time limit.", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("", function() print("this is a text only menu item") end)

rgbHelpMenu:add_action("Auto Stop Time Limit:", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    Defines the amount of time in", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    seconds that the player can be", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    out of a vehicle before RGB Mode", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    automatically stops.", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("", function() print("this is a text only menu item") end)

rgbHelpMenu:add_action("Start/Stop RGB Mode:", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    Starts or stops the RGB mode.", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    Start will initiate the color", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    changing loop, while Stop will", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    revert to original colors and", function() print("this is a text only menu item") end)
rgbHelpMenu:add_action("    halt the loop.", function() print("this is a text only menu item") end)

--#endregion

--#endregion

--#region Settings Menu
local settingsMenu = mainMenu:add_submenu("Settings")

settingsMenu:add_toggle("Console Print-outs",
    function() return settings.enablePrints end,
    function(bool) toggleUserPrints(bool) end
)

settingsMenu:add_toggle("Debug Mode",
    function() return settings.debugMode end,
    function(bool) toggleDebugMode(bool) end
)

--#region Memory
local memoryMenu = settingsMenu:add_submenu("Memory Management")

memoryMenu:add_int_range("Memory Usage Limit (KB)", 5000, 5000, 50000,
    function() return settings.memory.usageLimit end,
    function(value)
        settings.memory.usageLimit = value
        saveUserSettings()
        notify("Memory usage limit set to " .. tostring(value) .. " KB.")
        debugPrint("Memory usage limit set to " .. tostring(value) .. " KB")
    end
)

memoryMenu:add_int_range("Iteration Threshold", 100, 100, 5000,
    function() return settings.memory.defaultThreshold end,
    function(value)
        settings.memory.defaultThreshold = value
        saveUserSettings()
        notify("Iteration threshold for garbage collection set to " .. tostring(value) .. ".")
        debugPrint("Iteration threshold set to " .. tostring(value))
    end
)

--#endregion

--#endregion

--#endregion

--#region Callbacks

menu.register_callback("OnScriptsLoaded", function()
    startAutoHeal(settings.pvp.autoHeal.onStartUp and settings.pvp.autoHeal.running)
    loadWelcomeMessage() -- this MUST be last (view the function)
end)

--#endregion

loadUserSettings()
print(scriptName .. " has been initialized.")
