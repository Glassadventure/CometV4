workspace.CurrentCamera:Destroy()
task.wait(.1)
workspace.CurrentCamera.CameraType = Enum.CameraType.Attach
workspace.CurrentCamera.CameraSubject = workspace.CurrentRooms["100"].FigureSetup.FigureRagdoll.Head.FakeHead
game.Players.LocalPlayer.PlayerGui.MainUI.Enabled = false
