
-- NopHub Blue V5 - Mobile UI
-- Giao dien demo, co chua chuc nang exploit

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("NopHub")
if old then old:Destroy() end

local BLUE = Color3.fromRGB(0, 145, 255)
local BG = Color3.fromRGB(15, 21, 33)
local PANEL = Color3.fromRGB(24, 34, 51)
local WHITE = Color3.fromRGB(240, 246, 255)

local gui = Instance.new("ScreenGui")
gui.Name = "NopHub"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(340, 300)
main.Position = UDim2.new(0.5, -170, 0.5, -150)
main.BackgroundColor3 = BG
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 12)

local outline = Instance.new("UIStroke", main)
outline.Color = BLUE
outline.Thickness = 2

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 42)
header.BackgroundColor3 = BLUE
header.BorderSizePixel = 0
header.Parent = main
header.Active = true

Instance.new("UICorner", header).CornerRadius =
    UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.fromOffset(12, 0)
title.BackgroundTransparency = 1
title.Text = "NopHub | Blue V5"
title.TextColor3 = WHITE
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local function makeHeaderButton(text, x)
    local b = Instance.new("TextButton")
    b.Size = UDim2.fromOffset(32, 30)
    b.Position = UDim2.new(1, x, 0, 6)
    b.BackgroundColor3 = Color3.fromRGB(0, 105, 205)
    b.Text = text
    b.TextColor3 = WHITE
    b.TextSize = 17
    b.Font = Enum.Font.GothamBold
    b.Parent = header
    Instance.new("UICorner", b).CornerRadius =
        UDim.new(0, 7)
    return b
end

local minimize = makeHeaderButton("−", -72)
local close = makeHeaderButton("X", -36)

local body = Instance.new("Frame")
body.Position = UDim2.fromOffset(8, 50)
body.Size = UDim2.new(1, -16, 1, -58)
body.BackgroundTransparency = 1
body.Parent = main

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 104, 1, 0)
sidebar.BackgroundColor3 = PANEL
sidebar.Parent = body
Instance.new("UICorner", sidebar).CornerRadius =
    UDim.new(0, 8)

local pageArea = Instance.new("Frame")
pageArea.Position = UDim2.fromOffset(112, 0)
pageArea.Size = UDim2.new(1, -112, 1, 0)
pageArea.BackgroundColor3 = PANEL
pageArea.ClipsDescendants = true
pageArea.Parent = body
Instance.new("UICorner", pageArea).CornerRadius =
    UDim.new(0, 8)

local pages = {}
local currentPage
local tabs = {}

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = BLUE
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.CanvasSize = UDim2.new()
    page.Visible = false
    page.Parent = pageArea

    local pad = Instance.new("UIPadding", page)
    pad.PaddingTop = UDim.new(0, 8)
    pad.PaddingLeft = UDim.new(0, 8)
    pad.PaddingRight = UDim.new(0, 8)
    pad.PaddingBottom = UDim.new(0, 8)

    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 7)
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    pages[name] = page
    return page
end

local function addLabel(page, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 32)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = BLUE
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextWrapped = true
    label.Parent = page
    return label
end

local function addButton(page, text, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 36)
    b.BackgroundColor3 = Color3.fromRGB(37, 53, 74)
    b.Text = text
    b.TextColor3 = WHITE
    b.Font = Enum.Font.GothamMedium
    b.TextSize = 12
    b.TextWrapped = true
    b.Parent = page

    Instance.new("UICorner", b).CornerRadius =
        UDim.new(0, 7)

    b.Activated:Connect(callback)
    return b
end

local function addToggle(page, text, callback)
    local enabled = false
    local b

    local function refresh()
        b.Text = text .. (enabled and "  [ON]" or "  [OFF]")
        b.BackgroundColor3 = enabled and BLUE
            or Color3.fromRGB(37, 53, 74)
    end

    b = addButton(page, text .. "  [OFF]", function()
        enabled = not enabled
        refresh()
        callback(enabled)
    end)

    return b
end

local function showPage(name)
    if currentPage then
        currentPage.Visible = false
    end

    currentPage = pages[name]
    currentPage.Visible = true

    for tabName, tab in pairs(tabs) do
        tab.BackgroundColor3 =
            tabName == name and BLUE or BG
    end
end

local names = {
    "Trang chu",
    "Su kien",
    "Cay cuoc",
    "Cai dat"
}

for i, name in ipairs(names) do
    local page = createPage(name)

    local tab = Instance.new("TextButton")
    tab.Size = UDim2.new(1, -8, 0, 38)
    tab.Position = UDim2.fromOffset(4, 5 + (i - 1) * 43)
    tab.BackgroundColor3 = BG
    tab.Text = name
    tab.TextColor3 = WHITE
    tab.Font = Enum.Font.GothamMedium
    tab.TextSize = 11
    tab.Parent = sidebar

    Instance.new("UICorner", tab).CornerRadius =
        UDim.new(0, 6)

    tabs[name] = tab
    tab.Activated:Connect(function()
        showPage(name)
    end)
end

-- TRANG CHU
local home = pages["Trang chu"]
addLabel(home, "CHAO MUNG DEN NOPHUB")

local status = addLabel(home, "Trang thai: San sang")
status.TextColor3 = WHITE
status.Font = Enum.Font.Gotham

addButton(home, "Kiem tra nhan vat", function()
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")

    status.Text = hum
        and ("Nhan vat san sang | HP: " ..
            math.floor(hum.Health))
        or "Nhan vat chua san sang"
end)

addButton(home, "Dat lai trang thai", function()
    status.Text = "Trang thai: San sang"
end)

-- SU KIEN: TOGGLE GIA LAP
local events = pages["Su kien"]
addLabel(events, "SU KIEN - DEMO")

local eventStatus = addLabel(events, "Chua bat")
eventStatus.TextColor3 = WHITE
eventStatus.Font = Enum.Font.Gotham

addToggle(events, "Che do mau", function(on)
    eventStatus.Text = on and
        "Che do mau: dang bat" or "Che do mau: da tat"
end)

-- CAY CUOC: CAC NUT DEMO
local farm = pages["Cay cuoc"]
addLabel(farm, "CONG CU DEMO")

local count = 0
local counterLabel = addLabel(farm, "So lan bam: 0")
counterLabel.TextColor3 = WHITE
counterLabel.Font = Enum.Font.Gotham

addButton(farm, "Tang bo dem", function()
    count += 1
    counterLabel.Text = "So lan bam: " .. count
end)

addToggle(farm, "Thong bao mau", function(on)
    counterLabel.Text = on and
        "Thong bao mau: ON" or
        ("So lan bam: " .. count)
end)

-- CAI DAT
local settings = pages["Cai dat"]
addLabel(settings, "CAI DAT GIAO DIEN")

addButton(settings, "Doi mau xanh sang cyan", function()
    outline.Color = Color3.fromRGB(0, 230, 255)
    header.BackgroundColor3 = Color3.fromRGB(0, 120, 220)
end)

addButton(settings, "Dat lai mau xanh", function()
    outline.Color = BLUE
    header.BackgroundColor3 = BLUE
end)

addButton(settings, "Hien lai menu", function()
    main.Visible = true
end)

-- X va nut tru chi THU GON, KHONG XOA GUI
local collapsed = false

local function setCollapsed(value)
    collapsed = value
    body.Visible = not collapsed
    main.Size = collapsed
        and UDim2.fromOffset(340, 42)
        or UDim2.fromOffset(340, 300)
    minimize.Text = collapsed and "+" or "−"
end

minimize.Activated:Connect(function()
    setCollapsed(not collapsed)
end)

close.Activated:Connect(function()
    setCollapsed(true)
end)

-- KEOL THA BANG CAM UNG / CHUOT
local dragging = false
local dragStart
local startPos
local dragInput

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input == dragInput
        or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

showPage("Trang chu")
print("NopHub Blue V5 loaded")
