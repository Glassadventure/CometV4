local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
			local entityTable = Spawner.createEntity({
   				 CustomName = "Him", -- Custom name of your entity
   				 Model = "https://github.com/ChronoAccelerator/CometV4/blob/main/Models/Him.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    				Speed = 350, -- Percentage, 100 = default Rush speed
    				DelayTime = 3, -- Time before starting cycles (seconds)
    				HeightOffset = 0,
					CanKill = true,
					KillRange = 150,
					BackwardsMovement = false,
					BreakLights = false,
					FlickerLights = {
						false, -- Enabled/Disabled
						1, -- Time (seconds)
					},
					Cycles = {
						Min = 5,
						Max = 10,
						WaitTime = 1,
					},
					CamShake = {
						false, -- Enabled/Disabled
						{3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
						100, -- Shake start distance (from Entity to you)
					},
					Jumpscare = {
						true, -- Enabled/Disabled
						{
							Image1 = "rbxassetid://10601028487", -- Image1 url
							Image2 = "rbxassetid://10657365540", -- Image2 url
							Shake = true,
							Sound1 = {
								2663254285, -- SoundId
								{ Volume = 1}, -- Sound properties
							},
							Sound2 = {
								7837535984, -- SoundId
								{ Volume = 2 }, -- Sound properties
							},
							Flashing = {
								false, -- Enabled/Disabled
								Color3.fromRGB(255, 255, 255), -- Color
							},
							Tease = {
								true, -- Enabled/Disabled
								Min = 15,
								Max = 15,
							},
						},
					},
					CustomDialog = {"!!!!!!!!!!!!!!!!!!!!!"}, -- Custom death message
				})

				entityTable.Debug.OnEntitySpawned = function()
					Scream = Instance.new("Sound")
					Scream.Parent = workspace
					Scream.Name = "Him"
					Scream.Looped = false
					Scream.Volume = 1
					Scream.SoundId = "rbxassetid://9125713501"
					Scream:Play()
					--AmbienceBecauseYes
					Scare = Instance.new("Sound")
					Scare.Parent = workspace
					Scare.Name = "It"
					Scare.Looped = true
					Scare.Volume = 1
					Scare.SoundId = "rbxassetid://1837403780"
					Scare.PlayOnRemove = true
					Scare.RollOffMode = "Linear"
					Scare.RollOffMaxDistance = 36
					Scare.RollOffMinDistance = 2
					Scare.PlaybackSpeed = 0.198
					Scare.TimePosition = 48.607
					--Equalizer
					Eq = Instance.new("EqualizerSoundEffect")
					Eq.Parent = workspace.It
					Eq.LowGain = -80
					Eq.Enabled = true
					Eq.Name = "Equalizer"
					--Reverb
					Rb = Instance.new("ReverbSoundEffect")
					Rb.Parent = workspace.It
					Rb.DecayTime = 2.687
					Rb.Density = 1
					Rb.Diffusion = 1
					Rb.DryLevel = -80
					Rb.Enabled = true
					Rb.Name = "Reverb"
					wait(0.3)
					Scare:Play()
				end

				entityTable.Debug.OnEntityDespawned = function()
					Scream.Name = "Despawn"
					Scream.SoundId = "rbxassetid://7076365332"
					Scream.Volume = 1
					Scream:Play()
					--End Scare
					Scare:Destroy()
				end

				entityTable.Debug.OnEntityStartMoving = function()
					print("Entity has started moving:", entityTable)
				end

				entityTable.Debug.OnEntityFinishedRebound = function()
					print("Entity has finished rebound:", entityTable)
				end

				entityTable.Debug.OnEntityEnteredRoom = function(room)
					print("Entity:", entityTable, "has entered room:", room)
				end

				entityTable.Debug.OnLookAtEntity = function()
					game.Players.LocalPlayer.Character.Humanoid.Health = -100
				end

				entityTable.Debug.OnDeath = function()
					print("Come back, id like to see you again...")
				end
				------------------------------------


				-- Run the created entity
				Spawner.runEntity(entityTable)
