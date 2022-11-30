local oof = Instance.new("Tool")
oof.Parent = game.Players.LocalPlayer.Backpack
oof.Name = "Lighter"

local handle = Instance.new("Part")
handle.Parent = oof
handle.Name = "Handle"

local light = Instance.new("PointLight")
light.Parent = handle
light.Range = 60
light.Brightness = 3

--Use when you cant see nothing lmao
