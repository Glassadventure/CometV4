local Players = game:GetService("Players")
local TS = game:GetService("TweenService")
local ReSt = game:GetService("ReplicatedStorage")
local PPS = game:GetService("ProximityPromptService")

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")

local SelfModules = {
    Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))(),
    DoorReplication = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Door%20Replication/Source.lua"))(),
    Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))(),
    CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))(),
}
local Assets = {
    KeyItem = LoadCustomInstance("https://github.com/lopvi/Doors/blob/main/Skele%20Key.rbxm?raw=true"),
}


local function replicateDoor(room)
    local originalDoor = room:FindFirstChild("Door")

    if originalDoor then
        local door = SelfModules.DoorReplication.CreateDoor({
            Locked = room:WaitForChild("Assets"):WaitForChild("KeyObtain", 0.3) ~= nil,
            Sign = true,
            Light = true,
            Barricaded = false,
            CustomKeyNames = {"Skele Key"},
            DestroyKey = false,
            GuidingLight = true,
            FastOpen = false,
        })

        door.Model.Name = "FakeDoor"
        door.Model:SetPrimaryPartCFrame(originalDoor.PrimaryPart.CFrame)
        door.Model.Parent = room
        SelfModules.DoorReplication.ReplicateDoor(door)
        originalDoor:Destroy()

end
end

-- Door replication setup

task.spawn(function()
    for _, v in next, workspace.CurrentRooms:GetChildren() do
        if v:FindFirstChild("Door") and v.Door:FindFirstChild("Lock") then
            replicateDoor(v)
        end
    end
    
    workspace.CurrentRooms.DescendantAdded:Connect(function(des)
        if des.Name == "Lock" and des.Parent.Name == "Door" then
            task.wait(0.3)

            if des.Parent then
                replicateDoor(des.Parent.Parent)
            end
        end
    end)
end)

-- Obtain cursed key

Assets.KeyItem.Parent = game.Players.LocalPlayer.Backpack
 firesignal(ReSt.Bricks.Caption.OnClientEvent, "You got Skeleton Key!", true)
