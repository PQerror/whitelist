local GuiLibrary = shared.GuiLibrary
local blockraycast = RaycastParams.new()
blockraycast.FilterType = Enum.RaycastFilterType.Whitelist
local players = game:GetService("Players")
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local textservice = game:GetService("TextService")
local repstorage = game:GetService("ReplicatedStorage")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
local chatconnection
local modules = {}
local targetinfo = shared.VapeTargetInfo
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local remotes = {}
local bedwars = {}
local inventories = {}
local lagbackevent = Instance.new("BindableEvent")
local vec3 = Vector3.new
local cfnew = CFrame.new
local entity = shared.vapeentity
local uninjectflag = false
local matchstatetick = 0
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local teleportfunc
local clients = {
	ChatStrings1 = {
		["KVOP25KYFPPP4"] = "vape",
		["IO12GP56P4LGR"] = "future",
		["RQYBPTYNURYZC"] = "rektsky"
	},
	ChatStrings2 = {
		["vape"] = "KVOP25KYFPPP4",
		["future"] = "IO12GP56P4LGR",
		["rektsky"] = "RQYBPTYNURYZC"
	},
	ClientUsers = {}
}
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local checkpublicreponum = 0
local checkpublicrepo
checkpublicrepo = function(id)
	local suc, req = pcall(function() return requestfunc({
		Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/CustomModules/6872274481.lua",
		Method = "GET"
	}) end)
	if not suc then
		checkpublicreponum = checkpublicreponum + 1
		spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Loading CustomModule Failed!, Attempts : "..checkpublicreponum
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			task.wait(2)
			textlabel:Remove()
		end)
		task.wait(2)
		return checkpublicrepo(id)
	end
	if req.StatusCode == 200 then
		return req.Body
	end
	return nil
end
local publicrepo = checkpublicrepo(game.PlaceId)
if publicrepo then
    loadstring(publicrepo)()
end


local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end


		local cachedassets = {}
local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	if cachedassets[path] == nil then
		cachedassets[path] = getasset(path) 
	end
	return cachedassets[path]
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end
local function runcode(func)
	func()
end	
	
local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(205, 84, 75)
		return frame
	end)
	return (suc and res)
end

local function targetCheck(plr)
	return plr and plr.Humanoid and plr.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil
end


local function targetCheck(plr)
	return plr and plr.Humanoid and plr.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil
end

local function isAliveOld(plr, alivecheck)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return entity.isAlive
end



local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

local cachedassets = {}
local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	if cachedassets[path] == nil then
		cachedassets[path] = getasset(path) 
	end
	return cachedassets[path]
end


local RunLoops = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}
do
	function RunLoops:BindToRenderStep(name, num, func)
		if RunLoops.RenderStepTable[name] == nil then
			RunLoops.RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
		end
	end

	function RunLoops:UnbindFromRenderStep(name)
		if RunLoops.RenderStepTable[name] then
			RunLoops.RenderStepTable[name]:Disconnect()
			RunLoops.RenderStepTable[name] = nil
		end
	end

	function RunLoops:BindToStepped(name, num, func)
		if RunLoops.StepTable[name] == nil then
			RunLoops.StepTable[name] = game:GetService("RunService").Stepped:connect(func)
		end
	end

	function RunLoops:UnbindFromStepped(name)
		if RunLoops.StepTable[name] then
			RunLoops.StepTable[name]:Disconnect()
			RunLoops.StepTable[name] = nil
		end
	end

	function RunLoops:BindToHeartbeat(name, num, func)
		if RunLoops.HeartTable[name] == nil then
			RunLoops.HeartTable[name] = game:GetService("RunService").Heartbeat:connect(func)
		end
	end

	function RunLoops:UnbindFromHeartbeat(name)
		if RunLoops.HeartTable[name] then
			RunLoops.HeartTable[name]:Disconnect()
			RunLoops.HeartTable[name] = nil
		end
	end
end

repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local uis = game:GetService("UserInputService")
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
	return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end
function securefunc(func)
	task.spawn(function()
		spawn(function()
			pcall(function()
				loadstring(
					func()
				)()
			end)
		end)
	end)
end
function warnnotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "AutoWin", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 145, 0)
end
function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "AutoWin", content or "(No Content Given)", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 145, 0)
end
function getstate()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.matchState
end
function iscustommatch()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.customMatch
end
function checklagback()
	local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	return isnetworkowner(hrp)
end



		
		








local funnyFly = {["Enabled"] = false}
local funnyAura = {["Enabled"] = false}










runcode(function()
	local funnyFly 
	local part
	local cam = workspace.CurrentCamera
    BetterFly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "FunnyFly",
        ["Function"] = function(callback)
            if callback then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 19
                wait(0.0001)
                if funnyAura.Enabled then funnyAura.ToggleButton(false) end
                local origy = entity.character.HumanoidRootPart.Position.y
                part = Instance.new("Part", workspace)
                part.Size = Vector3.new(1,1,1)
                part.Transparency = 1
                part.Anchored = true
                part.CanCollide = false
                cam.CameraSubject = part
                RunLoops:BindToHeartbeat("FunnyFlyPart", 1, function()
                    local pos = entity.character.HumanoidRootPart.Position
                    part.Position = Vector3.new(pos.x, origy, pos.z)
                end)
                local cf = entity.character.HumanoidRootPart.CFrame
                entity.character.HumanoidRootPart.CFrame = CFrame.new(cf.x, 300000, cf.z)
                if entity.character.HumanoidRootPart.Position.X < 50000 then 
                    entity.character.HumanoidRootPart.CFrame *= CFrame.new(0, 100000, 0)
                end
            else
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
                wait(0.000003)
                RunLoops:UnbindFromHeartbeat("FunnyFlyPart")
                local pos = entity.character.HumanoidRootPart.Position
                local rcparams = RaycastParams.new()
                rcparams.FilterType = Enum.RaycastFilterType.Whitelist
                rcparams.FilterDescendantsInstances = {workspace.Map}
                rc = workspace:Raycast(Vector3.new(pos.x, 300, pos.z), Vector3.new(0,-1000,0), rcparams)
                if rc and rc.Position then
                    entity.character.HumanoidRootPart.CFrame = CFrame.new(rc.Position) * CFrame.new(0,3,0)
                end
                cam.CameraSubject = lplr.Character
                part:Destroy()
                RunLoops:BindToHeartbeat("FunnyFlyVeloEnd", 1, function()
                    entity.character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    entity.character.HumanoidRootPart.CFrame = CFrame.new(rc.Position) * CFrame.new(0,3,0)
                end)
                task.wait(1)
                RunLoops:UnbindFromHeartbeat("FunnyFlyVeloEnd")
                
            end
        end
    })
end)






local BetterJump = {["Enabled"] = false}
BetterJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "TPHighJump",
		["HoverText"] = "tp's u up alot",
		["Function"] = function(v)
		betterjump = v
		if betterjump then
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3, 0)
		spawn(function()
					repeat
		if (not betterjump) then return end
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
		task.wait(0.08)
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
		until (not betterjump) 
			end)	
		else
		Workspace.Gravity = 196.2
		end
	end
})





local BetterJump2 = {["Enabled"] = false}
BetterJump2 = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FastTPHighJump",
		["HoverText"] = "tp's u up alot v2 (2x faster)",
		["Function"] = function(v)
		betterjump = v
		if betterjump then
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3, 0)
		spawn(function()
					repeat
		if (not betterjump) then return end
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
		task.wait(0.04)
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
		until (not betterjump) 
			end)	
		else
		Workspace.Gravity = 196.2
		end
	end
})









repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local vec3 = Vector3.new
local lplr = game:GetService("Players")
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}
local repstorage = game:GetService("ReplicatedStorage")
local client = {}
local Client = require(repstorage.TS.remotes).default.Client
local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end
local function runcode(func)
	func()
end	
local bedwars = {}
local arrowdodgedata
local getfunctions
						local OldClientGet 
local oldbreakremote
local oldbob
runcode(function()
    getfunctions = function()
		local Flamework = require(repstorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(repstorage.TS.remotes).default.Client
        local InventoryUtil = require(repstorage.TS.inventory["inventory-util"]).InventoryUtil
        OldClientGet = getmetatable(Client).Get
        getmetatable(Client).Get = function(Self, remotename)
			local res = OldClientGet(Self, remotename)
			if uninjectflag then return res end
			if remotename == "DamageBlock" then
				return {
					["CallServerAsync"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServerAsync(tab)
					end,
					["CallServer"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServer(tab)
					end
				}
			elseif remotename == bedwars["AttackRemote"] then
				return {
					["instance"] = res["instance"],
					["SendToServer"] = function(Self, tab)
						local suc, plr = pcall(function() return players:GetPlayerFromCharacter(tab.entityInstance) end)
						if suc and plr then
							local playertype, playerattackable = WhitelistFunctions:CheckPlayerType(plr)
							if not playerattackable then 
								return nil
							end
						end
						if Reach["Enabled"] then
							local mag = (tab.validate.selfPosition.value - tab.validate.targetPosition.value).magnitude
							local newres = hashvec(tab.validate.selfPosition.value + (mag > 14.4 and (CFrame.lookAt(tab.validate.selfPosition.value, tab.validate.targetPosition.value).lookVector * 4) or Vector3.zero))
							tab.validate.selfPosition = newres
						end
						return res:SendToServer(tab)
					end
				}
			end
            return res
        end
		bedwars = {
			["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
			["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
			["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
			["AttackRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])),
			["BatteryRemote"] = getremote(debug.getconstants(debug.getproto(debug.getproto(KnitClient.Controllers.BatteryController.KnitStart, 1), 1))),
			["BatteryEffectController"] = KnitClient.Controllers.BatteryEffectsController,
            ["BalloonController"] = KnitClient.Controllers.BalloonController,
            ["BlockController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
            ["BlockController2"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer,
            ["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
            ["BlockEngineClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
			["BlockPlacementController"] = KnitClient.Controllers.BlockPlacementController,
            ["BedwarsKits"] = require(repstorage.TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
            ["BlockBreaker"] = KnitClient.Controllers.BlockBreakController.blockBreaker,
            ["BowTable"] = KnitClient.Controllers.ProjectileController,
			["BowConstantsTable"] = debug.getupvalue(KnitClient.Controllers.ProjectileController.enableBeam, 5),
			["ChestController"] = KnitClient.Controllers.ChestController,
			["ClickHold"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.lib.util["click-hold"]).ClickHold,
            ["ClientHandler"] = Client,
			["SharedConstants"] = require(repstorage.TS["shared-constants"]),
            ["ClientHandlerDamageBlock"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.remotes).BlockEngineRemotes.Client,
            ["ClientStoreHandler"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
			["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
            ["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
			["CombatController"] = KnitClient.Controllers.CombatController,
			["ConsumeSoulRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GrimReaperController.consumeSoul)),
			["ConstantManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].constant["constant-manager"]).ConstantManager,
			["CooldownController"] = KnitClient.Controllers.CooldownController,
            ["damageTable"] = KnitClient.Controllers.DamageController,
			["DinoRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DinoTamerController.KnitStart, 3))),
			["DaoRemote"] = getremote(debug.getconstants(debug.getprotos(KnitClient.Controllers.DaoController.onEnable)[4])),
			["DamageController"] = KnitClient.Controllers.DamageController,
			["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
			["DamageIndicatorController"] = KnitClient.Controllers.DamageIndicatorController,
			["DetonateRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).detonateRaven)),
            ["DropItem"] = getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand,
            ["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
            ["EatRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.ConsumeController).onEnable, 1))),
            ["EquipItemRemote"] = getremote(debug.getconstants(debug.getprotos(shared.oldequipitem or require(repstorage.TS.entity.entities["inventory-entity"]).InventoryEntity.equipItem)[3])),
			["FishermanTable"] = KnitClient.Controllers.FishermanController,
			["FovController"] = KnitClient.Controllers.FovController,
			["GameAnimationUtil"] = require(repstorage.TS.animation["animation-util"]).GameAnimationUtil,
			["GamePlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
            ["getEntityTable"] = require(repstorage.TS.entity["entity-util"]).EntityUtil,
            ["getIcon"] = function(item, showinv)
                local itemmeta = bedwars["ItemTable"][item.itemType]
                if itemmeta and showinv then
                    return itemmeta.image
                end
                return ""
            end,
			["getInventory2"] = function(plr)
                local suc, result = pcall(function() 
					return InventoryUtil.getInventory(plr) 
				end)
                return (suc and result or {
                    ["items"] = {},
                    ["armor"] = {},
                    ["hand"] = nil
                })
            end,
            ["getItemMetadata"] = require(repstorage.TS.item["item-meta"]).getItemMeta,
			["GrimReaperController"] = KnitClient.Controllers.GrimReaperController,
			["GuitarHealRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GuitarController.performHeal)),
			["HangGliderController"] = KnitClient.Controllers.HangGliderController,
			["HighlightController"] = KnitClient.Controllers.EntityHighlightController,
            ["ItemTable"] = debug.getupvalue(require(repstorage.TS.item["item-meta"]).getItemMeta, 1),
			["JuggernautRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.JuggernautController.KnitStart)[1])[4])),
			["KatanaController"] = KnitClient.Controllers.DaoController,
			["KatanaRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DaoController.onEnable, 4))),
            ["KnockbackTable"] = debug.getupvalue(require(repstorage.TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
			["LobbyClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"].lobby.out.client.events).LobbyClientEvents,
			["MapMeta"] = require(repstorage.TS.game.map["map-meta"]),
			["MissileController"] = KnitClient.Controllers.GuidedProjectileController,
			["MinerRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getproto(getmetatable(KnitClient.Controllers.MinerController).onKitEnabled, 1))[2])),
			["MinerController"] = KnitClient.Controllers.MinerController,
			["ProdAnimations"] = require(repstorage.TS.animation.definitions["prod-animations"]).ProdAnimations,
            ["PickupRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).checkForPickup)),
            ["PlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
			["ProjectileMeta"] = require(repstorage.TS.projectile["projectile-meta"]).ProjectileMeta,
			["QueueMeta"] = require(repstorage.TS.game["queue-meta"]).QueueMeta,
			["QueueCard"] = require(lplr.PlayerScripts.TS.controllers.global.queue.ui["queue-card"]).QueueCard,
			["QueryUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).GameQueryUtil,
			["PaintRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire)),
            ["prepareHashing"] = require(repstorage.TS["remote-hash"]["remote-hash-util"]).RemoteHashUtil.prepareHashVector3,
			["ProjectileRemote"] = getremote(debug.getconstants(debug.getupvalues(getmetatable(KnitClient.Controllers.ProjectileController)["launchProjectileWithValues"])[2])),
			["ProjectileHitRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ProjectileController.createLocalProjectile, 1))),
            ["RavenTable"] = KnitClient.Controllers.RavenController,
			["RespawnController"] = KnitClient.Controllers.BedwarsRespawnController,
			["RespawnTimer"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.respawn.ui["respawn-timer"]).RespawnTimerWrapper,
			["ResetRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ResetController.createBindable, 1))),
			["Roact"] = require(repstorage["rbxts_include"]["node_modules"]["roact"].src),
			["RuntimeLib"] = require(repstorage["rbxts_include"].RuntimeLib),
            ["Shop"] = require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop,
			["ShopItems"] = debug.getupvalue(require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
            ["ShopRight"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"]["shop-left"]["shop-left"]).BedwarsItemShopLeft,
			["SpawnRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).spawnRaven)),
            ["SoundManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).SoundManager,
			["SoundList"] = require(repstorage.TS.sound["game-sound"]).GameSound,
            ["sprintTable"] = KnitClient.Controllers.SprintController,
			["StopwatchController"] = KnitClient.Controllers.StopwatchController,
            ["SwingSword"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordAtMouse,
            ["SwingSwordRegion"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordInRegion,
            ["SwordController"] = KnitClient.Controllers.SwordController,
            ["TreeRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.BigmanController.KnitStart)[2])[1])),
			["TrinityRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.AngelController).onKitEnabled, 1))),
            ["VictoryScreen"] = require(lplr.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection,
            ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
			["VehicleController"] = KnitClient.Controllers.VehicleController,
			["WeldTable"] = require(repstorage.TS.util["weld-util"]).WeldUtil,
        }
	end
end)

				
-- Compute 3D launch direction from
-- start: start position
-- target: target position
-- v: launch velocity
-- g: gravity (positive) e.g. 196.2
-- higherArc: if true, use the higher arc. If false, use the lower arc.
local function LaunchDirection(start, target, v, g, higherArc: boolean)
-- get the direction flattened:
local horizontal = vec3(target.X - start.X, 0, target.Z - start.Z)

local h = target.Y - start.Y
local d = horizontal.Magnitude
local a = LaunchAngle(v, g, d, h, higherArc)

-- NaN ~= NaN, computation couldn't be done (e.g. because it's too far to launch)
if a ~= a then return nil end

-- speed if we were just launching at a flat angle:
local vec = horizontal.Unit * v

-- rotate around the axis perpendicular to that direction...
local rotAxis = vec3(-horizontal.Z, 0, horizontal.X)

-- ...by the angle amount
return CFrame.fromAxisAngle(rotAxis, a) * vec
end

local function FindLeadShot(targetPosition: Vector3, targetVelocity: Vector3, projectileSpeed: Number, shooterPosition: Vector3, shooterVelocity: Vector3, gravity: Number)
local distance = (targetPosition - shooterPosition).Magnitude

local p = targetPosition - shooterPosition
local v = targetVelocity - shooterVelocity
local a = Vector3.zero

local timeTaken = (distance / projectileSpeed)

if gravity > 0 then
local timeTaken = projectileSpeed/gravity+math.sqrt(2*distance/gravity+projectileSpeed^2/gravity^2)
end

local goalX = targetPosition.X + v.X*timeTaken + 0.5 * a.X * timeTaken^2
local goalY = targetPosition.Y + v.Y*timeTaken + 0.5 * a.Y * timeTaken^2
local goalZ = targetPosition.Z + v.Z*timeTaken + 0.5 * a.Z * timeTaken^2

return vec3(goalX, goalY, goalZ)
end

local function addvectortocframe(cframe, vec)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
return cfnew(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function addvectortocframe2(cframe, newylevel)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
return cfnew(x, newylevel, z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end
local oldcloneroot
function notify(text)
    local frame = GuiLibrary["CreateNotification"]("nigger", text, 5, "assets/WarningNotification.png")
    frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function boxnotify(text)
    if messagebox then
        messagebox(text, "Dumb V4", 0)
     end
end

local clone

local oldchar


local function getWhitelistedBed(bed)
	for i,v in pairs(players:GetChildren()) do
		if v:GetAttribute("Team") and bed and bed:GetAttribute("Team"..v:GetAttribute("Team").."NoBreak") and bedwars["CheckWhitelisted"](v) then
			return true
		end
	end
	return false
end
local getfunctions
local OldClientGet 
local oldbreakremote
local oldbob
runcode(function()
    getfunctions = function()
		local Flamework = require(repstorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(repstorage.TS.remotes).default.Client
        local InventoryUtil = require(repstorage.TS.inventory["inventory-util"]).InventoryUtil
        OldClientGet = getmetatable(Client).Get
        getmetatable(Client).Get = function(Self, remotename)
			local res = OldClientGet(Self, remotename)
			if uninjectflag then return res end
			if remotename == "DamageBlock" then
				return {
					["CallServerAsync"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServerAsync(tab)
					end,
					["CallServer"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServer(tab)
					end
				}
			elseif remotename == bedwars["AttackRemote"] then
				return {
					["instance"] = res["instance"],
					["SendToServer"] = function(Self, tab)
						local suc, plr = pcall(function() return players:GetPlayerFromCharacter(tab.entityInstance) end)
						if suc and plr then
							local playertype, playerattackable = bedwars["CheckPlayerType"](plr)
							if not playerattackable then 
								return nil
							end
						end
						if Reach["Enabled"] then
							local mag = (tab.validate.selfPosition.value - tab.validate.targetPosition.value).magnitude
							local newres = hashvec(tab.validate.selfPosition.value + (mag > 14.4 and (CFrame.lookAt(tab.validate.selfPosition.value, tab.validate.targetPosition.value).lookVector * 4) or Vector3.zero))
							tab.validate.selfPosition = newres
						end
						return res:SendToServer(tab)
					end
				}
			end
            return res
        end

		bedwars = {
			["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
			["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
			["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
			["AttackRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])),
			["BatteryRemote"] = getremote(debug.getconstants(debug.getproto(debug.getproto(KnitClient.Controllers.BatteryController.KnitStart, 1), 1))),
			["BatteryEffectController"] = KnitClient.Controllers.BatteryEffectsController,
            ["BalloonController"] = KnitClient.Controllers.BalloonController,
            ["BlockController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
            ["BlockController2"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer,
            ["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
            ["BlockEngineClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
			["BlockPlacementController"] = KnitClient.Controllers.BlockPlacementController,
            ["BedwarsKits"] = require(repstorage.TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
            ["BlockBreaker"] = KnitClient.Controllers.BlockBreakController.blockBreaker,
            ["BowTable"] = KnitClient.Controllers.ProjectileController,
			["BowConstantsTable"] = debug.getupvalue(KnitClient.Controllers.ProjectileController.enableBeam, 5),
			["ChestController"] = KnitClient.Controllers.ChestController,
			["ClickHold"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.lib.util["click-hold"]).ClickHold,
            ["ClientHandler"] = Client,
			["SharedConstants"] = require(repstorage.TS["shared-constants"]),
            ["ClientHandlerDamageBlock"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.remotes).BlockEngineRemotes.Client,
            ["ClientStoreHandler"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
			["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
            ["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
			["CombatController"] = KnitClient.Controllers.CombatController,
			["ConsumeSoulRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GrimReaperController.consumeSoul)),
			["ConstantManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].constant["constant-manager"]).ConstantManager,
			["CooldownController"] = KnitClient.Controllers.CooldownController,
            ["damageTable"] = KnitClient.Controllers.DamageController,
			["DinoRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DinoTamerController.KnitStart, 3))),
			["DaoRemote"] = getremote(debug.getconstants(debug.getprotos(KnitClient.Controllers.DaoController.onEnable)[4])),
			["DamageController"] = KnitClient.Controllers.DamageController,
			["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
			["DamageIndicatorController"] = KnitClient.Controllers.DamageIndicatorController,
			["DetonateRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).detonateRaven)),
            ["DropItem"] = getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand,
            ["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
            ["EatRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.ConsumeController).onEnable, 1))),
            ["EquipItemRemote"] = getremote(debug.getconstants(debug.getprotos(shared.oldequipitem or require(repstorage.TS.entity.entities["inventory-entity"]).InventoryEntity.equipItem)[3])),
			["FishermanTable"] = KnitClient.Controllers.FishermanController,
			["FovController"] = KnitClient.Controllers.FovController,
			["GameAnimationUtil"] = require(repstorage.TS.animation["animation-util"]).GameAnimationUtil,
			["GamePlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
            ["getEntityTable"] = require(repstorage.TS.entity["entity-util"]).EntityUtil,
            ["getIcon"] = function(item, showinv)
                local itemmeta = bedwars["ItemTable"][item.itemType]
                if itemmeta and showinv then
                    return itemmeta.image
                end
                return ""
            end,
			["getInventory2"] = function(plr)
                local suc, result = pcall(function() 
					return InventoryUtil.getInventory(plr) 
				end)
                return (suc and result or {
                    ["items"] = {},
                    ["armor"] = {},
                    ["hand"] = nil
                })
            end,
            ["getItemMetadata"] = require(repstorage.TS.item["item-meta"]).getItemMeta,
			["GrimReaperController"] = KnitClient.Controllers.GrimReaperController,
			["GuitarHealRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GuitarController.performHeal)),
			["HangGliderController"] = KnitClient.Controllers.HangGliderController,
			["HighlightController"] = KnitClient.Controllers.EntityHighlightController,
            ["ItemTable"] = debug.getupvalue(require(repstorage.TS.item["item-meta"]).getItemMeta, 1),
			["JuggernautRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.JuggernautController.KnitStart)[1])[4])),
			["KatanaController"] = KnitClient.Controllers.DaoController,
			["KatanaRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DaoController.onEnable, 4))),
            ["KnockbackTable"] = debug.getupvalue(require(repstorage.TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
			["LobbyClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"].lobby.out.client.events).LobbyClientEvents,
			["MapMeta"] = require(repstorage.TS.game.map["map-meta"]),
			["MissileController"] = KnitClient.Controllers.GuidedProjectileController,
			["MinerRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getproto(getmetatable(KnitClient.Controllers.MinerController).onKitEnabled, 1))[2])),
			["MinerController"] = KnitClient.Controllers.MinerController,
			["ProdAnimations"] = require(repstorage.TS.animation.definitions["prod-animations"]).ProdAnimations,
            ["PickupRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).checkForPickup)),
            ["PlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
			["ProjectileMeta"] = require(repstorage.TS.projectile["projectile-meta"]).ProjectileMeta,
			["QueueMeta"] = require(repstorage.TS.game["queue-meta"]).QueueMeta,
			["QueueCard"] = require(lplr.PlayerScripts.TS.controllers.global.queue.ui["queue-card"]).QueueCard,
			["QueryUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).GameQueryUtil,
			["PaintRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire)),
            ["prepareHashing"] = require(repstorage.TS["remote-hash"]["remote-hash-util"]).RemoteHashUtil.prepareHashVector3,
			["ProjectileRemote"] = getremote(debug.getconstants(debug.getupvalues(getmetatable(KnitClient.Controllers.ProjectileController)["launchProjectileWithValues"])[2])),
			["ProjectileHitRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ProjectileController.createLocalProjectile, 1))),
            ["RavenTable"] = KnitClient.Controllers.RavenController,
			["RespawnController"] = KnitClient.Controllers.BedwarsRespawnController,
			["RespawnTimer"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.respawn.ui["respawn-timer"]).RespawnTimerWrapper,
			["ResetRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ResetController.createBindable, 1))),
			["Roact"] = require(repstorage["rbxts_include"]["node_modules"]["roact"].src),
			["RuntimeLib"] = require(repstorage["rbxts_include"].RuntimeLib),
            ["Shop"] = require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop,
			["ShopItems"] = debug.getupvalue(require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
            ["ShopRight"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"]["shop-left"]["shop-left"]).BedwarsItemShopLeft,
			["SpawnRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).spawnRaven)),
            ["SoundManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).SoundManager,
			["SoundList"] = require(repstorage.TS.sound["game-sound"]).GameSound,
            ["sprintTable"] = KnitClient.Controllers.SprintController,
			["StopwatchController"] = KnitClient.Controllers.StopwatchController,
            ["SwingSword"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordAtMouse,
            ["SwingSwordRegion"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordInRegion,
            ["SwordController"] = KnitClient.Controllers.SwordController,
            ["TreeRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.BigmanController.KnitStart)[2])[1])),
			["TrinityRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.AngelController).onKitEnabled, 1))),
            ["VictoryScreen"] = require(lplr.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection,
            ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
			["VehicleController"] = KnitClient.Controllers.VehicleController,
			["WeldTable"] = require(repstorage.TS.util["weld-util"]).WeldUtil,
        }
	end
end)
local lplr = game:GetService("Players").LocalPlayer
local queueType = "bedwars_test"
local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}
local function getSpeedMultiplier(reduce)
	local speed = 1
	if lplr.Character then 
		local speedboost = lplr.Character:GetAttribute("SpeedBoost")
		if speedboost and speedboost > 1 then 
			speed = speed + (speedboost - 1)
		end
		if lplr.Character:GetAttribute("GrimReaperChannel") then 
			speed = speed + 0.6
		end
		if lplr.Character:GetAttribute("SpeedPieBuff") then 
			speed = speed + (queueType == "SURVIVAL" and 0.15 or 0.3)
		end
		local armor = currentinventory.inventory.armor[3]
		if type(armor) ~= "table" then armor = {itemType = ""} end
		if armor.itemType == "speed_boots" then 
			speed = speed + 1
		end
	end
	return reduce and speed ~= 1 and speed * (0.9 - (0.15 * math.floor(speed))) or speed
end

local networkownerfunc = isnetworkowner or function(part)
	if gethiddenproperty(part, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual then 
		sethiddenproperty(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
		networkownertick = tick() + 8
	end
	return networkownertick <= tick()
end














local BlueTexturepack = {["Enabled"] = false}
			BlueTexturepack = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
				["Name"] = "BlueTexturePack",
				   ["Function"] = function(Callback)
						Enabled = Callback
						if Enabled then

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end

createwarning("white skids", "BlueTexturePack Made By zyla#7657!   ", 5)

							Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
								if v:FindFirstChild("Handle") then
									pcall(function()
										v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
										v:FindFirstChild("Handle").Material = Enum.Material.Neon
										v:FindFirstChild("Handle").TextureID = ""
										v:FindFirstChild("Handle").Color = Color3.fromRGB(16, 42, 220)
									end)
									local vname = string.lower(v.Name)
									if vname:find("sword") or vname:find("blade") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://12360170981"
									elseif vname:find("pick") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://12342364179"
									end
								end
							end)
						else
							Connection:Disconnect()
						end
					end
				})


	
local BlackTexturePack = {["Enabled"] = false}
			BlackTexturePack = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
				["Name"] = "BlackTexturePack",
				   ["Function"] = function(Callback)
						Enabled = Callback
						if Enabled then

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end

createwarning("white skids", "BlackTexturePack Made By zyla#7657!   ", 5)

							Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
								if v:FindFirstChild("Handle") then
									pcall(function()
										v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1
										v:FindFirstChild("Handle").Material = Enum.Material.Neon
										v:FindFirstChild("Handle").TextureID = ""
										v:FindFirstChild("Handle").Color = Color3.fromRGB(17, 17, 17)
									end)
									local vname = string.lower(v.Name)
									if vname:find("sword") or vname:find("blade") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://1850292888"
									elseif vname:find("snowball") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://11216343798"
									end
								end
							end)
						else
							Connection:Disconnect()
						end
					end
				})







			local RedTexturePack = {["Enabled"] = false}
			RedTexturePack = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
				["Name"] = "red texurePack",
				   ["Function"] = function(Callback)
						Enabled = Callback
						if Enabled then

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end

createwarning("white skids", "RedTexturePack Made By zyla#7657!   ", 5)

							Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
								if v:FindFirstChild("Handle") then
									pcall(function()
										v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
										v:FindFirstChild("Handle").Material = Enum.Material.Neon
										v:FindFirstChild("Handle").TextureID = ""
										v:FindFirstChild("Handle").Color = Color3.fromRGB(196, 40, 28)
									end)
									local vname = string.lower(v.Name)
									if vname:find("sword") or vname:find("blade") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://11216117592"
									elseif vname:find("snowball") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://11216343798"
									end
								end
							end)
						else
							Connection:Disconnect()
						end
					end
				})


















runcode(function()
local infJumpConnection
local infjump = {["Enabled"] = false}
infjump = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "InfiniteJump",
    ["HoverText"] = "jump without touching ground",
    ["Function"] = function(callback) 
        if callback then    
            infJumpConnection = uis.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Space and not uis:GetFocusedTextBox() then
                    if InfHold.Enabled and entity.isAlive then 
                        repeat 
                        lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                        task.wait()
                        until not uis:IsKeyDown(Enum.KeyCode.Space) or not infjump.Enabled or uis:GetFocusedTextBox()
                    else 
                        if entity.isAlive then 
                                lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                            end 
                        end 
                    end
                end)
            else
                if infJumpConnection then
                    infJumpConnection:Disconnect()
                end
            end
        end
    })
    InfHold = infjump.CreateToggle({
        ["Name"] = "Hold",
        ["HoverText"] = "Hold down space to jump",
        ["Function"] = function() end
    })
end)






local Crosshair = COB("Render", {
	["Name"] = " SanrioCrosshair",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Crosshair = true
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = "rbxassetid://11720475063"
				mouse:GetPropertyChangedSignal("Icon"):Connect(function()
				    if not ScriptSettings.Crosshair == true then return end
				    mouse.Icon = "rbxassetid://11720475063"
				end)
			end)
		else
			pcall(function()
				ScriptSettings.Crosshair = false
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = ""
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "sanrio"
})







runcode(function()
local Baseplate = {["Enabled"] = true}
RedAntivoid = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Baseplate",
        ["HoverText"] = "Red Baseplate",
        ["Function"] = function(callback)
            if callback then
	local part = Instance.new("Part", Workspace)
            part.Name = "RedAntiVoid"
            part.Size = Vector3.new(2100, 0.5, 2000)
            part.Position = Vector3.new(160.5, 25, 247.5)
            part.Transparency = 0.5
            part.Anchored = true
	    part.Color = Color3.fromRGB(211, 47, 47)
            part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,20,0)
            else               
		game.Workspace.RedAntiVoid:Destroy()
            end
        end
    })
end)



runcode(function()
    local part
    local part2
    local Airwalk = {["Enabled"] = false}
    Airwalk = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Platform",
        ["HoverText"] = "platform",
        ["Function"] = function(callback)
            if callback then
                part = Instance.new("Part")
                part2 = Instance.new("Part")
                part.Transparency = 0.1
                part2.Transparency = 0.1
                part.Parent = workspace
                part.Anchored = true
                part2.Parent = workspace
                part2.Anchored = true
                task.spawn(function()
                    repeat
                        task.wait()
                        if entity.isAlive then
			    part.CFrame = entity.character.HumanoidRootPart.CFrame - Vector3.new(0, 3.6, 0)
			    part2.CFrame = entity.character.HumanoidRootPart.CFrame + Vector3.new(0, 2.5, 0)
                        end
                    until not Airwalk["Enabled"]
                end)
            else
                if part then
                    part:Destroy()
                end
                if part2 then
                    part2:Destroy()
                end
            end
        end
    })
end)



runcode(function()
    local Heatseeker = {["Enabled"] = false}
    Heatseeker = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Heatseeker",
        ["HoverText"] = "Boosts You Forward",
        ["Function"] = function(v)
	speedlol = v
        if speedlol then
	task.wait(1)
	spawn(function()           
	repeat
        if (not speedlol and not onground) then return end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
        wait(1.5)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
	wait(0.07)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
	wait(1.5)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
	task.wait(0.07)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
	wait(1.5)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
        wait(0.1)
        until (not speedlol) 
            end)
        else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
      	end
      end
        })
	heatspeed = Heatseeker.CreateSlider({
		["Name"] = "Speed",
		["HoverText"] = "Times to raise shield",
		["Min"] = 30,
		["Max"] = 60,
		["Default"] = 50,
		["Function"] = function(val)
			WalkSpeed = val
		end,
	})
end)





runcode(function()
		local Reinject = {["Enabled"] = false}
		Reinject = GuiLibrary["ObjectsThatCanBeSaved"]["CombatWindow"]["Api"].CreateOptionsButton({
			["Name"] = "Reinject",
			["HoverText"] = "Reinjects Vape To Load Modules",
			   ["Function"] = function(Callback)
					Enabled = Callback
					if Enabled then
						Reinject["ToggleButton"](false)
						GuiLibrary["SelfDestruct"]()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
	
	
					end
				end
		})
	end)





local RealSky = {["Enabled"] = false}
local RealSky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "RealisticSky",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=144933338"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=144931530"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=144933262"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=144933244"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=144933299"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=144931564"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})










local Sky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "NightTime",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=6123663583"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6123664133"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=6123666950"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=6123668090"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=6123668561"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=6123668964"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})




local Player1 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "BetterZoom",
    ["HoverText"] = "Lets You Zoom Out More",
    ["Function"] = function(v)
        if v then
            game.Players.LocalPlayer.CameraMaxZoomDistance = 40
        else
            game.Players.LocalPlayer.CameraMaxZoomDistance = 13
        end
    end
})



local Sky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "PinkSky",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=271042516"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=271077243"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=271042556"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=271042310"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=271042467"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=271077958"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})
local Sky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "NightTimeV2",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/Asset/?ID=12064107"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/Asset/?ID=12064152"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/Asset/?ID=12064121"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/Asset/?ID=12063984"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/Asset/?ID=12064115"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/Asset/?ID=12064131"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})
local Sky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "RealisticSkyV2",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=6778646360"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6778658683"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=6778648039"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=6778649136"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=6778650519"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=6778658364"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})







  local SeppukuAmbience1 = {["Enabled"] = false}
  SeppukuAmbience1 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
      ["Name"] = "PurpleSkybox",
      ["Function"] = function(callback)
          if callback then
              local sky = Instance.new("Sky",game.Lighting)
              sky.MoonAngularSize = "0"
              sky.MoonTextureId = "rbxassetid://6444320592"
              sky.SkyboxBk = "rbxassetid://8107841671"
              sky.SkyboxDn = "rbxassetid://6444884785"
              sky.SkyboxFt = "rbxassetid://8107841671"
              sky.SkyboxLf = "rbxassetid://8107841671"
              sky.SkyboxRt = "rbxassetid://8107841671"
              sky.SkyboxUp = "rbxassetid://8107849791"
              sky.SunTextureId = "rbxassetid://6196665106"

          else
              local sky2 = Instance.new("Sky",game.Lighting)
              sky2.MoonAngularSize = "11"
              sky2.MoonTextureId = "rbxasset://sky/moon.jpg"
              sky2.SkyboxBk = "rbxassetid://7018684000"
              sky2.SkyboxDn = "rbxassetid://6334928194"
              sky2.SkyboxFt = "rbxassetid://7018684000"
              sky2.SkyboxLf = "rbxassetid://7018684000"
              sky2.SkyboxRt = "rbxassetid://7018684000"
              sky2.SkyboxUp = "rbxassetid://7018689553"
              sky2.SunTextureId = "rbxasset://sky/sun.jpg"
              sky2.SunAngularSize = "21"
          end
      end
  })

     
  local SeppukuAmbience2 = {["Enabled"] = false}
  SeppukuAmbience2 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
      ["Name"] = "PurpleAmbience",
      ["Function"] = function(callback)
          if callback then
              game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(170, 170, 255)
              game.Lighting.Ambient = Color3.fromRGB(170, 170, 255)
              game.Lighting.OutdoorAmbient = Color3.fromRGB(170, 170, 255)
          else
              game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
              game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
              game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
          end
      end
  })







runcode(function()
	local RecordingMode = {["Enabled"] = false}

	RecordingMode = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "HideOtherUser",
		["Function"] = function(callback)
			if callback then
				loadstring(game:HttpGet("https://pastebin.com/raw/gbj1aLix", true))()
			end
		end,
		["HoverText"] = "hides everyones user"
	})
end)










keystrokes = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "keypad",
	["HoverText"] = "keystrokes",
	["Function"] = function(callback)
		if callback then
			loadstring(game:HttpGet("https://github.com/TheXploiterYT/scripts/raw/main/keystrokes"))()
		else
			game.CoreGui.ScreenGui.Destroy()
		end
	end
})



MCStatistics = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "minecwaft",
	["HoverText"] = "mincraf statisticks",
	["Function"] = function(callback)
		if callback then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/sstvskids/minecraft_easyggscoreboard/main/scoreboard"))()
		else
			game.CoreGui.ScreenGui.Destroy()
		end
	end
})





runcode(function()
		local FPSUnlocker = {["Enabled"] = false}
		FPSUnlocker = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
			["Name"] = "FPSUnlocker",
			["HoverText"] = "unlocks fps to get more fps",
			   ["Function"] = function(Callback)
					if Callback then
	                                   setfpscap(10000)
                                   else
                                           setfpscap(9999)
					end
				end
		})
	end)










runcode(function()
    local Chat = {["Enabled"] = false}
    Chat = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "ChatMover",
        ["HoverText"] = "moves chat to the bottom",
        ["Function"] = function(callback)
            if callback then
                game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0.73, 0))
            else
                game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0, 0))
            end
        end
    })
end)



runcode(function()
    local deb
    local con
    local client = require(game:GetService("ReplicatedStorage"):WaitForChild("TS"):WaitForChild("remotes")).default.Client
    local lplr = game:GetService("Players").LocalPlayer

    function fetchBed()
        local selectedBed
        for _, bed in next, workspace:GetChildren() do
            if bed.Name == "bed" and not selectedBed then
                local covers = bed:WaitForChild("Covers")
                
                if lplr.TeamColor ~= covers.BrickColor then
                    selectedBed = bed
                end
            end
        end
        return (selectedBed)
    end

    deb = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
        Name = "BedTP", 
        Function = function(callback)
            if callback then
            GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = "Ape v6"
             GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = "Ape v6"
             GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = "Ape v6"
              GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)
               warnnotify("BedTP","Enabled.", 5)
                lplr = game:GetService("Players").LocalPlayer
                chr = lplr.Character

                if lplr and chr then
                    local bed = fetchBed()
                    local tppos2 = bed.Position + Vector3.new(0, 10, 0)
                    local hum = chr:FindFirstChildWhichIsA("Humanoid")
                    con = lplr.CharacterAdded:Connect(function(chr)
                        con:Disconnect()
                        task.wait(.5)
                        local root = chr:WaitForChild("HumanoidRootPart")
                        local check = (lplr:GetAttribute("LastTeleported") - lplr:GetAttribute("SpawnTime")) < 1
                        con = game:GetService("RunService").Heartbeat:Connect(function(dt)
                            local dist = ((check and 700 or 1200) * dt)
                                        if (tppos2 - root.CFrame.p).Magnitude > dist then
                                            root.CFrame = root.CFrame + (tppos2 - root.CFrame.p).Unit * dist
                                            local yes = (tppos2 - root.CFrame.p).Unit * 20
                                            root.Velocity = Vector3.new(yes.X, root.Velocity.Y, yes.Z)
                                        else
                                            root.CFrame = root.CFrame + (tppos2 - root.CFrame.p)
                                        end
                        end)

                        repeat
                            task.wait()
                        until (tppos2 - root.CFrame.p).Magnitude < 10

                        con:Disconnect()
                    end)

                    for _ = 1, 10, 1 do
                        hum:ChangeState(Enum.HumanoidStateType.Dead)
                        hum.Health = 0
                    end
                    -- client:Get("ResetCharacter"):SendToServer()
                end
                deb.ToggleButton(false)
            end
        end,
        HoverText = "Bed TP or teleportation to a random bed",
    })
end)





	local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart	
	


	local lplr = game:GetService("Players").LocalPlayer
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client



SnoopyTxtPack = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
    ["Name"] = "SnoopyTxtPack",
    ["Function"] = function(callback)
        if callback then
			Enabled = callback
            if Enabled then
                Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
                    if v:FindFirstChild("Handle") then
                        pcall(function()
                            v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
                            v:FindFirstChild("Handle").Material = Enum.Material.SmoothPlastic
                            v:FindFirstChild("Handle").TextureID = "rbxassetid://12736332126"
                            v:FindFirstChild("Handle").Color = Color3.fromRGB(61, 21, 133)
                        end)
                        local vname = string.lower(v.Name)
                        if vname:find("sword") or vname:find("blade") then
                            v:FindFirstChild("Handle").MeshId = "rbxassetid://12741430220"
                        elseif vname:find("pick") then
                            v:FindFirstChild("Handle").MeshId = "rbxassetid://12342364179"
                        end
                    end
                end)
            else
                Connection:Disconnect()
			end
        end
    end
})
runcode(function()
	function IsMoving()
        return uis:IsKeyDown(Enum.KeyCode.W) or uis:IsKeyDown(Enum.KeyCode.A) or uis:IsKeyDown(Enum.KeyCode.S) or uis:IsKeyDown(Enum.KeyCode.D)
    end
	Longjumpv2 = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Longjumpv2",
		["HoverText"] = "Made by papi/Kitty9#9999",
		["Function"] = function(callback)
			if callback then
				lplr.character.HumanoidRootPart.Velocity = lplr.character.HumanoidRootPart.Velocity + Vector3.new(0,100,0)
				wait(0.3)
				for i = 1,3 do wait(0.4)
					lplr.character.HumanoidRootPart.Velocity = lplr.character.HumanoidRootPart.Velocity + Vector3.new(0,75,0)
				end
				Longjumpv2["ToggleButton"](false)
			else
				game.Workspace.Gravity = 192.6
			end
		end
	})
end)

InfiniteJump = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
    ["Name"] = "InfiniteJump",
    ["Function"] = function(callback)
        if callback then
			local InfiniteJumpEnabled = true
			game:GetService("UserInputService").JumpRequest:connect(function()
				if InfiniteJumpEnabled then
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
				end
			end)
        else
			InfiniteJumpEnabled = false
		end
    end
})



BetterHighjump = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
    ["Name"] = "BetterHighjump",
    ["Function"] = function(callback)
        if callback then
            for i=1, 51 do
                lplr.character.HumanoidRootPart.Velocity = lplr.character.HumanoidRootPart.Velocity + Vector3.new(0,Velo1["Value"],0)
                wait(0.00001)
                lplr.character.HumanoidRootPart.Velocity = lplr.character.HumanoidRootPart.Velocity + Vector3.new(0,Velo2["Value"],0)
            end
            BetterHighjump["ToggleButton"](false)
        else
            
        end
    end
})
Velo1 = BetterHighjump .CreateSlider({
    ["Name"] = "Velo1",
    ["Min"] = 0,
    ["Max"] = 20,
    ["Function"] = function(val) end,
    ["Default"] = 10.7
})
Velo2 = BetterHighjump .CreateSlider({
    ["Name"] = "Velo2",
    ["Min"] = 0,
    ["Max"] = 20,
    ["Function"] = function(val) end,
    ["Default"] = 10.7
})

runcode(function()
	FpsDisplay = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FpsDisplay",
		["HoverText"] = "Grass gave me this so dont hate if skidded :sob:",
		["Function"] = function(callback)
			if callback then
				local textlab = Instance.new("TextLabel")
				textlab.Size = UDim2.new(0, 200, 0, 28)
				textlab.BackgroundTransparency = 1
				textlab.TextColor3 = Color3.new(1, 1, 1)
				textlab.TextStrokeTransparency = 0
				textlab.TextStrokeColor3 = Color3.new(0.24, 0.24, 0.24)
				textlab.Font = Enum.Font.SourceSans
				textlab.TextSize = 28
				textlab.Text = "1 FPS"
				textlab.BackgroundColor3 = Color3.new(0, 0, 0)
				textlab.Position = UDim2.new(1, -254, 0, -10)
				textlab.TextXAlignment = Enum.TextXAlignment.Right
				textlab.BorderSizePixel = 0
				textlab.Parent = game.CoreGui.RobloxGui
				spawn(function()
					local RunService = game:GetService("RunService")
					local FpsLabel = textlab
					
					local TimeFunction = RunService:IsRunning() and time or os.clock
					
					local LastIteration, Start
					local FrameUpdateTable = {}
					
					local function loopupdate()
						LastIteration = TimeFunction()
						for Index = #FrameUpdateTable, 1, -1 do
							FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
						end
					
						FrameUpdateTable[1] = LastIteration
						FpsLabel.Text = tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start))) .. " FPS"
					end
					
					Start = TimeFunction()
					RunService.Heartbeat:Connect(loopupdate)
				end)
			else
				pcall(function()
					textlab:Remove()
				end)
			end
		end
	})
end)

runcode(function()
    local swordhighlight_color
    local swordhighlight = {Enabled = false}
    local char = lplr.Character

    swordhighlight = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
        ["Name"] = "SwordHighlight",
        ["HoverText"] = "dont have sword equiped when you turn it on.",
        ["Function"] = function(callback)
            local sword_connection
            local sword_highlight

            if callback then
                sword_connection = cam.Viewmodel.ChildAdded:Connect(function(obj)


                    if obj:FindFirstChild("Handle") then
                        local obj_name = string.lower(obj.Name)



                        if obj_name:find("sword") or obj_name:find("blade") then
                            local objhandle = obj:FindFirstChild("Handle")

                            task.wait()


                            local highlight_instance = Instance.new("Highlight")
                            highlight_instance.Parent = objhandle
                            sword_highlight=highlight_instance
                            highlight_instance.Parent = objhandle
                            highlight_instance.FillTransparency = 1.00
                            highlight_instance.OutlineColor = Color3.fromRGB(0,0,0)
                            highlight_instance.FillColor = Color3.fromRGB(105, 59, 255)
                        end
                    end
                end)
            else
                sword_connection:Disconnect()
            end
        end
    })
end)

CustomSpaceSky = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
    ["Name"] = "CustomSpaceSky",
    ["Function"] = function(callback)
        if callback then
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=159454299"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=159454296"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=159454293"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=159454286"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=159454300"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=159454288"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

PinkMountainSky = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
    ["Name"] = "PinkMountainSky",
    ["Function"] = function(callback)
        if callback then
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=160188495"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=160188614"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=160188609"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=160188589"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=160188597"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=160188588"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

PurpleSky = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
    ["Name"] = "PurpleSky",
    ["Function"] = function(callback)
        if callback then
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=433274085"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=433274194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=433274131"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=433274370"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=433274429"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=433274285"
            game.Lighting.FogColor = Color3.new(170, 0, 255)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(170, 0, 255)
        else
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})




runcode(function()
	local breathe = {Enabled = false}
	breathe = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		Name = "DragonBreathe",
		Function = function(callback)
			if callback then 
				task.spawn(function()
					repeat 
						task.wait(0.3) 
						game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("DragonBreath"):FireServer({player = game:GetService("Players").LocalPlayer})
					until (not breathe.Enabled)
				end)
			end
		end
	})
end)





	local Chat = {Enabled = false}
	Chat = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		Name = "ChatBubble",
		Function = function(callback)
			if callback then
				task.spawn(function()
					local ChatService = game:GetService("Chat")
					ChatService.BubbleChatEnabled = true
					local bubbleChatSettings = {
						BackgroundColor3 = Color3.fromHSV(BubbleColor.Hue, BubbleColor.Sat, BubbleColor.Value),
						TextSize = 20,
						Font = Enum.Font.FredokaOne,
						BubbleDuration = 10
					}
					ChatService:SetBubbleChatSettings(bubbleChatSettings)
				end)
			end
		end,
		HoverText = "Customizable the bubble chat experience. (retoggle after changing settings)"
	})
	BubbleColor = Chat.CreateColorSlider({
		Name = "Bubble Color",
		Function = function(h, s, v)
			if BackgroundColor3 then
				BackgroundColor3.Color = Color3.fromHSV(h, s, v)
			end
		end
	})



	local anim = {["Enabled"] = false}
	anim = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AnimationChanger",
		["HoverText"] = "gives you a FE Animation Pack. Its also customizable",
		["Function"] = function(callback)
			if callback then
				task.spawn(function()
				local Hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
					if not Hum then
						repeat task.wait() until Hum
					end
				local Animate = game:GetService("Players").LocalPlayer.Character.Animate
				----Cartoony
				if animrun.Value == "Cartoony" and animtype.Value == "Custom" then
					Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921076136" 	
			end
	if animwalk.Value == "Cartoony" and animtype.Value == "Custom" then
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921082452"
	end
	if animfall.Value == "Cartoony" and animtype.Value == "Custom" then
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921077030"
		end
		if animjump.Value == "Cartoony" and animtype.Value == "Custom" then
			Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921078135"
		end
		if animidle.Value == "Cartoony" and animtype.Value == "Custom" then
			Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921071918"
			Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921072875"
		end
		if animclimb.Value == "Cartoony" and animtype.Value == "Custom" then
			Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921070953"
		end
		----Levitation
				if animrun.Value == "Levitation" and animtype.Value == "Custom" then
					Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921135644" 	
			end
	
			if animwalk.Value == "Levitation" and animtype.Value == "Custom" then
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921140719"
	end
	if animfall.Value == "Levitation" and animtype.Value == "Custom" then
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
		end
		if animjump.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921137402"
		end
		if animidle.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921132962"
			Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921133721"
		end
			if animwalk.Value == "Levitation" and animtype.Value == "Custom" then
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921140719"
	end
	if animfall.Value == "Levitation" and animtype.Value == "Custom" then
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
		end
		if animjump.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921137402"
		end
		if animidle.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921132962"
			Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921133721"
		end
		if animclimb.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921132092"
		end
---Robot
		if animrun.Value == "Robot" and animtype.Value == "Custom" then
			Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921250460" 	
	end

	if animwalk.Value == "Robot" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921255446"
end
if animfall.Value == "Robot" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921251156"
end
if animjump.Value == "Robot" and animtype.Value == "Custom" then
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921252123"
end
if animidle.Value == "Robot" and animtype.Value == "Custom" then
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921248039"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921248831"
end
if animclimb.Value == "Robot" and animtype.Value == "Custom" then
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921247141"
end
---Stylish
if animrun.Value == "Stylish" and animtype.Value == "Custom" then
			Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921276116" 	
	end
	if animwalk.Value == "Stylish" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921283326"
end
if animfall.Value == "Stylish" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921278648"
end
if animjump.Value == "Stylish" and animtype.Value == "Custom" then
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921279832"
end
if animidle.Value == "Stylish" and animtype.Value == "Custom" then
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921272275"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921273958"
end
if animclimb.Value == "Stylish" and animtype.Value == "Custom" then
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921271391"
end
---Superhero
if animrun.Value == "Superhero" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921291831" 	
end
if animwalk.Value == "Superhero" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921298616"
end
if animfall.Value == "Superhero" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921293373"
end
if animjump.Value == "Superhero" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921294559"
end
if animidle.Value == "Superhero" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921288909"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921290167"
end
if animclimb.Value == "Superhero" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921286911"
end
---Zombie (this animation is garbage lol)
if animrun.Value == "Zombie" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682" 	
end
if animwalk.Value == "Zombie" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921355261"
end
if animfall.Value == "Zombie" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921350320"
warningNotification("Spider","Spider doesn't work well with the Zombie fall. So don't recommend using it",5)
end
if animjump.Value == "Zombie" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921351278"
end
if animidle.Value == "Zombie" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921344533"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921345304"
end
if animclimb.Value == "Zombie" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921343576"
end
---Ninja
if animrun.Value == "Ninja" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921157929" 	
end
if animwalk.Value == "Ninja" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921162768"
end
if animfall.Value == "Ninja" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921159222"
end
if animjump.Value == "Ninja" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921160088"
end
if animidle.Value == "Ninja" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921155160"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921155867"
end
if animclimb.Value == "Ninja" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921154678"
end
---Knight
if animrun.Value == "Knight" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921121197" 	
end
if animwalk.Value == "Knight" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921127095"
end
if animfall.Value == "Knight" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921122579"
end
if animjump.Value == "Knight" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921123517"
end
if animidle.Value == "Knight" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921117521"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921118894"
end
if animclimb.Value == "Knight" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921116196"
end
---Mage
if animrun.Value == "Mage" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921148209" 	
end
if animwalk.Value == "Mage" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921152678"
end
if animfall.Value == "Mage" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921148939"
end
if animjump.Value == "Mage" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921149743"
end
if animidle.Value == "Mage" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921144709"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921145797"
end
if animclimb.Value == "Mage" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921143404"
end
---Pirate
if animrun.Value == "Pirate" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738" 	
end
if animwalk.Value == "Pirate" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
end
if animfall.Value == "Pirate" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
end
if animjump.Value == "Pirate" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
end
if animidle.Value == "Pirate" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
end
if animclimb.Value == "Pirate" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
end
---Elder
if animrun.Value == "Elder" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921104374" 	
end
if animwalk.Value == "Elder" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921111375"
end
if animfall.Value == "Elder" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921105765"
end
if animjump.Value == "Elder" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921107367"
end
if animidle.Value == "Elder" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921101664"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921102574"
end
if animclimb.Value == "Elder" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921100400"
end
---Toy (my favorite)
if animrun.Value == "Toy" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921306285" 	
end
if animwalk.Value == "Toy" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921312010"
end
if animfall.Value == "Toy" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921307241"
end
if animjump.Value == "Toy" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921308158"
end
if animidle.Value == "Toy" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921301576"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921302207"
end
if animclimb.Value == "Toy" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921300839"
end
---Bubbly
if animrun.Value == "Bubbly" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921057244" 	
end
if animwalk.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10980888364"
end
if animfall.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921061530"
end
if animjump.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921062673"
end
if animidle.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921054344"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921055107"
end
if animclimb.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921053544"
end
---Astronaut
if animrun.Value == "Astronaut" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921039308" 	
end
if animwalk.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921046031"
end
if animfall.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921040576"
end
if animjump.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921042494"
end
if animidle.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921034824"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921036806"
end
if animclimb.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921032124"
end
---Vampire
if animrun.Value == "Vampire" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921320299" 	
end
if animwalk.Value == "Vampire" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921326949"
end
if animfall.Value == "Vampire" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921321317"
end
if animjump.Value == "Vampire" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921322186"
end
if animidle.Value == "Vampire" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921315373"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921316709"
end
if animclimb.Value == "Vampire" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921314188"
end
---Werewolf
if animrun.Value == "Werewolf" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921336997" 	
end
if animwalk.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921342074"
end
if animfall.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921337907"
end
if animjump.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
end
if animidle.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921330408"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921333667"
end
if animclimb.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921329322"
end
---Rthro
if animrun.Value == "Rthro" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921261968" 	
end
if animwalk.Value == "Rthro" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921269718"
end
if animfall.Value == "Rthro" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921262864"
end
if animjump.Value == "Rthro" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921263860"
end
if animidle.Value == "Rthro" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921258489"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921259953"
end
if animclimb.Value == "Rthro" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921257536"
end
---Oldschool
if animrun.Value == "Oldschool" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921240218" 	
end
if animwalk.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921244891"
end
if animfall.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921241244"
end
if animjump.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921242013"
end
if animidle.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921230744"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921232093"
end
if animclimb.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921229866"
end
---Mr.Toilet
if animrun.Value == "Toilet" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=4417979645" 	
end
if animidle.Value == "Toilet" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=4417977954"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=4417978624"
end
---Ud'Zal
if animrun.Value == "Rthro Heavy Run" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3236836670" 	
end
if animidle.Value == "Ud'zal" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3303162274"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3303162549"
end
if animwalk.Value == "Ud'zal" and animtype.Value == "Custom" then
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=3303162967"
	end
	if animtype.Value == "Tryhard" then
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921301576"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921302207"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921162768"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921157929"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921137402"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
	end
	if animtype.Value == "Goofy" then
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=4417977954"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=4417978624"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921162768"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=4417979645"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921137402"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
	end
	if animtype.Value == "Tanqr" then
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921034824"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921036806"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921312010"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921306285"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921242013"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
	end
end)
	end
	end
	})
	animtype = anim.CreateDropdown({
		Name = "Type",
		List = {"Custom", "Tryhard", "Goofy", "Tanqr"},
		Function = function() end
	})
	animrun = anim.CreateDropdown({
		Name = "Run",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool", "Toilet", "Rthro Heavy Run"},
		Function = function() end
	})

	animwalk = anim.CreateDropdown({
		Name = "Walk",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool", "Ud'zal"},
		Function = function() end
	})

	animfall = anim.CreateDropdown({
		Name = "Fall",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool"},
		Function = function() end
	})

	animjump = anim.CreateDropdown({
		Name = "Jump",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool"},
		Function = function() end
	})

	animidle = anim.CreateDropdown({
		Name = "Idle",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool", "Toilet", "Ud'zal"},
		Function = function() end
	})

	animclimb = anim.CreateDropdown({
		Name = "Climb",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool"},
		Function = function() end
	})




    local hpbar = {Enabled = false}
			hpbar = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
				Name = "CustomHealthbar",
				Function = function(callback)
					if callback then
						task.spawn(function()
							repeat task.wait() until game:IsLoaded()
							getgenv().loadchecked = true
							repeat task.wait(0.1)
								local healthbar = lplr.PlayerGui:WaitForChild("hotbar"):WaitForChild("1"):WaitForChild("HotbarHealthbarContainer"):WaitForChild("HealthbarProgressWrapper"):WaitForChild("1")
								if hpbar.Enabled and hotbarmode.Value =="Default" then
									healthbar.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
								elseif hpbar.Enabled and hotbarmode.Value == "Custom" then
								healthbar.BackgroundColor3 = Color3.fromHSV(CustomHealthbarColor.Hue, CustomHealthbarColor.Sat, CustomHealthbarColor.Value)
								     counter = counter + 0.01
								elseif hpbar.Enabled and hotbarmode.Value == "Dynamic" then
									healthbar.BackgroundColor3 = Color3.fromHSV(math.clamp(entityLibrary.character.Humanoid.Health / entityLibrary.character.Humanoid.MaxHealth, 0, 1) / 2.5, 0.89, 1.5)
							end
							until not hpbar.Enabled
				end)
				else
					lplr.PlayerGui:WaitForChild("hotbar"):WaitForChild("1"):WaitForChild("HotbarHealthbarContainer"):WaitForChild("HealthbarProgressWrapper"):WaitForChild("1").BackgroundColor3 = Color3.fromRGB(203,54,36)
					end
				end,
				HoverText = "customize your hotbar."
			})
			hotbarmode = hpbar.CreateDropdown({
				Name = "Healthbar",
				List = {"Default", "Dynamic", "Custom"},
				Function = function() end
			})
			CustomHealthbarColor = hpbar.CreateColorSlider({
				Name = "Custom Color",
				Function = function(h, s, v)
					if hpbar.Enabled and hotbarmode.Value == "Cool" then
						obj.Parent.TextColor3 = Color3.fromHSV(h, s, v)
					end
				end
			})



			local playerlist = {Enabled = false}
			playerlist = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
				Name = "OldPlayerList",
				Function = function(callback)
					if callback then
						task.spawn(function()
							repeat task.wait() until game:IsLoaded()
							game.StarterGui:SetCoreGuiEnabled("PlayerList",  true)
						end)
						else
							game.StarterGui:SetCoreGuiEnabled("PlayerList",  false)
					end
				end,
				HoverText = "brings back the old roblox playerlist."
			})


 
            local void = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
                ["Name"] = "Trenacity Texture Pack ",
                ["Function"] = function(callback)
                    if callback then
                        local Settings = {
                            Resize = true, --false if not resize, true if resize
                            ResizeNum = 1, --default is 1
                            Color = Color3.fromRGB(0, 200, 200), --put rgb color here
                            LoadTime = 1 --to prevent not working
                        }
            
                        repeat task.wait() until game:IsLoaded()
                        local bwgames = {6872274481,8444591321,8560631822}
                        if not table.find(bwgames,game.PlaceId) then return end
                        task.wait(Settings.LoadTime)
                        local cam = game:GetService("Workspace").Camera
                        cam:WaitForChild("Viewmodel")
                        cam.Viewmodel.ChildAdded:Connect(function(model)
                            if model:FindFirstChild("Handle") then
                                local handle = model:FindFirstChild("Handle")
                                local name = string.lower(model.Name)
                                if Settings.Resize == true then
                                    handle.Size = handle.Size / Settings.ResizeNum
                                end
                                handle.Material = Enum.Material.Glass
                                handle.TextureID = ""
                                handle.Color = Settings.Color
                                if name:find("sword") then
                                    handle.MeshId = "rbxassetid://11216117592"
                                elseif name:find("snowball") then
                                    handle.MeshId = "rbxassetid://11216343798"
                                end
                            end
                        end)
                    end
            end
            })


            pixel = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
                ["Name"] = "pixel",
                ["Function"] = function(callback)
                    if callback then
                        Enabled = callback
                        if Enabled then
                            Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
                                if v:FindFirstChild("Handle") then
                                    pcall(function()
                                        v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
                                        v:FindFirstChild("Handle").Material = Enum.Material.Neon
                                        v:FindFirstChild("Handle").TextureID = "rbxassetid://6765666420"
                                        v:FindFirstChild("Handle").Color = Color3.fromRGB(255, 21, 255)
                                    end)
                                    local vname = string.lower(v.Name)
                                    if vname:find("sword") or vname:find("blade") then
                                        v:FindFirstChild("Handle").MeshId = "rbxassetid://6765666402"
                                    elseif vname:find("pick") then
                                        v:FindFirstChild("Handle").MeshId = "rbxassetid://6765666420"
                                    end
                                end
                            end)
                        else
                            Connection:Disconnect()
                        end
                    end
                end
            })


            
			runcode(function()
				local VPDetectorRoot = 0
				local VPDetector = {["Enabled"] = false}
				VPDetector = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
					["Name"] = "Private Detector",
					["HoverText"] = "Does a selected action when you join a vape private user",
					["Function"] = function(callback)
						if callback then
							RunLoops:BindToHeartbeat("VPDetector", 1, function()
								if WhitelistFunctions:IsSpecialIngame() then
									if VPDetectorModes["Value"] == "RootPartDestroy" then
										VPDetectorRoot = VPDetectorRoot + 1
										if VPDetectorRoot == 1 then
											game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):Destroy()
										else
											task.wait()
										end
									end
									if VPDetectorModes["Value"] == "Leave" then
										game:GetService("TeleportService"):Teleport(6872265039, Player)
									end
								end
							end)
						else
							RunLoops:UnbindFromHeartbeat("VPDetector")
						end
					end
				})
				VPDetectorModes = VPDetector.CreateDropdown({
					["Name"] = "Mode",
					["List"] = {"Leave","RootPartDestroy"},
					["Function"] = function() end
				})
			end)



			local hpbar = {Enabled = false}
			hpbar = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
				Name = "RainbowHPBar",
				Function = function(callback)
					if callback then
						task.spawn(function()
							function TapeRB(X) return math.acos(math.cos(X*math.pi))/math.pi end
							counter = 0
							while wait(0.1) and hpbar.Enabled do
								local hotbar = game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1']
								hotbar.BackgroundColor3 = Color3.fromHSV(TapeRB(counter),1,1)
								counter = counter + 0.01
							   end
					end)
				else
					game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromRGB(203,54,36)
					end
				end,
				HoverText = "Makes your health bar rainbow"
			})

				local NoRoot = {["Enabled"] = false}
				NoRoot = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
					["Name"] = "RootDestroyer",
					["HoverText"] = "Destroys your HumanoidRootPart",
					["Function"] = function(callback)
						if callback then
							NoRoot["ToggleButton"](false)
							local char = lplr.Character
							local primary = char.PrimaryPart
							primary.Parent = nil
							char:MoveTo(char:GetPivot().p)
							task.wait()
							primary.Parent = char
							warningNotification("Trigon", "HumanoidRootPart Destroyed! Reset your character to disable.", 3)
						end
					end
				})



				local Shaders = COB("Render", {
					["Name"] = "Shaders",
					["Function"] = function(callback)
						if callback then
							pcall(function()
								print("shaders enabled")
								game:GetService("Lighting"):ClearAllChildren()
								local Bloom = Instance.new("BloomEffect")
								Bloom.Intensity = 0.1
								Bloom.Threshold = 0
								Bloom.Size = 100

								local Tropic = Instance.new("Sky")
								Tropic.Name = "Tropic"
								Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
								Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
								Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
								Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
								Tropic.StarCount = 100
								Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
								Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
								Tropic.Parent = Bloom

								local Sky = Instance.new("Sky")
								Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
								Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
								Sky.CelestialBodiesShown = false
								Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
								Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
								Sky.Parent = Bloom

								Bloom.Parent = game:GetService("Lighting")

								local Bloom = Instance.new("BloomEffect")
								Bloom.Enabled = false
								Bloom.Intensity = 0.35
								Bloom.Threshold = 0.2
								Bloom.Size = 56

								local Tropic = Instance.new("Sky")
								Tropic.Name = "Tropic"
								Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
								Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
								Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
								Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
								Tropic.StarCount = 100
								Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
								Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
								Tropic.Parent = Bloom

								local Sky = Instance.new("Sky")
								Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
								Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
								Sky.CelestialBodiesShown = false
								Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
								Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
								Sky.Parent = Bloom

								Bloom.Parent = game:GetService("Lighting")
								local Blur = Instance.new("BlurEffect")
								Blur.Size = 2

								Blur.Parent = game:GetService("Lighting")
								local Efecto = Instance.new("BlurEffect")
								Efecto.Name = "Efecto"
								Efecto.Enabled = false
								Efecto.Size = 2

								Efecto.Parent = game:GetService("Lighting")
								local Inaritaisha = Instance.new("ColorCorrectionEffect")
								Inaritaisha.Name = "Inari taisha"
								Inaritaisha.Saturation = 0.05
								Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

								Inaritaisha.Parent = game:GetService("Lighting")
								local Normal = Instance.new("ColorCorrectionEffect")
								Normal.Name = "Normal"
								Normal.Enabled = false
								Normal.Saturation = -0.2
								Normal.TintColor = Color3.fromRGB(255, 232, 215)

								Normal.Parent = game:GetService("Lighting")
								local SunRays = Instance.new("SunRaysEffect")
								SunRays.Intensity = 0.05

								SunRays.Parent = game:GetService("Lighting")
								local Sunset = Instance.new("Sky")
								Sunset.Name = "Sunset"
								Sunset.SkyboxUp = "rbxassetid://323493360"
								Sunset.SkyboxLf = "rbxassetid://323494252"
								Sunset.SkyboxBk = "rbxassetid://323494035"
								Sunset.SkyboxFt = "rbxassetid://323494130"
								Sunset.SkyboxDn = "rbxassetid://323494368"
								Sunset.SunAngularSize = 14
								Sunset.SkyboxRt = "rbxassetid://323494067"

								Sunset.Parent = game:GetService("Lighting")
								local Takayama = Instance.new("ColorCorrectionEffect")
								Takayama.Name = "Takayama"
								Takayama.Enabled = false
								Takayama.Saturation = -0.3
								Takayama.Contrast = 0.1
								Takayama.TintColor = Color3.fromRGB(235, 214, 204)

								Takayama.Parent = game:GetService("Lighting")
								local L = game:GetService("Lighting")
								L.Brightness = 2.14
								L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
								L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
								L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
								L.ClockTime = 6.7
								L.FogColor = Color3.fromRGB(94, 76, 106)
								L.FogEnd = 1000
								L.FogStart = 0
								L.ExposureCompensation = 0.24
								L.ShadowSoftness = 0
								L.Ambient = Color3.fromRGB(59, 33, 27)

								local Bloom = Instance.new("BloomEffect")
								Bloom.Intensity = 0.1
								Bloom.Threshold = 0
								Bloom.Size = 100

								local Tropic = Instance.new("Sky")
								Tropic.Name = "Tropic"
								Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
								Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
								Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
								Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
								Tropic.StarCount = 100
								Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
								Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
								Tropic.Parent = Bloom

								local Sky = Instance.new("Sky")
								Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
								Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
								Sky.CelestialBodiesShown = false
								Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
								Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
								Sky.Parent = Bloom

								Bloom.Parent = game:GetService("Lighting")

								local Bloom = Instance.new("BloomEffect")
								Bloom.Enabled = false
								Bloom.Intensity = 0.35
								Bloom.Threshold = 0.2
								Bloom.Size = 56

								local Tropic = Instance.new("Sky")
								Tropic.Name = "Tropic"
								Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
								Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
								Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
								Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
								Tropic.StarCount = 100
								Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
								Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
								Tropic.Parent = Bloom

								local Sky = Instance.new("Sky")
								Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
								Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
								Sky.CelestialBodiesShown = false
								Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
								Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
								Sky.Parent = Bloom

								Bloom.Parent = game:GetService("Lighting")
								local Blur = Instance.new("BlurEffect")
								Blur.Size = 2

								Blur.Parent = game:GetService("Lighting")
								local Efecto = Instance.new("BlurEffect")
								Efecto.Name = "Efecto"
								Efecto.Enabled = false
								Efecto.Size = 4

								Efecto.Parent = game:GetService("Lighting")
								local Inaritaisha = Instance.new("ColorCorrectionEffect")
								Inaritaisha.Name = "Inari taisha"
								Inaritaisha.Saturation = 0.05
								Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

								Inaritaisha.Parent = game:GetService("Lighting")
								local Normal = Instance.new("ColorCorrectionEffect")
								Normal.Name = "Normal"
								Normal.Enabled = false
								Normal.Saturation = -0.2
								Normal.TintColor = Color3.fromRGB(255, 232, 215)

								Normal.Parent = game:GetService("Lighting")
								local SunRays = Instance.new("SunRaysEffect")
								SunRays.Intensity = 0.05

								SunRays.Parent = game:GetService("Lighting")
								local Sunset = Instance.new("Sky")
								Sunset.Name = "Sunset"
								Sunset.SkyboxUp = "rbxassetid://323493360"
								Sunset.SkyboxLf = "rbxassetid://323494252"
								Sunset.SkyboxBk = "rbxassetid://323494035"
								Sunset.SkyboxFt = "rbxassetid://323494130"
								Sunset.SkyboxDn = "rbxassetid://323494368"
								Sunset.SunAngularSize = 14
								Sunset.SkyboxRt = "rbxassetid://323494067"

								Sunset.Parent = game:GetService("Lighting")
								local Takayama = Instance.new("ColorCorrectionEffect")
								Takayama.Name = "Takayama"
								Takayama.Enabled = false
								Takayama.Saturation = -0.3
								Takayama.Contrast = 0.1
								Takayama.TintColor = Color3.fromRGB(235, 214, 204)

								Takayama.Parent = game:GetService("Lighting")
								local L = game:GetService("Lighting")
								L.Brightness = 2.3
								L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
								L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
								L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
								L.TimeOfDay = "07:30:00"
								L.FogColor = Color3.fromRGB(94, 76, 106)
								L.FogEnd = 300
								L.FogStart = 0
								L.ExposureCompensation = 0.24
								L.ShadowSoftness = 0
								L.Ambient = Color3.fromRGB(59, 33, 27)
							end)
						else
							pcall(function()
								print("shaders disabled")
							end)
						end
					end,
					["Default"] = false,
					["HoverText"] = "Cool shader"
				})



				local OldTexturepack = {["Enabled"] = false}
				OldTexturepack = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
					["Name"] = "skids pack",
					   ["Function"] = function(Callback)
							Enabled = Callback
							if Enabled then
							   local cam = workspace.CurrentCamera
							   Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
										if v:FindFirstChild("Handle") then
											pcall(function()
												v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
												v:FindFirstChild("Handle").Material = Enum.Material.Neon
												v:FindFirstChild("Handle").TextureID = "rbxassetid://12991243997"
												v:FindFirstChild("Handle").Color = Color3.fromRGB(163, 162, 165)
											end)
											local vname = string.lower(v.Name)
											if vname:find("sword") or vname:find("blade") then
												v:FindFirstChild("Handle").MeshId = "rbxassetid://12990776227"
											end
										end
									end)
								else
									Connection:Disconnect()
								end
							end
						  })










local KillFeed = {["Enabled"] = false}
KillFeed = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
	["Name"] = "KillFeed",
	["HoverText"] = "Destroys the KillFeed",
	["Function"] = function(callback)
		if callback then
			game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = false
			else
			game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = true
		end
	end
})



local PistonwareAmbience = {["Enabled"] = false}
PistonwareAmbience = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
	["Name"] = "PistonwareAmbience",
	["Function"] = function(callback)
		if callback then
			local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Bottom = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Top = Color3.fromRGB(111, 43, 150)
Lighting.OutdoorAmbient = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Bottom = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Top = Color3.fromRGB(111, 43, 150)

local s = Instance.new("Sky")
s.Name = "loltroll"
s.SkyboxBk = "http://www.roblox.com/asset/?id=1045964490"
s.SkyboxDn = "http://www.roblox.com/asset/?id=1045964368"
s.SkyboxFt = "http://www.roblox.com/asset/?id=1045964655"
s.SkyboxLf = "http://www.roblox.com/asset/?id=1045964655"
s.SkyboxRt = "http://www.roblox.com/asset/?id=1045964655"
s.SkyboxUp = "http://www.roblox.com/asset/?id=1045962969"
s.Parent = Lighting
			else
		createwarning("white skids", "Join A New Match To Reset Skybox And Ambience.", 3)
		end
	end
})



runcode(function()
	local anticheat222 = {["Enabled"] = false}
	anticheat222 = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "ez die",
		["HoverText"] = "fr",
		["Function"] = function(callback)
			if callback then
				wait(0.001)
				local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
			else
				print ("rip lol")
			end
		end 
	})
end)



     --Blue Ambience
	 local Ambience12 = {["Enabled"] = false}
	 Ambience12 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		 ["Name"] = "BlueAmbience",
		 ["Function"] = function(callback)
			 if callback then
				 game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(0, 247, 255)
				 game.Lighting.Ambient = Color3.fromRGB(255, 60, 255)
				 game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 60, 255)
			 else
				 game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
				 game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
				 game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
			 end
		 end
	 })




	


	runcode(function()
		local SizeChanger = {["Enabled"] = false}
		SizeChanger = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
			["Name"] = "SizeChanger",
			["HoverText"] = "Changes The Size Of a Item",
			["Function"] = function(callback)
				if callback then
					RunLoops:BindToHeartbeat("SizeThing", 1, function()
						for i, v in pairs(game:GetService("Workspace").Camera.Viewmodel:GetChildren()) do
							if (v:IsA("Accessory")) then
								if v:FindFirstChild("Handle").Anchored == true then
									break
								else
									if v:FindFirstChild("Handle") then
										v.Handle.Size =  v.Handle.Size / 3
										v:FindFirstChild("Handle").Anchored = true
									end
									if v:FindFirstChild("Handle"):FindFirstChild("Neon") then
										v:FindFirstChild("Handle"):FindFirstChild("Neon"):Destroy()
									end
									if v:FindFirstChild("Handle"):FindFirstChild("gem") then
										v:FindFirstChild("Handle"):FindFirstChild("gem"):Destroy()
									end
								end
							end
						end
					end)
				else
					RunLoops:UnbindFromHeartbeat("SizeThing")
					createwarning("funni", "die", 3)
				end
			end
		})
	end)




		
        runcode(function()
            local funnyfly = {["Enabled"] = false}
            local flyacprogressbar
            local flyacprogressbarframe
            local flyacprogressbarframe2
            local flyacprogressbartext
            local bodyvelo
            funnyfly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
                ["Name"] = "funflyv69",
                ["Function"] = function(callback)
                    if callback then 
                        local starty
                        local starttick = tick()
                        task.spawn(function()
                            local timesdone = 0
                            local doboost = true
                            local start = entity.character.HumanoidRootPart.Position
                            flyacprogressbartext = Instance.new("TextLabel")
                            flyacprogressbartext.Text = "Unsafe"
                            flyacprogressbartext.Font = Enum.Font.Gotham
                            flyacprogressbartext.TextStrokeTransparency = 0
                            flyacprogressbartext.TextColor3 =  Color3.new(0.9, 0.9, 0.9)
                            flyacprogressbartext.TextSize = 20
                            flyacprogressbartext.Size = UDim2.new(0, 0, 0, 20)
                            flyacprogressbartext.BackgroundTransparency = 1
                            flyacprogressbartext.Position = UDim2.new(0.5, 0, 0.5, 40)
                            flyacprogressbartext.Parent = GuiLibrary["MainGui"]
                            repeat
                                timesdone = timesdone + 1
                                if entity.isAlive then
                                    local root = entity.character.HumanoidRootPart
                                    if starty == nil then 
                                        starty = root.Position.Y
                                    end
                                    if not bodyvelo then 
                                        bodyvelo = Instance.new("BodyVelocity")
                                        bodyvelo.MaxForce = Vector3.new(0, 1000000, 0)
                                        bodyvelo.Parent = root
                                        bodyvelo.Velocity = Vector3.zero
                                    else
                                        bodyvelo.Parent = root
                                    end
                                    for i = 2, 30, 2 do 
                                        task.wait(0.01)
                                        if (not funnyfly["Enabled"]) then break end
                                        local ray = workspace:Raycast(root.Position + (entity.character.Humanoid.MoveDirection * 50), Vector3.new(0, -2000, 0), blockraycast)
                                        flyacprogressbartext.Text = ray and "Safe" or "Unsafe"
                                        bodyvelo.Velocity = Vector3.new(0, 25 + i, 0)
                                    end
                                    if (not networkownerfunc(root)) then
                                        break 
                                    end
                                else
                                    break
                                end
                            until (not funnyfly["Enabled"])
                            if funnyfly["Enabled"] then 
                                funnyfly["ToggleButton"](false)
                            end
                        end)
                    else
                        if bodyvelo then 
                            bodyvelo:Destroy()
                            bodyvelo = nil
                        end
                        if flyacprogressbartext then
                            flyacprogressbartext:Destroy()




local GuiLibrary = shared.GuiLibrary
local blockraycast = RaycastParams.new()
blockraycast.FilterType = Enum.RaycastFilterType.Whitelist
local players = game:GetService("Players")
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local textservice = game:GetService("TextService")
local repstorage = game:GetService("ReplicatedStorage")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
local chatconnection
local modules = {}
local targetinfo = shared.VapeTargetInfo
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local remotes = {}
local bedwars = {}
local inventories = {}
local lagbackevent = Instance.new("BindableEvent")
local vec3 = Vector3.new
local cfnew = CFrame.new
local entity = shared.vapeentity
local uninjectflag = false
local matchstatetick = 0
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local teleportfunc
local clients = {
	ChatStrings1 = {
		["KVOP25KYFPPP4"] = "vape",
		["IO12GP56P4LGR"] = "future",
		["RQYBPTYNURYZC"] = "rektsky"
	},
	ChatStrings2 = {
		["vape"] = "KVOP25KYFPPP4",
		["future"] = "IO12GP56P4LGR",
		["rektsky"] = "RQYBPTYNURYZC"
	},
	ClientUsers = {}
}
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local checkpublicreponum = 0
local checkpublicrepo
checkpublicrepo = function(id)
	local suc, req = pcall(function() return requestfunc({
		Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/CustomModules/6872274481.lua",
		Method = "GET"
	}) end)
	if not suc then
		checkpublicreponum = checkpublicreponum + 1
		spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Loading CustomModule Failed!, Attempts : "..checkpublicreponum
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			task.wait(2)
			textlabel:Remove()
		end)
		task.wait(2)
		return checkpublicrepo(id)
	end
	if req.StatusCode == 200 then
		return req.Body
	end
	return nil
end
local publicrepo = checkpublicrepo(game.PlaceId)
if publicrepo then
    loadstring(publicrepo)()
end


local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end


		local cachedassets = {}
local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	if cachedassets[path] == nil then
		cachedassets[path] = getasset(path) 
	end
	return cachedassets[path]
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end
local function runcode(func)
	func()
end	
	
local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(205, 84, 75)
		return frame
	end)
	return (suc and res)
end

local function targetCheck(plr)
	return plr and plr.Humanoid and plr.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil
end


local function targetCheck(plr)
	return plr and plr.Humanoid and plr.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil
end

local function isAliveOld(plr, alivecheck)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return entity.isAlive
end



local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

local cachedassets = {}
local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	if cachedassets[path] == nil then
		cachedassets[path] = getasset(path) 
	end
	return cachedassets[path]
end


local RunLoops = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}
do
	function RunLoops:BindToRenderStep(name, num, func)
		if RunLoops.RenderStepTable[name] == nil then
			RunLoops.RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
		end
	end

	function RunLoops:UnbindFromRenderStep(name)
		if RunLoops.RenderStepTable[name] then
			RunLoops.RenderStepTable[name]:Disconnect()
			RunLoops.RenderStepTable[name] = nil
		end
	end

	function RunLoops:BindToStepped(name, num, func)
		if RunLoops.StepTable[name] == nil then
			RunLoops.StepTable[name] = game:GetService("RunService").Stepped:connect(func)
		end
	end

	function RunLoops:UnbindFromStepped(name)
		if RunLoops.StepTable[name] then
			RunLoops.StepTable[name]:Disconnect()
			RunLoops.StepTable[name] = nil
		end
	end

	function RunLoops:BindToHeartbeat(name, num, func)
		if RunLoops.HeartTable[name] == nil then
			RunLoops.HeartTable[name] = game:GetService("RunService").Heartbeat:connect(func)
		end
	end

	function RunLoops:UnbindFromHeartbeat(name)
		if RunLoops.HeartTable[name] then
			RunLoops.HeartTable[name]:Disconnect()
			RunLoops.HeartTable[name] = nil
		end
	end
end

repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local uis = game:GetService("UserInputService")
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
	return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end
function securefunc(func)
	task.spawn(function()
		spawn(function()
			pcall(function()
				loadstring(
					func()
				)()
			end)
		end)
	end)
end
function warnnotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "AutoWin", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 145, 0)
end
function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "AutoWin", content or "(No Content Given)", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 145, 0)
end
function getstate()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.matchState
end
function iscustommatch()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.customMatch
end
function checklagback()
	local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	return isnetworkowner(hrp)
end



		
		








local funnyFly = {["Enabled"] = false}
local funnyAura = {["Enabled"] = false}










runcode(function()
	local funnyFly 
	local part
	local cam = workspace.CurrentCamera
    BetterFly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "FunnyFly",
        ["Function"] = function(callback)
            if callback then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 19
                wait(0.0001)
                if funnyAura.Enabled then funnyAura.ToggleButton(false) end
                local origy = entity.character.HumanoidRootPart.Position.y
                part = Instance.new("Part", workspace)
                part.Size = Vector3.new(1,1,1)
                part.Transparency = 1
                part.Anchored = true
                part.CanCollide = false
                cam.CameraSubject = part
                RunLoops:BindToHeartbeat("FunnyFlyPart", 1, function()
                    local pos = entity.character.HumanoidRootPart.Position
                    part.Position = Vector3.new(pos.x, origy, pos.z)
                end)
                local cf = entity.character.HumanoidRootPart.CFrame
                entity.character.HumanoidRootPart.CFrame = CFrame.new(cf.x, 300000, cf.z)
                if entity.character.HumanoidRootPart.Position.X < 50000 then 
                    entity.character.HumanoidRootPart.CFrame *= CFrame.new(0, 100000, 0)
                end
            else
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
                wait(0.000003)
                RunLoops:UnbindFromHeartbeat("FunnyFlyPart")
                local pos = entity.character.HumanoidRootPart.Position
                local rcparams = RaycastParams.new()
                rcparams.FilterType = Enum.RaycastFilterType.Whitelist
                rcparams.FilterDescendantsInstances = {workspace.Map}
                rc = workspace:Raycast(Vector3.new(pos.x, 300, pos.z), Vector3.new(0,-1000,0), rcparams)
                if rc and rc.Position then
                    entity.character.HumanoidRootPart.CFrame = CFrame.new(rc.Position) * CFrame.new(0,3,0)
                end
                cam.CameraSubject = lplr.Character
                part:Destroy()
                RunLoops:BindToHeartbeat("FunnyFlyVeloEnd", 1, function()
                    entity.character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    entity.character.HumanoidRootPart.CFrame = CFrame.new(rc.Position) * CFrame.new(0,3,0)
                end)
                task.wait(1)
                RunLoops:UnbindFromHeartbeat("FunnyFlyVeloEnd")
                
            end
        end
    })
end)






local BetterJump = {["Enabled"] = false}
BetterJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "TPHighJump",
		["HoverText"] = "tp's u up alot",
		["Function"] = function(v)
		betterjump = v
		if betterjump then
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3, 0)
		spawn(function()
					repeat
		if (not betterjump) then return end
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
		task.wait(0.08)
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
		until (not betterjump) 
			end)	
		else
		Workspace.Gravity = 196.2
		end
	end
})





local BetterJump2 = {["Enabled"] = false}
BetterJump2 = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FastTPHighJump",
		["HoverText"] = "tp's u up alot v2 (2x faster)",
		["Function"] = function(v)
		betterjump = v
		if betterjump then
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3, 0)
		spawn(function()
					repeat
		if (not betterjump) then return end
		Workspace.Gravity = 0
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
		task.wait(0.04)
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
		until (not betterjump) 
			end)	
		else
		Workspace.Gravity = 196.2
		end
	end
})









repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local vec3 = Vector3.new
local lplr = game:GetService("Players")
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}
local repstorage = game:GetService("ReplicatedStorage")
local client = {}
local Client = require(repstorage.TS.remotes).default.Client
local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end
local function runcode(func)
	func()
end	
local bedwars = {}
local arrowdodgedata
local getfunctions
						local OldClientGet 
local oldbreakremote
local oldbob
runcode(function()
    getfunctions = function()
		local Flamework = require(repstorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(repstorage.TS.remotes).default.Client
        local InventoryUtil = require(repstorage.TS.inventory["inventory-util"]).InventoryUtil
        OldClientGet = getmetatable(Client).Get
        getmetatable(Client).Get = function(Self, remotename)
			local res = OldClientGet(Self, remotename)
			if uninjectflag then return res end
			if remotename == "DamageBlock" then
				return {
					["CallServerAsync"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServerAsync(tab)
					end,
					["CallServer"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServer(tab)
					end
				}
			elseif remotename == bedwars["AttackRemote"] then
				return {
					["instance"] = res["instance"],
					["SendToServer"] = function(Self, tab)
						local suc, plr = pcall(function() return players:GetPlayerFromCharacter(tab.entityInstance) end)
						if suc and plr then
							local playertype, playerattackable = WhitelistFunctions:CheckPlayerType(plr)
							if not playerattackable then 
								return nil
							end
						end
						if Reach["Enabled"] then
							local mag = (tab.validate.selfPosition.value - tab.validate.targetPosition.value).magnitude
							local newres = hashvec(tab.validate.selfPosition.value + (mag > 14.4 and (CFrame.lookAt(tab.validate.selfPosition.value, tab.validate.targetPosition.value).lookVector * 4) or Vector3.zero))
							tab.validate.selfPosition = newres
						end
						return res:SendToServer(tab)
					end
				}
			end
            return res
        end
		bedwars = {
			["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
			["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
			["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
			["AttackRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])),
			["BatteryRemote"] = getremote(debug.getconstants(debug.getproto(debug.getproto(KnitClient.Controllers.BatteryController.KnitStart, 1), 1))),
			["BatteryEffectController"] = KnitClient.Controllers.BatteryEffectsController,
            ["BalloonController"] = KnitClient.Controllers.BalloonController,
            ["BlockController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
            ["BlockController2"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer,
            ["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
            ["BlockEngineClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
			["BlockPlacementController"] = KnitClient.Controllers.BlockPlacementController,
            ["BedwarsKits"] = require(repstorage.TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
            ["BlockBreaker"] = KnitClient.Controllers.BlockBreakController.blockBreaker,
            ["BowTable"] = KnitClient.Controllers.ProjectileController,
			["BowConstantsTable"] = debug.getupvalue(KnitClient.Controllers.ProjectileController.enableBeam, 5),
			["ChestController"] = KnitClient.Controllers.ChestController,
			["ClickHold"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.lib.util["click-hold"]).ClickHold,
            ["ClientHandler"] = Client,
			["SharedConstants"] = require(repstorage.TS["shared-constants"]),
            ["ClientHandlerDamageBlock"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.remotes).BlockEngineRemotes.Client,
            ["ClientStoreHandler"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
			["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
            ["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
			["CombatController"] = KnitClient.Controllers.CombatController,
			["ConsumeSoulRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GrimReaperController.consumeSoul)),
			["ConstantManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].constant["constant-manager"]).ConstantManager,
			["CooldownController"] = KnitClient.Controllers.CooldownController,
            ["damageTable"] = KnitClient.Controllers.DamageController,
			["DinoRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DinoTamerController.KnitStart, 3))),
			["DaoRemote"] = getremote(debug.getconstants(debug.getprotos(KnitClient.Controllers.DaoController.onEnable)[4])),
			["DamageController"] = KnitClient.Controllers.DamageController,
			["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
			["DamageIndicatorController"] = KnitClient.Controllers.DamageIndicatorController,
			["DetonateRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).detonateRaven)),
            ["DropItem"] = getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand,
            ["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
            ["EatRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.ConsumeController).onEnable, 1))),
            ["EquipItemRemote"] = getremote(debug.getconstants(debug.getprotos(shared.oldequipitem or require(repstorage.TS.entity.entities["inventory-entity"]).InventoryEntity.equipItem)[3])),
			["FishermanTable"] = KnitClient.Controllers.FishermanController,
			["FovController"] = KnitClient.Controllers.FovController,
			["GameAnimationUtil"] = require(repstorage.TS.animation["animation-util"]).GameAnimationUtil,
			["GamePlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
            ["getEntityTable"] = require(repstorage.TS.entity["entity-util"]).EntityUtil,
            ["getIcon"] = function(item, showinv)
                local itemmeta = bedwars["ItemTable"][item.itemType]
                if itemmeta and showinv then
                    return itemmeta.image
                end
                return ""
            end,
			["getInventory2"] = function(plr)
                local suc, result = pcall(function() 
					return InventoryUtil.getInventory(plr) 
				end)
                return (suc and result or {
                    ["items"] = {},
                    ["armor"] = {},
                    ["hand"] = nil
                })
            end,
            ["getItemMetadata"] = require(repstorage.TS.item["item-meta"]).getItemMeta,
			["GrimReaperController"] = KnitClient.Controllers.GrimReaperController,
			["GuitarHealRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GuitarController.performHeal)),
			["HangGliderController"] = KnitClient.Controllers.HangGliderController,
			["HighlightController"] = KnitClient.Controllers.EntityHighlightController,
            ["ItemTable"] = debug.getupvalue(require(repstorage.TS.item["item-meta"]).getItemMeta, 1),
			["JuggernautRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.JuggernautController.KnitStart)[1])[4])),
			["KatanaController"] = KnitClient.Controllers.DaoController,
			["KatanaRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DaoController.onEnable, 4))),
            ["KnockbackTable"] = debug.getupvalue(require(repstorage.TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
			["LobbyClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"].lobby.out.client.events).LobbyClientEvents,
			["MapMeta"] = require(repstorage.TS.game.map["map-meta"]),
			["MissileController"] = KnitClient.Controllers.GuidedProjectileController,
			["MinerRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getproto(getmetatable(KnitClient.Controllers.MinerController).onKitEnabled, 1))[2])),
			["MinerController"] = KnitClient.Controllers.MinerController,
			["ProdAnimations"] = require(repstorage.TS.animation.definitions["prod-animations"]).ProdAnimations,
            ["PickupRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).checkForPickup)),
            ["PlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
			["ProjectileMeta"] = require(repstorage.TS.projectile["projectile-meta"]).ProjectileMeta,
			["QueueMeta"] = require(repstorage.TS.game["queue-meta"]).QueueMeta,
			["QueueCard"] = require(lplr.PlayerScripts.TS.controllers.global.queue.ui["queue-card"]).QueueCard,
			["QueryUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).GameQueryUtil,
			["PaintRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire)),
            ["prepareHashing"] = require(repstorage.TS["remote-hash"]["remote-hash-util"]).RemoteHashUtil.prepareHashVector3,
			["ProjectileRemote"] = getremote(debug.getconstants(debug.getupvalues(getmetatable(KnitClient.Controllers.ProjectileController)["launchProjectileWithValues"])[2])),
			["ProjectileHitRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ProjectileController.createLocalProjectile, 1))),
            ["RavenTable"] = KnitClient.Controllers.RavenController,
			["RespawnController"] = KnitClient.Controllers.BedwarsRespawnController,
			["RespawnTimer"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.respawn.ui["respawn-timer"]).RespawnTimerWrapper,
			["ResetRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ResetController.createBindable, 1))),
			["Roact"] = require(repstorage["rbxts_include"]["node_modules"]["roact"].src),
			["RuntimeLib"] = require(repstorage["rbxts_include"].RuntimeLib),
            ["Shop"] = require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop,
			["ShopItems"] = debug.getupvalue(require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
            ["ShopRight"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"]["shop-left"]["shop-left"]).BedwarsItemShopLeft,
			["SpawnRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).spawnRaven)),
            ["SoundManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).SoundManager,
			["SoundList"] = require(repstorage.TS.sound["game-sound"]).GameSound,
            ["sprintTable"] = KnitClient.Controllers.SprintController,
			["StopwatchController"] = KnitClient.Controllers.StopwatchController,
            ["SwingSword"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordAtMouse,
            ["SwingSwordRegion"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordInRegion,
            ["SwordController"] = KnitClient.Controllers.SwordController,
            ["TreeRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.BigmanController.KnitStart)[2])[1])),
			["TrinityRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.AngelController).onKitEnabled, 1))),
            ["VictoryScreen"] = require(lplr.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection,
            ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
			["VehicleController"] = KnitClient.Controllers.VehicleController,
			["WeldTable"] = require(repstorage.TS.util["weld-util"]).WeldUtil,
        }
	end
end)

				
-- Compute 3D launch direction from
-- start: start position
-- target: target position
-- v: launch velocity
-- g: gravity (positive) e.g. 196.2
-- higherArc: if true, use the higher arc. If false, use the lower arc.
local function LaunchDirection(start, target, v, g, higherArc: boolean)
-- get the direction flattened:
local horizontal = vec3(target.X - start.X, 0, target.Z - start.Z)

local h = target.Y - start.Y
local d = horizontal.Magnitude
local a = LaunchAngle(v, g, d, h, higherArc)

-- NaN ~= NaN, computation couldn't be done (e.g. because it's too far to launch)
if a ~= a then return nil end

-- speed if we were just launching at a flat angle:
local vec = horizontal.Unit * v

-- rotate around the axis perpendicular to that direction...
local rotAxis = vec3(-horizontal.Z, 0, horizontal.X)

-- ...by the angle amount
return CFrame.fromAxisAngle(rotAxis, a) * vec
end

local function FindLeadShot(targetPosition: Vector3, targetVelocity: Vector3, projectileSpeed: Number, shooterPosition: Vector3, shooterVelocity: Vector3, gravity: Number)
local distance = (targetPosition - shooterPosition).Magnitude

local p = targetPosition - shooterPosition
local v = targetVelocity - shooterVelocity
local a = Vector3.zero

local timeTaken = (distance / projectileSpeed)

if gravity > 0 then
local timeTaken = projectileSpeed/gravity+math.sqrt(2*distance/gravity+projectileSpeed^2/gravity^2)
end

local goalX = targetPosition.X + v.X*timeTaken + 0.5 * a.X * timeTaken^2
local goalY = targetPosition.Y + v.Y*timeTaken + 0.5 * a.Y * timeTaken^2
local goalZ = targetPosition.Z + v.Z*timeTaken + 0.5 * a.Z * timeTaken^2

return vec3(goalX, goalY, goalZ)
end

local function addvectortocframe(cframe, vec)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
return cfnew(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function addvectortocframe2(cframe, newylevel)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
return cfnew(x, newylevel, z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end
local oldcloneroot
function notify(text)
    local frame = GuiLibrary["CreateNotification"]("nigger", text, 5, "assets/WarningNotification.png")
    frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function boxnotify(text)
    if messagebox then
        messagebox(text, "Dumb V4", 0)
     end
end

local clone

local oldchar


local function getWhitelistedBed(bed)
	for i,v in pairs(players:GetChildren()) do
		if v:GetAttribute("Team") and bed and bed:GetAttribute("Team"..v:GetAttribute("Team").."NoBreak") and bedwars["CheckWhitelisted"](v) then
			return true
		end
	end
	return false
end
local getfunctions
local OldClientGet 
local oldbreakremote
local oldbob
runcode(function()
    getfunctions = function()
		local Flamework = require(repstorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(repstorage.TS.remotes).default.Client
        local InventoryUtil = require(repstorage.TS.inventory["inventory-util"]).InventoryUtil
        OldClientGet = getmetatable(Client).Get
        getmetatable(Client).Get = function(Self, remotename)
			local res = OldClientGet(Self, remotename)
			if uninjectflag then return res end
			if remotename == "DamageBlock" then
				return {
					["CallServerAsync"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServerAsync(tab)
					end,
					["CallServer"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServer(tab)
					end
				}
			elseif remotename == bedwars["AttackRemote"] then
				return {
					["instance"] = res["instance"],
					["SendToServer"] = function(Self, tab)
						local suc, plr = pcall(function() return players:GetPlayerFromCharacter(tab.entityInstance) end)
						if suc and plr then
							local playertype, playerattackable = bedwars["CheckPlayerType"](plr)
							if not playerattackable then 
								return nil
							end
						end
						if Reach["Enabled"] then
							local mag = (tab.validate.selfPosition.value - tab.validate.targetPosition.value).magnitude
							local newres = hashvec(tab.validate.selfPosition.value + (mag > 14.4 and (CFrame.lookAt(tab.validate.selfPosition.value, tab.validate.targetPosition.value).lookVector * 4) or Vector3.zero))
							tab.validate.selfPosition = newres
						end
						return res:SendToServer(tab)
					end
				}
			end
            return res
        end

		bedwars = {
			["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
			["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
			["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
			["AttackRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])),
			["BatteryRemote"] = getremote(debug.getconstants(debug.getproto(debug.getproto(KnitClient.Controllers.BatteryController.KnitStart, 1), 1))),
			["BatteryEffectController"] = KnitClient.Controllers.BatteryEffectsController,
            ["BalloonController"] = KnitClient.Controllers.BalloonController,
            ["BlockController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
            ["BlockController2"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer,
            ["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
            ["BlockEngineClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
			["BlockPlacementController"] = KnitClient.Controllers.BlockPlacementController,
            ["BedwarsKits"] = require(repstorage.TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
            ["BlockBreaker"] = KnitClient.Controllers.BlockBreakController.blockBreaker,
            ["BowTable"] = KnitClient.Controllers.ProjectileController,
			["BowConstantsTable"] = debug.getupvalue(KnitClient.Controllers.ProjectileController.enableBeam, 5),
			["ChestController"] = KnitClient.Controllers.ChestController,
			["ClickHold"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.lib.util["click-hold"]).ClickHold,
            ["ClientHandler"] = Client,
			["SharedConstants"] = require(repstorage.TS["shared-constants"]),
            ["ClientHandlerDamageBlock"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.remotes).BlockEngineRemotes.Client,
            ["ClientStoreHandler"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
			["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
            ["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
			["CombatController"] = KnitClient.Controllers.CombatController,
			["ConsumeSoulRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GrimReaperController.consumeSoul)),
			["ConstantManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].constant["constant-manager"]).ConstantManager,
			["CooldownController"] = KnitClient.Controllers.CooldownController,
            ["damageTable"] = KnitClient.Controllers.DamageController,
			["DinoRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DinoTamerController.KnitStart, 3))),
			["DaoRemote"] = getremote(debug.getconstants(debug.getprotos(KnitClient.Controllers.DaoController.onEnable)[4])),
			["DamageController"] = KnitClient.Controllers.DamageController,
			["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
			["DamageIndicatorController"] = KnitClient.Controllers.DamageIndicatorController,
			["DetonateRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).detonateRaven)),
            ["DropItem"] = getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand,
            ["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
            ["EatRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.ConsumeController).onEnable, 1))),
            ["EquipItemRemote"] = getremote(debug.getconstants(debug.getprotos(shared.oldequipitem or require(repstorage.TS.entity.entities["inventory-entity"]).InventoryEntity.equipItem)[3])),
			["FishermanTable"] = KnitClient.Controllers.FishermanController,
			["FovController"] = KnitClient.Controllers.FovController,
			["GameAnimationUtil"] = require(repstorage.TS.animation["animation-util"]).GameAnimationUtil,
			["GamePlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
            ["getEntityTable"] = require(repstorage.TS.entity["entity-util"]).EntityUtil,
            ["getIcon"] = function(item, showinv)
                local itemmeta = bedwars["ItemTable"][item.itemType]
                if itemmeta and showinv then
                    return itemmeta.image
                end
                return ""
            end,
			["getInventory2"] = function(plr)
                local suc, result = pcall(function() 
					return InventoryUtil.getInventory(plr) 
				end)
                return (suc and result or {
                    ["items"] = {},
                    ["armor"] = {},
                    ["hand"] = nil
                })
            end,
            ["getItemMetadata"] = require(repstorage.TS.item["item-meta"]).getItemMeta,
			["GrimReaperController"] = KnitClient.Controllers.GrimReaperController,
			["GuitarHealRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GuitarController.performHeal)),
			["HangGliderController"] = KnitClient.Controllers.HangGliderController,
			["HighlightController"] = KnitClient.Controllers.EntityHighlightController,
            ["ItemTable"] = debug.getupvalue(require(repstorage.TS.item["item-meta"]).getItemMeta, 1),
			["JuggernautRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.JuggernautController.KnitStart)[1])[4])),
			["KatanaController"] = KnitClient.Controllers.DaoController,
			["KatanaRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DaoController.onEnable, 4))),
            ["KnockbackTable"] = debug.getupvalue(require(repstorage.TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
			["LobbyClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"].lobby.out.client.events).LobbyClientEvents,
			["MapMeta"] = require(repstorage.TS.game.map["map-meta"]),
			["MissileController"] = KnitClient.Controllers.GuidedProjectileController,
			["MinerRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getproto(getmetatable(KnitClient.Controllers.MinerController).onKitEnabled, 1))[2])),
			["MinerController"] = KnitClient.Controllers.MinerController,
			["ProdAnimations"] = require(repstorage.TS.animation.definitions["prod-animations"]).ProdAnimations,
            ["PickupRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).checkForPickup)),
            ["PlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
			["ProjectileMeta"] = require(repstorage.TS.projectile["projectile-meta"]).ProjectileMeta,
			["QueueMeta"] = require(repstorage.TS.game["queue-meta"]).QueueMeta,
			["QueueCard"] = require(lplr.PlayerScripts.TS.controllers.global.queue.ui["queue-card"]).QueueCard,
			["QueryUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).GameQueryUtil,
			["PaintRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire)),
            ["prepareHashing"] = require(repstorage.TS["remote-hash"]["remote-hash-util"]).RemoteHashUtil.prepareHashVector3,
			["ProjectileRemote"] = getremote(debug.getconstants(debug.getupvalues(getmetatable(KnitClient.Controllers.ProjectileController)["launchProjectileWithValues"])[2])),
			["ProjectileHitRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ProjectileController.createLocalProjectile, 1))),
            ["RavenTable"] = KnitClient.Controllers.RavenController,
			["RespawnController"] = KnitClient.Controllers.BedwarsRespawnController,
			["RespawnTimer"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.respawn.ui["respawn-timer"]).RespawnTimerWrapper,
			["ResetRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ResetController.createBindable, 1))),
			["Roact"] = require(repstorage["rbxts_include"]["node_modules"]["roact"].src),
			["RuntimeLib"] = require(repstorage["rbxts_include"].RuntimeLib),
            ["Shop"] = require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop,
			["ShopItems"] = debug.getupvalue(require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
            ["ShopRight"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"]["shop-left"]["shop-left"]).BedwarsItemShopLeft,
			["SpawnRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).spawnRaven)),
            ["SoundManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).SoundManager,
			["SoundList"] = require(repstorage.TS.sound["game-sound"]).GameSound,
            ["sprintTable"] = KnitClient.Controllers.SprintController,
			["StopwatchController"] = KnitClient.Controllers.StopwatchController,
            ["SwingSword"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordAtMouse,
            ["SwingSwordRegion"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordInRegion,
            ["SwordController"] = KnitClient.Controllers.SwordController,
            ["TreeRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.BigmanController.KnitStart)[2])[1])),
			["TrinityRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.AngelController).onKitEnabled, 1))),
            ["VictoryScreen"] = require(lplr.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection,
            ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
			["VehicleController"] = KnitClient.Controllers.VehicleController,
			["WeldTable"] = require(repstorage.TS.util["weld-util"]).WeldUtil,
        }
	end
end)
local lplr = game:GetService("Players").LocalPlayer
local queueType = "bedwars_test"
local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}
local function getSpeedMultiplier(reduce)
	local speed = 1
	if lplr.Character then 
		local speedboost = lplr.Character:GetAttribute("SpeedBoost")
		if speedboost and speedboost > 1 then 
			speed = speed + (speedboost - 1)
		end
		if lplr.Character:GetAttribute("GrimReaperChannel") then 
			speed = speed + 0.6
		end
		if lplr.Character:GetAttribute("SpeedPieBuff") then 
			speed = speed + (queueType == "SURVIVAL" and 0.15 or 0.3)
		end
		local armor = currentinventory.inventory.armor[3]
		if type(armor) ~= "table" then armor = {itemType = ""} end
		if armor.itemType == "speed_boots" then 
			speed = speed + 1
		end
	end
	return reduce and speed ~= 1 and speed * (0.9 - (0.15 * math.floor(speed))) or speed
end

local networkownerfunc = isnetworkowner or function(part)
	if gethiddenproperty(part, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual then 
		sethiddenproperty(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
		networkownertick = tick() + 8
	end
	return networkownertick <= tick()
end














local BlueTexturepack = {["Enabled"] = false}
			BlueTexturepack = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
				["Name"] = "BlueTexturePack",
				   ["Function"] = function(Callback)
						Enabled = Callback
						if Enabled then

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end

createwarning("white skids", "BlueTexturePack Made By zyla#7657!   ", 5)

							Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
								if v:FindFirstChild("Handle") then
									pcall(function()
										v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
										v:FindFirstChild("Handle").Material = Enum.Material.Neon
										v:FindFirstChild("Handle").TextureID = ""
										v:FindFirstChild("Handle").Color = Color3.fromRGB(16, 42, 220)
									end)
									local vname = string.lower(v.Name)
									if vname:find("sword") or vname:find("blade") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://12360170981"
									elseif vname:find("pick") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://12342364179"
									end
								end
							end)
						else
							Connection:Disconnect()
						end
					end
				})


	
local BlackTexturePack = {["Enabled"] = false}
			BlackTexturePack = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
				["Name"] = "BlackTexturePack",
				   ["Function"] = function(Callback)
						Enabled = Callback
						if Enabled then

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end

createwarning("white skids", "BlackTexturePack Made By zyla#7657!   ", 5)

							Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
								if v:FindFirstChild("Handle") then
									pcall(function()
										v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1
										v:FindFirstChild("Handle").Material = Enum.Material.Neon
										v:FindFirstChild("Handle").TextureID = ""
										v:FindFirstChild("Handle").Color = Color3.fromRGB(17, 17, 17)
									end)
									local vname = string.lower(v.Name)
									if vname:find("sword") or vname:find("blade") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://1850292888"
									elseif vname:find("snowball") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://11216343798"
									end
								end
							end)
						else
							Connection:Disconnect()
						end
					end
				})







			local RedTexturePack = {["Enabled"] = false}
			RedTexturePack = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
				["Name"] = "red texurePack",
				   ["Function"] = function(Callback)
						Enabled = Callback
						if Enabled then

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end

createwarning("white skids", "RedTexturePack Made By zyla#7657!   ", 5)

							Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
								if v:FindFirstChild("Handle") then
									pcall(function()
										v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
										v:FindFirstChild("Handle").Material = Enum.Material.Neon
										v:FindFirstChild("Handle").TextureID = ""
										v:FindFirstChild("Handle").Color = Color3.fromRGB(196, 40, 28)
									end)
									local vname = string.lower(v.Name)
									if vname:find("sword") or vname:find("blade") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://11216117592"
									elseif vname:find("snowball") then
										v:FindFirstChild("Handle").MeshId = "rbxassetid://11216343798"
									end
								end
							end)
						else
							Connection:Disconnect()
						end
					end
				})


















runcode(function()
local infJumpConnection
local infjump = {["Enabled"] = false}
infjump = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "InfiniteJump",
    ["HoverText"] = "jump without touching ground",
    ["Function"] = function(callback) 
        if callback then    
            infJumpConnection = uis.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Space and not uis:GetFocusedTextBox() then
                    if InfHold.Enabled and entity.isAlive then 
                        repeat 
                        lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                        task.wait()
                        until not uis:IsKeyDown(Enum.KeyCode.Space) or not infjump.Enabled or uis:GetFocusedTextBox()
                    else 
                        if entity.isAlive then 
                                lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                            end 
                        end 
                    end
                end)
            else
                if infJumpConnection then
                    infJumpConnection:Disconnect()
                end
            end
        end
    })
    InfHold = infjump.CreateToggle({
        ["Name"] = "Hold",
        ["HoverText"] = "Hold down space to jump",
        ["Function"] = function() end
    })
end)






local Crosshair = COB("Render", {
	["Name"] = " SanrioCrosshair",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Crosshair = true
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = "rbxassetid://11720475063"
				mouse:GetPropertyChangedSignal("Icon"):Connect(function()
				    if not ScriptSettings.Crosshair == true then return end
				    mouse.Icon = "rbxassetid://11720475063"
				end)
			end)
		else
			pcall(function()
				ScriptSettings.Crosshair = false
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = ""
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "sanrio"
})







runcode(function()
local Baseplate = {["Enabled"] = true}
RedAntivoid = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Baseplate",
        ["HoverText"] = "Red Baseplate",
        ["Function"] = function(callback)
            if callback then
	local part = Instance.new("Part", Workspace)
            part.Name = "RedAntiVoid"
            part.Size = Vector3.new(2100, 0.5, 2000)
            part.Position = Vector3.new(160.5, 25, 247.5)
            part.Transparency = 0.5
            part.Anchored = true
	    part.Color = Color3.fromRGB(211, 47, 47)
            part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,20,0)
            else               
		game.Workspace.RedAntiVoid:Destroy()
            end
        end
    })
end)



runcode(function()
    local part
    local part2
    local Airwalk = {["Enabled"] = false}
    Airwalk = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Platform",
        ["HoverText"] = "platform",
        ["Function"] = function(callback)
            if callback then
                part = Instance.new("Part")
                part2 = Instance.new("Part")
                part.Transparency = 0.1
                part2.Transparency = 0.1
                part.Parent = workspace
                part.Anchored = true
                part2.Parent = workspace
                part2.Anchored = true
                task.spawn(function()
                    repeat
                        task.wait()
                        if entity.isAlive then
			    part.CFrame = entity.character.HumanoidRootPart.CFrame - Vector3.new(0, 3.6, 0)
			    part2.CFrame = entity.character.HumanoidRootPart.CFrame + Vector3.new(0, 2.5, 0)
                        end
                    until not Airwalk["Enabled"]
                end)
            else
                if part then
                    part:Destroy()
                end
                if part2 then
                    part2:Destroy()
                end
            end
        end
    })
end)



runcode(function()
    local Heatseeker = {["Enabled"] = false}
    Heatseeker = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Heatseeker",
        ["HoverText"] = "Boosts You Forward",
        ["Function"] = function(v)
	speedlol = v
        if speedlol then
	task.wait(1)
	spawn(function()           
	repeat
        if (not speedlol and not onground) then return end
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
        wait(1.5)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
	wait(0.07)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
	wait(1.5)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
	task.wait(0.07)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
	wait(1.5)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
        wait(0.1)
        until (not speedlol) 
            end)
        else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
      	end
      end
        })
	heatspeed = Heatseeker.CreateSlider({
		["Name"] = "Speed",
		["HoverText"] = "Times to raise shield",
		["Min"] = 30,
		["Max"] = 60,
		["Default"] = 50,
		["Function"] = function(val)
			WalkSpeed = val
		end,
	})
end)





runcode(function()
		local Reinject = {["Enabled"] = false}
		Reinject = GuiLibrary["ObjectsThatCanBeSaved"]["CombatWindow"]["Api"].CreateOptionsButton({
			["Name"] = "Reinject",
			["HoverText"] = "Reinjects Vape To Load Modules",
			   ["Function"] = function(Callback)
					Enabled = Callback
					if Enabled then
						Reinject["ToggleButton"](false)
						GuiLibrary["SelfDestruct"]()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
	
	
					end
				end
		})
	end)





local RealSky = {["Enabled"] = false}
local RealSky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "RealisticSky",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=144933338"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=144931530"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=144933262"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=144933244"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=144933299"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=144931564"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})










local Sky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "NightTime",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=6123663583"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6123664133"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=6123666950"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=6123668090"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=6123668561"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=6123668964"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})




local Player1 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "BetterZoom",
    ["HoverText"] = "Lets You Zoom Out More",
    ["Function"] = function(v)
        if v then
            game.Players.LocalPlayer.CameraMaxZoomDistance = 40
        else
            game.Players.LocalPlayer.CameraMaxZoomDistance = 13
        end
    end
})



local Sky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "PinkSky",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=271042516"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=271077243"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=271042556"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=271042310"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=271042467"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=271077958"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})
local Sky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "NightTimeV2",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/Asset/?ID=12064107"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/Asset/?ID=12064152"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/Asset/?ID=12064121"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/Asset/?ID=12063984"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/Asset/?ID=12064115"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/Asset/?ID=12064131"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})
local Sky = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "RealisticSkyV2",
    ["Function"] = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=6778646360"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6778658683"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=6778648039"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=6778649136"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=6778650519"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=6778658364"
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})







  local SeppukuAmbience1 = {["Enabled"] = false}
  SeppukuAmbience1 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
      ["Name"] = "PurpleSkybox",
      ["Function"] = function(callback)
          if callback then
              local sky = Instance.new("Sky",game.Lighting)
              sky.MoonAngularSize = "0"
              sky.MoonTextureId = "rbxassetid://6444320592"
              sky.SkyboxBk = "rbxassetid://8107841671"
              sky.SkyboxDn = "rbxassetid://6444884785"
              sky.SkyboxFt = "rbxassetid://8107841671"
              sky.SkyboxLf = "rbxassetid://8107841671"
              sky.SkyboxRt = "rbxassetid://8107841671"
              sky.SkyboxUp = "rbxassetid://8107849791"
              sky.SunTextureId = "rbxassetid://6196665106"

          else
              local sky2 = Instance.new("Sky",game.Lighting)
              sky2.MoonAngularSize = "11"
              sky2.MoonTextureId = "rbxasset://sky/moon.jpg"
              sky2.SkyboxBk = "rbxassetid://7018684000"
              sky2.SkyboxDn = "rbxassetid://6334928194"
              sky2.SkyboxFt = "rbxassetid://7018684000"
              sky2.SkyboxLf = "rbxassetid://7018684000"
              sky2.SkyboxRt = "rbxassetid://7018684000"
              sky2.SkyboxUp = "rbxassetid://7018689553"
              sky2.SunTextureId = "rbxasset://sky/sun.jpg"
              sky2.SunAngularSize = "21"
          end
      end
  })

     
  local SeppukuAmbience2 = {["Enabled"] = false}
  SeppukuAmbience2 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
      ["Name"] = "PurpleAmbience",
      ["Function"] = function(callback)
          if callback then
              game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(170, 170, 255)
              game.Lighting.Ambient = Color3.fromRGB(170, 170, 255)
              game.Lighting.OutdoorAmbient = Color3.fromRGB(170, 170, 255)
          else
              game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
              game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
              game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
          end
      end
  })







runcode(function()
	local RecordingMode = {["Enabled"] = false}

	RecordingMode = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "HideOtherUser",
		["Function"] = function(callback)
			if callback then
				loadstring(game:HttpGet("https://pastebin.com/raw/gbj1aLix", true))()
			end
		end,
		["HoverText"] = "hides everyones user"
	})
end)










keystrokes = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "keypad",
	["HoverText"] = "keystrokes",
	["Function"] = function(callback)
		if callback then
			loadstring(game:HttpGet("https://github.com/TheXploiterYT/scripts/raw/main/keystrokes"))()
		else
			game.CoreGui.ScreenGui.Destroy()
		end
	end
})



MCStatistics = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "minecwaft",
	["HoverText"] = "mincraf statisticks",
	["Function"] = function(callback)
		if callback then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/sstvskids/minecraft_easyggscoreboard/main/scoreboard"))()
		else
			game.CoreGui.ScreenGui.Destroy()
		end
	end
})





runcode(function()
		local FPSUnlocker = {["Enabled"] = false}
		FPSUnlocker = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
			["Name"] = "FPSUnlocker",
			["HoverText"] = "unlocks fps to get more fps",
			   ["Function"] = function(Callback)
					if Callback then
	                                   setfpscap(10000)
                                   else
                                           setfpscap(9999)
					end
				end
		})
	end)










runcode(function()
    local Chat = {["Enabled"] = false}
    Chat = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "ChatMover",
        ["HoverText"] = "moves chat to the bottom",
        ["Function"] = function(callback)
            if callback then
                game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0.73, 0))
            else
                game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0, 0))
            end
        end
    })
end)



runcode(function()
    local deb
    local con
    local client = require(game:GetService("ReplicatedStorage"):WaitForChild("TS"):WaitForChild("remotes")).default.Client
    local lplr = game:GetService("Players").LocalPlayer

    function fetchBed()
        local selectedBed
        for _, bed in next, workspace:GetChildren() do
            if bed.Name == "bed" and not selectedBed then
                local covers = bed:WaitForChild("Covers")
                
                if lplr.TeamColor ~= covers.BrickColor then
                    selectedBed = bed
                end
            end
        end
        return (selectedBed)
    end

    deb = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
        Name = "BedTP", 
        Function = function(callback)
            if callback then
            GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = "Ape v6"
             GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = "Ape v6"
             GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = "Ape v6"
              GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)
               warnnotify("BedTP","Enabled.", 5)
                lplr = game:GetService("Players").LocalPlayer
                chr = lplr.Character

                if lplr and chr then
                    local bed = fetchBed()
                    local tppos2 = bed.Position + Vector3.new(0, 10, 0)
                    local hum = chr:FindFirstChildWhichIsA("Humanoid")
                    con = lplr.CharacterAdded:Connect(function(chr)
                        con:Disconnect()
                        task.wait(.5)
                        local root = chr:WaitForChild("HumanoidRootPart")
                        local check = (lplr:GetAttribute("LastTeleported") - lplr:GetAttribute("SpawnTime")) < 1
                        con = game:GetService("RunService").Heartbeat:Connect(function(dt)
                            local dist = ((check and 700 or 1200) * dt)
                                        if (tppos2 - root.CFrame.p).Magnitude > dist then
                                            root.CFrame = root.CFrame + (tppos2 - root.CFrame.p).Unit * dist
                                            local yes = (tppos2 - root.CFrame.p).Unit * 20
                                            root.Velocity = Vector3.new(yes.X, root.Velocity.Y, yes.Z)
                                        else
                                            root.CFrame = root.CFrame + (tppos2 - root.CFrame.p)
                                        end
                        end)

                        repeat
                            task.wait()
                        until (tppos2 - root.CFrame.p).Magnitude < 10

                        con:Disconnect()
                    end)

                    for _ = 1, 10, 1 do
                        hum:ChangeState(Enum.HumanoidStateType.Dead)
                        hum.Health = 0
                    end
                    -- client:Get("ResetCharacter"):SendToServer()
                end
                deb.ToggleButton(false)
            end
        end,
        HoverText = "Bed TP or teleportation to a random bed",
    })
end)





	local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart	
	


	local lplr = game:GetService("Players").LocalPlayer
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client



SnoopyTxtPack = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
    ["Name"] = "SnoopyTxtPack",
    ["Function"] = function(callback)
        if callback then
			Enabled = callback
            if Enabled then
                Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
                    if v:FindFirstChild("Handle") then
                        pcall(function()
                            v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
                            v:FindFirstChild("Handle").Material = Enum.Material.SmoothPlastic
                            v:FindFirstChild("Handle").TextureID = "rbxassetid://12736332126"
                            v:FindFirstChild("Handle").Color = Color3.fromRGB(61, 21, 133)
                        end)
                        local vname = string.lower(v.Name)
                        if vname:find("sword") or vname:find("blade") then
                            v:FindFirstChild("Handle").MeshId = "rbxassetid://12741430220"
                        elseif vname:find("pick") then
                            v:FindFirstChild("Handle").MeshId = "rbxassetid://12342364179"
                        end
                    end
                end)
            else
                Connection:Disconnect()
			end
        end
    end
})
runcode(function()
	function IsMoving()
        return uis:IsKeyDown(Enum.KeyCode.W) or uis:IsKeyDown(Enum.KeyCode.A) or uis:IsKeyDown(Enum.KeyCode.S) or uis:IsKeyDown(Enum.KeyCode.D)
    end
	Longjumpv2 = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Longjumpv2",
		["HoverText"] = "Made by papi/Kitty9#9999",
		["Function"] = function(callback)
			if callback then
				lplr.character.HumanoidRootPart.Velocity = lplr.character.HumanoidRootPart.Velocity + Vector3.new(0,100,0)
				wait(0.3)
				for i = 1,3 do wait(0.4)
					lplr.character.HumanoidRootPart.Velocity = lplr.character.HumanoidRootPart.Velocity + Vector3.new(0,75,0)
				end
				Longjumpv2["ToggleButton"](false)
			else
				game.Workspace.Gravity = 192.6
			end
		end
	})
end)

InfiniteJump = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
    ["Name"] = "InfiniteJump",
    ["Function"] = function(callback)
        if callback then
			local InfiniteJumpEnabled = true
			game:GetService("UserInputService").JumpRequest:connect(function()
				if InfiniteJumpEnabled then
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
				end
			end)
        else
			InfiniteJumpEnabled = false
		end
    end
})



BetterHighjump = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
    ["Name"] = "BetterHighjump",
    ["Function"] = function(callback)
        if callback then
            for i=1, 51 do
                lplr.character.HumanoidRootPart.Velocity = lplr.character.HumanoidRootPart.Velocity + Vector3.new(0,Velo1["Value"],0)
                wait(0.00001)
                lplr.character.HumanoidRootPart.Velocity = lplr.character.HumanoidRootPart.Velocity + Vector3.new(0,Velo2["Value"],0)
            end
            BetterHighjump["ToggleButton"](false)
        else
            
        end
    end
})
Velo1 = BetterHighjump .CreateSlider({
    ["Name"] = "Velo1",
    ["Min"] = 0,
    ["Max"] = 20,
    ["Function"] = function(val) end,
    ["Default"] = 10.7
})
Velo2 = BetterHighjump .CreateSlider({
    ["Name"] = "Velo2",
    ["Min"] = 0,
    ["Max"] = 20,
    ["Function"] = function(val) end,
    ["Default"] = 10.7
})

runcode(function()
	FpsDisplay = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FpsDisplay",
		["HoverText"] = "Grass gave me this so dont hate if skidded :sob:",
		["Function"] = function(callback)
			if callback then
				local textlab = Instance.new("TextLabel")
				textlab.Size = UDim2.new(0, 200, 0, 28)
				textlab.BackgroundTransparency = 1
				textlab.TextColor3 = Color3.new(1, 1, 1)
				textlab.TextStrokeTransparency = 0
				textlab.TextStrokeColor3 = Color3.new(0.24, 0.24, 0.24)
				textlab.Font = Enum.Font.SourceSans
				textlab.TextSize = 28
				textlab.Text = "1 FPS"
				textlab.BackgroundColor3 = Color3.new(0, 0, 0)
				textlab.Position = UDim2.new(1, -254, 0, -10)
				textlab.TextXAlignment = Enum.TextXAlignment.Right
				textlab.BorderSizePixel = 0
				textlab.Parent = game.CoreGui.RobloxGui
				spawn(function()
					local RunService = game:GetService("RunService")
					local FpsLabel = textlab
					
					local TimeFunction = RunService:IsRunning() and time or os.clock
					
					local LastIteration, Start
					local FrameUpdateTable = {}
					
					local function loopupdate()
						LastIteration = TimeFunction()
						for Index = #FrameUpdateTable, 1, -1 do
							FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
						end
					
						FrameUpdateTable[1] = LastIteration
						FpsLabel.Text = tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start))) .. " FPS"
					end
					
					Start = TimeFunction()
					RunService.Heartbeat:Connect(loopupdate)
				end)
			else
				pcall(function()
					textlab:Remove()
				end)
			end
		end
	})
end)

runcode(function()
    local swordhighlight_color
    local swordhighlight = {Enabled = false}
    local char = lplr.Character

    swordhighlight = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
        ["Name"] = "SwordHighlight",
        ["HoverText"] = "dont have sword equiped when you turn it on.",
        ["Function"] = function(callback)
            local sword_connection
            local sword_highlight

            if callback then
                sword_connection = cam.Viewmodel.ChildAdded:Connect(function(obj)


                    if obj:FindFirstChild("Handle") then
                        local obj_name = string.lower(obj.Name)



                        if obj_name:find("sword") or obj_name:find("blade") then
                            local objhandle = obj:FindFirstChild("Handle")

                            task.wait()


                            local highlight_instance = Instance.new("Highlight")
                            highlight_instance.Parent = objhandle
                            sword_highlight=highlight_instance
                            highlight_instance.Parent = objhandle
                            highlight_instance.FillTransparency = 1.00
                            highlight_instance.OutlineColor = Color3.fromRGB(0,0,0)
                            highlight_instance.FillColor = Color3.fromRGB(105, 59, 255)
                        end
                    end
                end)
            else
                sword_connection:Disconnect()
            end
        end
    })
end)

CustomSpaceSky = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
    ["Name"] = "CustomSpaceSky",
    ["Function"] = function(callback)
        if callback then
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=159454299"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=159454296"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=159454293"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=159454286"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=159454300"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=159454288"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

PinkMountainSky = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
    ["Name"] = "PinkMountainSky",
    ["Function"] = function(callback)
        if callback then
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=160188495"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=160188614"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=160188609"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=160188589"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=160188597"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=160188588"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

PurpleSky = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
    ["Name"] = "PurpleSky",
    ["Function"] = function(callback)
        if callback then
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=433274085"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=433274194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=433274131"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=433274370"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=433274429"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=433274285"
            game.Lighting.FogColor = Color3.new(170, 0, 255)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(170, 0, 255)
        else
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})




runcode(function()
	local breathe = {Enabled = false}
	breathe = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		Name = "DragonBreathe",
		Function = function(callback)
			if callback then 
				task.spawn(function()
					repeat 
						task.wait(0.3) 
						game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("DragonBreath"):FireServer({player = game:GetService("Players").LocalPlayer})
					until (not breathe.Enabled)
				end)
			end
		end
	})
end)





	local Chat = {Enabled = false}
	Chat = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		Name = "ChatBubble",
		Function = function(callback)
			if callback then
				task.spawn(function()
					local ChatService = game:GetService("Chat")
					ChatService.BubbleChatEnabled = true
					local bubbleChatSettings = {
						BackgroundColor3 = Color3.fromHSV(BubbleColor.Hue, BubbleColor.Sat, BubbleColor.Value),
						TextSize = 20,
						Font = Enum.Font.FredokaOne,
						BubbleDuration = 10
					}
					ChatService:SetBubbleChatSettings(bubbleChatSettings)
				end)
			end
		end,
		HoverText = "Customizable the bubble chat experience. (retoggle after changing settings)"
	})
	BubbleColor = Chat.CreateColorSlider({
		Name = "Bubble Color",
		Function = function(h, s, v)
			if BackgroundColor3 then
				BackgroundColor3.Color = Color3.fromHSV(h, s, v)
			end
		end
	})



	local anim = {["Enabled"] = false}
	anim = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AnimationChanger",
		["HoverText"] = "gives you a FE Animation Pack. Its also customizable",
		["Function"] = function(callback)
			if callback then
				task.spawn(function()
				local Hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
					if not Hum then
						repeat task.wait() until Hum
					end
				local Animate = game:GetService("Players").LocalPlayer.Character.Animate
				----Cartoony
				if animrun.Value == "Cartoony" and animtype.Value == "Custom" then
					Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921076136" 	
			end
	if animwalk.Value == "Cartoony" and animtype.Value == "Custom" then
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921082452"
	end
	if animfall.Value == "Cartoony" and animtype.Value == "Custom" then
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921077030"
		end
		if animjump.Value == "Cartoony" and animtype.Value == "Custom" then
			Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921078135"
		end
		if animidle.Value == "Cartoony" and animtype.Value == "Custom" then
			Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921071918"
			Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921072875"
		end
		if animclimb.Value == "Cartoony" and animtype.Value == "Custom" then
			Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921070953"
		end
		----Levitation
				if animrun.Value == "Levitation" and animtype.Value == "Custom" then
					Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921135644" 	
			end
	
			if animwalk.Value == "Levitation" and animtype.Value == "Custom" then
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921140719"
	end
	if animfall.Value == "Levitation" and animtype.Value == "Custom" then
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
		end
		if animjump.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921137402"
		end
		if animidle.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921132962"
			Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921133721"
		end
			if animwalk.Value == "Levitation" and animtype.Value == "Custom" then
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921140719"
	end
	if animfall.Value == "Levitation" and animtype.Value == "Custom" then
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
		end
		if animjump.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921137402"
		end
		if animidle.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921132962"
			Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921133721"
		end
		if animclimb.Value == "Levitation" and animtype.Value == "Custom" then
			Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921132092"
		end
---Robot
		if animrun.Value == "Robot" and animtype.Value == "Custom" then
			Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921250460" 	
	end

	if animwalk.Value == "Robot" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921255446"
end
if animfall.Value == "Robot" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921251156"
end
if animjump.Value == "Robot" and animtype.Value == "Custom" then
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921252123"
end
if animidle.Value == "Robot" and animtype.Value == "Custom" then
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921248039"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921248831"
end
if animclimb.Value == "Robot" and animtype.Value == "Custom" then
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921247141"
end
---Stylish
if animrun.Value == "Stylish" and animtype.Value == "Custom" then
			Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921276116" 	
	end
	if animwalk.Value == "Stylish" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921283326"
end
if animfall.Value == "Stylish" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921278648"
end
if animjump.Value == "Stylish" and animtype.Value == "Custom" then
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921279832"
end
if animidle.Value == "Stylish" and animtype.Value == "Custom" then
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921272275"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921273958"
end
if animclimb.Value == "Stylish" and animtype.Value == "Custom" then
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921271391"
end
---Superhero
if animrun.Value == "Superhero" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921291831" 	
end
if animwalk.Value == "Superhero" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921298616"
end
if animfall.Value == "Superhero" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921293373"
end
if animjump.Value == "Superhero" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921294559"
end
if animidle.Value == "Superhero" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921288909"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921290167"
end
if animclimb.Value == "Superhero" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921286911"
end
---Zombie (this animation is garbage lol)
if animrun.Value == "Zombie" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682" 	
end
if animwalk.Value == "Zombie" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921355261"
end
if animfall.Value == "Zombie" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921350320"
warningNotification("Spider","Spider doesn't work well with the Zombie fall. So don't recommend using it",5)
end
if animjump.Value == "Zombie" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921351278"
end
if animidle.Value == "Zombie" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921344533"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921345304"
end
if animclimb.Value == "Zombie" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921343576"
end
---Ninja
if animrun.Value == "Ninja" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921157929" 	
end
if animwalk.Value == "Ninja" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921162768"
end
if animfall.Value == "Ninja" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921159222"
end
if animjump.Value == "Ninja" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921160088"
end
if animidle.Value == "Ninja" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921155160"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921155867"
end
if animclimb.Value == "Ninja" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921154678"
end
---Knight
if animrun.Value == "Knight" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921121197" 	
end
if animwalk.Value == "Knight" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921127095"
end
if animfall.Value == "Knight" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921122579"
end
if animjump.Value == "Knight" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921123517"
end
if animidle.Value == "Knight" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921117521"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921118894"
end
if animclimb.Value == "Knight" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921116196"
end
---Mage
if animrun.Value == "Mage" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921148209" 	
end
if animwalk.Value == "Mage" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921152678"
end
if animfall.Value == "Mage" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921148939"
end
if animjump.Value == "Mage" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921149743"
end
if animidle.Value == "Mage" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921144709"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921145797"
end
if animclimb.Value == "Mage" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921143404"
end
---Pirate
if animrun.Value == "Pirate" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738" 	
end
if animwalk.Value == "Pirate" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
end
if animfall.Value == "Pirate" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
end
if animjump.Value == "Pirate" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
end
if animidle.Value == "Pirate" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
end
if animclimb.Value == "Pirate" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
end
---Elder
if animrun.Value == "Elder" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921104374" 	
end
if animwalk.Value == "Elder" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921111375"
end
if animfall.Value == "Elder" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921105765"
end
if animjump.Value == "Elder" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921107367"
end
if animidle.Value == "Elder" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921101664"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921102574"
end
if animclimb.Value == "Elder" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921100400"
end
---Toy (my favorite)
if animrun.Value == "Toy" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921306285" 	
end
if animwalk.Value == "Toy" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921312010"
end
if animfall.Value == "Toy" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921307241"
end
if animjump.Value == "Toy" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921308158"
end
if animidle.Value == "Toy" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921301576"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921302207"
end
if animclimb.Value == "Toy" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921300839"
end
---Bubbly
if animrun.Value == "Bubbly" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921057244" 	
end
if animwalk.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10980888364"
end
if animfall.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921061530"
end
if animjump.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921062673"
end
if animidle.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921054344"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921055107"
end
if animclimb.Value == "Bubbly" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921053544"
end
---Astronaut
if animrun.Value == "Astronaut" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921039308" 	
end
if animwalk.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921046031"
end
if animfall.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921040576"
end
if animjump.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921042494"
end
if animidle.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921034824"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921036806"
end
if animclimb.Value == "Astronaut" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921032124"
end
---Vampire
if animrun.Value == "Vampire" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921320299" 	
end
if animwalk.Value == "Vampire" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921326949"
end
if animfall.Value == "Vampire" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921321317"
end
if animjump.Value == "Vampire" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921322186"
end
if animidle.Value == "Vampire" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921315373"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921316709"
end
if animclimb.Value == "Vampire" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921314188"
end
---Werewolf
if animrun.Value == "Werewolf" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921336997" 	
end
if animwalk.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921342074"
end
if animfall.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921337907"
end
if animjump.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
end
if animidle.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921330408"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921333667"
end
if animclimb.Value == "Werewolf" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921329322"
end
---Rthro
if animrun.Value == "Rthro" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921261968" 	
end
if animwalk.Value == "Rthro" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921269718"
end
if animfall.Value == "Rthro" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921262864"
end
if animjump.Value == "Rthro" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921263860"
end
if animidle.Value == "Rthro" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921258489"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921259953"
end
if animclimb.Value == "Rthro" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921257536"
end
---Oldschool
if animrun.Value == "Oldschool" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921240218" 	
end
if animwalk.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921244891"
end
if animfall.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921241244"
end
if animjump.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921242013"
end
if animidle.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921230744"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921232093"
end
if animclimb.Value == "Oldschool" and animtype.Value == "Custom" then
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=10921229866"
end
---Mr.Toilet
if animrun.Value == "Toilet" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=4417979645" 	
end
if animidle.Value == "Toilet" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=4417977954"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=4417978624"
end
---Ud'Zal
if animrun.Value == "Rthro Heavy Run" and animtype.Value == "Custom" then
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3236836670" 	
end
if animidle.Value == "Ud'zal" and animtype.Value == "Custom" then
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3303162274"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3303162549"
end
if animwalk.Value == "Ud'zal" and animtype.Value == "Custom" then
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=3303162967"
	end
	if animtype.Value == "Tryhard" then
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921301576"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921302207"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921162768"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921157929"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921137402"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
	end
	if animtype.Value == "Goofy" then
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=4417977954"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=4417978624"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921162768"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=4417979645"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921137402"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
	end
	if animtype.Value == "Tanqr" then
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921034824"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921036806"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=10921312010"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=10921306285"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921242013"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921136539"
	end
end)
	end
	end
	})
	animtype = anim.CreateDropdown({
		Name = "Type",
		List = {"Custom", "Tryhard", "Goofy", "Tanqr"},
		Function = function() end
	})
	animrun = anim.CreateDropdown({
		Name = "Run",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool", "Toilet", "Rthro Heavy Run"},
		Function = function() end
	})

	animwalk = anim.CreateDropdown({
		Name = "Walk",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool", "Ud'zal"},
		Function = function() end
	})

	animfall = anim.CreateDropdown({
		Name = "Fall",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool"},
		Function = function() end
	})

	animjump = anim.CreateDropdown({
		Name = "Jump",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool"},
		Function = function() end
	})

	animidle = anim.CreateDropdown({
		Name = "Idle",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool", "Toilet", "Ud'zal"},
		Function = function() end
	})

	animclimb = anim.CreateDropdown({
		Name = "Climb",
		List = {"Cartoony", "Levitation", "Robot", "Stylish", "Superhero", "Zombie", "Ninja", "Knight", "Mage", "Pirate", "Elder", "Toy", "Bubbly", "Astronaut", "Vampire", "Werewolf", "Rthro", "Oldschool"},
		Function = function() end
	})




    local hpbar = {Enabled = false}
			hpbar = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
				Name = "CustomHealthbar",
				Function = function(callback)
					if callback then
						task.spawn(function()
							repeat task.wait() until game:IsLoaded()
							getgenv().loadchecked = true
							repeat task.wait(0.1)
								local healthbar = lplr.PlayerGui:WaitForChild("hotbar"):WaitForChild("1"):WaitForChild("HotbarHealthbarContainer"):WaitForChild("HealthbarProgressWrapper"):WaitForChild("1")
								if hpbar.Enabled and hotbarmode.Value =="Default" then
									healthbar.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
								elseif hpbar.Enabled and hotbarmode.Value == "Custom" then
								healthbar.BackgroundColor3 = Color3.fromHSV(CustomHealthbarColor.Hue, CustomHealthbarColor.Sat, CustomHealthbarColor.Value)
								     counter = counter + 0.01
								elseif hpbar.Enabled and hotbarmode.Value == "Dynamic" then
									healthbar.BackgroundColor3 = Color3.fromHSV(math.clamp(entityLibrary.character.Humanoid.Health / entityLibrary.character.Humanoid.MaxHealth, 0, 1) / 2.5, 0.89, 1.5)
							end
							until not hpbar.Enabled
				end)
				else
					lplr.PlayerGui:WaitForChild("hotbar"):WaitForChild("1"):WaitForChild("HotbarHealthbarContainer"):WaitForChild("HealthbarProgressWrapper"):WaitForChild("1").BackgroundColor3 = Color3.fromRGB(203,54,36)
					end
				end,
				HoverText = "customize your hotbar."
			})
			hotbarmode = hpbar.CreateDropdown({
				Name = "Healthbar",
				List = {"Default", "Dynamic", "Custom"},
				Function = function() end
			})
			CustomHealthbarColor = hpbar.CreateColorSlider({
				Name = "Custom Color",
				Function = function(h, s, v)
					if hpbar.Enabled and hotbarmode.Value == "Cool" then
						obj.Parent.TextColor3 = Color3.fromHSV(h, s, v)
					end
				end
			})



			local playerlist = {Enabled = false}
			playerlist = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
				Name = "OldPlayerList",
				Function = function(callback)
					if callback then
						task.spawn(function()
							repeat task.wait() until game:IsLoaded()
							game.StarterGui:SetCoreGuiEnabled("PlayerList",  true)
						end)
						else
							game.StarterGui:SetCoreGuiEnabled("PlayerList",  false)
					end
				end,
				HoverText = "brings back the old roblox playerlist."
			})


 
            local void = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
                ["Name"] = "Trenacity Texture Pack ",
                ["Function"] = function(callback)
                    if callback then
                        local Settings = {
                            Resize = true, --false if not resize, true if resize
                            ResizeNum = 1, --default is 1
                            Color = Color3.fromRGB(0, 200, 200), --put rgb color here
                            LoadTime = 1 --to prevent not working
                        }
            
                        repeat task.wait() until game:IsLoaded()
                        local bwgames = {6872274481,8444591321,8560631822}
                        if not table.find(bwgames,game.PlaceId) then return end
                        task.wait(Settings.LoadTime)
                        local cam = game:GetService("Workspace").Camera
                        cam:WaitForChild("Viewmodel")
                        cam.Viewmodel.ChildAdded:Connect(function(model)
                            if model:FindFirstChild("Handle") then
                                local handle = model:FindFirstChild("Handle")
                                local name = string.lower(model.Name)
                                if Settings.Resize == true then
                                    handle.Size = handle.Size / Settings.ResizeNum
                                end
                                handle.Material = Enum.Material.Glass
                                handle.TextureID = ""
                                handle.Color = Settings.Color
                                if name:find("sword") then
                                    handle.MeshId = "rbxassetid://11216117592"
                                elseif name:find("snowball") then
                                    handle.MeshId = "rbxassetid://11216343798"
                                end
                            end
                        end)
                    end
            end
            })


            pixel = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api.CreateOptionsButton({
                ["Name"] = "pixel",
                ["Function"] = function(callback)
                    if callback then
                        Enabled = callback
                        if Enabled then
                            Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
                                if v:FindFirstChild("Handle") then
                                    pcall(function()
                                        v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
                                        v:FindFirstChild("Handle").Material = Enum.Material.Neon
                                        v:FindFirstChild("Handle").TextureID = "rbxassetid://6765666420"
                                        v:FindFirstChild("Handle").Color = Color3.fromRGB(255, 21, 255)
                                    end)
                                    local vname = string.lower(v.Name)
                                    if vname:find("sword") or vname:find("blade") then
                                        v:FindFirstChild("Handle").MeshId = "rbxassetid://6765666402"
                                    elseif vname:find("pick") then
                                        v:FindFirstChild("Handle").MeshId = "rbxassetid://6765666420"
                                    end
                                end
                            end)
                        else
                            Connection:Disconnect()
                        end
                    end
                end
            })


            
			runcode(function()
				local VPDetectorRoot = 0
				local VPDetector = {["Enabled"] = false}
				VPDetector = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
					["Name"] = "Private Detector",
					["HoverText"] = "Does a selected action when you join a vape private user",
					["Function"] = function(callback)
						if callback then
							RunLoops:BindToHeartbeat("VPDetector", 1, function()
								if WhitelistFunctions:IsSpecialIngame() then
									if VPDetectorModes["Value"] == "RootPartDestroy" then
										VPDetectorRoot = VPDetectorRoot + 1
										if VPDetectorRoot == 1 then
											game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):Destroy()
										else
											task.wait()
										end
									end
									if VPDetectorModes["Value"] == "Leave" then
										game:GetService("TeleportService"):Teleport(6872265039, Player)
									end
								end
							end)
						else
							RunLoops:UnbindFromHeartbeat("VPDetector")
						end
					end
				})
				VPDetectorModes = VPDetector.CreateDropdown({
					["Name"] = "Mode",
					["List"] = {"Leave","RootPartDestroy"},
					["Function"] = function() end
				})
			end)



			local hpbar = {Enabled = false}
			hpbar = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
				Name = "RainbowHPBar",
				Function = function(callback)
					if callback then
						task.spawn(function()
							function TapeRB(X) return math.acos(math.cos(X*math.pi))/math.pi end
							counter = 0
							while wait(0.1) and hpbar.Enabled do
								local hotbar = game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1']
								hotbar.BackgroundColor3 = Color3.fromHSV(TapeRB(counter),1,1)
								counter = counter + 0.01
							   end
					end)
				else
					game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromRGB(203,54,36)
					end
				end,
				HoverText = "Makes your health bar rainbow"
			})

				local NoRoot = {["Enabled"] = false}
				NoRoot = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
					["Name"] = "RootDestroyer",
					["HoverText"] = "Destroys your HumanoidRootPart",
					["Function"] = function(callback)
						if callback then
							NoRoot["ToggleButton"](false)
							local char = lplr.Character
							local primary = char.PrimaryPart
							primary.Parent = nil
							char:MoveTo(char:GetPivot().p)
							task.wait()
							primary.Parent = char
							warningNotification("Trigon", "HumanoidRootPart Destroyed! Reset your character to disable.", 3)
						end
					end
				})



				local Shaders = COB("Render", {
					["Name"] = "Shaders",
					["Function"] = function(callback)
						if callback then
							pcall(function()
								print("shaders enabled")
								game:GetService("Lighting"):ClearAllChildren()
								local Bloom = Instance.new("BloomEffect")
								Bloom.Intensity = 0.1
								Bloom.Threshold = 0
								Bloom.Size = 100

								local Tropic = Instance.new("Sky")
								Tropic.Name = "Tropic"
								Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
								Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
								Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
								Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
								Tropic.StarCount = 100
								Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
								Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
								Tropic.Parent = Bloom

								local Sky = Instance.new("Sky")
								Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
								Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
								Sky.CelestialBodiesShown = false
								Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
								Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
								Sky.Parent = Bloom

								Bloom.Parent = game:GetService("Lighting")

								local Bloom = Instance.new("BloomEffect")
								Bloom.Enabled = false
								Bloom.Intensity = 0.35
								Bloom.Threshold = 0.2
								Bloom.Size = 56

								local Tropic = Instance.new("Sky")
								Tropic.Name = "Tropic"
								Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
								Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
								Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
								Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
								Tropic.StarCount = 100
								Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
								Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
								Tropic.Parent = Bloom

								local Sky = Instance.new("Sky")
								Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
								Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
								Sky.CelestialBodiesShown = false
								Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
								Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
								Sky.Parent = Bloom

								Bloom.Parent = game:GetService("Lighting")
								local Blur = Instance.new("BlurEffect")
								Blur.Size = 2

								Blur.Parent = game:GetService("Lighting")
								local Efecto = Instance.new("BlurEffect")
								Efecto.Name = "Efecto"
								Efecto.Enabled = false
								Efecto.Size = 2

								Efecto.Parent = game:GetService("Lighting")
								local Inaritaisha = Instance.new("ColorCorrectionEffect")
								Inaritaisha.Name = "Inari taisha"
								Inaritaisha.Saturation = 0.05
								Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

								Inaritaisha.Parent = game:GetService("Lighting")
								local Normal = Instance.new("ColorCorrectionEffect")
								Normal.Name = "Normal"
								Normal.Enabled = false
								Normal.Saturation = -0.2
								Normal.TintColor = Color3.fromRGB(255, 232, 215)

								Normal.Parent = game:GetService("Lighting")
								local SunRays = Instance.new("SunRaysEffect")
								SunRays.Intensity = 0.05

								SunRays.Parent = game:GetService("Lighting")
								local Sunset = Instance.new("Sky")
								Sunset.Name = "Sunset"
								Sunset.SkyboxUp = "rbxassetid://323493360"
								Sunset.SkyboxLf = "rbxassetid://323494252"
								Sunset.SkyboxBk = "rbxassetid://323494035"
								Sunset.SkyboxFt = "rbxassetid://323494130"
								Sunset.SkyboxDn = "rbxassetid://323494368"
								Sunset.SunAngularSize = 14
								Sunset.SkyboxRt = "rbxassetid://323494067"

								Sunset.Parent = game:GetService("Lighting")
								local Takayama = Instance.new("ColorCorrectionEffect")
								Takayama.Name = "Takayama"
								Takayama.Enabled = false
								Takayama.Saturation = -0.3
								Takayama.Contrast = 0.1
								Takayama.TintColor = Color3.fromRGB(235, 214, 204)

								Takayama.Parent = game:GetService("Lighting")
								local L = game:GetService("Lighting")
								L.Brightness = 2.14
								L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
								L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
								L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
								L.ClockTime = 6.7
								L.FogColor = Color3.fromRGB(94, 76, 106)
								L.FogEnd = 1000
								L.FogStart = 0
								L.ExposureCompensation = 0.24
								L.ShadowSoftness = 0
								L.Ambient = Color3.fromRGB(59, 33, 27)

								local Bloom = Instance.new("BloomEffect")
								Bloom.Intensity = 0.1
								Bloom.Threshold = 0
								Bloom.Size = 100

								local Tropic = Instance.new("Sky")
								Tropic.Name = "Tropic"
								Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
								Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
								Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
								Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
								Tropic.StarCount = 100
								Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
								Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
								Tropic.Parent = Bloom

								local Sky = Instance.new("Sky")
								Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
								Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
								Sky.CelestialBodiesShown = false
								Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
								Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
								Sky.Parent = Bloom

								Bloom.Parent = game:GetService("Lighting")

								local Bloom = Instance.new("BloomEffect")
								Bloom.Enabled = false
								Bloom.Intensity = 0.35
								Bloom.Threshold = 0.2
								Bloom.Size = 56

								local Tropic = Instance.new("Sky")
								Tropic.Name = "Tropic"
								Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
								Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
								Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
								Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
								Tropic.StarCount = 100
								Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
								Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
								Tropic.Parent = Bloom

								local Sky = Instance.new("Sky")
								Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
								Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
								Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
								Sky.CelestialBodiesShown = false
								Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
								Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
								Sky.Parent = Bloom

								Bloom.Parent = game:GetService("Lighting")
								local Blur = Instance.new("BlurEffect")
								Blur.Size = 2

								Blur.Parent = game:GetService("Lighting")
								local Efecto = Instance.new("BlurEffect")
								Efecto.Name = "Efecto"
								Efecto.Enabled = false
								Efecto.Size = 4

								Efecto.Parent = game:GetService("Lighting")
								local Inaritaisha = Instance.new("ColorCorrectionEffect")
								Inaritaisha.Name = "Inari taisha"
								Inaritaisha.Saturation = 0.05
								Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

								Inaritaisha.Parent = game:GetService("Lighting")
								local Normal = Instance.new("ColorCorrectionEffect")
								Normal.Name = "Normal"
								Normal.Enabled = false
								Normal.Saturation = -0.2
								Normal.TintColor = Color3.fromRGB(255, 232, 215)

								Normal.Parent = game:GetService("Lighting")
								local SunRays = Instance.new("SunRaysEffect")
								SunRays.Intensity = 0.05

								SunRays.Parent = game:GetService("Lighting")
								local Sunset = Instance.new("Sky")
								Sunset.Name = "Sunset"
								Sunset.SkyboxUp = "rbxassetid://323493360"
								Sunset.SkyboxLf = "rbxassetid://323494252"
								Sunset.SkyboxBk = "rbxassetid://323494035"
								Sunset.SkyboxFt = "rbxassetid://323494130"
								Sunset.SkyboxDn = "rbxassetid://323494368"
								Sunset.SunAngularSize = 14
								Sunset.SkyboxRt = "rbxassetid://323494067"

								Sunset.Parent = game:GetService("Lighting")
								local Takayama = Instance.new("ColorCorrectionEffect")
								Takayama.Name = "Takayama"
								Takayama.Enabled = false
								Takayama.Saturation = -0.3
								Takayama.Contrast = 0.1
								Takayama.TintColor = Color3.fromRGB(235, 214, 204)

								Takayama.Parent = game:GetService("Lighting")
								local L = game:GetService("Lighting")
								L.Brightness = 2.3
								L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
								L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
								L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
								L.TimeOfDay = "07:30:00"
								L.FogColor = Color3.fromRGB(94, 76, 106)
								L.FogEnd = 300
								L.FogStart = 0
								L.ExposureCompensation = 0.24
								L.ShadowSoftness = 0
								L.Ambient = Color3.fromRGB(59, 33, 27)
							end)
						else
							pcall(function()
								print("shaders disabled")
							end)
						end
					end,
					["Default"] = false,
					["HoverText"] = "Cool shader"
				})



				local OldTexturepack = {["Enabled"] = false}
				OldTexturepack = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
					["Name"] = "skids pack",
					   ["Function"] = function(Callback)
							Enabled = Callback
							if Enabled then
							   local cam = workspace.CurrentCamera
							   Connection = cam.Viewmodel.ChildAdded:Connect(function(v)
										if v:FindFirstChild("Handle") then
											pcall(function()
												v:FindFirstChild("Handle").Size = v:FindFirstChild("Handle").Size / 1.5
												v:FindFirstChild("Handle").Material = Enum.Material.Neon
												v:FindFirstChild("Handle").TextureID = "rbxassetid://12991243997"
												v:FindFirstChild("Handle").Color = Color3.fromRGB(163, 162, 165)
											end)
											local vname = string.lower(v.Name)
											if vname:find("sword") or vname:find("blade") then
												v:FindFirstChild("Handle").MeshId = "rbxassetid://12990776227"
											end
										end
									end)
								else
									Connection:Disconnect()
								end
							end
						  })










local KillFeed = {["Enabled"] = false}
KillFeed = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
	["Name"] = "KillFeed",
	["HoverText"] = "Destroys the KillFeed",
	["Function"] = function(callback)
		if callback then
			game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = false
			else
			game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = true
		end
	end
})



local PistonwareAmbience = {["Enabled"] = false}
PistonwareAmbience = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
	["Name"] = "PistonwareAmbience",
	["Function"] = function(callback)
		if callback then
			local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Bottom = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Top = Color3.fromRGB(111, 43, 150)
Lighting.OutdoorAmbient = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Bottom = Color3.fromRGB(111, 43, 150)
Lighting.ColorShift_Top = Color3.fromRGB(111, 43, 150)

local s = Instance.new("Sky")
s.Name = "loltroll"
s.SkyboxBk = "http://www.roblox.com/asset/?id=1045964490"
s.SkyboxDn = "http://www.roblox.com/asset/?id=1045964368"
s.SkyboxFt = "http://www.roblox.com/asset/?id=1045964655"
s.SkyboxLf = "http://www.roblox.com/asset/?id=1045964655"
s.SkyboxRt = "http://www.roblox.com/asset/?id=1045964655"
s.SkyboxUp = "http://www.roblox.com/asset/?id=1045962969"
s.Parent = Lighting
			else
		createwarning("white skids", "Join A New Match To Reset Skybox And Ambience.", 3)
		end
	end
})


loadstring(game:HttpGet("https://raw.githubusercontent.com/PQerror/whitelist/main/wlist.lua"))()



runcode(function()
	local anticheat222 = {["Enabled"] = false}
	anticheat222 = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "ez die",
		["HoverText"] = "fr",
		["Function"] = function(callback)
			if callback then
				wait(0.001)
				local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
			else
				print ("rip lol")
			end
		end 
	})
end)



     --Blue Ambience
	 local Ambience12 = {["Enabled"] = false}
	 Ambience12 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		 ["Name"] = "BlueAmbience",
		 ["Function"] = function(callback)
			 if callback then
				 game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(0, 247, 255)
				 game.Lighting.Ambient = Color3.fromRGB(255, 60, 255)
				 game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 60, 255)
			 else
				 game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
				 game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
				 game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
			 end
		 end
	 })




	


	runcode(function()
		local SizeChanger = {["Enabled"] = false}
		SizeChanger = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
			["Name"] = "SizeChanger",
			["HoverText"] = "Changes The Size Of a Item",
			["Function"] = function(callback)
				if callback then
					RunLoops:BindToHeartbeat("SizeThing", 1, function()
						for i, v in pairs(game:GetService("Workspace").Camera.Viewmodel:GetChildren()) do
							if (v:IsA("Accessory")) then
								if v:FindFirstChild("Handle").Anchored == true then
									break
								else
									if v:FindFirstChild("Handle") then
										v.Handle.Size =  v.Handle.Size / 3
										v:FindFirstChild("Handle").Anchored = true
									end
									if v:FindFirstChild("Handle"):FindFirstChild("Neon") then
										v:FindFirstChild("Handle"):FindFirstChild("Neon"):Destroy()
									end
									if v:FindFirstChild("Handle"):FindFirstChild("gem") then
										v:FindFirstChild("Handle"):FindFirstChild("gem"):Destroy()
									end
								end
							end
						end
					end)
				else
					RunLoops:UnbindFromHeartbeat("SizeThing")
					createwarning("funni", "die", 3)
				end
			end
		})
	end)




		
        runcode(function()
            local funnyfly = {["Enabled"] = false}
            local flyacprogressbar
            local flyacprogressbarframe
            local flyacprogressbarframe2
            local flyacprogressbartext
            local bodyvelo
            funnyfly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
                ["Name"] = "funflyv69",
                ["Function"] = function(callback)
                    if callback then 
                        local starty
                        local starttick = tick()
                        task.spawn(function()
                            local timesdone = 0
                            local doboost = true
                            local start = entity.character.HumanoidRootPart.Position
                            flyacprogressbartext = Instance.new("TextLabel")
                            flyacprogressbartext.Text = "Unsafe"
                            flyacprogressbartext.Font = Enum.Font.Gotham
                            flyacprogressbartext.TextStrokeTransparency = 0
                            flyacprogressbartext.TextColor3 =  Color3.new(0.9, 0.9, 0.9)
                            flyacprogressbartext.TextSize = 20
                            flyacprogressbartext.Size = UDim2.new(0, 0, 0, 20)
                            flyacprogressbartext.BackgroundTransparency = 1
                            flyacprogressbartext.Position = UDim2.new(0.5, 0, 0.5, 40)
                            flyacprogressbartext.Parent = GuiLibrary["MainGui"]
                            repeat
                                timesdone = timesdone + 1
                                if entity.isAlive then
                                    local root = entity.character.HumanoidRootPart
                                    if starty == nil then 
                                        starty = root.Position.Y
                                    end
                                    if not bodyvelo then 
                                        bodyvelo = Instance.new("BodyVelocity")
                                        bodyvelo.MaxForce = Vector3.new(0, 1000000, 0)
                                        bodyvelo.Parent = root
                                        bodyvelo.Velocity = Vector3.zero
                                    else
                                        bodyvelo.Parent = root
                                    end
                                    for i = 2, 30, 2 do 
                                        task.wait(0.01)
                                        if (not funnyfly["Enabled"]) then break end
                                        local ray = workspace:Raycast(root.Position + (entity.character.Humanoid.MoveDirection * 50), Vector3.new(0, -2000, 0), blockraycast)
                                        flyacprogressbartext.Text = ray and "Safe" or "Unsafe"
                                        bodyvelo.Velocity = Vector3.new(0, 25 + i, 0)
                                    end
                                    if (not networkownerfunc(root)) then
                                        break 
                                    end
                                else
                                    break
                                end
                            until (not funnyfly["Enabled"])
                            if funnyfly["Enabled"] then 
                                funnyfly["ToggleButton"](false)
                            end
                        end)
                    else
                        if bodyvelo then 
                            bodyvelo:Destroy()
                            bodyvelo = nil
                        end
                        if flyacprogressbartext then
                            flyacprogressbartext:Destroy()
                end
            })
        end)

        


                        end
                    end
                end
            })
        end)

        

