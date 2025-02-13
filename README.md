# LXR-Target ![Version](https://img.shields.io/badge/version-1.0.0-blue) ![Status](https://img.shields.io/badge/status-active-brightgreen) ![License](https://img.shields.io/github/license/LXRCore/lxr-target)

**LXR-Target** is a versatile targeting solution tailored for the **LXRCore** framework. It allows interaction with any predefined entity, model, entity type, or polyzone. When activated, it enables seamless replacement of markers and distance checking, focusing on an intuitive design to improve player experiences and optimize interaction.

## Credits

- Special thanks to [qtarget](https://github.com/overextended/qtarget) for rewriting and optimizing bt-target. This resource is largely a fork of their amazing work.
- Huge credit to [bt-target](https://github.com/brentN5/bt-target) from brentN5 for pioneering the target system concept!
- Thanks to [ms-peds](https://github.com/MiddleSkillz/ms-peds) for allowing the integration of their ped spawner into the target system!

## Dependency

- [PolyZone](https://github.com/mkafrin/PolyZone)

## Optional Dependency

- **LXRCore** (required for full functionality)

## Information

This repository originated as a fork but has now evolved into a standalone solution that builds upon the foundation of **qtarget** with several improvements for performance and functionality. Much of the code derives from **qtarget**, as their work has been instrumental in achieving the quality of this release.

Contributions via Pull Requests are encouraged! Feel free to suggest features or report issues; community engagement is greatly appreciated.

Templates and examples are continuously being improved. If you'd like new examples, don't hesitate to ask!

## Features

- Maintains compatibility with **bt-target** while offering enhanced utility and performance.
- Optimized raycasting function allows interaction with a broader range of entities.
- Define generic options for players, peds, vehicles, or objects.
- Trigger events, functions, or commands with custom data passing when interacting with a target.
- Define per-option or overall distances when interacting with a target.
- Ability to dynamically add or remove options without replacing existing ones.
- Supports advanced `canInteract` functionality, allowing for custom conditions to show or hide target options based on any triggers.
- Ped spawner included to spawn peds and assign target options all at once.

## Installation

1. Clone or download the repository and place it in your `lxr` directory.
2. Ensure **PolyZone** and **LXRCore** (if using) are installed and running.
3. Add the following to your `server.cfg`:

```bash
ensure lxr-core
ensure lxr-target
```

---

## Examples

The config is in the init.lua file.

### All the exports must be on the client-side to work!

### 1. AddBoxZone / Job Check

This example sets up a `BoxZone` around an object and checks for a specific job to allow interaction. The zone is defined with a vector position, size, and heading. The interaction is restricted to police officers.

#### Example using **exports**:

```lua
exports['lxr-target']:AddBoxZone("MissionRowDutyClipboard", vector3(441.7989, -982.0529, 30.67834), 0.45, 0.35, {
	name = "MissionRowDutyClipboard", heading = 11.0, debugPoly = false, minZ = 30.77834, maxZ = 30.87834
}, {
	options = {
		{ type = "client", event = "lxr-policejob:ToggleDuty", icon = "fas fa-sign-in-alt", label = "Sign In", job = "police" }
	},
	distance = 2.5
})
```

#### Example using **horizontal config**:

```lua
Config.BoxZones = {
	["MissionRowDutyClipboard"] = { name = "MissionRowDutyClipboard", coords = vector3(441.7989, -982.0529, 30.67834), length = 0.45, width = 0.35, heading = 11.0, debugPoly = false, minZ = 30.77834, maxZ = 30.87834,
		options = {
			{ type = "client", event = "lxr-policejob:ToggleDuty", icon = "fas fa-sign-in-alt", label = "Sign In", job = "police" }
		},
		distance = 2.5
	}
}
```

---

### 2. AddTargetModel / Item / canInteract()

This example demonstrates interaction with a specific ped model, where interactions are restricted by job and item possession.

#### Example using **exports**:

```lua
exports['lxr-target']:AddTargetModel({"g_m_importexport_0", "g_m_m_armboss_01"}, {
	options = {
		{ event = "request:CuffPed", icon = "fas fa-hands", label = "Cuff / Uncuff", item = 'handcuffs', job = "police" },
		{ event = "Rob:Ped", icon = "fas fa-sack-dollar", label = "Rob", canInteract = function(entity) return not IsPedAPlayer(entity) and IsEntityDead(entity) end }
	},
	distance = 2.5
})
```

#### Example using **horizontal config**:

```lua
Config.TargetModels = {
	["targetmodel1"] = { models = {"g_m_importexport_0", "g_m_m_armboss_01"}, 
		options = {
			{ type = "client", event = "request:CuffPed", icon = "fas fa-hands", label = "Cuff / Uncuff", item = 'handcuffs', job = "police" },
			{ type = "client", event = "Rob:Ped", icon = "fas fa-sack-dollar", label = "Rob", canInteract = function(entity) return not IsPedAPlayer(entity) and IsEntityDead(entity) end }
		},
		distance = 2.5
	}
}
```

---

### 3. Add Target Entity

This example shows how to apply a target to a specific entity, allowing players to interact with that entity, such as retrieving packages from a vehicle.

#### Example using **exports**:

```lua
exports['lxr-target']:AddTargetEntity('mule2', {
	options = {
		{ type = "client", event = "postop:getPackage", icon = "fas fa-box-circle-check", label = "Get Package", job = "postop" }
	},
	distance = 3.0
})
```

#### Example using **horizontal config**:

```lua
Config.TargetEntities = {
	["entity1"] = { entity = 'mule2', 
		options = {
			{ type = "client", event = "postop:getPackage", icon = "fas fa-box-circle-check", label = "Get Package", job = "postop" }
		},
		distance = 3.0
	}
}
```

---

### 4. Passing Item Data

This example shows how to pass data (like item prices) through the target interaction. The code sets up a coffee machine interaction where the player can purchase a coffee.

#### Example using **exports**:

```lua
exports['lxr-target']:AddTargetModel(690372739, {
	options = {
		{ type = "client", event = "coffee:buy", icon = "fas fa-coffee", label = "Coffee", price = 5 }
	},
	distance = 2.5
})

RegisterNetEvent('coffee:buy', function(data)
	exports['lxr-core']:Notify("You purchased a " .. data.label .. " for $" .. data.price .. ". Enjoy!", 'success')
end)
```

#### Example using **horizontal config**:

```lua
Config.TargetModels = {
	["buyCoffee"] = { models = 690372739,
		options = {
			{ type = "client", event = "coffee:buy", icon = "fas fa-coffee", label = "Coffee", price = 5 }
		},
		distance = 2.5
	}
}
```

---

### 5. Dynamic Target Creation

This example demonstrates how to dynamically create a target for an entity in an event. The example shows planting a potato and setting a target interaction for harvesting the plant.

#### Example using **exports**:

```lua
AddEventHandler('plantpotato', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	model = `prop_plant_fern_02a`
	RequestModel(model)
	while not HasModelLoaded(model) do Wait(0) end
	local plant = CreateObject(model, coords.x, coords.y, coords.z, true, true)
	PlaceObjectOnGroundProperly(plant)
	SetEntityInvincible(plant, true)

	exports['lxr-target']:AddEntityZone("potato-growing-" .. plant, plant, { name = "potato-growing-" .. plant, heading = GetEntityHeading(plant), debugPoly = false },
		{ options = { { type = "client", event = "farming:harvestPlant", icon = "fa-solid fa-scythe", label = "Harvest Potato", plant = plant, job = "farmer", canInteract = function(entity) return Entity(entity).state.growth >= 100 end } },
		distance = 2.

5
	})
end)
```

---

## License

This project is licensed under the MIT License.

---

Feel free to integrate **LXR-Target** into your RedM server and enjoy enhanced targeting interactions!

