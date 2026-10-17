
--// NopHubV3 | BLUE OCEAN EDITION
--// UI demo: không có chức năng exploit gameplay

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("NopHubV3")
if old then old:Destroy() end

local C = {
    Blue = Color3.fromRGB(0, 180, 255),
    DarkBlue = Color3.fromRGB(0, 90, 160),
    Background = Color3.fromRGB(10, 15, 26),
    Panel = Color3.fromRGB(19, 28, 43),
    Card = Color3.fromRGB(27, 39, 57),
    White = Color3.fromRGB(240, 248, 255),
    Gray = Color3.fromRGB(145, 165, 190),
    Red = Color3.fromRGB(180, 55, 70)
}

local function create(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

local function round(obj, radius)
    create("UICorner", {
        CornerRadius = UDim.new(0, radius or 9)
    }, obj)
end

local gui = create("ScreenGui", {
    Name = "NopHubV3",
    ResetOnSpawn = false,
    DisplayOrder = 999
}, pg)

local main = create("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(350, 420),
    Position = UDim2.new(0.5, -175, 0.5, -210),
    BackgroundColor3 = C.Background,
    BorderSizePixel = 0,
    ClipsDescendants = true
}, gui)
round(main, 14)

local outline = create("UIStroke", {
    Color = C.Blue,
    Thickness = 1.5,
    Transparency = 0.15
}, main)

local top = create("Frame", {
    Size = UDim2.new(1, 0, 0, 52),
    BackgroundColor3 = C.Panel,
    BorderSizePixel = 0
}, main)
round(top, 14)

create("TextLabel", {
    Position = UDim2.fromOffset(13, 5),
    Size = UDim2.fromOffset(32, 40),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.Blue,
    Font = Enum.Font.GothamBlack,
    TextSize = 30
}, top)

local title = create("TextLabel", {
    Position = UDim2.fromOffset(49, 6),
    Size = UDim2.new(1, -135, 0, 23),
    BackgroundTransparency = 1,
    Text = "NopHubV3",
    TextColor3 = C.White,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamBold,
    TextSize = 18
}, top)

create("TextLabel", {
    Position = UDim2.fromOffset(50, 29),
    Size = UDim2.new(1, -140, 0, 14),
    BackgroundTransparency = 1,
    Text = "BLUE OCEAN EDITION",
    TextColor3 = C.Blue,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamMedium,
    TextSize = 9
}, top)

local function button(parent, text, size, pos, color)
    local b = create("TextButton", {
        Size = size,
        Position = pos,
        BackgroundColor3 = color or C.Card,
        Text = text,
        TextColor3 = C.White,
        Font = Enum.Font.GothamSemibold,
        TextSize = 11,
        AutoButtonColor = true
    }, parent)
    round(b, 8)
    return b
end

local minimize = button(
    top, "–", UDim2.fromOffset(27, 29),
    UDim2.new(1, -65, 0, 10)
)
local close = button(
    top, "×", UDim2.fromOffset(27, 29),
    UDim2.new(1, -33, 0, 10), C.Red
)

local sidebar = create("Frame", {
    Position = UDim2.fromOffset(9, 60),
    Size = UDim2.new(0, 108, 1, -69),
    BackgroundColor3 = C.Panel,
    BorderSizePixel = 0
}, main)
round(sidebar, 10)

create("UIPadding", {
    PaddingTop = UDim.new(0, 9),
    PaddingLeft = UDim.new(0, 7),
    PaddingRight = UDim.new(0, 7)
}, sidebar)

create("UIListLayout", {
    Padding = UDim.new(0, 7),
    SortOrder = Enum.SortOrder.LayoutOrder
}, sidebar)

local content = create("Frame", {
    Position = UDim2.fromOffset(125, 60),
    Size = UDim2.new(1, -134, 1, -69),
    BackgroundColor3 = C.Panel,
    BorderSizePixel = 0
}, main)
round(content, 10)

local tabNames = {
    "Trang Chủ",
    "Trộm Trứng",
    "Cày Cuốc",
    "Sự Kiện",
    "Cài Đặt"
}

local pages, tabButtons = {}, {}

local function makePage(name)
    local page = create("ScrollingFrame", {
        Name = name,
        Position = UDim2.fromOffset(6, 6),
        Size = UDim2.new(1, -12, 1, -12),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = C.Blue,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Visible = false
    }, content)

    create("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, page)

    create("UIPadding", {
        PaddingTop = UDim.new(0, 3),
        PaddingBottom = UDim.new(0, 8)
    }, page)

    pages[name] = page
    return page
end

local function heading(page, text)
    create("TextLabel", {
        Size = UDim2.new(1, -2, 0, 29),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = C.White,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold
    }, page)
end

local function info(page, titleText, description)
    local card = create("Frame", {
        Size = UDim2.new(1, -2, 0, 69),
        BackgroundColor3 = C.Card,
        BorderSizePixel = 0
    }, page)
    round(card, 9)

    create("Frame", {
        Position = UDim2.fromOffset(8, 10),
        Size = UDim2.new(0, 3, 1, -20),
        BackgroundColor3 = C.Blue,
        BorderSizePixel = 0
    }, card)

    create("TextLabel", {
        Position = UDim2.fromOffset(18, 8),
        Size = UDim2.new(1, -24, 0, 22),
        BackgroundTransparency = 1,
        Text = titleText,
        TextColor3 = C.White,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold,
        TextSize = 11
    }, card)

    create("TextLabel", {
        Position = UDim2.fromOffset(18, 31),
        Size = UDim2.new(1, -24, 0, 30),
        BackgroundTransparency = 1,
        Text = description,
        TextColor3 = C.Gray,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        Font = Enum.Font.Gotham,
        TextSize = 10
    }, card)
end

local function toggle(page, text, callback)
    local row = create("Frame", {
        Size = UDim2.new(1, -2, 0, 40),
        BackgroundColor3 = C.Card,
        BorderSizePixel = 0
    }, page)
    round(row, 8)

    create("TextLabel", {
        Position = UDim2.fromOffset(9, 0),
        Size = UDim2.new(1, -65, 1, 0),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = C.White,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamMedium
    }, row)

    local enabled = false
    local b = button(
        row, "OFF", UDim2.fromOffset(43, 24),
        UDim2.new(1, -49, 0.5, -12)
    )
    b.TextSize = 9

    b.Activated:Connect(function()
        enabled = not enabled
        b.Text = enabled and "ON" or "OFF"
        TweenService:Create(b, TweenInfo.new(0.15), {
            BackgroundColor3 = enabled and C.Blue or C.Panel
        }):Play()
        if callback then callback(enabled) end
    end)
end

for i, name in ipairs(tabNames) do
    local b = button(
        sidebar, name, UDim2.new(1, 0, 0, 37),
        UDim2.new(0, 0, 0, 0)
    )
    b.LayoutOrder = i
    tabButtons[name] = b
    makePage(name)
end

local function showPage(name)
    for n, page in pairs(pages) do
        page.Visible = n == name
    end
    for n, b in pairs(tabButtons) do
        b.BackgroundColor3 = n == name and C.DarkBlue or C.Card
    end
end

-- Trang Chủ
local home = pages["Trang Chủ"]
heading(home, "Tổng Quan")
info(home, "Xin chào!", "Chào mừng đến với NopHubV3.")
info(home, "Phiên bản", "Blue Ocean Edition • Mobile UI")
info(home, "Trạng thái", "Menu đã khởi tạo thành công.")

local search = create("TextBox", {
    Size = UDim2.new(1, -2, 0, 35),
    BackgroundColor3 = C.Card,
    PlaceholderText = "Tìm chức năng...",
    PlaceholderColor3 = C.Gray,
    Text = "",
    TextColor3 = C.White,
    ClearTextOnFocus = false,
    Font = Enum.Font.Gotham,
    TextSize = 11
}, home)
round(search, 8)

search:GetPropertyChangedSignal("Text"):Connect(function()
    local query = string.lower(search.Text)
    for tabName, b in pairs(tabButtons) do
        b.Visible = query == "" or string.find(string.lower(tabName), query, 1, true) ~= nil
    end
end)

-- Trộm Trứng: chỉ là các điều khiển giao diện mẫu.
local eggs = pages["Trộm Trứng"]
heading(eggs, "Trộm Trứng")
info(eggs, "Chế độ demo", "Các công tắc bên dưới chỉ minh họa trạng thái UI.")
toggle(eggs, "Tự động trộm (demo)", function(on)
    title.Text = on and "NopHubV3 • DEMO ON" or "NopHubV3"
end)
toggle(eggs, "Dịch chuyển (demo)", function(on)
    title.Text = on and "Teleport • DEMO" or "NopHubV3"
end)
toggle(eggs, "Bộ lọc trứng (demo)", function(on)
    outline.Enabled = on
end)
info(eggs, "Thông báo", "Không có hành động nào được thực hiện trong game.")

-- Cày Cuốc
local farm = pages["Cày Cuốc"]
heading(farm, "Cày Cuốc")
toggle(farm, "Tự động (demo)", function(on)
    title.Text = on and "Farming • DEMO" or "NopHubV3"
end)
toggle(farm, "Hiệu ứng giao diện", function(on)
    outline.Enabled = on
end)
info(farm, "Ghi chú", "Có thể tích hợp tính năng hợp lệ cho game của bạn.")

-- Sự Kiện
local events = pages["Sự Kiện"]
heading(events, "Sự Kiện")
info(events, "Sự kiện 01", "Khu vực hiển thị thông tin sự kiện mẫu.")
info(events, "Sự kiện 02", "Nội dung sẽ được cập nhật khi có dữ liệu.")

-- Cài Đặt
local settings = pages["Cài Đặt"]
heading(settings, "Cài Đặt")
toggle(settings, "Hiện viền xanh", function(on)
    outline.Enabled = on
end)

local reset = button(
    settings, "Đưa menu về giữa",
    UDim2.new(1, -2, 0, 35), UDim2.new(0, 0, 0, 0)
)
reset.Activated:Connect(function()
    main.Position = UDim2.new(0.5, -175, 0.5, -210)
end)

showPage("Trang Chủ")

-- Kéo thả bằng cảm ứng hoặc chuột
local dragging, dragStart, startPos = false, nil, nil

top.InputBegan:Connect(function(input)
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

local minimized = false
local fullSize = main.Size

minimize.Activated:Connect(function()
    minimized = not minimized
    if minimized then
        fullSize = main.Size
        sidebar.Visible = false
        content.Visible = false
        main.Size = UDim2.fromOffset(230, 52)
        minimize.Text = "+"
    else
        main.Size = fullSize
        sidebar.Visible = true
        content.Visible = true
        minimize.Text = "–"
    end
end)

close.Activated:Connect(function()
    gui:Destroy()
end)
