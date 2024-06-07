local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local title = Instance.new("TextLabel")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ResetOnSpawn = false

Frame.Parent = main
Frame.Size = UDim2.new(0, 140, 0, 200)
Frame.Position = UDim2.new(0.1, 0, 0.379, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

title.Parent = Frame
title.Size = UDim2.new(0, 120, 0, 25)
title.Position = UDim2.new(0.1, 0, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Text = "Nicholas"

local function createButton(name, text, position, onClick)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = Frame
    button.Size = UDim2.new(0, 120, 0, 30)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.Gotham
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.TextSize = 16
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
flyMenu.Size = UDim2.new(0, 150, 0, 200)
flyMenu.Position = UDim2.new(0.3, 0, 0.3, 0)
flyMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
flyMenu.Visible = false
flyMenu.Active = true
flyMenu.Draggable = true

local speedLabel = Instance.new("TextLabel")
speedLabel.Parent = flyMenu
speedLabel.Size = UDim2.new(0, 130, 0, 25)
speedLabel.Position = UDim2.new(0.1, 0, 0, 10)
speedLabel.BackgroundTransparency = 1
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.TextSize = 14
speedLabel.Text = "Скорость полета:"

local speedBox = Instance.new("TextBox")
speedBox.Parent = flyMenu
speedBox.Size = UDim2.new(0, 130, 0, 25)
speedBox.Position = UDim2.new(0.1, 0, 0, 40)
speedBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
speedBox.Font = Enum.Font.Gotham
speedBox.TextColor3 = Color3.fromRGB(0, 0, 0)
speedBox.TextSize = 14
speedBox.Text = "50"

local noclipLabel = Instance.new("TextLabel")
noclipLabel.Parent = flyMenu
noclipLabel.Size = UDim2.new(0, 130, 0, 25)
noclipLabel.Position = UDim2.new(0.1, 0, 0, 70)
noclipLabel.BackgroundTransparency = 1
noclipLabel.Font = Enum.Font.Gotham
noclipLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipLabel.TextSize = 14
noclipLabel.Text = "Пролет сквозь стены:"

local noclipToggle = Instance.new("TextButton")
noclipToggle.Parent = flyMenu
noclipToggle.Size = UDim2.new(0, 130, 0, 25)
noclipToggle.Position = UDim2.new(0.1, 0, 0, 100)
noclipToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
noclipToggle.Font = Enum.Font.Gotham
noclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipToggle.TextSize = 14
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

local flyToggle = Instance.new("TextButton")
flyToggle.Parent = flyMenu
flyToggle.Size = UDim2.new(0, 130, 0, 25)
flyToggle.Position = UDim2.new(0.1, 0, 0, 130)
flyToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
flyToggle.Font = Enum.Font.Gotham
flyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
flyToggle.TextSize = 14
flyToggle.Text = "Вкл/Выкл Полет"

local function toggleFly()
    flying = not flying
    if flying then
        flyToggle.Text = "Выкл Полет"
        flyToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        bodyGyro.Parent = character.PrimaryPart
        bodyVelocity.Parent = character.PrimaryPart
        while flying do
            local moveDirection = humanoid.MoveDirection
            local speed = tonumber(speedBox.Text) or 50
            if moveDirection.magnitude > 0 then
                bodyVelocity.velocity = workspace.CurrentCamera.CFrame.LookVector * speed
            else
                bodyVelocity.velocity = Vector3.new(0, 0, 0)
            end
            if noclipToggle.Text == "Вкл" then
                for _, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                for _, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
            wait()
        end
    else
        flyToggle.Text = "Вкл Полет"
        flyToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        bodyGyro.Parent = nil
        bodyVelocity.Parent = nil
        for _, v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = true
            end
        end
    end
end

flyToggle.MouseButton1Click:Connect(toggleFly)

local function setupCharacter()
    character = player.Character or player.CharacterAdded:Wait()
    humanoid = character:WaitForChild("Humanoid")

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.maxTorque = Vector3.new(9e4, 9e4, 9e4)

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

local spinMenu = Instance.new("Frame")
spinMenu.Parent = main
spinMenu.Size = UDim2.new(0, 150, 0, 200)
spinMenu.Position = UDim2.new(0.5, 0, 0.3, 0)
spinMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
spinMenu.Visible = false
spinMenu.Active = true
spinMenu.Draggable = true

local spinSpeedLabel = Instance.new("TextLabel")
spinSpeedLabel.Parent = spinMenu
spinSpeedLabel.Size = UDim2.new(0, 130, 0, 25)
spinSpeedLabel.Position = UDim2.new(0.1, 0, 0, 10)
spinSpeedLabel.BackgroundTransparency = 1
spinSpeedLabel.Font = Enum.Font.Gotham
spinSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
spinSpeedLabel.TextSize = 14
spinSpeedLabel.Text = "Скорость вращения:"

local spinSpeedBox = Instance.new("TextBox")
spinSpeedBox.Parent = spinMenu
spinSpeedBox.Size = UDim2.new(0, 130, 0, 25)
spinSpeedBox.Position = UDim2.new(0.1, 0, 0, 40)
spinSpeedBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
spinSpeedBox.Font = Enum.Font.Gotham
spinSpeedBox.TextColor3 = Color3.fromRGB(0, 0, 0)
spinSpeedBox.TextSize = 14
spinSpeedBox.Text = "10"

local pushStrengthLabel = Instance.new("TextLabel")
pushStrengthLabel.Parent = spinMenu
pushStrengthLabel.Size = UDim2.new(0, 130, 0, 25)
pushStrengthLabel.Position = UDim2.new(0.1, 0, 0, 70)
pushStrengthLabel.BackgroundTransparency = 1
pushStrengthLabel.Font = Enum.Font.Gotham
pushStrengthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pushStrengthLabel.TextSize = 14
pushStrengthLabel.Text = "Сила отталкивания:"

local pushStrengthBox = Instance.new("TextBox")
pushStrengthBox.Parent = spinMenu
pushStrengthBox.Size = UDim2.new(0, 130, 0, 25)
pushStrengthBox.Position = UDim2.new(0.1, 0, 0, 100)
pushStrengthBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pushStrengthBox.Font = Enum.Font.Gotham
pushStrengthBox.TextColor3 = Color3.fromRGB(0, 0, 0)
pushStrengthBox.TextSize = 14
pushStrengthBox.Text = "20"

local spinToggle = Instance.new("TextButton")
spinToggle.Parent = spinMenu
spinToggle.Size = UDim2.new(0, 130, 0, 25)
spinToggle.Position = UDim2.new(0.1, 0, 0, 130)
spinToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
spinToggle.Font = Enum.Font.Gotham
spinToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
spinToggle.TextSize = 14
spinToggle.Text = "Вкл/Выкл Спиннер"

local spinning = false
local spinCount = 0

local function startSpinner()
    spinning = true
    spinCount = 1
    character.Humanoid.PlatformStand = true
end

local function stopSpinner()
    spinning = false
    character.Humanoid.PlatformStand = false
end

local function toggleSpinner()
    if spinning then
        stopSpinner()
        spinToggle.Text = "Вкл Спиннер"
        spinToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    else
        startSpinner()
        spinToggle.Text = "Выкл Спиннер"
        spinToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end
end

spinToggle.MouseButton1Click:Connect(toggleSpinner)

local function spinner()
    spinMenu.Visible = not spinMenu.Visible
end

local function onTouched(hit)
    if not spinning then return end
    local hitPart = hit.Parent
    if hitPart and hitPart:FindFirstChild("Humanoid") then
        local targetHumanoid = hitPart:FindFirstChild("Humanoid")
        if targetHumanoid and targetHumanoid ~= humanoid then
            local pushDirection = (hitPart.PrimaryPart.Position - character.PrimaryPart.Position).unit
            targetHumanoid:ChangeState(Enum.HumanoidStateType.Physics)
            targetHumanoid:TakeDamage(10)
            targetHumanoid.Sit = true
            targetHumanoid.PlatformStand = true
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = pushDirection * (tonumber(pushStrengthBox.Text) or 20)
            bodyVelocity.P = 9e4
            bodyVelocity.MaxForce = Vector3.new(9e4, 9e4, 9e4)
            bodyVelocity.Parent = hitPart.PrimaryPart
            game.Debris:AddItem(bodyVelocity, 0.5)
        end
    end
end

character.HumanoidRootPart.Touched:Connect(onTouched)

game:GetService("RunService").Stepped:Connect(function()
    if spinCount > 0 then
        local speed = tonumber(spinSpeedBox.Text) or 10
        character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, math.rad(speed * spinCount))
        character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.1)
        if spinning then
            spinCount = spinCount + 1
            if spinCount > 6 then
                spinCount = 0
                stopSpinner()
            end
        end
    end
end)

local buttons = {
    {"flyButton", "Полет", UDim2.new(0.1, 0, 0.1, 0), fly},
    {"spinnerButton", "Спиннер", UDim2.new(0.1, 0, 0.3, 0), spinner},
    {"button3", "Button 3", UDim2.new(0.1, 0, 0.5, 0)},
    {"button4", "Button 4", UDim2.new(0.1, 0, 0.7, 0)},
    {"button5", "Button 5", UDim2.new(0.1, 0, 0.9, 0)},
    {"closeButton", "Close Script", UDim2.new(0.1, 0, 1, -90), function()
        main:Destroy()
    end},
    {"minimizeButton", "Minimize Script", UDim2.new(0.1, 0, 1, -45), function()
        Frame.Size = UDim2.new(0, 140, 0, 40)
        Frame.Position = UDim2.new(0.1, 0, 1, -40)
    end}
}

for _, buttonInfo in ipairs(buttons) do
    createButton(buttonInfo[1], buttonInfo[2], buttonInfo[3], buttonInfo[4])
end

game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "New Menu",
    Text = "By Nicholas",
    Icon = "", -- Замените на фактический идентификатор иконки
    Duration = 5
})
