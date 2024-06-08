local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local title = Instance.new("TextLabel")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ResetOnSpawn = false

Frame.Parent = main
Frame.Size = UDim2.new(0, 280, 0, 200)
Frame.Position = UDim2.new(0.1, 0, 0.379, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

title.Parent = Frame
title.Size = UDim2.new(0, 280, 0, 25)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Text = "Ваньванич дебил и не удачник, удаляй всю эту парашу"

local function createButton(name, text, position, onClick)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = Frame
    button.Size = UDim2.new(0, 140, 0, 30)
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

local pushMenu = Instance.new("Frame")
pushMenu.Parent = main
pushMenu.Size = UDim2.new(0, 150, 0, 200)
pushMenu.Position = UDim2.new(0.3, 0, 0.3, 0)
pushMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
pushMenu.Visible = false
pushMenu.Active = true
pushMenu.Draggable = true

local pushStrengthLabel = Instance.new("TextLabel")
pushStrengthLabel.Parent = pushMenu
pushStrengthLabel.Size = UDim2.new(0, 130, 0, 25)
pushStrengthLabel.Position = UDim2.new(0.1, 0, 0, 10)
pushStrengthLabel.BackgroundTransparency = 1
pushStrengthLabel.Font = Enum.Font.Gotham
pushStrengthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pushStrengthLabel.TextSize = 14
pushStrengthLabel.Text = "Сила отталкивания:"

local pushStrengthBox = Instance.new("TextBox")
pushStrengthBox.Parent = pushMenu
pushStrengthBox.Size = UDim2.new(0, 130, 0, 25)
pushStrengthBox.Position = UDim2.new(0.1, 0, 0, 40)
pushStrengthBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pushStrengthBox.Font = Enum.Font.Gotham
pushStrengthBox.TextColor3 = Color3.fromRGB(0, 0, 0)
pushStrengthBox.TextSize = 14
pushStrengthBox.Text = "50"

local pushToggle = Instance.new("TextButton")
pushToggle.Parent = pushMenu
pushToggle.Size = UDim2.new(0, 130, 0, 25)
pushToggle.Position = UDim2.new(0.1, 0, 0, 70)
pushToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
pushToggle.Font = Enum.Font.Gotham
pushToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
pushToggle.TextSize = 14
pushToggle.Text = "Вкл/Выкл Отталкивание"

local function togglePush()
    pushMenu.Visible = not pushMenu.Visible
end

pushToggle.MouseButton1Click:Connect(togglePush)

local function push()
    local pushStrength = tonumber(pushStrengthBox.Text) or 50
    local players = game.Players:GetPlayers()
    for _, player in ipairs(players) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = player.Character.HumanoidRootPart.Position
            local pushDirection = (targetPosition - character.HumanoidRootPart.Position).unit
            player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            player.Character.Humanoid.PlatformStand = false
            player.Character.Humanoid:Move(pushDirection * pushStrength)
        end
    end
end

local beeSwarmMenu = Instance.new("Frame")
beeSwarmMenu.Parent = main
beeSwarmMenu.Size = UDim2.new(0, 150, 0, 200)
beeSwarmMenu.Position = UDim2.new(0.3, 0, 0.3, 0)
beeSwarmMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
beeSwarmMenu.Visible = false
beeSwarmMenu.Active = true
beeSwarmMenu.Draggable = true

local hiveCoordLabel = Instance.new("TextLabel")
hiveCoordLabel.Parent = beeSwarmMenu
hiveCoordLabel.Size = UDim2.new(0, 130, 0, 25)
hiveCoordLabel.Position = UDim2.new(0.1, 0, 40)
hiveCoordLabel.BackgroundTransparency = 1
hiveCoordLabel.Font = Enum.Font.Gotham
hiveCoordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hiveCoordLabel.TextSize = 14
hiveCoordLabel.Text = "Коорд. Соты:"

local hiveCoordBox = Instance.new("TextBox")
hiveCoordBox.Parent = beeSwarmMenu
hiveCoordBox.Size = UDim2.new(0, 130, 0, 25)
hiveCoordBox.Position = UDim2.new(0.1, 0, 70)
hiveCoordBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hiveCoordBox.Font = Enum.Font.Gotham
hiveCoordBox.TextColor3 = Color3.fromRGB(0, 0, 0)
hiveCoordBox.TextSize = 14
hiveCoordBox.Text = ""

local farmCoordLabel = Instance.new("TextLabel")
farmCoordLabel.Parent = beeSwarmMenu
farmCoordLabel.Size = UDim2.new(0, 130, 0, 25)
farmCoordLabel.Position = UDim2.new(0.1, 0, 100)
farmCoordLabel.BackgroundTransparency = 1
farmCoordLabel.Font = Enum.Font.Gotham
farmCoordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
farmCoordLabel.TextSize = 14
farmCoordLabel.Text = "Коорд. Фарм:"

local farmCoordBox = Instance.new("TextBox")
farmCoordBox.Parent = beeSwarmMenu
farmCoordBox.Size = UDim2.new(0, 130, 0, 25)
farmCoordBox.Position = UDim2.new(0.1, 0, 130)
farmCoordBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
farmCoordBox.Font = Enum.Font.Gotham
farmCoordBox.TextColor3 = Color3.fromRGB(0, 0, 0)
farmCoordBox.TextSize = 14
farmCoordBox.Text = ""

local autoReturnToggle = Instance.new("TextButton")
autoReturnToggle.Parent = beeSwarmMenu
autoReturnToggle.Size = UDim2.new(0, 130, 0, 25)
autoReturnToggle.Position = UDim2.new(0.1, 0, 160)
autoReturnToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
autoReturnToggle.Font = Enum.Font.Gotham
autoReturnToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoReturnToggle.TextSize = 14
autoReturnToggle.Text = "Вкл/Выкл"
