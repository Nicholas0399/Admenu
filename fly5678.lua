local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local title = Instance.new("TextLabel")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ResetOnSpawn = false

Frame.Parent = main
Frame.Size = UDim2.new(0, 190, 0, 200)
Frame.Position = UDim2.new(0.1, 0, 0.379, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

title.Parent = Frame
title.Size = UDim2.new(0, 150, 0, 30)
title.Position = UDim2.new(0.1, 0, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Text = "Nicholas"

local function createButton(name, text, position, onClick)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = Frame
    button.Size = UDim2.new(0, 150, 0, 40)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.Gotham
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.TextSize = 20
    button.Text = text
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    end)
    if onClick then
        button.MouseButton1Click:Connect(onClick)
    end
    return button
end

local flyMenu = Instance.new("Frame")
flyMenu.Parent = main
flyMenu.Size = UDim2.new(0, 200, 0, 300)
flyMenu.Position = UDim2.new(0.3, 0, 0.3, 0)
flyMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
flyMenu.Visible = false
flyMenu.Active = true
flyMenu.Draggable = true

local speedLabel = Instance.new("TextLabel")
speedLabel.Parent = flyMenu
speedLabel.Size = UDim2.new(0, 180, 0, 30)
speedLabel.Position = UDim2.new(0.1, 0, 0, 10)
speedLabel.BackgroundTransparency = 1
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.TextSize = 18
speedLabel.Text = "Скорость полета:"

local speedBox = Instance.new("TextBox")
speedBox.Parent = flyMenu
speedBox.Size = UDim2.new(0, 180, 0, 30)
speedBox.Position = UDim2.new(0.1, 0, 0, 50)
speedBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
speedBox.Font = Enum.Font.Gotham
speedBox.TextColor3 = Color3.fromRGB(0, 0, 0)
speedBox.TextSize = 18
speedBox.Text = "50"

local noclipLabel = Instance.new("TextLabel")
noclipLabel.Parent = flyMenu
noclipLabel.Size = UDim2.new(0, 180, 0, 30)
noclipLabel.Position = UDim2.new(0.1, 0, 0, 90)
noclipLabel.BackgroundTransparency = 1
noclipLabel.Font = Enum.Font.Gotham
noclipLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipLabel.TextSize = 18
noclipLabel.Text = "Пролет сквозь стены:"

local noclipToggle = Instance.new("TextButton")
noclipToggle.Parent = flyMenu
noclipToggle.Size = UDim2.new(0, 180, 0, 30)
noclipToggle.Position = UDim2.new(0.1, 0, 0, 130)
noclipToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
noclipToggle.Font = Enum.Font.Gotham
noclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipToggle.TextSize = 18
noclipToggle.Text = "Выкл"

local function toggleNoclip()
    if noclipToggle.Text == "Выкл" then
        noclipToggle.Text = "Вкл"
        noclipToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        noclipToggle.Text = "Выкл"
        noclipToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

noclipToggle.MouseButton1Click:Connect(toggleNoclip)

local visualEffectLabel = Instance.new("TextLabel")
visualEffectLabel.Parent = flyMenu
visualEffectLabel.Size = UDim2.new(0, 180, 0, 30)
visualEffectLabel.Position = UDim2.new(0.1, 0, 0, 170)
visualEffectLabel.BackgroundTransparency = 1
visualEffectLabel.Font = Enum.Font.Gotham
visualEffectLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
visualEffectLabel.TextSize = 18
visualEffectLabel.Text = "Визуальный эффект:"

local visualEffectToggle = Instance.new("TextButton")
visualEffectToggle.Parent = flyMenu
visualEffectToggle.Size = UDim2.new(0, 180, 0, 30)
visualEffectToggle.Position = UDim2.new(0.1, 0, 0, 210)
visualEffectToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
visualEffectToggle.Font = Enum.Font.Gotham
visualEffectToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
visualEffectToggle.TextSize = 18
visualEffectToggle.Text = "Выкл"

local function toggleVisualEffect()
    if visualEffectToggle.Text == "Выкл" then
        visualEffectToggle.Text = "Вкл"
        visualEffectToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        visualEffectToggle.Text = "Выкл"
        visualEffectToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

visualEffectToggle.MouseButton1Click:Connect(toggleVisualEffect)

local function fly()
    flyMenu.Visible = not flyMenu.Visible
end

local flying = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local bodyGyro = Instance.new("BodyGyro")
bodyGyro.P = 9e4
bodyGyro.maxTorque = Vector3.new(9e4, 9e4, 9e4)

local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.maxForce = Vector3.new(9e4, 9e4, 9e4)

local particleEmitter = Instance.new("ParticleEmitter")
particleEmitter.Enabled = false
particleEmitter.Texture = "rbxassetid://243660364" -- Замените на желаемый ID текстуры
particleEmitter.Rate = 100
particleEmitter.Speed = NumberRange.new(5, 10)
particleEmitter.Parent = character.PrimaryPart

local flyToggle = Instance.new("TextButton")
flyToggle.Parent = flyMenu
flyToggle.Size = UDim2.new(0, 180, 0, 30)
flyToggle.Position = UDim2.new(0.1, 0, 0, 250)
flyToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
flyToggle.Font = Enum.Font.Gotham
flyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
flyToggle.TextSize = 18
flyToggle.Text = "Вкл/Выкл Полет"

local flying = false
local particleEmitter = Instance.new("ParticleEmitter")
particleEmitter.Enabled = false
particleEmitter.Texture = "rbxassetid://243660364" -- Замените на желаемый ID текстуры
particleEmitter.Rate = 100
particleEmitter.Speed = NumberRange.new(5, 10)
particleEmitter.Parent = nil -- Установим родителя в toggleFly функции

local function toggleFly()
    flying = not flying
    if flying then
        flyToggle.Text = "Выкл Полет"
        flyToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        bodyGyro.Parent = character.PrimaryPart
        bodyVelocity.Parent = character.PrimaryPart
        particleEmitter.Parent = character.PrimaryPart
        particleEmitter.Enabled = visualEffectToggle.Text == "Вкл"
        while flying do
            local moveDirection = humanoid.MoveDirection
            bodyGyro.CFrame = workspace.CurrentCamera.CoordinateFrame
            local speed = tonumber(speedBox.Text) or 50
            bodyVelocity.Velocity = moveDirection * speed
            wait()
        end
    else
        flyToggle.Text = "Вкл Полет"
        flyToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        bodyGyro.Parent = nil
        bodyVelocity.Parent = nil
        particleEmitter.Parent = nil
        particleEmitter.Enabled = false
    end
end

flyToggle.MouseButton1Click:Connect(toggleFly)

local function setupCharacter()
    character = player.Character or player.CharacterAdded:Wait()
    humanoid = character:WaitForChild("Humanoid")
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.maxTorque = Vector3.new(9e4, 9e4, 9e4)
    bodyVelocity = Instance.new
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.maxForce = Vector3.new(9e4, 9e4, 9e4)
end

player.CharacterAdded:Connect(function()
    setupCharacter()
    if flying then
        toggleFly() -- Отключить полет при смерти
    end
end)

setupCharacter()

local buttons = {
    {"flyButton", "Полет", UDim2.new(0.1, 0, 0.1, 0), fly},
    {"button2", "Button 2", UDim2.new(0.1, 0, 0.3, 0)},
    {"button3", "Button 3", UDim2.new(0.1, 0, 0.5, 0)},
    {"button4", "Button 4", UDim2.new(0.1, 0, 0.7, 0)},
    {"button5", "Button 5", UDim2.new(0.1, 0, 0.9, 0)},
    {"closeButton", "Close Script", UDim2.new(0.1, 0, 1, -90), function()
        main:Destroy()
    end},
    {"minimizeButton", "Minimize Script", UDim2.new(0.1, 0, 1, -45), function()
        Frame.Size = UDim2.new(0, 190, 0, 40)
        Frame.Position = UDim2.new(0.1, 0, 1, -40)
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
