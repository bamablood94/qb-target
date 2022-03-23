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
Config.EnableDefaultOptions = false

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
	["MRPDBossMenu"] = {
        name = "MRPDBossMenu",
        coords = vector3(461.58, -985.55, 31.37),
        length = 0.65,
        width = 0.65,
        heading = 122.95,
        debugPoly = false,
        minZ = 30.03,
        maxZ = 31.14,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:openMenu",
                icon = "fas fa-folder",
                label = "Open Boss Menu",
                job = "police",
            },
        },
        distance = 2.0
    },
	["MRPDPoliceDuty"] = {
        name = "MRPDPoliceDuty",
        coords = vector3(441.83, -982.06, 30.69),
        length = 0.5,
        width = 0.4,
        heading = 12,
        debugPoly = false,
        minZ = 30.79,
        maxZ = 31.04,
        options = {
            {
                type = "client",
                event = "policejob:client:dutyToggle",
                icon = "fas fa-clipboard",
                label = "Toggle Duty",
                job = "police",
            },
        },
        distance = 1.5
    },
	["MRPDPoliceDuty2"] = {
        name = "MRPDPoliceDuty2",
        coords = vector3(473.16, -1006.95, 26.28),
        length = 0.45,
        width = 0.35,
        heading = 88.68,
        debugPoly = false,
        minZ = 26.23034,
        maxZ = 26.33034,
        options = {
            {
                type = "client",
                event = "policejob:client:dutyToggle",
                icon = "fas fa-clipboard",
                label = "Toggle Duty",
                job = "police",
            },
        },
        distance = 2.5
    },
	["MRPDPoliceDutyDog"] = {
        name = "MRPDPoliceDutyDog",
        coords = vector3(460.78, -980.83, 31.27),
        length = 1.0,
        width = 1.0,
        heading = 12,
        debugPoly = false,
        minZ = 30.07,
        maxZ = 30.57,
        options = {
            {
                type = "client",
                event = "policejob:client:dutyToggle",
                icon = "fas fa-clipboard",
                label = "Woof Woof, donuts, YABADOABAODOOO, bork",
                job = "police",
            },
        },
        distance = 1.5
    },
	["MRPDClothes"] = {
        name = "MRPDClothes",
        coords = vector3(461.93, -1000.2, 30.69),
        length = 0.4,
        width = 4.34,
        heading = 0,
        debugPoly = false,
        minZ = 29.72,
        maxZ = 32.48,
        options = {
            {
                type = "client",
                event = "fivem-appearance:PDclothingShop",
                icon = "fas fa-tshirt",
                label = "View Clothing",
                job = "police",
            },
        },
        distance = 2.5
    },
	["MRPDArmory"] = {
        name = "MRPDArmory",
        coords = vector3(485.41, -995.34, 30.69),
        length = 1.5,
        width = 1.5,
        heading = 235,
        debugPoly = false,
        minZ = 24.33,
        maxZ = 35.33,
        options = {
            {
                type = "client",
                event = "police:client:openArmory",
                icon = "fas fa-clipboard",
                label = "Open Police Armory",
                job = "police"
            }
        },
        distance = 1.5
    },
	["MRPDPersonalStash1"] = {
        name = "MRPDPersonalStash1",
        coords = vector3(482.6, -995.07, 30.69),
        length = 0.8,
        width = 1,
        heading = 180.93992614746,
        debugPoly = false,
        minZ = 30.0,
        maxZ = 31.5,
        options = {
            {
                type = "client",
                event = "police:client:openStash",
                icon = "fas fa-boxes",
                label = "Personal Stash",
                job = "police",
            },
        },
        distance = 2.5
    },
    ["MRPDFingerprintScan"] = {
        name = "MRPDFingerprintScan",
        coords = vector3(474.16, -1014.02, 27.21),
        length = 0.5,
        width = 0.3,
        heading = 88.68,
        debugPoly = false,
        minZ = 26.2,
        maxZ = 26.69,
        options = {
            {
                type = "client",
                event = "police:client:openFingerprint",
                icon = "fas fa-fingerprint",
                label = "Scan Fingerprint",
                job = "police",
            },
        },
        distance = 2.5
    },
	["lsclobbycomputer1"] = {
        name = "lsclobbycomputer1",
        coords = vector3(-348.25, -127.12, 38.99),
        length = 0.75,
        width = 0.4,
        heading = -20,
        debugPoly = false,
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
	["lsclobbycomputer2"] = {
        name = "lsclobbycomputer2",
        coords = vector3(-349.11, -129.29, 39.01),
        length = 0.75,
        width = 0.4,
        heading = -20,
        debugPoly = false,
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
		debugPoly = false,
		minZ = 36.01,
		maxZ = 39.89,
		options = {
			{
				type = "client",
				event = 'mechanic:client:openStash',
				icon = 'fas fa-box',
				label = 'Personal Locker',
				job = 'mechanic'
			}
		},
		distance = 1.5
	},
	['LSCOutfit'] = {
		name = 'LSCOutfit',
		coords = vector3(-309.51, -137.81, 39.01),
		length = 3.0,
		width = 1.90,
		heading = 338,
		debugPoly = false,
		minZ = 36.01,
		maxZ = 39.89,
		options = {
			{
				type = "client",
				event = 'qb-clothing:client:openOutfitMenu',
				icon = 'fas fa-shirt',
				label = 'Change Wardrobe',
				job = 'mechanic'
			}
		},
		distance = 1.5
	},
	['mechanicbossmenu'] = {
		name = 'mechanicbossmenu',
		coords = vector3(-305.03, -122.15, 39.01),
		length = 0.45,
		width = 0.59,
		heading = 25,
		debugPoly = false,
		minZ = 38.81,
		maxZ = 39.35,
		options = {
			{
				type = 'client',
				event = 'qb-bossmenu:client:openMenu',
				icon = 'fas fa-desktop',
				label = 'Access Boss Menu',
				job = 'mechanic'
			}
		}
	}
}

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetEntities = {

}

Config.TargetModels = {
	["drinkVending"] = {
        models =     {
            "prop_vend_soda_01",
            "prop_vend_soda_02",
            "prop_vend_water_01",
        },
        options = {
            {
                type = "client",
                event = 'vendingDrink:buy',
                icon = "fas fa-shopping-basket",
                label = "Insert Coin",
            },
        },
        distance = 2.5
    },
    ["vendingSnack"] = {
        models =     {
            "prop_vend_snak_01",
            "prop_vend_snak_01_tu",
        },
        options = {
            {
                type = "client",
                event = 'vendingSnack:buy',
                icon = "fas fa-shopping-basket",
                label = "Insert Coin",
            },
        },
        distance = 2.5
    },
    
    ["vendingCoffee"] = {
        models =     {
            "prop_vend_coffe_01",
            "apa_mp_h_acc_coffeemachine_01",
        },
        options = {
            {
                type = "client",
                event = 'vendingCoffee:buy',
                icon = "fas fa-shopping-basket",
                label = "Insert Coin",
            },
        },
        distance = 2.5
    },
	['watercooler'] = {
		models = {
			'prop_watercooler_dark',
			'prop_watercooler'
		},
		options = {
			{
				type = "server",
				event = 'targetevent:server:watercooler',
				icon = 'fas fa-water',
				label = "Grab a Water"
			}
		},
		distance = 2.5
	},
    ["ATM"] = {
        models = {
            "prop_atm_01", 
            "prop_atm_02", 
            "prop_atm_03", 
            "prop_fleeca_atm"},
        options = {
                            {
                type = "command",
                event = "atm",
                parameters = {},
                icon = "fab fa-cc-visa",
                label = "Use ATM"
            },
        },
        distance = 1.0
    },
    ["qb-slots"] = {
		models = {
			'ch_prop_casino_slot_01a',
			'ch_prop_casino_slot_02a',
			'ch_prop_casino_slot_03a',
			'ch_prop_casino_slot_04a',
			'ch_prop_casino_slot_04b',
			'ch_prop_casino_slot_05a',
			'ch_prop_casino_slot_06a',
			'ch_prop_casino_slot_07a',
			'ch_prop_casino_slot_08a',
			'vw_prop_casino_slot_01a',
			'vw_prop_casino_slot_02a',
			'vw_prop_casino_slot_03a',
			'vw_prop_casino_slot_04a',
			'vw_prop_casino_slot_05a',
			'vw_prop_casino_slot_06a',
			'vw_prop_casino_slot_07a',
			'vw_prop_casino_slot_08a',
		},
		options = {
			{
				type = "client",
				event = "qb-slots:enterBets",
				icon = "fa-solid fa-slot-machine",
				label = "Play Slot Machine",
			},
		},
		distance = 2.5,
	},
    ["boats"] = {
        models = {
            'tritoon',
        },
        options = {
            {
                type = "client",
                event = "qb-vehiclemenu:client:openextras",
                icon = "fas fa-anchor",
                label = "Toggle Extras",
            },
        },
        distance = 2.5,
    },
    ['hunting'] = {
        models = {
            'a_c_deer',
            'a_c_coyote',
            'a_c_boar'
        },
        options = {
            {
                type = 'client',
                event = 'qb-hunting:client:butcheranimal',
                icon = 'fas fa-gun',
                label = 'Butcher Animal'
            }
        }
    }
}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {
	options = {
		--[[{
			type = 'client',
			event = 'police:client:SetPlayerOutVehicle',
			icon = 'fas fa-chevron-circle-right',
			label = 'Remove From Vehicle',
		},]]
		{
			type = 'client',
			event = 'police:client:ImpoundVehicle',
			icon = 'fas fa-car',
			label = 'Impound Vehicle',
			job = 'police'
		},
        {
			type = 'client',
			event = 'qb-clothing:client:openOutfitMenu',
			icon = 'fas fa-car',
			label = 'Open clothing compartment',
			job = 'police'
		},
        {
			type = 'client',
			event = 'police:client:openStash',
			icon = 'fas fa-car',
			label = 'Open Safe',
			job = 'police'
		},
        {
			type = 'client',
			event = 'qb-tow:client:TowVehicle',
			icon = 'fas fa-car',
			label = 'Tow vehicle',
			job = 'mechanic12'
		},
		--[[{
			type = 'client',
			event = 'qb-trunk:client:GetIn',
			icon = 'fas fa-user-secret',
			label = 'Get In Trunk',
		},]]
		-- {
		--     type = 'client',
		--     event = 'vehicle:flipit',
		--     icon = 'fas fa-car',
		--     label = 'Flip Vehicle',
		--     canInteract = function()
		--         vehicle = QBCore.Functions.GetClosestVehicle()
		--         return not IsVehicleOnAllWheels(vehicle)
		--     end,
		-- },
	}
}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {
	options = {
		{
			type = 'client',
			event = 'qb-phone:client:GiveContactDetails',
			icon = 'fas fa-address-book',
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
    [2] = {
        model = 's_m_y_garbage',
        coords = vector4(-322.25, -1545.84, 31.02, 273.78),
        minusOne = true,
        freeze = true,
        invincible = true,
        target = {
            options = {
                {
                    type = "client",
                    event = "getGarbagePaySlip",
                    icon = "fas fa-money-bill-wave",
                    label = "Collect Paycheck"
                },
                {
                    type = "client",
                    event = "GarbageTruckSpawn",
                    icon = "fas fa-truck-fast",
                    label = "Spawn Garbage-Truck"
                },
            },
            distance = 2.5
        },
    },
    [3] = {
        model = 'a_m_m_farmer_01',
        coords = vector4(2029.65, 4980.63, 42.1, 226.36),
        minusOne = true,
        freeze = true,
        invincible = true,
        target = {
            options = {
                {
                    type = "client",
                    event = "hunting:buy",
                    icon = "fas fa-money-bill-wave",
                    label = "Open Shop"
                },
                {
                    type = "client",
                    event = "",
                    icon = "fas fa-truck-fast",
                    label = "Sell products"
                },
            },
            distance = 2.5
        },
    },
    [4] = {
        model = 's_m_m_paramedic_01',
        coords = vector4(242.39, -1377.46, 39.53, 313.54),
        minusOne = true,
        freeze = true,
        invincible = true,
        target = {
            options = {
                {
                    type = 'client',
                    event = 'qb-clothes:client:CreateFirstCharacter',
                    icon = 'fas fa-user-tie',
                    label = 'Plastic Surgery'
                },
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