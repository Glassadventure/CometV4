local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
