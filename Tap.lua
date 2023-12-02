local plr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local remotes = game.ReplicatedStorage.Remotes

UIS.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed then
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			remotes.OnTap:FireServer(1 + plr.leaderstats.Rebirths.Value)
		end
	end
end)
