local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local currencyStore = DataStoreService:GetDataStore("PlayerCoins_v1")
local STARTING_COINS = 100
local MAX_COINS = 2_000_000_000

local function getKey(player)
	return "player_" .. player.UserId
end

local function clampCoins(value)
	value = tonumber(value) or STARTING_COINS
	return math.clamp(math.floor(value), 0, MAX_COINS)
end

local function createLeaderstats(player, amount)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = clampCoins(amount)
	coins.Parent = leaderstats
end

local function loadPlayer(player)
	local success, savedValue = pcall(function()
		return currencyStore:GetAsync(getKey(player))
	end)

	if not success then
		warn("Could not load coins for " .. player.Name .. ": " .. tostring(savedValue))
		savedValue = STARTING_COINS
	end

	createLeaderstats(player, savedValue)
end

local function savePlayer(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	local coins = leaderstats and leaderstats:FindFirstChild("Coins")
	if not coins then
		return
	end

	local amount = clampCoins(coins.Value)
	local success, errorMessage = pcall(function()
		currencyStore:UpdateAsync(getKey(player), function()
			return amount
		end)
	end)

	if not success then
		warn("Could not save coins for " .. player.Name .. ": " .. tostring(errorMessage))
	end
end

Players.PlayerAdded:Connect(loadPlayer)
Players.PlayerRemoving:Connect(savePlayer)

game:BindToClose(function()
	local players = Players:GetPlayers()
	local finished = 0

	for _, player in ipairs(players) do
		task.spawn(function()
			savePlayer(player)
			finished += 1
		end)
	end

	local deadline = os.clock() + 10
	while finished < #players and os.clock() < deadline do
		task.wait()
	end
end)
