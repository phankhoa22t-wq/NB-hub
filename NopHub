
-- NopHub V1 | Blue Edition
-- UI template for your own Roblox experience
-- Place as a LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("NopHub")
if old then old:Destroy() end

local blue = Color3.fromRGB(0, 135, 255)
local darkBlue = Color3.fromRGB(8, 20, 42)
local panelBlue = Color3.fromRGB(12, 35, 70)
local textColor = Color3.fromRGB(245, 248, 255)

local gui = Instance.new("ScreenGui")
gui.Name = "NopHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.92, 0, 0, 500)
main.Position = UDim2.new(0.04, 0, 0.18, 0)
main.BackgroundColor3 = darkBlue
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 52)
header.BackgroundColor3 = panelBlue
header.BorderSizePixel = 0
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 14)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.fromOffset(14, 0)
title.BackgroundTransparency = 1
title.Text = "🔵 NopHub V1"
title.TextColor3 = textColor
title.Font = Enum.Font.GothamBold
title.TextSize = 21
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(34, 34)
close.Position = UDim2.new(1, -42, 0, 9)
close.BackgroundColor3 = blue
close.Text = "X"
close.TextColor3 = textColor
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = close

close.Activated:Connect(function()
    gui:Destroy()
end)

local sidebar = Instance.new("Frame")
sidebar.Position = UDim2.fromOffset(0, 52)
sidebar.Size = UDim2.new(0, 112, 1, -52)
sidebar.BackgroundColor3 = Color3.fromRGB(6, 16, 34)
sidebar.BorderSizePixel = 0
sidebar.Parent = main

local content = Instance.new("ScrollingFrame")
content.Position = UDim2.fromOffset(122, 62)
content.Size = UDim2.new(1, -132, 1, -74)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ScrollBarThickness = 4
content.ScrollBarImageColor3 = blue
content.CanvasSize = UDim2.new()
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.Parent = main

local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0, 8)
contentLayout.Parent = content

local pages = {
    "Trang chủ",
    "Sự kiện",
    "Cày cuốc",
    "Cướp trứng",
    "Cài đặt"
}

local function clearContent()
    for _, item in ipairs(content:GetChildren()) do
        if item:IsA("GuiObject")
            and not item:IsA("UIListLayout") then
            item:Destroy()
        end
    end
end

local function addLabel(text, height)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -4, 0, height or 42)
    label.BackgroundColor3 = panelBlue
    label.Text = "  " .. text
    label.TextColor3 = textColor
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 14
    label.TextWrapped = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = content

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = label
    return label
end

local function addToggle(text)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -4, 0, 42)
    row.BackgroundColor3 = panelBlue
    row.Parent = content

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = row

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -72, 1, 0)
    label.Position = UDim2.fromOffset(10, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = textColor
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = row

    local button = Instance.new("TextButton")
    button.Size = UDim2.fromOffset(48, 25)
    button.Position = UDim2.new(1, -56, 0.5, -12)
    button.BackgroundColor3 = Color3.fromRGB(65, 75, 95)
    button.Text = "OFF"
    button.TextColor3 = textColor
    button.Font = Enum.Font.GothamBold
    button.TextSize = 10
    button.Parent = row

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = button

    local enabled = false
    button.Activated:Connect(function()
        enabled = not enabled
        button.Text = enabled and "ON" or "OFF"
        button.BackgroundColor3 = enabled
            and blue or Color3.fromRGB(65, 75, 95)
    end)
end

local function showPage(page)
    clearContent()

    if page == "Trang chủ" then
        addLabel("Chào mừng đến với NopHub!", 48)
        addLabel("Người chơi: " .. player.DisplayName)
        addLabel("Tên tài khoản: " .. player.Name)
        addLabel("Phiên bản: V1 Blue Edition")
        addLabel("Các chức năng cần tích hợp với game.")
    elseif page == "Sự kiện" then
        addLabel("SỰ KIỆN", 42)
        addToggle("Thông báo sự kiện")
        addToggle("Tự nhận thưởng - giao diện")
        addToggle("Tự trang bị - giao diện")
        addLabel("Đua xe | Sao băng | Bắt bướm | Phòng Lab")
    elseif page == "Cày cuốc" then
        addLabel("CHUỒNG ẤP", 42)
        addToggle("Tự động đặt trứng - giao diện")
        addToggle("Tự động ấp - giao diện")
        addLabel("MÁY TẬP", 42)
        addToggle("Auto máy chạy bộ - giao diện")
        addLabel("QUẢN LÝ", 42)
        addToggle("Tự bán vật phẩm - giao diện")
    elseif page == "Cướp trứng" then
        addLabel("CHỌN KHU VỰC", 42)

        local zones = {
            "Khu vực mặc định",
            "Khu vực trứng",
            "Khu vực sự kiện"
        }
        local index = 1

        local zoneButton = Instance.new("TextButton")
        zoneButton.Size = UDim2.new(1, -4, 0, 42)
        zoneButton.BackgroundColor3 = blue
        zoneButton.Text = zones[index] .. "  ▼"
        zoneButton.TextColor3 = textColor
        zoneButton.Font = Enum.Font.GothamBold
        zoneButton.TextSize = 13
        zoneButton.Parent = content

        local zc = Instance.new("UICorner")
        zc.CornerRadius = UDim.new(0, 8)
        zc.Parent = zoneButton

        zoneButton.Activated:Connect(function()
            index = index % #zones + 1
            zoneButton.Text = zones[index] .. "  ▼"
        end)

        addToggle("Tự động cướp - giao diện")
        addToggle("Bộ lọc trứng - giao diện")
        addLabel("Các lựa chọn hiện chưa tác động đến gameplay.")
    elseif page == "Cài đặt" then
        addToggle("Hiệu ứng giao diện")
        addLabel("NopHub V1 | Blue Edition")
        addLabel("Nhấn X để đóng menu.")
    end
end

for i, page in ipairs(pages) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 42)
    button.Position = UDim2.fromOffset(5, 8 + (i - 1) * 49)
    button.BackgroundColor3 = panelBlue
    button.Text = page
    button.TextColor3 = textColor
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 11
    button.Parent = sidebar

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 8)
    bc.Parent = button

    button.Activated:Connect(function()
        for _, child in ipairs(sidebar:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = panelBlue
            end
        end
        button.BackgroundColor3 = blue
        showPage(page)
    end)
end

showPage("Trang chủ")
