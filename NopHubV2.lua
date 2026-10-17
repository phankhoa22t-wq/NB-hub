
-- NopHubV2 | BLUE EDITION
-- Giao diện mẫu, không chứa chức năng exploit

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("NopHubV2")
if old then old:Destroy() end

local blue = Color3.fromRGB(0, 170, 255)
local dark = Color3.fromRGB(12, 18, 29)
local panel = Color3.fromRGB(23, 33, 49)
local white = Color3.fromRGB(240, 248, 255)
local muted = Color3.fromRGB(150, 170, 195)

local gui = Instance.new("ScreenGui")
gui.Name = "NopHubV2"
gui.ResetOnSpawn = false
gui.Parent = pg

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 330, 0, 370)
main.Position = UDim2.new(0.5, -165, 0.5, -185)
main.BackgroundColor3 = dark
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local outline = Instance.new("UIStroke", main)
outline.Color = blue
outline.Thickness = 1.5

local function makeButton(parent, text, size, pos)
    local b = Instance.new("TextButton", parent)
    b.Size = size
    b.Position = pos
    b.Text = text
    b.TextColor3 = white
    b.TextSize = 12
    b.Font = Enum.Font.GothamSemibold
    b.BackgroundColor3 = panel
    b.AutoButtonColor = true
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 7)
    return b
end

local header = Instance.new("TextLabel", main)
header.Size = UDim2.new(1, -95, 0, 44)
header.Position = UDim2.new(0, 12, 0, 0)
header.BackgroundTransparency = 1
header.Text = "NopHubV2  |  BLUE"
header.TextColor3 = blue
header.TextSize = 16
header.Font = Enum.Font.GothamBold
header.TextXAlignment = Enum.TextXAlignment.Left

local mini = makeButton(main, "–", UDim2.new(0, 30, 0, 28),
    UDim2.new(1, -70, 0, 8))
local close = makeButton(main, "×", UDim2.new(0, 30, 0, 28),
    UDim2.new(1, -36, 0, 8))
close.BackgroundColor3 = Color3.fromRGB(120, 40, 55)

local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.new(0, 8, 0, 50)
sidebar.Size = UDim2.new(0, 103, 1, -58)
sidebar.BackgroundTransparency = 1

local content = Instance.new("Frame", main)
content.Position = UDim2.new(0, 119, 0, 50)
content.Size = UDim2.new(1, -127, 1, -58)
content.BackgroundColor3 = panel
content.BorderSizePixel = 0
Instance.new("UICorner", content).CornerRadius = UDim.new(0, 9)

local pages, tabButtons = {}, {}
local tabNames = {"Trang chủ", "Tiện ích", "Ghi chú", "Cài đặt"}

local function newPage(name)
    local page = Instance.new("ScrollingFrame", content)
    page.Name = name
    page.Position = UDim2.new(0, 6, 0, 6)
    page.Size = UDim2.new(1, -12, 1, -12)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = blue
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.Visible = false

    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    local pad = Instance.new("UIPadding", page)
    pad.PaddingTop = UDim.new(0, 3)
    pages[name] = page
    return page
end

local function addLabel(page, text)
    local label = Instance.new("TextLabel", page)
    label.Size = UDim2.new(1, -2, 0, 43)
    label.BackgroundColor3 = dark
    label.Text = text
    label.TextColor3 = white
    label.TextSize = 11
    label.TextWrapped = true
    label.Font = Enum.Font.Gotham
    Instance.new("UICorner", label).CornerRadius = UDim.new(0, 7)
end

local function addToggle(page, text, callback)
    local row = Instance.new("Frame", page)
    row.Size = UDim2.new(1, -2, 0, 40)
    row.BackgroundColor3 = dark
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 7)

    local label = Instance.new("TextLabel", row)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.Size = UDim2.new(1, -62, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = white
    label.TextSize = 10
    label.Font = Enum.Font.GothamMedium
    label.TextXAlignment = Enum.TextXAlignment.Left

    local enabled = false
    local btn = makeButton(row, "OFF", UDim2.new(0, 45, 0, 25),
        UDim2.new(1, -51, 0.5, -12))
    btn.TextSize = 10
    btn.Activated:Connect(function()
        enabled = not enabled
        btn.Text = enabled and "ON" or "OFF"
        btn.BackgroundColor3 = enabled and blue or panel
        if callback then callback(enabled) end
    end)
end

for i, name in ipairs(tabNames) do
    local tab = makeButton(sidebar, name, UDim2.new(1, 0, 0, 37),
        UDim2.new(0, 0, 0, (i-1)*44))
    tab.TextSize = 11
    tabButtons[name] = tab
    newPage(name)
end

local function showPage(name)
    for n, p in pairs(pages) do p.Visible = n == name end
    for n, b in pairs(tabButtons) do
        b.BackgroundColor3 = n == name and Color3.fromRGB(0, 95, 165) or panel
    end
end

addLabel(pages["Trang chủ"], "Chào mừng đến với NopHubV2!")
addLabel(pages["Trang chủ"], "BLUE EDITION • Giao diện điện thoại")
addLabel(pages["Trang chủ"], "Trạng thái: Đang hoạt động")

addToggle(pages["Tiện ích"], "Hiệu ứng tiêu đề", function(on)
    header.TextColor3 = on and blue or muted
end)
addToggle(pages["Tiện ích"], "Viền xanh", function(on)
    outline.Enabled = on
end)
addLabel(pages["Tiện ích"], "Công tắc mẫu chỉ thay đổi giao diện.")

addLabel(pages["Ghi chú"], "Chạm tab bên trái để chuyển trang.")
addLabel(pages["Ghi chú"], "Kéo thanh tiêu đề để di chuyển menu.")
addLabel(pages["Cài đặt"], "NopHubV2 • Blue Theme")
addToggle(pages["Cài đặt"], "Chế độ xanh", function(on)
    header.TextColor3 = on and blue or white
end)

showPage("Trang chủ")

-- Thu nhỏ và mở rộng
local minimized = false
local fullSize = main.Size
mini.Activated:Connect(function()
    minimized = not minimized
    if minimized then
        fullSize = main.Size
        sidebar.Visible = false
        content.Visible = false
        main.Size = UDim2.new(0, 230, 0, 44)
        mini.Text = "+"
    else
        main.Size = fullSize
        sidebar.Visible = true
        content.Visible = true
        mini.Text = "–"
    end
end)

close.Activated:Connect(function()
    gui:Destroy()
end)

-- Kéo thả bằng cảm ứng hoặc chuột
local dragging, dragStart, startPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
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

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)
