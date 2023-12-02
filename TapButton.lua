local Remotes = game.ReplicatedStorage.Remotes
local plr = game.Players.LocalPlayer

script.Parent.MouseButton1Click:Connect(function()
	Remotes:FindFirstChild("OnTap"):FireServer(1 + plr.leaderstats.Rebirths.Value)
end)
