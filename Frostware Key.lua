local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "KeyGui"
KeyGui.ResetOnSpawn = false
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.Parent = playerGui

local Background = Instance.new("Frame", KeyGui)
Background.Size = UDim2.new(0, 297, 0, 200)
Background.Position = UDim2.new(0.165, 0, 0.34, 0)
Background.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Background.Active = true
Background.Draggable = true
Instance.new("UICorner", Background)
Instance.new("UIStroke", Background).Thickness = 2.9

local CloseBtn = Instance.new("TextButton", Background)
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(0.01, 0, 0.02, 0)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.FredokaOne
CloseBtn.TextSize = 20
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", CloseBtn)
Instance.new("UIStroke", CloseBtn).Thickness = 1.3

CloseBtn.MouseButton1Click:Connect(function()
    KeyGui:Destroy()
end)

local Title = Instance.new("TextLabel", Background)
Title.Position = UDim2.new(0.08, 0, 0.02, 0)
Title.Size = UDim2.new(0, 123, 0, 26)
Title.Text = "Frostware"
Title.Font = Enum.Font.FredokaOne
Title.FontFace.Weight = Enum.FontWeight.Bold
Title.TextSize = 29
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Instance.new("UIStroke", Title).Thickness = 1.3
Instance.new("UIGradient", Title).Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(0.15, Color3.fromRGB(0, 0, 147)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(0, 0, 127)),
    ColorSequenceKeypoint.new(0.59, Color3.fromRGB(0, 0, 127)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 43, 127))
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
local currentTween
local currentStroke

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
local stroke1 = Instance.new("UIStroke", Option1)
stroke1.Thickness = 1.3
stroke1.Color = Color3.fromRGB(255, 255, 255)

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
local stroke2 = Instance.new("UIStroke", Option2)
stroke2.Thickness = 1.3
stroke2.Color = Color3.fromRGB(255, 255, 255)

local function stopCurrentTween()
    if currentTween then
        currentTween:Cancel()
        currentTween = nil
    end
    if currentStroke then
        currentStroke.Color = Color3.fromRGB(255, 255, 255)
        currentStroke = nil
    end
end

local function startGlowAnimation(stroke)
    stopCurrentTween()
    currentStroke = stroke
    local brightBlue = Color3.fromRGB(0, 170, 255)
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    currentTween = TweenService:Create(stroke, tweenInfo, {Color = brightBlue})
    currentTween:Play()
end

local function clearSelection()
    stopCurrentTween()
    stroke1.Color = Color3.fromRGB(255, 255, 255)
    stroke2.Color = Color3.fromRGB(255, 255, 255)
end

Option1.MouseButton1Click:Connect(function()
    selectedLink = "https://ads.luarmor.net/v/cb/dwQQOBvvyFOS/GwwwrPjgoGMNFjlB"
    clearSelection()
    startGlowAnimation(stroke1)
end)

Option2.MouseButton1Click:Connect(function()
    selectedLink = "https://ads.luarmor.net/v/cb/OwAyyGgObIDY/MHkWoGnuWBlfakdA"
    clearSelection()
    startGlowAnimation(stroke2)
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

local function createNotification(text, isGradient)
    local note = Instance.new("TextLabel", Background)
    note.Size = UDim2.new(0, 260, 0, 20)
    note.Position = UDim2.new(0.05, 0, 0.27, 0)
    note.Text = text
    note.Font = Enum.Font.FredokaOne
    note.BackgroundTransparency = 1
    note.TextScaled = true

    if isGradient then
        note.TextColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UIStroke", note).Thickness = 1.1

        local grad = Instance.new("UIGradient", note)
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 150, 255))
        })
    else
        note.TextColor3 = Color3.fromRGB(255, 100, 100)
    end

    task.delay(3, function()
        if note then note:Destroy() end
    end)
end

GET.MouseButton1Click:Connect(function()
    if selectedLink then
        setclipboard(selectedLink)
    else
        createNotification("Please select a provider and try again.", false)
    end
end)

local checkingInProgress = false

CHECK.MouseButton1Click:Connect(function()
    if checkingInProgress then return end
    local keyInput = TextBox.Text

    if keyInput == "" then
        createNotification("Enter your key in the textbox below and try again.", false)
        return
    end

    checkingInProgress = true
    CHECK.AutoButtonColor = false
    CHECK.TextTransparency = 0.5

    local note = Instance.new("TextLabel", Background)
    note.Size = UDim2.new(0, 260, 0, 20)
    note.Position = UDim2.new(0.05, 0, 0.27, 0)
    note.Font = Enum.Font.FredokaOne
    note.BackgroundTransparency = 1
    note.TextScaled = true
    note.TextColor3 = Color3.fromRGB(255, 255, 255)

    local stroke = Instance.new("UIStroke", note)
    stroke.Thickness = 1.1

    local grad = Instance.new("UIGradient", note)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 150, 255))
    })

    note.Text = "Checking key"
    note.Parent = Background

    task.spawn(function()
        for i = 1, 3 do
            if note then
                wait(0.4)
                note.Text = "Checking key" .. string.rep(".", i)
            end
        end
        if note then
            local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(note, tweenInfo, {TextTransparency = 1})
            tween:Play()
            tween.Completed:Wait()
            note:Destroy()
        end
    end)

    local script_key = keyInput
    local code = [[
        script_key = "]] .. script_key .. [[";

        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/87fdf6d3de83847864dfa76f8eb36be6.lua"))()
    ]]

    local func, err = loadstring(code)

    if func then
        func()
        
    else
        warn("Error loading key script:", err)
        createNotification("Invalid or expired key.", false)
    end
end)
