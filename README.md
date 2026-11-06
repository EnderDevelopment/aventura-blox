# Aventura Blox Roblox Script

Aventura Blox is a Roblox server-side coin system script for an experience you own. It adds a Coins leaderstat, saves player balances with DataStoreService, and awards coins to players over time.

## Install

1. Open your experience in Roblox Studio.
2. In Explorer, add `CurrencySystem.server.lua` as a Script under `ServerScriptService`.
3. Add `RewardCoins.server.lua` as a separate Script under `ServerScriptService`.
4. For DataStore testing in Studio, enable **Game Settings > Security > Enable Studio Access to API Services**.
5. Publish your experience to use persistent DataStore saves.

## Use

1. Run the experience. Each player starts with 100 Coins, or their saved balance if one is available.
2. Keep the server running to award each player 25 Coins every 5 minutes.
3. View the Coins value in the player list through `leaderstats`.
4. The system saves balances when players leave and when the server closes. It clamps balances to the range 0–2,000,000,000 when loading and saving.

This is an in-game currency system for your own Roblox experience. It does not provide Robux or interact with or automate Blox Fruits.

---

More Roblox script projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/62d9ff8e-64cd-476e-9646-74c9e70b1c17?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=62d9ff8e-64cd-476e-9646-74c9e70b1c17
