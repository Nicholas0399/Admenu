local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local title = Instance.new("TextLabel")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ResetOnSpawn = false

Frame.Parent = main
Frame.Size = UDim2.new(0, 200, 0, 300)
Frame.Position = UDim2.new(0.1, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 5
Frame.BorderColor3 = Color3.fromRGB(125, 0, 255)
Frame.Active = true
Frame.ClipsDescendants = true
Frame.ZIndex = 2
Frame.ClipsDescendants = true
Frame.BackgroundTransparency = 0.5
Frame.BackgroundBlur = true
Frame.Visible = true
Frame.CornerRadius = UDim.new(0, 10)

title.Parent = Frame
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(125, 0, 255)
title.BackgroundTransparency = 0.5
title.BorderSizePixel = 0
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Text = "Nicholas"
title.TextScaled = true

local nowe = false

local function toggleFlight()
    nowe = not nowe

    if nowe then
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    else
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end

local function createButton(name, text, position, onClick)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = Frame
    button.Size = UDim2.new(0, 180, 0, 40)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BorderSizePixel = 5
    button.BorderColor3 = Color3.fromRGB(125, 0, 255)
    button.Font = Enum.Font.Gotham
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16
    button.Text = text
    button.TextScaled = true
    button.AutoButtonColor = false
    button.Modal = true
    button.ClipsDescendants = true
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    if onClick then
        button.MouseButton1Click:Connect(onClick)
    end
    return button
end

local buttons = {
    {"flightButton", "Полёт", UDim2.new(0.1, 0, 0.1, 0), toggleFlight},
    {"button2", "Button 2", UDim2.new(0.1, 0, 0.2, 0)},
    {"button3", "Button 3", UDim2.new(0.1, 0, 0.3, 0)},
    {"button4", "Button 4", UDim2.new(0.1, 0, 0.4, 0)},
    {"button5", "Button 5", UDim2.new(0.1, 0, 0.5, 0)},
    {"closeButton", "Закрыть", UDim2.new(0.1, 0, 0.9, 0), function()
        main:Destroy()
    end},
    {"minimizeButton", "Свернуть", UDim2.new(0.1, 0, 0.8, 0), function()
        Frame.Visible = not Frame.Visible
    end}
}

for _, buttonInfo in ipairs(buttons) do
    createButton(buttonInfo[1], buttonInfo[2], buttonInfo[3], buttonInfo[4])
end

game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "New Menu",
    Text = "By Nicholas",
    Icon = "", -- Replace with actual icon ID
    Duration = 5
})
