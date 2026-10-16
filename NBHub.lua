-- NB HUB | Steal an Egg
-- Giao dien den

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")

gui.Name = "NBHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(260, 160)
main.Position = UDim2.new(0.5, -130, 0.5, -80)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 45)
title.BackgroundTransparency = 1
title.Text = "NB HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -40, 0, 5)
close.Text = "X"
close.Parent = main

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local hide = Instance.new("TextButton")
hide.Size = UDim2.new(1, -24, 0, 42)
hide.Position = UDim2.fromOffset(12, 65)
hide.Text = "Hide Menu"
hide.Parent = main

hide.MouseButton1Click:Connect(function()
    main.Visible = false
end)
