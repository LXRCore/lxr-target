# LXR-Target

**LXR-Target** is a powerful and optimized targeting solution for RedM, designed to enhance player interaction with entities, models, and zones. This resource allows you to streamline interactions through intuitive targeting mechanics, with full customization options.

## Features

- Compatible with bt-target and qb-target setups.
- Optimized raycasting for better interaction with various entities.
- Define interaction zones, models, and entities with flexible distance checks and restrictions.
- Advanced targeting conditions like job, gang, items, or custom functions (`canInteract`).
- Supports both event-based and function-based interactions.
- Works with both LXR-Core and QBCore.

## Dependencies

- [PolyZone](https://github.com/mkafrin/PolyZone) – Required for handling zones.
- [LXR-Core](https://github.com/LXRCore/LXR-Core) – Core framework required for this resource.

---

## Configuration Examples

### **1. AddBoxZone / Job Check**

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

### **2. AddTargetModel / Item / canInteract()**

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

### **3. Add Target Entity**

This example showcases how to apply a target to a specific entity, allowing players to interact with that entity, such as retrieving packages from a vehicle.

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

### **4. Passing Item Data**

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

### **5. Dynamic Target Creation**

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
		distance = 2.5
	})
end)
```

---

This example provides a full range of targeting options with easy-to-read, horizontally formatted configuration settings. The flexibility allows for both predefined and dynamically created target zones and entities, making it perfect for immersive gameplay.

---
