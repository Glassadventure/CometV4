
-- Services

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local RightArm = Char:WaitForChild("RightUpperArm")
local LeftArm = Char:WaitForChild("LeftUpperArm")
local RightHand = Char:WaitForChild("RightHand")
local Mouse = Plr:GetMouse()

local RightC1 = RightArm.RightShoulder.C1
local LeftC1 = LeftArm.LeftShoulder.C1

local SelfModules = {
    Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))(),
    CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))(),
}
local ModuleScripts = {
    MainGame = require(Plr.PlayerGui.MainUI.Initiator.Main_Game),
}

-- Functions

-- Scripts

local Gun = LoadCustomInstance("https://github.com/watheck1/m249/blob/main/M249.rbxm?raw=true")

if typeof(Gun) == "Instance" and Gun.ClassName == "Tool" then
    Gun.Equipped:Connect(function()
        RightArm.Name = "R_Arm"
        LeftArm.Name = "L_Arm"
        
        local rightGrip = RightHand:WaitForChild("RightGrip")
    
        RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-35), 0)
        LeftArm.LeftShoulder.C1 = LeftC1 * CFrame.new(1, 1, 0) * CFrame.Angles(math.rad(-80), math.rad(35), 0)
        rightGrip.C1 = rightGrip.C1 * CFrame.Angles(0, math.rad(35), 0)
    end)
    
    Gun.Unequipped:Connect(function()
        RightArm.Name = "RightUpperArm"
        LeftArm.Name = "LeftUpperArm"
    
        RightArm.RightShoulder.C1 = RightC1
        LeftArm.LeftShoulder.C1 = LeftC1
    end)
    
    Gun.Activated:Connect(function()
        while UIS.IsMouseButtonPressed(UIS, Enum.UserInputType.MouseButton1) and Char.FindFirstChild(Char, Gun.Name) and Hum.Health > 0 do
            -- Sound
            
            local sound = Gun.Shoot:Clone()
            sound.PlayOnRemove = true
            sound.Parent = workspace
            sound:Destroy()
    
            -- Shoot visual
    
            Gun.Barrel.Attachment.Particles:Emit(1)
    
            -- Cam shake
    
            ModuleScripts.MainGame.camShaker:ShakeOnce(20, 10, 0.05, 0.05)
    
            -- Bullet ray
    
            local bulletRay = Ray.new(Gun.Barrel.Position, (Mouse.Hit.Position - Gun.Barrel.Position).Unit * 100)
            local found = workspace:FindPartOnRayWithIgnoreList(bulletRay, {Char})
    
            if found then
                local entity = nil
    
                for _, v in next, workspace:GetChildren() do
                    if v.GetAttribute(v, "IsCustomEntity") and found.IsDescendantOf(found, v) then
                        entity = v
    
                        break
                    end
                end
    
                if entity then
                    local health = entity:GetAttribute("Health") or 1
                    health = 1
                    
                    entity:SetAttribute("Health", health)
    
                    if health == 0 then
                        entity:Destroy()
                    end
                end
            end
    
            task.wait(0.1)
        end
    end)

    -- Create shop item

    SelfModules.CustomShop.CreateItem(Gun, {
        Title = "M249",
        Desc = "Don't shoot your friends!",
        Image = "rbxassetid://10889297548",
        Price = 0,
        Stack = 1,
    })

    print("M249 script by RegularVynixu#8039")
end
