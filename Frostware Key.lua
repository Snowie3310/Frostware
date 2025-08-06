repeat task.wait() until game:IsLoaded()
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "87fdf6d3de83847864dfa76f8eb36be6"

local function notify(title, text, duration)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = title,
		Text = text,
		Duration = duration or 5
	})
end

local function notifyCustom(text)
	local existingGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("KeyGui")
	if not existingGui then return end
	local note = Instance.new("TextLabel", existingGui:FindFirstChild("Frame") or existingGui)
	note.Size = UDim2.new(0, 260, 0, 20)
	note.Position = UDim2.new(0.05, 0, 0.27, 0)
	note.Text = text
	note.Font = Enum.Font.FredokaOne
	note.TextColor3 = Color3.fromRGB(255, 100, 100)
	note.BackgroundTransparency = 1
	note.TextScaled = true

	task.delay(3, function()
		if note then
			note:Destroy()
		end
	end)
end

local savedKeyPath = "FrostWare_Key.lua"
if isfile(savedKeyPath) then
	local savedKey = readfile(savedKeyPath)
	local status = api.check_key(savedKey)
	if status.code == "KEY_VALID" then
		getgenv().script_key = savedKey
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/87fdf6d3de83847864dfa76f8eb36be6.lua"))()
		return
	else
		task.wait(1)
	end
end

local HttpService = game:GetService("HttpService")

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "KeyGui"
KeyGui.ResetOnSpawn = false
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Background = Instance.new("Frame", KeyGui)
Background.Name = "Frame"
Background.Size = UDim2.new(0, 297, 0, 200)
Background.Position = UDim2.new(0.165, 0, 0.34, 0)
Background.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Background.Active = true
Background.Draggable = true
Instance.new("UICorner", Background)
Instance.new("UIStroke", Background).Thickness = 2.9

local CloseBtn = Instance.new("TextButton", Background)
CloseBtn.Position = UDim2.new(0.005, 0, 0.015, 0)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.FredokaOne
CloseBtn.FontFace.Weight = Enum.FontWeight.Bold
CloseBtn.TextSize = 22
CloseBtn.TextColor3 = Color3.fromRGB(255, 75, 75)
CloseBtn.BackgroundTransparency = 1
Instance.new("UIStroke", CloseBtn).Thickness = 1.3

CloseBtn.MouseButton1Click:Connect(function()
	KeyGui:Destroy()
end)

local Title = Instance.new("TextLabel", Background)
Title.Position = UDim2.new(0.115, 0, 0.02, 0)
Title.Size = UDim2.new(0, 123, 0, 26)
Title.Text = "Frostware"
Title.Font = Enum.Font.FredokaOne
Title.FontFace.Weight = Enum.FontWeight.Bold
Title.TextSize = 29
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Instance.new("UIStroke", Title).Thickness = 1.3
Instance.new("UIGradient", Title).Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)),
	ColorSequenceKeypoint.new(0.15, Color3.fromRGB(0, 0, 147)),
	ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 0, 127)),
	ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)),
	ColorSequenceKeypoint.new(1.00, Color3.fromRGB(17, 43, 127))
})

local discord = Instance.new("TextLabel", Background)
discord.Position = UDim2.new(0.689, 0, 0.015, 0)
discord.Size = UDim2.new(0, 86, 0, 22)
discord.Text = ".gg/getfrost"
discord.Font = Enum.Font.FredokaOne
discord.FontFace.Weight = Enum.FontWeight.Bold
discord.TextSize = 14
discord.TextColor3 = Color3.fromRGB(255, 255, 255)
discord.BackgroundTransparency = 1
Instance.new("UIStroke", discord).Thickness = 1.3

local selectedLink = nil
local stroke1, stroke2

local Option1 = Instance.new("TextButton", Background)
Option1.Size = UDim2.new(0, 135, 0, 25)
Option1.Position = UDim2.new(0.05, 0, 0.17, 0)
Option1.Text = "Linkvertise"
Option1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Option1.Font = Enum.Font.FredokaOne
Option1.FontFace.Weight = Enum.FontWeight.Bold
Option1.TextSize = 14
Option1.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Option1)
stroke1 = Instance.new("UIStroke", Option1)
stroke1.Thickness = 1.3

local Option2 = Instance.new("TextButton", Background)
Option2.Size = UDim2.new(0, 135, 0, 25)
Option2.Position = UDim2.new(0.51, 0, 0.17, 0)
Option2.Text = "Lootlab"
Option2.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Option2.Font = Enum.Font.FredokaOne
Option2.FontFace.Weight = Enum.FontWeight.Bold
Option2.TextSize = 14
Option2.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Option2)
stroke2 = Instance.new("UIStroke", Option2)
stroke2.Thickness = 1.3

local function clearSelection()
	stroke1.Color = Color3.fromRGB(255, 255, 255)
	stroke2.Color = Color3.fromRGB(255, 255, 255)
end

Option1.MouseButton1Click:Connect(function()
	Option1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Option2.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
	selectedLink = "https://ads.luarmor.net/v/cb/dwQQOBvvyFOS/GwwwrPjgoGMNFjlB"
	clearSelection()
	stroke1.Color = Color3.fromRGB(0, 170, 255)
end)

Option2.MouseButton1Click:Connect(function()
	Option2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Option1.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
	selectedLink = "https://ads.luarmor.net/v/cb/OwAyyGgObIDY/MHkWoGnuWBlfakdA"
	clearSelection()
	stroke2.Color = Color3.fromRGB(0, 170, 255)
end)

local TextBox = Instance.new("TextBox", Background)
TextBox.Position = UDim2.new(0.137, 0, 0.37, 0)
TextBox.Size = UDim2.new(0, 220, 0, 26)
TextBox.PlaceholderText = "Key Here"
TextBox.Text = ""
TextBox.Font = Enum.Font.FredokaOne
TextBox.TextSize = 14
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Instance.new("UICorner", TextBox)
Instance.new("UIStroke", TextBox).Thickness = 1.3

local GET = Instance.new("TextButton", Background)
GET.Position = UDim2.new(0.168, 0, 0.57, 0)
GET.Size = UDim2.new(0, 89, 0, 44)
GET.Text = "Get Key"
GET.Font = Enum.Font.FredokaOne
GET.FontFace.Weight = Enum.FontWeight.Bold
GET.TextSize = 14
GET.TextColor3 = Color3.fromRGB(255, 255, 255)
GET.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", GET)
Instance.new("UIStroke", GET).Thickness = 1.3

local CHECK = Instance.new("TextButton", Background)
CHECK.Position = UDim2.new(0.538, 0, 0.57, 0)
CHECK.Size = UDim2.new(0, 89, 0, 44)
CHECK.Text = "Check Key"
CHECK.Font = Enum.Font.FredokaOne
CHECK.FontFace.Weight = Enum.FontWeight.Bold
CHECK.TextSize = 14
CHECK.TextColor3 = Color3.fromRGB(255, 255, 255)
CHECK.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", CHECK)
Instance.new("UIStroke", CHECK).Thickness = 1.3

local ACTIVATE = Instance.new("TextButton", Background)
ACTIVATE.Position = UDim2.new(0.167, 0, 0.83, 0)
ACTIVATE.Size = UDim2.new(0, 198, 0, 23)
ACTIVATE.Text = "Copy Discord"
ACTIVATE.Font = Enum.Font.FredokaOne
ACTIVATE.FontFace.Weight = Enum.FontWeight.Bold
ACTIVATE.TextSize = 14
ACTIVATE.TextColor3 = Color3.fromRGB(255, 255, 255)
ACTIVATE.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", ACTIVATE)
Instance.new("UIStroke", ACTIVATE).Thickness = 1.3

ACTIVATE.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/getfrost")
        notify("Success", "Discord link Successfully Copied.", 5)
    else
        notify("Error", "Clipboard function not available.", 5)
    end
end)

GET.MouseButton1Click:Connect(function()
	if selectedLink then
		setclipboard(selectedLink)
	else
		notifyCustom("Please select a provider and try again.")
	end
end)

CHECK.MouseButton1Click:Connect(function()
	local enteredKey = TextBox.Text
	if enteredKey == "" then
		notify("Error", "Please enter a key.", 5)
		return
	end

	local status = api.check_key(enteredKey)
	if status.code == "KEY_VALID" then
		notify("Success", "Key is valid! Loading Frostware...", 5)
		getgenv().script_key = tostring(enteredKey)
		writefile(savedKeyPath, enteredKey)
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/87fdf6d3de83847864dfa76f8eb36be6.lua"))()
		KeyGui:Destroy()
	elseif status.code == "KEY_HWID_LOCKED" or status.code == "KEY_INCORRECT" then
		notifyCustom("Your key has expired.")
	else
		notifyCustom("Your key has expired.")
	end
end)
