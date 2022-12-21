--game:GetService("ReplicatedStorage").Bricks.PlayAgain:FireServer()
















--Charred Room
local Entry = true
local Exit = false
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
local TweenService = game:GetService("TweenService")
local Chatting = false
local Events = false
local Looted = false
local Generate = true
local Lights = true

function MakeDoor(Point)
	local Model = game:GetObjects("rbxassetid://11855600082")[1]
	Model.Parent = Point.Parent
	Model:SetPrimaryPartCFrame(Point.CFrame * CFrame.new(0, 0, .5))
	local Prompt = Model.Knob.PromptAtt.DoorOpen
	local Loaded = false
	local function Open()
		Prompt.Enabled = false



		task.spawn(function()
			Loaded = true
			local knobC1 = Model.Hinge.Knob.C1

			for _,v in pairs(Model.Skull:GetChildren()) do
				if string.match(v.Name,"Eye") then
					game:GetService("TweenService"):Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						Color = Color3.fromRGB(91, 163, 71),
					}):Play()
				end
			end

			game:GetService("TweenService"):Create(Model.Hinge.Knob, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {C1 = knobC1 * CFrame.Angles(0, 0, math.rad(-35))}):Play()
			task.wait(.15)
			Model.Door.CanCollide = false
			Model.Door.Open:Play()
			Model.Hidden:Destroy()

			for _,v in pairs(Model.Skull:GetChildren()) do
				if string.match(v.Name,"Eye") then
					game:GetService("TweenService"):Create(v, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						Color = Color3.fromRGB(0, 0, 0),
					}):Play()
				end
			end

			game:GetService("TweenService"):Create(Model.Hinge.Knob, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {C1 = knobC1}):Play()

			game:GetService("TweenService"):Create(Model.Hinge, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = Model.Hinge.CFrame * CFrame.Angles(0, math.rad(-90), 0)}):Play()
		end)



	end
	Prompt.Triggered:Connect(Open)
	repeat wait(.1) until Loaded == true
	local Room = game:GetObjects("rbxassetid://11865663338")[1]
	Room.Parent = workspace.CurrentRooms
	Room.Name = "CharredRoom"
	Room:SetPrimaryPartCFrame(Point.CFrame)

	Prompt.Triggered:Connect(Open)
	print("The Charred has spawned.")

	wait(2)

	workspace.CurrentRooms.CharredRoom.Charred.CollisionPrompt.Touched:Connect(function(touch)
		if touch.Parent:FindFirstChildOfClass("Humanoid") and Entry == true then
			wait(2)
			Ambience = Instance.new("Sound")
				Ambience.Looped = true
				Ambience.Volume = 0.1
				Ambience.Parent = workspace.CurrentRooms.CharredRoom
				Ambience.Name = "CharredAmbience"
				Ambience.SoundId = "rbxassetid://9112775175"
				Ambience.Playing = true
				Chatting = true
				firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Something doesn't feel right...")
				wait(3)
				firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Its so dusty, like a fire broke out..")
				wait(3)
				firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Maybe I should scavenge and see what I can find..")
				Entry = false
			else
				print("Left room")
		end
	end)

	workspace.CurrentRooms.CharredRoom.Charred.RoomStart.Touched:Connect(function(touch)
		if touch.Parent:FindFirstChildOfClass("Humanoid") and Exit == false then
				workspace.CurrentRooms.CharredRoom.CharredAmbience:Destroy()
				firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Why is it so dark?")
					game.Lighting.Caves.Enabled = true
					game.Lighting.Bloom.Enabled = true
					game.Lighting.FogEnd = "100"
					game.Lighting.FogStart = "25"
				wait(5)
				Exit = true
				firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "breakLights", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 0.416, 60)
				wait(5)
				firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "...")
				Events = true
				Generate = false
			else
				wait(5)
				if Chatting then return end
				firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Why do I want to return?")
		end
	end)

	Room.Charred.Floor_Painting.InteractPrompt.Triggered:Connect(function()
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "It emits a strange sound...")
			Whispers = Instance.new("Sound")
				Whispers.Parent = Room.Charred
				Whispers.Name = "DemonicSounds"	
				Whispers.SoundId = "rbxassetid://313948389"
				Whispers.Volume = 0.5
				Whispers.Playing = true
			wait(5)
		Whispers.Playing = false
	end)

	Room.Charred.Painting_Small1.InteractPrompt.Triggered:Connect(function()
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Its a dusty painting.")
	end)

	Room.Charred.Painting_Small2.InteractPrompt.Triggered:Connect(function()
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Its a dusty painting.")
	end)

	Room.Charred.Painting_VeryBig.InteractPrompt.Triggered:Connect(function()
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Its a dusty painting.")
	end)

	Room.Charred.Bookcase1.Prompt.Triggered:Connect(function()
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Its burnt.")
	end)

	Room.Charred.UntouchedCrate.Prompt.Triggered:Connect(function()
		if Looted then return end
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "You search the uncharred box, you find nothing in value but a candle.")
		wait(2)
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "You pick it up and it bursts in blue flame..")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/CometV4/main/Items/Candle.lua",true))()
		wait(2)
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "You feel safer with this candle.")

	end)


	Room.Charred.Note.Prompt.Triggered:Connect(function()
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "You read the note... It says...")
		wait(3)
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "If you are reading this I do not endorse leaving this room.")
		wait(3)
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "You're cursed and its the truth, heck if you do leave..")
		wait(3)
		firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "God help you if the lights break.")
		wait(2)
			Lightsound = Instance.new("Sound")
			Lightsound.Name = "Buzz"
			Lightsound.Parent = workspace.CurrentRooms.CharredRoom
			Lightsound.Volume = 1
			Lightsound.SoundId = "rbxassetid://4288784832"
			Lightsound.Playing = true
			Lightsound.Looped = false
			firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "... what was that?")
			wait(3)
			Lightsound:Destroy()
		end)

end


function ReturnLatestRoom()
	return workspace.CurrentRooms:FindFirstChild(game.ReplicatedStorage.GameData.LatestRoom.Value)
end

function FixRoomPoint(Point)
	if Point:IsA("BasePart") then
		Point.Size = Vector3.new(5, 8, 0.5)
		Point.Orientation += Vector3.new(0,180,0)
		Point.CFrame *= CFrame.new(0,0,-1)
		Point.Name = "RoomPoint"

		return Point
	end
end

function GenerateTheSkeletonAppears(Point)
	GetNearestPlankedDoor(Point.Parent.Parent,Point)
	MakeDoor(Point)
end

function GetNearestPlankedDoor(Room,Point)
	for _,v in pairs(Room:GetDescendants()) do
		if v.Name == "FakeDoor_Hotel" then
			local dist = (Point.Position - v.FakeDoor.Position).Magnitude

			if dist < 5 then
				for _,z in pairs(v:GetDescendants()) do
					if z:IsA("BasePart") then
						z.Transparency = 1
						z.CanCollide = false
					end
				end
			end

		end
	end

end


function CheckRoom(Room)
	if Room:FindFirstChild("RandomDoor") and Generate == true then
		local Doors = Room:FindFirstChild("RandomDoor"):GetChildren()

		if #Doors > 1 then
			local ChosenPoint = Doors[1]
			local NewPoint = FixRoomPoint(ChosenPoint)
			GenerateTheSkeletonAppears(NewPoint)
		else
			local NewPoint = FixRoomPoint(Doors[1])
			GenerateTheSkeletonAppears(NewPoint)
		end

	end
end

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
task.wait(.1)
CheckRoom(ReturnLatestRoom())
end)

function BreakLights()
	local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
	firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "breakLights", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 0.416, 60)
end

while true do
    wait(1)
	if Events == true then
		wait(89)
		Screamteaser = Instance.new("Sound")
		Screamteaser.SoundId = "rbxassetid://9125712561"
		Screamteaser.Parent = workspace.CurrentRooms
		Screamteaser.Name = "Entity_Teaser"
		Screamteaser.Looped = false
		Screamteaser.Volume = 0.5
		Screamteaser.PlayOnRemove = true
		Screamteaser.Playing = true
		wait(5)
		Heartbeat = Instance.new("Sound")
		Heartbeat.SoundId = "rbxassetid://176554627"
		Heartbeat.Parent = workspace.CurrentRooms
		Heartbeat.Name = "Horror_Heartbeat"
		Heartbeat.Looped = true
		Heartbeat.Volume = 0.2
		Heartbeat.Playing = true
		wait(0.1)
		game.Lighting.FogEnd = "35"
		game.Lighting.FogStart = "10"
		wait(1)
			firesignal(game.ReplicatedStorage.Bricks.Caption.OnClientEvent, "Something is following you.")
		wait(30)
		Lights = true
		wait(50)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/CometV4/main/Misc/Events.lua",true))()
		wait(1)

		while true do
			if Lights == false then
			wait(1)
			BreakLights()
		 end
		end

		wait(60)
		
		Events = false
	end
end
