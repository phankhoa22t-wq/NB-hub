
-- NB HUB | Steal an Egg
-- Black UI | Roblox Studio LocalScript

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("NBHub")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "NBHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local function create(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

local black = Color3.fromRGB(16, 16, 16)
local panel = Color3.fromRGB(36, 36, 36)
local white = Color3.fromRGB(255, 255, 255)

local main = create("Frame", {
    Size = UDim2.fromOffset(300, 350),
    Position = UDim2.new(0.5, -150, 0.5, -175),
    BackgroundColor3 = black,
    BorderSizePixel = 0,
    Active = true,
    Draggable = true
}, gui)

create("UICorner", {
    CornerRadius = UDim.new(0, 12)
}, main)

create("TextLabel", {
    Size = UDim2.new(1, -45, 0, 45),
    Position = UDim2.fromOffset(12, 0),
    BackgroundTransparency = 1,
    Text = "NB HUB",
    TextColor3 = white,
    Font = Enum.Font.GothamBold,
    TextSize = 23,
    TextXAlignment = Enum.TextXAlignment.Left
}, main)

local close = create("TextButton", {
    Size = UDim2.fromOffset(32, 32),
    Position = UDim2.new(1, -38, 0, 6),
    Text = "X",
    TextColor3 = white,
    BackgroundColor3 = panel
}, main)

close.Activated:Connect(function()
    gui:Destroy()
end)

local function makeButton(text, y)
    local b = create("TextButton", {
        Size = UDim2.new(1, -24, 0, 38),
        Position = UDim2.fromOffset(12, y),
        Text = text,
        TextColor3 = white,
        BackgroundColor3 = panel,
        Font = Enum.Font.GothamSemibold,
        TextSize = 14
    }, main)

    create("UICorner", {
        CornerRadius = UDim.new(0, 7)
    }, b)

    return b
end

-- Chọn khu vực
local zones = {
    "Khu vực mặc định",
    "Khu vực trứng",
    "Khu vực sự kiện"
}

local zoneIndex = 1
local zoneButton = makeButton(
    "Khu vực: " .. zones[zoneIndex], 55
)

zoneButton.Activated:Connect(function()
    zoneIndex = zoneIndex % #zones + 1
    zoneButton.Text = "Khu vực: " .. zones[zoneIndex]
end)

-- Auto máy chạy bộ: nút giao diện
local autoRun = false
local runButton = makeButton("Auto máy chạy bộ: OFF", 103)

runButton.Activated:Connect(function()
    autoRun = not autoRun
    runButton.Text = "Auto máy chạy bộ: " ..
        (autoRun and "ON" or "OFF")
end)

-- Sự kiện
local eventButton = makeButton("Sự kiện", 151)
eventButton.Activated:Connect(function()
    eventButton.Text = "Sự kiện: Chưa có dữ liệu"
end)

-- Hop Server: nút giao diện
local hopButton = makeButton("Hop Server", 199)
hopButton.Activated:Connect(function()
    hopButton.Text = "Cần tích hợp hệ thống server"
end)

-- Ẩn / hiện menu
local hideButton = makeButton("Ẩn menu", 247)

local reopen = create("TextButton", {
    Size = UDim2.fromOffset(110, 38),
    Position = UDim2.new(0, 12, 0.5, -19),
    Text = "Mở NB HUB",
    TextColor3 = white,
    BackgroundColor3 = black,
    Visible = false
}, gui)

hideButton.Activated:Connect(function()
    main.Visible = false
    reopen.Visible = true
end)

reopen.Activated:Connect(function()
    main.Visible = true
    reopen.Visible = false
end)
