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

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 5.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target
Config.OpenKey = 'LMENU' -- Left Alt
Config.OpenControlKey = 19 -- Control for keypress detection also Left Alt for the eye itself, controls are found here https://docs.fivem.net/docs/game-references/controls/

-- Key to open the menu
Config.MenuControlKey = 238 -- Control for keypress detection on the context menu, this is the Right Mouse Button, controls are found here https://docs.fivem.net/docs/game-references/controls/

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {
	["LSC"] = {
        name = "LSCLobby",
        coords = vector3(-348.25, -127.12, 38.99),
        length = 0.75,
        width = 0.4,
        heading = -20,
        debugPoly = true,
        minZ = 39.01,
        maxZ = 39.75,
        options = {
            {
                type = "server",
                event = "QBCore:ToggleDuty",
                icon = "fas fa-clipboard",
                label = "Toggle Duty",
                job = "mechanic",
            },
			{
				type = "client",
				event = 'qb-mechanicjob:client:bill',
				icon = 'fas fa-cash-register',
				label = "Charge Customer",
				job = "mechanic"
			}
        },
        distance = 1.5
    },
	['LSCStash'] = {
		name = 'LSCStash',
		coords = vector3(-313.73, -129.86, 39.01),
		length = 2.0,
		width = 0.95,
		heading = 161,
		debugPoly = true,
		minZ = 36.01,
		maxZ = 39.89,
		options = {
			type = "client",
			event = 'mechanic:client:openStash',
			icon = 'fas fa-box',
			label = 'Personal Locker',
			job = 'mechanic'
		},
		distance = 1.5
	},
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
	options = {
		{
			type = 'client',
			event = 'qb-phone:client:GiveContactDetails',
			icon = 'fas fa-chevron-circle-left',
			label = 'Give contact details',
		},
	}
}

Config.Peds = {
	[1] = {
  model = 'a_f_y_hipster_01',
  coords = vector4(-266.23, -967.81, 31.23, 300.11),
  minusOne = true,
  freeze = true,
  invincible = true,
  blockevents = true,
  animDict = 'abigail_mcs_1_concat-0',
  anim = 'csb_abigail_dual-0',
  flag = 1,
  scenario = 'WORLD_HUMAN_AA_COFFEE',
  target = {
    options = {
      {
        type = "client",
        event = "qb-multicharacter:client:chooseChar",
        icon = 'fas fa-arrow-right-arrow-left',
        label = 'Swap Character',
      }
    },
    distance = 2.5
  },
},
}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCount() return true end
local function CitizenCheck() return true end

CreateThread(function()
	if not Config.Standalone then
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCount = function(item)
			for _, v in pairs(PlayerData.items) do
				if v.name == item then
					return true
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	else
		local firstSpawn = false
		AddEventHandler('playerSpawned', function()
			if not firstSpawn then
				SpawnPeds()
				firstSpawn = true
			end
		end)
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