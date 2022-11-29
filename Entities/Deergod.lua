 local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
        -- Create entity
        local entity = Creator.createEntity({
        Model = "11393625763",
       Speed = 32,
       DelayTime = 0,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
           true,
           80,
          },
        Cycles = {
            Min = 1,
            Max = 1,
            WaitTime = 0.1,
    },
    CamShake = {
        true,
        {5, 15, 0.1, 1},
        10,
    },
	    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://11395251069", -- Image1 url
            Image2 = "rbxassetid://11395251069", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(48, 25, 52), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 1,
            },
        },
    },
    CustomDialog = {"You died to whom you call The Deer God","Closets Wont work! So try running","Its form is incomprehensible to a human upclose...","..-so avoid Eye Contact" }
})
          -----[[ Advanced ]]-----
          entity.Debug.OnEntitySpawned = function(entityModel)
              
          end
  
          entity.Debug.OnEntityDespawned = function(entityModel)
		  if getgenv().death == false then
              getgenv().Title = "Out of many Looks" --Title Here
              getgenv().Description = "WHY ARE YOU RUNNING?!?!" --Description Here
              getgenv().Reason = "Survive Dear God" --Reason Here
              getgenv().BadgeId = 2129182510 --Replace Number with Your Badge ID
              getgenv().Category = 10 --You can replace the Category or dont
  
              local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)
              local Achievements = debug.getupvalue(Unlock, 1)
              for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
                  v.Title = getgenv().Title
                  v.Desc = getgenv().Description
                  v.Reason = getgenv().Reason
                  v.BadgeId = getgenv().BadgeId
                  v.Category = getgenv().Category
              end
              Unlock(nil,"Join")
		  end
          end
  
          entity.Debug.OnEntityStartMoving = function(entityModel)
              
          end
  
          entity.Debug.OnEntityFinishedRebound = function(entityModel)
              
          end
  
          entity.Debug.OnDeath = function()
		  getgenv().death = true
              getgenv().Title = "Curiosity Killed The Cat" --Title Here
              getgenv().Description = "Should have ran." --Description Here
              getgenv().Reason = "Get Killed by Dear God" --Reason Here
              getgenv().BadgeId = 11395249153 --Replace Number with Your Badge ID
              getgenv().Category = 10 --You can replace the Category or dont
  
              local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)
              local Achievements = debug.getupvalue(Unlock, 1)
              for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
                  v.Title = getgenv().Title
                  v.Desc = getgenv().Description
                  v.Reason = getgenv().Reason
                  v.BadgeId = getgenv().BadgeId
                  v.Category = getgenv().Category
              end
              Unlock(nil,"Join")
          end
          ---------------------------
  
-- Run the created entity
Creator.runEntity(entity)
end
