local HWIDTable = loadstring(game:HttpGet("https://raw.githubusercontent.com/PQerror/whitelist/main/clientids"))() -- hwids
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
for i,v in pairs(HWIDTable) do
    if v == HWID then
    wait(0)
else
  game.Players.LocalPlayer:Kick("not wled")
end
end
