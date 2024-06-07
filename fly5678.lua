local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local plus = Instance.new("TextButton")
local mine = Instance.new("TextButton")
local title = Instance.new("TextLabel")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ResetOnSpawn = false

Frame.Parent = main
Frame.Size = UDim2.new(0, 190, 0, 200)
Frame.Position = UDim2.new(0.1, 0, 0.379, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local function createButton(name, text, position, color)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = Frame
    button.Size = UDim2.new(0, 150, 0, 40)
    button.Position = position
    button.BackgroundColor3 = color
    button.BorderSizePixel = 0
    button.Font = Enum.Font.Gotham
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 20
    button.Text = text
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = color
    end)
    return button
end

up = createButton("up", "UP", UDim2.new(0.1, 0, 0.05, 0), Color3.fromRGB(0, 120, 255))
down = createButton("down", "DOWN", UDim2.new(0.1, 0, 0.25, 0), Color3.fromRGB(255, 0, 0))
onof = createButton("onof", "FLY", UDim2.new(0.1, 0, 0.45, 0), Color3.fromRGB(0, 255, 0))
plus = createButton("plus", "+", UDim2.new(0.1, 0, 0.65, 0), Color3.fromRGB(255, 165, 0))
mine = createButton("mine", "-", UDim2.new(0.1, 0, 0.85, 0), Color3.fromRGB(255, 165, 0))

title.Parent = Frame
title.Size = UDim2.new(0, 150, 0, 30)
title.Position = UDim2.new(0.1, 0, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Text = "FLY GUI V3"

local nowe = false

onof.MouseButton1Click:Connect(function()
    local flyEnabled = not nowe
    nowe = flyEnabled

    if flyEnabled then
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    else
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "FLY GUI V3",
    Text = "BY XNEO",
    Icon = "rbxassetid://123456789", -- Replace with actual icon ID
    Duration = 5
})
