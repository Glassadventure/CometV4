local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
 
-- Create entity
local entity = Creator.createEntity({
    CustomName = "Smiler", -- Custom name of your entity
    Model = "https://github.com/PABMAXICHAC/doors-monsters-models/blob/main/Smiler.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 850, -- Percentage, 100 = default Rush speed
    DelayTime = 12, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        10, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 20,
        WaitTime = 0,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://11417375410", -- Image1 url
            Image2 = "rbxassetid://11417375410", -- Image2 url
            Shake = true,
            Sound1 = {
                5263560566, -- SoundId
                { Volume = 2.1 }, -- Sound properties
            },
            Sound2 = {
                5263560566, -- SoundId
                { Volume = 2.1 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(255, 0, 0), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"¡¡ I REMEMBER THAT SMILE !!", "It seems like u got access to an entity that isn't released yet.", "Please report to LSplash#1234 and Redibles#7070 if this happens again."}, -- Custom death message (can be as long as you want)
})
 
-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end
 
entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", entityModel)
end
 
entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started smiling:", entityModel)
end
 
entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished smiling:", entityModel)
end
 
entity.Debug.OnDeath = function()
    warn("smile more")
end
------------------------
 
-- Run the created entity
Creator.runEntity(entity)
