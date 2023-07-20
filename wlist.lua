local HWIDTable = loadstring(game:HttpGet("https://raw.githubusercontent.com/PQerror/whitelist/main/clientids"))() -- hwids
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
for i,v in pairs(HWIDTable)
    if v == HWID then
  print("Whitelisted! Enjoy Gilbertware Private!")
else
  game.Players.LocalPlayer:Kick("not wled")
end
