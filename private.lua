local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "private.lol", HidePremium = false, IntroText = "private.lol", SaveConfig = true, ConfigFolder = "Silk"})

local ff2 = Window:MakeTab({
	Name = "Football Fusion 2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

ff2:AddButton({
	Name = "BleachHack",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/devdoroz/bleachhack/main/newloader.lua"))()
  	end    
})

local Frontlines = Window:MakeTab({
	Name = "Frontlines",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Frontlines:AddButton({
	Name = "Aimbot+ESP",
	Callback = function()
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Set hitbox size, transparency level, and notification status
local size = Vector3.new(10, 10, 10)
local trans = 1
local notifications = false
 
-- Store the time when the code starts executing
local start = os.clock()
 
-- Send a notification saying that the script is loading
game.StarterGui:SetCore("SendNotification", {
   Title = "Script",
   Text = "Loading script...",
   Icon = "",
   Duration = 5
})
 
-- Load the ESP library and turn it on
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/andrewc0de/Roblox/main/Dependencies/ESP.lua"))()
esp:Toggle(true)
 
-- Configure ESP settings
esp.Boxes = true
esp.Names = false
esp.Tracers = false
esp.Players = false
 
-- Add an object listener to the workspace to detect enemy models
esp:AddObjectListener(workspace, {
   Name = "soldier_model",
   Type = "Model",
   Color = Color3.fromRGB(255, 0, 4),
 
   -- Specify the primary part of the model as the HumanoidRootPart
   PrimaryPart = function(obj)
       local root
       repeat
           root = obj:FindFirstChild("HumanoidRootPart")
           task.wait()
       until root
       return root
   end,
 
   -- Use a validator function to ensure that models do not have the "friendly_marker" child
   Validator = function(obj)
       task.wait(1)
       if obj:FindFirstChild("friendly_marker") then
           return false
       end
       return true
   end,
 
   -- Set a custom name to use for the enemy models
   CustomName = "?",
 
   -- Enable the ESP for enemy models
   IsEnabled = "enemy"
})
 
-- Enable the ESP for enemy models
esp.enemy = true
 
-- Wait for the game to load fully before applying hitboxes
task.wait(1)
 
-- Apply hitboxes to all existing enemy models in the workspace
for _, v in pairs(workspace:GetDescendants()) do
   if v.Name == "soldier_model" and v:IsA("Model") and not v:FindFirstChild("friendly_marker") then
       local pos = v:FindFirstChild("HumanoidRootPart").Position
       for _, bp in pairs(workspace:GetChildren()) do
           if bp:IsA("BasePart") then
               local distance = (bp.Position - pos).Magnitude
               if distance <= 5 then
                   bp.Transparency = trans
                   bp.Size = size
               end
           end
       end
   end
end
 
-- Function to handle when a new descendant is added to the workspace
local function handleDescendantAdded(descendant)
   task.wait(1)
 
   -- If the new descendant is an enemy model and notifications are enabled, send a notification
   if descendant.Name == "soldier_model" and descendant:IsA("Model") and not descendant:FindFirstChild("friendly_marker") then
       if notifications then
           game.StarterGui:SetCore("SendNotification", {
               Title = "Script",
               Text = "[Warning] New Enemy Spawned! Applied hitboxes.",
               Icon = "",
               Duration = 3
           })
       end
 
       -- Apply hitboxes to the new enemy model
       local pos = descendant:FindFirstChild("HumanoidRootPart").Position
       for _, bp in pairs(workspace:GetChildren()) do
           if bp:IsA("BasePart") then
               local distance = (bp.Position - pos).Magnitude
               if distance <= 5 then
                   bp.Transparency = trans
                   bp.Size = size
               end
           end
       end
   end
end
 
-- Connect the handleDescendantAdded function to the DescendantAdded event of the workspace
task.spawn(function()
   game.Workspace.DescendantAdded:Connect(handleDescendantAdded)
end)
 
-- Store the time when the code finishes executing
local finish = os.clock()
 
-- Calculate how long the code took to run and determine a rating for the loading speed
local time = finish - start
local rating
if time < 3 then
   rating = "fast"
elseif time < 5 then
   rating = "acceptable"
else
   rating = "slow"
end
 
-- Send a notification showing how long the code took to run and its rating
game.StarterGui:SetCore("SendNotification", {
   Title = "Script",
   Text = string.format("Script loaded in %.2f seconds (%s loading)", time, rating),
   Icon = "",
   Duration = 5
})
  	end    
})

local mvsd = Window:MakeTab({
	Name = "MurdervSheriff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

mvsd:AddButton({
	Name = "AIMBOT+ESP",
	Callback = function()
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local kavoUi = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local window = kavoUi.CreateLib("private.lol","Ocean")
 
---Tabs
 
local Tab1 = window:NewTab("Main")
local Tab1Section = Tab1:NewSection("Main")
local Tab2 = window:NewTab("Credits")
local Tab2Section = Tab2:NewSection("huh")
local Tab2Section = Tab2:NewSection("huh")
 
---Buttons
 
Tab1Section:NewButton("Hitbox","Increase Range",function()
_G.HeadSize = 15
_G.Disabled = true
 
game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end)
 
Tab1Section:NewToggle("Infinite Jumps"," Infinite Jumps",function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)
 
Tab1Section:NewButton("Speed","Increase speed",function()
function isNumber(str)
  if tonumber(str) ~= nil or str == 'inf' then
    return true
  end
end
local tspeed = 1
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed and isNumber(tspeed) then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
end)
 
Tab1Section:NewButton("Esp","Esp",function()
local Settings = {
	['Material'] = Enum.Material.Neon, -- Material
	['Color'] = Color3.fromRGB(0,255,255), -- Color
	['Transparency'] = 0.7 -- 0 to 1 Transparency
}
 
local ScreenGui = Instance.new('ScreenGui', game.CoreGui) -- Create screengui
ScreenGui.IgnoreGuiInset = true
 
local ViewportFrame = Instance.new('ViewportFrame', ScreenGui) -- Create viewport and define properties
ViewportFrame.CurrentCamera = workspace.CurrentCamera
ViewportFrame.Size = UDim2.new(1,0,1,0)
ViewportFrame.BackgroundTransparency = 1
ViewportFrame.ImageTransparency = Settings.Transparency
 
local Chasms = {} -- Array for storing parts
 
function generateChasm(player) -- functions that generates chasms for the player specififed
	local Character = workspace:FindFirstChild(player.Name)
 
	if Character then
		for _,Part in pairs(Character:GetChildren()) do
			if Part:IsA('Part') or Part:IsA('MeshPart') then
				local Chasm = Part:Clone()
 
				for _,Child in pairs(Chasm:GetChildren()) do
					if Child:IsA('Decal') then
						Child:Destroy()
					end
				end
 
				Chasm.Parent = ViewportFrame
				Chasm.Material = Settings.Material
				Chasm.Color = Settings.Color
				Chasm.Anchored = true
 
				table.insert(Chasms, Chasm)
			end
		end
	end
end
 
function clearChasms() -- remove all chasms
	for _,Chasm in pairs(Chasms) do
		Chasm:Destroy()
	end
 
	Chasms = {}
end
 
while game:GetService('RunService').RenderStepped:Wait() do -- loop this process
	clearChasms()
 
	for _,Player in pairs(game:GetService('Players'):GetPlayers()) do
		if Player ~= game:GetService('Players').LocalPlayer then
			generateChasm(Player)
		end
	end
end
end)
 
  	end    
})

local mm2 = Window:MakeTab({
	Name = "MM2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

mm2:AddButton({
	Name = "MM2 1",
	Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Drifter0507/GUIS/main/MURDER%20MYSTERY%202", true))()
  	end    
})

local dahood = Window:MakeTab({
	Name = "Dahood",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

dahood:AddButton({
	Name = "Dahood",
	Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b95e8fecdf824e41f4a030044b055add.lua"))()
  	end    
})

local Rivals = Window:MakeTab({
	Name = "Rivals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Rivals:AddButton({
	Name = "rivals",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/rivals/main/rival"))()
  	end    
})

local PS99 = Window:MakeTab({
	Name = "PS99",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

PS99:AddButton({
	Name = "PS99",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/PyroXHUB/PyroX/main/PS99'))()
  	end    
})

local uni = Window:MakeTab({
	Name = "universal",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


uni:AddButton({
	Name = "Infyield",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  	end    
})

local Setings = Window:MakeTab({
	Name = "Setings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Settings:AddButton({
	Name = "Destroy GUI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})

OrionLib:Init()
