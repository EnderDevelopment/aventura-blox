local Players = game:GetService("Players")

local REWARD_AMOUNT = 25
local REWARD_INTERVAL = 300

local function rewardPlayer(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	local coins = leaderstats and leaderstats:FindFirstChild("Coins")
	if coins then
		coins.Value += REWARD_AMOUNT
	end
end

while true do
	task.wait(REWARD_INTERVAL)
	for _, player in ipairs(Players:GetPlayers()) do
		rewardPlayer(player)
	end
end
