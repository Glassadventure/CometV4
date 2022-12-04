 rmEntitiesConTwo=workspace.CurrentRooms.ChildAdded:Connect(function(c)
                if c:WaitForChild"Base" then
                    task.spawn(function()
                        local p=Instance.new("ParticleEmitter", c.Base)
                        p.Brightness=500
                        p.Color=ColorSequence.new(Color3.fromRGB(0,80,255))
                        p.LightEmission=10000
                        p.LightInfluence=0
                        p.Orientation=Enum.ParticleOrientation.FacingCamera
                        p.Size=NumberSequence.new(0.2)
                        p.Squash=NumberSequence.new(0)
                        p.Texture="rbxassetid://2581223252"
                        p.Transparency=NumberSequence.new(0)
                        p.ZOffset=0
                        p.EmissionDirection=Enum.NormalId.Top
                        p.Lifetime=NumberRange.new(2.5)
                        p.Rate=500
                        p.Rotation=NumberRange.new(0)
                        p.RotSpeed=NumberRange.new(0)
                        p.Speed=10
                        p.SpreadAngle=Vector2.new(0,0)
                        p.Shape=Enum.ParticleEmitterShape.Box
                        p.ShapeInOut=Enum.ParticleEmitterShapeInOut.Outward
                        p.ShapeStyle=Enum.ParticleEmitterShapeStyle.Volume
                        p.Drag=0
                    end)
                end
            end)
            rmEntitiesCon=workspace.ChildAdded:Connect(function(c)
                if c.Name=="Lookman" then
                    repeat task.wait() until c.Core.Attachment.Eyes.Enabled==true
                    task.wait(.02)
                    local door=workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:WaitForChild"Door"
                    local lp=game.Players.LocalPlayer
                    local char=lp.Character
                    local pos=char.PrimaryPart.CFrame
                    char:PivotTo(door.Hidden.CFrame)
                    if door:FindFirstChild"ClientOpen" then door.ClientOpen:FireServer() end
                    task.wait(.2)
                    local HasKey = false
                    for i,v in ipairs(door.Parent:GetDescendants()) do
                        if v.Name == "KeyObtain" then
                            HasKey = v
                        end
                    end
                    if HasKey then
                        game.Players.LocalPlayer.Character:PivotTo(CFrame.new(HasKey.Hitbox.Position))
                        wait(0.3)
                        fireproximityprompt(HasKey.ModulePrompt,0)
                        game.Players.LocalPlayer.Character:PivotTo(CFrame.new(door.Door.Position))
                        wait(0.3)
                        fireproximityprompt(door.Lock.UnlockPrompt,0)
                        return
                    end
                    char:PivotTo(pos)
                end
            end)
            local val=game.ReplicatedStorage.GameData.ChaseStart
            local savedVal=val.Value
            task.spawn(function()
                repeat
                    if not game:GetService"Players":GetPlayers()[2] then
                        repeat task.wait() until val.Value~=savedVal
                        savedVal=val.Value
                        repeat task.wait() until workspace.CurrentRooms:FindFirstChild(tostring(val.Value))
                        local room=workspace.CurrentRooms[tostring(val.Value-1)]
                        local thing=loadstring(game:HttpGet"https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Door%20Replication/Source.lua")()
                        local newdoor=thing.CreateDoor({CustomKeyNames={"SkellyKey"}, Sign=true, Light=true, Locked=(room.Door:FindFirstChild"Lock" and true or false)})
                        newdoor.Model.Parent=workspace
                        newdoor.Model:PivotTo(room.Door.Door.CFrame)
                        newdoor.Model.Parent=room
                        room.Door:Destroy()
                        thing.ReplicateDoor({Model=newdoor.Model, Config={}, Debug={OnDoorPreOpened=function() end}})
                        return
                    else
                        repeat task.wait() until val.Value~=savedVal
                        savedVal=val.Value
                        repeat task.wait() until workspace.CurrentRooms:FindFirstChild(tostring(val.Value)) and workspace.CurrentRooms:FindFirstChild(tostring(val.Value-2)).Door.Light.Attachment.PointLight.Enabled==true
                        xpcall(function()
                            if removeEntities==true and game.ReplicatedStorage.GameData.ChaseEnd.Value-val.Value<3 and game.ReplicatedStorage.GameData.ChaseStart.Value~=50 then
                                local lp=game.Players.LocalPlayer
                                local char=lp.Character
                                local pos=char.PrimaryPart.CFrame
                                local door=workspace.CurrentRooms[tostring(val.Value)]:WaitForChild("Door")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
        
                                local HasKey = false
                                for i,v in ipairs(door.Parent:GetDescendants()) do
                                    if v.Name == "KeyObtain" then
                                        HasKey = v
                                    end
                                end
                                if HasKey then
                                    game.Players.LocalPlayer.Character:PivotTo(CFrame.new(HasKey.Hitbox.Position))
                                    wait(0.3)
                                    fireproximityprompt(HasKey.ModulePrompt,0)
                                    game.Players.LocalPlayer.Character:PivotTo(CFrame.new(door.Door.Position))
                                    wait(0.3)
                                    fireproximityprompt(door.Lock.UnlockPrompt,0)
                                    return
                                end

                                char:PivotTo(door.Hidden.CFrame)
                                if door:FindFirstChild"ClientOpen" then door.ClientOpen:FireServer() end
                                task.wait(.2)
                                char:PivotTo(pos)
                            end
                        end, function(...) print(...) end)
                    end
                until removeEntities==false
            end)
            if not game:GetService"Players":GetPlayers()[2] and removeEntities==true then
                repeat task.wait() until workspace.CurrentRooms:FindFirstChild(tostring(savedVal))
                local room=workspace.CurrentRooms[tostring(savedVal)]
                local thing=loadstring(game:HttpGet"https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Door%20Replication/Source.lua")()
                local newdoor=thing.CreateDoor({CustomKeyNames={"SkellyKey"}, Sign=true, Light=true})
                newdoor.Model.Parent=workspace
                newdoor.Model:PivotTo(room.Door.Door.CFrame)
                newdoor.Model.Parent=room
                room.Door:Destroy()
                thing.ReplicateDoor({Model=newdoor.Model, Config={}, Debug={OnDoorPreOpened=function() end}})
            else
                repeat task.wait() until workspace.CurrentRooms:FindFirstChild(tostring(savedVal)) and workspace.CurrentRooms:FindFirstChild(tostring(savedVal-2)).Door.Light.Attachment.PointLight.Enabled==true
                if removeEntities==true then
                    local lp=game.Players.LocalPlayer
                    local char=lp.Character
                    local pos=char.PrimaryPart.CFrame
                    local door=workspace.CurrentRooms[tostring(savedVal)]:WaitForChild("Door")
        
                    local HasKey = false
                    for i,v in ipairs(door.Parent:GetDescendants()) do
                        if v.Name == "KeyObtain" then
                            HasKey = v
                        end
                    end
                    if HasKey then
                        game.Players.LocalPlayer.Character:PivotTo(CFrame.new(HasKey.Hitbox.Position))
                        wait(0.3)
                        fireproximityprompt(HasKey.ModulePrompt,0)
                        game.Players.LocalPlayer.Character:PivotTo(CFrame.new(door.Door.Position))
                        wait(0.3)
                        fireproximityprompt(door.Lock.UnlockPrompt,0)
                        return
                    else 

                    char:PivotTo(door.Hidden.CFrame)
                    if door:FindFirstChild"ClientOpen" then door.ClientOpen:FireServer() end
                    task.wait(.2)
                    char:PivotTo(pos) end
                end
            end
