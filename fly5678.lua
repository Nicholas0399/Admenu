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

pushToggle.MouseButton1Click:Connect(togglePush)

local beeSwarmMenu = Instance.new("Frame")
beeSwarmMenu.Parent = main
beeSwarmMenu.Size = UDim2.new(0, 150, 0, 300)
beeSwarmMenu.Position = UDim2.new(0.3, 0, 0.3, 0)
beeSwarmMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
beeSwarmMenu.Visible = false
beeSwarmMenu.Active = true
beeSwarmMenu.Draggable = true

local beeSwarmTitle = Instance.new("TextLabel")
beeSwarmTitle.Parent = beeSwarmMenu
beeSwarmTitle.Size = UDim2.new(0, 130, 0, 25)
beeSwarmTitle.Position = UDim2.new(0.1, 0, 0, 10)
beeSwarmTitle.BackgroundTransparency = 1
beeSwarmTitle.Font = Enum.Font.Gotham
beeSwarmTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
beeSwarmTitle.TextSize = 14
beeSwarmTitle.Text = "Bee Swarm Simulator"

local coordsLabel = Instance.new("TextLabel")
coordsLabel.Parent = beeSwarmMenu
coordsLabel.Size = UDim2.new(0, 130, 0, 25)
coordsLabel.Position = UDim2.new(0.1, 0, 0, 40)
coordsLabel.BackgroundTransparency = 1
coordsLabel.Font = Enum.Font.Gotham
coordsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
coordsLabel.TextSize = 14
coordsLabel.Text = "Координаты:"

local hiveCoordLabel = Instance.new("TextLabel")
hiveCoordLabel.Parent = beeSwarmMenu
hiveCoordLabel.Size = UDim2.new(0, 130, 0, 25)
hiveCoordLabel.Position = UDim2.new(0.1, 0, 70)
hiveCoordLabel.BackgroundTransparency = 1
hiveCoordLabel.Font = Enum.Font.Gotham
hiveCoordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hiveCoordLabel.TextSize = 14
hiveCoordLabel.Text = "Коорд. Соты:"

local hiveCoordBox = Instance.new("TextBox")
hiveCoordBox.Parent = beeSwarmMenu
hiveCoordBox.Size = UDim2.new(0, 130, 0, 25)
hiveCoordBox.Position = UDim2.new(0.1, 0, 100)
hiveCoordBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hiveCoordBox.Font = Enum.Font.Gotham
hiveCoordBox.TextColor3 = Color3.fromRGB(0, 0, 0)
hiveCoordBox.TextSize = 14
hiveCoordBox.Text = ""

local farmCoordLabel = Instance.new("TextLabel")
farmCoordLabel.Parent = beeSwarmMenu
farmCoordLabel.Size = UDim2.new(0, 130, 0, 25)
farmCoordLabel.Position = UDim2.new(0.1, 0, 130)
farmCoordLabel.BackgroundTransparency = 1
farmCoordLabel.Font = Enum.Font.Gotham
farmCoordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
farmCoordLabel.TextSize = 14
farmCoordLabel.Text = "Коорд. Фарм:"

local farmCoordBox = Instance.new("TextBox")
farmCoordBox.Parent = beeSwarmMenu
farmCoordBox.Size = UDim2.new(0, 130, 0, 25)
farmCoordBox.Position = UDim2.new(0.1, 0, 160)
farmCoordBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
farmCoordBox.Font = Enum.Font.Gotham
farmCoordBox.TextColor3 = Color3.fromRGB(0, 0, 0)
farmCoordBox.TextSize = 14
farmCoordBox.Text = ""

local autoReturnToggle = Instance.new("TextButton")
autoReturnToggle.Parent = beeSwarmMenu
autoReturnToggle.Size = UDim2.new(0, 130, 0, 25)
autoReturnToggle.Position = UDim2.new(0.1, 0, 0, 190)
autoReturnToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
autoReturnToggle.Font = Enum.Font.Gotham
autoReturnToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoReturnToggle.TextSize = 14
autoReturnToggle.Text = "Вкл/Выкл"

local running = false

local function updateCoords()
    while beeSwarmMenu.Visible do
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local position = player.Character.HumanoidRootPart.Position
            coordsLabel.Text = string.format("Координаты: X: %.2f, Y: %.2f, Z: %.2f", position.X, position.Y, position.Z)
        end
        wait(1)
    end
end

beeSwarmMenu:GetPropertyChangedSignal("Visible"):Connect(updateCoords)

local function moveToCoordinates(coords)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local coordTable = coords:split(",")
        local targetPosition = Vector3.new(tonumber(coordTable[1]), tonumber(coordTable[2]), tonumber(coordTable[3]))

        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:MoveTo(targetPosition)
            humanoid.MoveToFinished:Wait() -- Wait until the character reaches the target position
        end
    end
end

local function autoFarmAndReturn()
    while running do
        local player = game.Players.LocalPlayer
        if player and player.Backpack and player.Backpack:FindFirstChild("Container") then
            local container = player.Backpack.Container
            if container:FindFirstChild("Amount") and container.Amount.Value >= container.MaxAmount.Value then
                moveToCoordinates(hiveCoordBox.Text)
                -- Simulate pressing "F"
                local virtualUser = game:GetService("VirtualUser")
                virtualUser:CaptureController()
                virtualUser:SetKeyDown("0x46") -- "F" key
                wait(0.1)
                virtualUser:SetKeyUp("0x46")
            else
                moveToCoordinates(farmCoordBox.Text)
            end
        end
        wait(1)
    end
end

local function toggleAutoReturn()
    running = not running
    if running then
        autoReturnToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        spawn(autoFarmAndReturn)
    else
        autoReturnToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

autoReturnToggle.MouseButton1Click:Connect(toggleAutoReturn)

local function toggleBeeSwarmMenu()
    beeSwarmMenu.Visible = not beeSwarmMenu.Visible
end

local buttons = {
    {"flyButton", "Полет", UDim2.new(0.1, 0, 0.1, 0), fly},
    {"pushButton", "Отталкивание", UDim2.new(0.1, 0, 0.3, 0), push},
    {"button3", "Bee Swarm Menu", UDim2.new(0.1, 0, 0.5, 0), toggleBeeSwarmMenu},
    {"button4", "Button 4", UDim2.new(0.1, 0, 0.7, 0)},
    {"button5", "Button 5", UDim2.new(0.1, 0, 0.9, 0)},
    {"closeButton", "Close Script", UDim2.new(0.1, 0, 1, -90), function()
        running = false
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
