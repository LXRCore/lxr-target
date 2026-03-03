--[[
    ████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗
       ██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝
       ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   
       ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   
       ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   
       ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   
    
    🐺 LXR Target - Advanced Interaction & Targeting System
    
    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════
    
    Server:      The Land of Wolves 🐺
    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    Store:       https://theluxempire.tebex.io
    
    ═══════════════════════════════════════════════════════════════════════════════
    
    Framework Support:
    - LXR Core  (Primary)
    - RSG Core  (Primary)
    - VORP Core (Supported)
    - Standalone (Fallback)
    
    ═══════════════════════════════════════════════════════════════════════════════
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE NAME PROTECTION - RUNTIME CHECK
-- ═══════════════════════════════════════════════════════════════════════════════

local REQUIRED_RESOURCE_NAME = "lxr-target"
local currentResourceName = GetCurrentResourceName()

if currentResourceName ~= REQUIRED_RESOURCE_NAME then
    error(string.format([[

        ═══════════════════════════════════════════════════════════════════════════════
        ❌ CRITICAL ERROR: RESOURCE NAME MISMATCH ❌
        ═══════════════════════════════════════════════════════════════════════════════

        Expected: %s
        Got: %s

        This resource is branded and must maintain the correct name.
        Rename the folder to "%s" to continue.

        🐺 wolves.land - The Land of Wolves

        ═══════════════════════════════════════════════════════════════════════════════

    ]], REQUIRED_RESOURCE_NAME, currentResourceName, REQUIRED_RESOURCE_NAME))
end

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SERVER BRANDING & INFO ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config = {}

Config.ServerInfo = {
    name       = 'The Land of Wolves 🐺',
    developer  = 'iBoss21 / The Lux Empire',
    website    = 'https://www.wolves.land',
    discord    = 'https://discord.gg/CrKcWdfd3A',
    store      = 'https://theluxempire.tebex.io',
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK CONFIGURATION ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Framework Priority (in order):
    1. LXR-Core  (Primary)
    2. RSG-Core  (Primary)
    3. VORP Core (Supported)
    4. Standalone (Fallback)
]]

Config.Framework = 'auto' -- 'auto' or manual: 'lxr-core', 'rsg-core', 'vorp_core', 'standalone'

Config.FrameworkSettings = {
    ['lxr-core'] = {
        resource = 'lxr-core',
        events = {
            onPlayerLoaded  = 'LXRCore:Client:OnPlayerLoaded',
            onPlayerUnload  = 'LXRCore:Client:OnPlayerUnload',
            onJobUpdate     = 'LXRCore:Client:OnJobUpdate',
            onGangUpdate    = 'LXRCore:Client:OnGangUpdate',
            setPlayerData   = 'LXRCore:Player:SetPlayerData',
        }
    },
    ['rsg-core'] = {
        resource = 'rsg-core',
        events = {
            onPlayerLoaded  = 'RSGCore:Client:OnPlayerLoaded',
            onPlayerUnload  = 'RSGCore:Client:OnPlayerUnload',
            onJobUpdate     = 'RSGCore:Client:OnJobUpdate',
            onGangUpdate    = 'RSGCore:Client:OnGangUpdate',
            setPlayerData   = 'RSGCore:Player:SetPlayerData',
        }
    },
    ['vorp_core'] = {
        resource = 'vorp_core',
        events = {
            onPlayerLoaded  = 'vorp:playerLoaded',
            onPlayerUnload  = 'vorp:playerLogout',
        }
    },
    ['standalone'] = {
        resource = nil,
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ STARTUP BANNER ████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

CreateThread(function()
    Wait(500)
    print([[

        ═══════════════════════════════════════════════════════════════════════════════

            ████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗
               ██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝
               ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   
               ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   
               ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   
               ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   

        ═══════════════════════════════════════════════════════════════════════════════
        🐺 LXR TARGET - SUCCESSFULLY LOADED
        ═══════════════════════════════════════════════════════════════════════════════

        Version:     5.2.2
        Server:      The Land of Wolves 🐺
        Framework:   ]] .. Config.Framework .. [[

        ═══════════════════════════════════════════════════════════════════════════════

        Developer:   iBoss21 / The Lux Empire
        Website:     https://www.wolves.land
        Discord:     https://discord.gg/CrKcWdfd3A

        ═══════════════════════════════════════════════════════════════════════════════

    ]])
end)

function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 5.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- The color of the outline in rgb, the first value is red, the second value is green and the last value is blue. Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255}

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target
Config.OpenKey = 'LMENU' -- Left Alt

-- Key to open the menu
Config.MenuControlKey = 238 -- Control for keypress detection on the context menu, this is the Right Mouse Button, controls are found here https://docs.fivem.net/docs/game-references/controls/

-- Whether to have the target as a toggle or not
Config.Toggle = false

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {

}

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetEntities = {

}

Config.TargetModels = {

}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

}

Config.Peds = {

}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK FUNCTIONS ████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCount() return true end
local function CitizenCheck() return true end

-- ─────────────────────────────────────────────────────────────────────────────
-- Auto-detect active framework if Config.Framework == 'auto'
-- ─────────────────────────────────────────────────────────────────────────────
local function ResolveFramework()
    if Config.Framework ~= 'auto' then return Config.Framework end
    local priority = {'lxr-core', 'rsg-core', 'vorp_core'}
    for _, fw in ipairs(priority) do
        local settings = Config.FrameworkSettings[fw]
        if settings and settings.resource and GetResourceState(settings.resource) == 'started' then
            return fw
        end
    end
    return 'standalone'
end

CreateThread(function()
    local framework = ResolveFramework()

    -- ─────────────────────────────────────────────────────────────────────────
    -- LXR-Core
    -- ─────────────────────────────────────────────────────────────────────────
    if framework == 'lxr-core' then
        local LXRCore = exports['lxr-core']:GetCoreObject()
        local PlayerData = exports['lxr-core']:GetPlayerData()
        local evts = Config.FrameworkSettings['lxr-core'].events

        ItemCount = function(item)
            for _, v in pairs(PlayerData.items) do
                if v.name == item then return true end
            end
            return false
        end

        JobCheck = function(job)
            if type(job) == 'table' then
                job = job[PlayerData.job.name]
                if job and PlayerData.job.grade.level >= job then return true end
            elseif job == 'all' or job == PlayerData.job.name then
                return true
            end
            return false
        end

        GangCheck = function(gang)
            if type(gang) == 'table' then
                gang = gang[PlayerData.gang.name]
                if gang and PlayerData.gang.grade.level >= gang then return true end
            elseif gang == 'all' or gang == PlayerData.gang.name then
                return true
            end
            return false
        end

        CitizenCheck = function(citizenid)
            return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
        end

        RegisterNetEvent(evts.onPlayerLoaded, function()
            PlayerData = exports['lxr-core']:GetPlayerData()
            SpawnPeds()
        end)

        RegisterNetEvent(evts.onPlayerUnload, function()
            PlayerData = {}
            DeletePeds()
        end)

        RegisterNetEvent(evts.onJobUpdate, function(JobInfo)
            PlayerData.job = JobInfo
        end)

        RegisterNetEvent(evts.onGangUpdate, function(GangInfo)
            PlayerData.gang = GangInfo
        end)

        RegisterNetEvent(evts.setPlayerData, function(val)
            PlayerData = val
        end)

    -- ─────────────────────────────────────────────────────────────────────────
    -- RSG-Core
    -- ─────────────────────────────────────────────────────────────────────────
    elseif framework == 'rsg-core' then
        local RSGCore = exports['rsg-core']:GetCoreObject()
        local PlayerData = RSGCore.Functions.GetPlayerData()
        local evts = Config.FrameworkSettings['rsg-core'].events

        ItemCount = function(item)
            for _, v in pairs(PlayerData.items or {}) do
                if v.name == item then return true end
            end
            return false
        end

        JobCheck = function(job)
            if type(job) == 'table' then
                job = job[PlayerData.job.name]
                if job and PlayerData.job.grade.level >= job then return true end
            elseif job == 'all' or job == PlayerData.job.name then
                return true
            end
            return false
        end

        GangCheck = function(gang)
            if type(gang) == 'table' then
                gang = gang[PlayerData.gang.name]
                if gang and PlayerData.gang.grade.level >= gang then return true end
            elseif gang == 'all' or gang == PlayerData.gang.name then
                return true
            end
            return false
        end

        CitizenCheck = function(citizenid)
            return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
        end

        RegisterNetEvent(evts.onPlayerLoaded, function()
            PlayerData = RSGCore.Functions.GetPlayerData()
            SpawnPeds()
        end)

        RegisterNetEvent(evts.onPlayerUnload, function()
            PlayerData = {}
            DeletePeds()
        end)

        RegisterNetEvent(evts.onJobUpdate, function(JobInfo)
            PlayerData.job = JobInfo
        end)

        RegisterNetEvent(evts.onGangUpdate, function(GangInfo)
            PlayerData.gang = GangInfo
        end)

        RegisterNetEvent(evts.setPlayerData, function(val)
            PlayerData = val
        end)

    -- ─────────────────────────────────────────────────────────────────────────
    -- VORP Core
    -- ─────────────────────────────────────────────────────────────────────────
    elseif framework == 'vorp_core' then
        local VORPCore = exports.vorp_core:GetCore()
        local evts = Config.FrameworkSettings['vorp_core'].events

        JobCheck = function(job)
            local User = VORPCore.Functions.GetUser(PlayerId())
            if not User then return false end
            local char = User.getUsedCharacter
            if type(job) == 'table' then
                return job[char.job] ~= nil
            end
            return job == 'all' or job == char.job
        end

        RegisterNetEvent(evts.onPlayerLoaded, function()
            SpawnPeds()
        end)

        RegisterNetEvent(evts.onPlayerUnload, function()
            DeletePeds()
        end)

    -- ─────────────────────────────────────────────────────────────────────────
    -- Standalone
    -- ─────────────────────────────────────────────────────────────────────────
    else
        local firstSpawn = false
        local event = AddEventHandler('playerSpawned', function()
            SpawnPeds()
            firstSpawn = true
        end)
        while true do
            if firstSpawn then
                RemoveEventHandler(event)
                break
            end
            Wait(1000)
        end
    end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCount(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end