local remotes = game.ReplicatedStorage.Remotes
local debounce = false

remotes.OnTap.OnServerEvent:Connect(function(plr, amount)
	if debounce == false then
		debounce = true
		plr.leaderstats.Clicks.Value += amount	
		task.wait(0.5)
		debounce = false
	end
end)
