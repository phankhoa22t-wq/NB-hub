
-- NopGM Loading Screen
-- Đặt LocalScript trong StarterPlayerScripts

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NopGMLoading"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.fromRGB(3, 12, 35)
bg.BorderSizePixel = 0
bg.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 70)
title.Position = UDim2.new(0, 0, 0.34, 0)
title.BackgroundTransparency = 1
title.Text = "NopGM"
title.TextColor3 = Color3.fromRGB(0, 210, 255)
title.TextSize = 48
title.Font = Enum.Font.GothamBold
title.Parent = bg

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.Position = UDim2.new(0, 0, 0.44, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "INITIALIZING..."
subtitle.TextColor3 = Color3.fromRGB(150, 220, 255)
subtitle.TextSize = 14
subtitle.Font = Enum.Font.GothamMedium
subtitle.Parent = bg

local barBG = Instance.new("Frame")
barBG.AnchorPoint = Vector2.new(0.5, 0.5)
barBG.Position = UDim2.new(0.5, 0, 0.56, 0)
barBG.Size = UDim2.new(0.72, 0, 0, 12)
barBG.BackgroundColor3 = Color3.fromRGB(12, 35, 70)
barBG.BorderSizePixel = 0
barBG.Parent = bg

Instance.new("UICorner", barBG).CornerRadius = UDim.new(1, 0)

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 195, 255)
bar.BorderSizePixel = 0
bar.Parent = barBG

Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

local percent = Instance.new("TextLabel")
percent.Position = UDim2.new(0, 0, 0.59, 0)
percent.Size = UDim2.new(1, 0, 0, 25)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.new(1, 1, 1)
percent.TextSize = 14
percent.Font = Enum.Font.GothamBold
percent.Parent = bg

for i = 1, 100 do
    bar:TweenSize(
        UDim2.new(i / 100, 0, 1, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Linear,
        0.035,
        true
    )
    percent.Text = i .. "%"
    task.wait(0.035)
end

subtitle.Text = "LOAD COMPLETE!"

TweenService:Create(
    bg,
    TweenInfo.new(0.5),
    {BackgroundTransparency = 1}
):Play()

task.wait(0.6)
gui:Destroy()

-- Loading kết thúc tại đây.
-- Bạn có thể mở giao diện NopGM của mình ở phần này.
