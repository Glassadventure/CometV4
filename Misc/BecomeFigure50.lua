workspace.CurrentCamera:Destroy()
task.wait(.1)
workspace.CurrentCamera.CameraType = Enum.CameraType.Attach
workspace.CurrentCamera.CameraSubject = workspace.CurrentRooms["50"].FigureSetup.FigureRagdoll.Head.FakeHead
game.Players.LocalPlayer.PlayerGui.MainUI.Enabled = false
