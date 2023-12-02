local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("video")

function playerAdded(plr)
	local leaderstats = Instance.new("Folder", plr)
	leaderstats.Name = "leaderstats"

	local clicks = Instance.new("NumberValue", leaderstats)
	clicks.Name = "Clicks"
	clicks.Value = 0

	local gems = Instance.new("NumberValue", leaderstats)
	gems.Name = "Gems"
	gems.Value = 0

	local rebirths = Instance.new("NumberValue", leaderstats)
	rebirths.Name = "Rebirths"
	rebirths.Value = 0

	local plrId = "Player__"..plr.UserId

	local data
	local success, errormessage = pcall(function()
		data = DataStore:GetAsync(plrId)
	end)
	if success then
		print("data loaded")
		if data then
			clicks.Value = data.clicks
			gems.Value = data.gems
			rebirths.Value = data.rebirths
		end
	else
		error("data NOT loaded")
	end
end

function playerLeaving(plr)
	local plrId = "Player__"..plr.UserId

	local data = {
		clicks = plr.leaderstats.Clicks.Value;
		gems = plr.leaderstats.Gems.Value;
		rebirths = plr.leaderstats.Rebirths.Value;
	}

	local success, errormessage = pcall(function()
		data = DataStore:SetAsync(plrId, data)
	end)
	
	if success then
		print("data saved")
	else
		error("Data not saved!")
	end
end

game.Players.PlayerAdded:Connect(playerAdded)
game.Players.PlayerRemoving:Connect(playerLeaving)

game:BindToClose(function()
	if game["Run Service"]:IsStudio() then
		task.wait(2)
	else
		local Players = game.Players:GetPlayers()
		local PlayersLeft = #Players
		
		for i, plr in ipairs(Players) do
			coroutine.wrap(function()
				playerLeaving(plr)
				PlayersLeft -= 1
			end)
		end
	end
end)
