repeat task.wait() until game:IsLoaded()

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "87fdf6d3de83847864dfa76f8eb36be6"

local savedKeyPath = "FrostWare_sex.lua"

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local SideNotify = {}
local activeNotifs = {}
local notifSpacing = 6
local notifWidth, notifHeight = 220, 50
local exitTweenTime = 0.4

local parentGui = Instance.new("ScreenGui")
parentGui.IgnoreGuiInset = true
parentGui.ResetOnSpawn = false
parentGui.Parent = CoreGui

local function getYPosition(index)
    local viewportY = workspace.CurrentCamera.ViewportSize.Y
    return 0.85 * viewportY - ((index - 1) * (notifHeight + notifSpacing))
end

local function updateStack()
    for i, notif in ipairs(activeNotifs) do
        local targetY = getYPosition(i)
        TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Position = UDim2.new(1, -notifWidth - 20, 0, targetY)
        }):Play()
    end
end

function SideNotify.Notify(message, duration)
    duration = duration or 3

    local frame = Instance.new("Frame")
    frame.Parent = parentGui
    frame.Size = UDim2.new(0, notifWidth, 0, notifHeight)
    frame.Position = UDim2.new(1, notifWidth, 0, workspace.CurrentCamera.ViewportSize.Y * 0.85)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.BackgroundTransparency = 0.1
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    local info = Instance.new("TextLabel")
    info.Parent = frame
    info.BackgroundTransparency = 1
    info.Size = UDim2.new(1, -10, 0, 14)
    info.Position = UDim2.new(0, 8, 0, 4)
    info.Font = Enum.Font.GothamBold
    info.Text = "FrostWare"
    info.TextColor3 = Color3.fromRGB(200, 200, 200)
    info.TextSize = 12
    info.TextXAlignment = Enum.TextXAlignment.Left

    local text = Instance.new("TextLabel")
    text.Parent = frame
    text.BackgroundTransparency = 1
    text.Size = UDim2.new(1, -10, 0, 25)
    text.Position = UDim2.new(0, 8, 0, 18)
    text.Font = Enum.Font.GothamBold
    text.Text = message
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.TextSize = 16
    text.TextXAlignment = Enum.TextXAlignment.Left

    local bar = Instance.new("Frame")
    bar.Parent = frame
    bar.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    bar.Size = UDim2.new(1, -16, 0, 3)
    bar.Position = UDim2.new(0, 8, 1, -6)
    bar.BorderSizePixel = 0
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 3)

    table.insert(activeNotifs, frame)
    updateStack()

    TweenService:Create(bar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 0, 3)
    }):Play()

    task.delay(duration, function()
        if not frame.Parent then return end
        for i, notif in ipairs(activeNotifs) do
            if notif == frame then
                table.remove(activeNotifs, i)
                break
            end
        end
        TweenService:Create(frame, TweenInfo.new(exitTweenTime, Enum.EasingStyle.Quad), {
            Position = UDim2.new(1, notifWidth, frame.Position.Y.Scale, frame.Position.Y.Offset)
        }):Play()
        task.delay(exitTweenTime, function()
            frame:Destroy()
            updateStack()
        end)
    end)
end

getgenv().sideNotify = function(message, duration)
    SideNotify.Notify(message, duration)
end

if isfile(savedKeyPath) then
    local savedKey = readfile(savedKeyPath)
    local status = api.check_key(savedKey)
    if status.code == "KEY_VALID" then
        getgenv().script_key = tostring(savedKey)
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/87fdf6d3de83847864dfa76f8eb36be6.lua"))()
        return
    end
end

local gui = Instance.new("ScreenGui")
gui.Name = "FWSDkey"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = gethui()

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 360, 0, 240)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.BorderSizePixel = 0
main.Parent = gui
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "FrostWare"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
local xGradient = Instance.new("UIGradient", closeBtn)
xGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
}
xGradient.Rotation = 45
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local subtitle = Instance.new("TextLabel", main)
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 40)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Enter your key to begin. For free."
subtitle.TextColor3 = Color3.fromRGB(170, 170, 170)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14

local toggleFrame = Instance.new("Frame", main)
toggleFrame.Size = UDim2.new(0.9, 0, 0, 40)
toggleFrame.Position = UDim2.new(0.05, 0, 0, 70)
toggleFrame.BackgroundTransparency = 1

local function createGlowOutline(parent)
    Instance.new("UICorner", parent).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", parent)
    stroke.Name = "GlowStroke"
    stroke.Color = Color3.fromRGB(100, 70, 255)
    stroke.Thickness = 2
    stroke.Transparency = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return stroke
end

local linkvertise = Instance.new("TextButton", toggleFrame)
linkvertise.Size = UDim2.new(0.5, -5, 1, 0)
linkvertise.Position = UDim2.new(0, 0, 0, 0)
linkvertise.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
linkvertise.Text = "Linkvertise"
linkvertise.TextColor3 = Color3.fromRGB(200, 200, 200)
linkvertise.Font = Enum.Font.Gotham
linkvertise.TextSize = 14
linkvertise.AutoButtonColor = false
local linkGlow = createGlowOutline(linkvertise)

local linkIcon = Instance.new("ImageLabel", linkvertise)
linkIcon.Size = UDim2.new(0, 20, 0, 20)
linkIcon.Position = UDim2.new(0.089, 5,0.5, -10)
linkIcon.BackgroundTransparency = 1
linkIcon.Image = "rbxassetid://86481729660500"

local lootlab = Instance.new("TextButton", toggleFrame)
lootlab.Size = UDim2.new(0.5, -5, 1, 0)
lootlab.Position = UDim2.new(0.5, 5, 0, 0)
lootlab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
lootlab.Text = "Lootlab"
lootlab.TextColor3 = Color3.fromRGB(200, 200, 200)
lootlab.Font = Enum.Font.Gotham
lootlab.TextSize = 14
lootlab.AutoButtonColor = false
local lootGlow = createGlowOutline(lootlab)

local lootIcon = Instance.new("ImageLabel", lootlab)
lootIcon.Size = UDim2.new(0, 20, 0, 20)
lootIcon.Position = UDim2.new(0.089, 5,0.5, -10)
lootIcon.BackgroundTransparency = 1
lootIcon.Image = "rbxassetid://128402195473780"

local selected = nil
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear)
local currentTweens = {
    linkGlow = nil,
    lootGlow = nil,
}

local function fadeGlow(glowName, glow, targetTransparency)
    if currentTweens[glowName] then
        currentTweens[glowName]:Cancel()
        currentTweens[glowName] = nil
    end
    local tween = TweenService:Create(glow, tweenInfo, {Transparency = targetTransparency})
    currentTweens[glowName] = tween
    tween:Play()
    tween.Completed:Connect(function()
        if currentTweens[glowName] == tween then
            currentTweens[glowName] = nil
        end
    end)
end

local function selectButton(btnName)
    if btnName == "linkvertise" then
        selected = "linkvertise"
        fadeGlow("linkGlow", linkGlow, 0)
        fadeGlow("lootGlow", lootGlow, 1)
    elseif btnName == "lootlab" then
        selected = "lootlab"
        fadeGlow("linkGlow", linkGlow, 1)
        fadeGlow("lootGlow", lootGlow, 0)
    end
end

linkvertise.MouseButton1Click:Connect(function()
    if selected ~= "linkvertise" then
        selectButton("linkvertise")
    end
end)

lootlab.MouseButton1Click:Connect(function()
    if selected ~= "lootlab" then
        selectButton("lootlab")
    end
end)

local keyInput = Instance.new("TextBox", main)
keyInput.Size = UDim2.new(0.779, 0,0, 35)
keyInput.Position = UDim2.new(0.05, 0, 0, 125)
keyInput.PlaceholderText = "0000-0000-0000"
keyInput.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.Text = ""
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 14
Instance.new("UICorner", keyInput).CornerRadius = UDim.new(0, 8)

local textboxIcon = Instance.new("ImageLabel", keyInput)
textboxIcon.Size = UDim2.new(0, 20, 0, 20)
textboxIcon.Position = UDim2.new(0, -25, 0.5, -10)
textboxIcon.BackgroundTransparency = 1
textboxIcon.Image = "rbxassetid://131556088905771"

local paste = Instance.new("TextButton", main)
paste.Size = UDim2.new(0.101111181, 0, 0, 35)
paste.Position = UDim2.new(0.849, 0,0, 125)
paste.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
paste.Text = " "
paste.TextColor3 = Color3.fromRGB(200, 200, 200)
paste.Font = Enum.Font.Gotham
paste.TextSize = 14
Instance.new("UICorner", paste).CornerRadius = UDim.new(0, 8)

local pasteIcon = Instance.new("ImageLabel", paste)
pasteIcon.Size = UDim2.new(0, 20, 0, 20)
pasteIcon.Position = UDim2.new(0.082802549, 5, 0.5, -10)
pasteIcon.BackgroundTransparency = 1
pasteIcon.Image = "rbxassetid://98074949340874"
pasteIcon.ImageColor3 = Color3.fromRGB(178, 178, 178)

local getKey = Instance.new("TextButton", main)
getKey.Size = UDim2.new(0.45, -5, 0, 40)
getKey.Position = UDim2.new(0.05, 0, 0, 180)
getKey.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
getKey.Text = "Get key"
getKey.TextColor3 = Color3.fromRGB(255, 255, 255)
getKey.Font = Enum.Font.GothamBold
getKey.TextSize = 14
Instance.new("UICorner", getKey).CornerRadius = UDim.new(0, 8)

local getKeyIcon = Instance.new("ImageLabel", getKey)
getKeyIcon.Size = UDim2.new(0, 20, 0, 20)
getKeyIcon.Position = UDim2.new(0, 30, 0.5, -10)
getKeyIcon.BackgroundTransparency = 1
getKeyIcon.Image = "rbxassetid://85434572689388"

local verify = Instance.new("TextButton", main)
verify.Size = UDim2.new(0.45, -5, 0, 40)
verify.Position = UDim2.new(0.5, 5, 0, 180)
verify.BackgroundColor3 = Color3.fromRGB(100, 70, 255)
verify.Text = "Verify key"
verify.TextColor3 = Color3.fromRGB(255, 255, 255)
verify.Font = Enum.Font.GothamBold
verify.TextSize = 14
Instance.new("UICorner", verify).CornerRadius = UDim.new(0, 8)

paste.MouseButton1Click:Connect(function()
    pcall(function()
        keyInput.Text = getclipboard()
    end)
end)

getKey.MouseButton1Click:Connect(function()
    if not selected then
        sideNotify("Please select a provider..", 3)
        return
    end

    if selected == "linkvertise" then
        setclipboard("https://ads.luarmor.net/v/cb/dwQQOBvvyFOS/GwwwrPjgoGMNFjlB")
        sideNotify("Linkvertise link copied!", 3)
    elseif selected == "lootlab" then
        setclipboard("https://ads.luarmor.net/v/cb/OwAyyGgObIDY/MHkWoGnuWBlfakdA")
        sideNotify("Lootlab link copied!", 3)
    end
end)

verify.MouseButton1Click:Connect(function()
	local enteredKey = keyInput.Text
	if enteredKey == "" then
		sideNotify("Please enter a key.", 3)
		return
	end

	local status = api.check_key(enteredKey)
	if status.code == "KEY_VALID" then
		sideNotify("Valid key! Loading Frostware...", 3)
		getgenv().script_key = tostring(enteredKey)
		writefile(savedKeyPath, enteredKey)
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/87fdf6d3de83847864dfa76f8eb36be6.lua"))()
		gui:Destroy()
	elseif status.code == "KEY_HWID_LOCKED" or status.code == "KEY_INCORRECT" then
		sideNotify("Your key is invalid or locked.", 3)
	else
		sideNotify("Your key is invalid or expired.", 3)
	end
end)
