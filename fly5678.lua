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

local flying = false
local flightSpeed = 50
local canFlyThroughWalls = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local bodyGyro = Instance.new("BodyGyro")
bodyGyro.P = 9e4
bodyGyro.maxTorque = Vector3.new(9e4, 9e4, 9e4)

local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.maxForce = Vector3.new(9e4, 9e4, 9e4)

local function fly()
    flying = not flying
    if flying then
        bodyGyro.Parent = character.PrimaryPart
        bodyVelocity.Parent = character.PrimaryPart
        if canFlyThroughWalls then
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
        while flying do
            local moveDirection = humanoid.MoveDirection
            bodyGyro.cframe = workspace.CurrentCamera.CoordinateFrame
            if moveDirection.magnitude > 0 then
                bodyVelocity.velocity = workspace.CurrentCamera.CFrame.LookVector * flightSpeed
            else
                bodyVelocity.velocity = Vector3.new(0, 0, 0)
            end
            wait()
        end
    else
        bodyGyro.Parent = nil
        bodyVelocity.Parent = nil
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

local function showFlightSettings()
    local settingsFrame = Instance.new("Frame")
    settingsFrame.Parent = main
    settingsFrame.Size = UDim2.new(0, 200, 0, 150)
    settingsFrame.Position = UDim2.new(0.1, 0, 0.6, 0)
    settingsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    settingsFrame.BorderSizePixel = 0

    local speedLabel = Instance.new("TextLabel")
    speedLabel.Parent = settingsFrame
    speedLabel.Size = UDim2.new(0, 180, 0, 30)
    speedLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
    speedLabel.BackgroundTransparency = 1
    speedLabel.Font = Enum.Font.Gotham
    speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedLabel.TextSize = 18
    speedLabel.Text = "Flight Speed: " .. flightSpeed

    local speedSlider = Instance.new("TextBox")
    speedSlider.Parent = settingsFrame
    speedSlider.Size = UDim2.new(0, 180, 0, 30)
    speedSlider.Position = UDim2.new(0.1, 0, 0.3, 0)
    speedSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    speedSlider.BorderSizePixel = 0
    speedSlider.Font = Enum.Font.Gotham
    speedSlider.TextColor3 = Color3.fromRGB(0, 0, 0)
    speedSlider.TextSize = 18
    speedSlider.Text = tostring(flightSpeed)
    speedSlider.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local newSpeed = tonumber(speedSlider.Text)
            if newSpeed then
                flightSpeed = newSpeed
                speedLabel.Text = "Flight Speed: " .. flightSpeed
            end
        end
    end)

    local flyThroughWallsLabel = Instance.new("TextLabel")
    flyThroughWallsLabel.Parent = settingsFrame
    flyThroughWallsLabel.Size = UDim2.new(0, 180, 0, 30)
    flyThroughWallsLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
    flyThroughWallsLabel.BackgroundTransparency = 1
    flyThroughWallsLabel.Font = Enum.Font.Gotham
    flyThroughWallsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    flyThroughWallsLabel.TextSize = 18
    flyThroughWallsLabel.Text = "Fly Through Walls: " .. (canFlyThroughWalls and "On" or "Off")

    local flyThroughWallsButton = createButton("flyThroughWallsButton", "Toggle", UDim2.new(0.1, 0, 0.7, 0), function()
        canFlyThroughWalls = not canFlyThroughWalls
        flyThroughWallsLabel.Text = "Fly Through Walls: " .. (canFlyThroughWalls and "On" or "Off")
    end)
    flyThroughWallsButton.Parent = settingsFrame
    flyThroughWallsButton.Size = UDim2.new(0, 180, 0, 30)

    local closeButton = createButton("closeSettingsButton", "Close", UDim2.new(0.1, 0, 0.9, 0), function()
        settingsFrame:Destroy()
    end)
    closeButton.Parent = settingsFrame
    closeButton.Size = UDim2.new(0, 180, 0, 30)
end

local buttons = {
    {"flySettingsButton", "Настройки полета", UDim2.new(0.1, 0, 0.1, 0), showFlightSettings},
    {"flyButton", "Полет", UDim2.new(0.1, 0, 0.3, 0), fly},
    {"button2", "Button 2", UDim2.new(0.1, 0, 0.5, 0)},
    {"button3", "Button 3", UDim2.new(0.1, 0, 0.7, 0)},
    {"button4", "Button 4", UDim2.new(0.1, 0, 0.9, 0)},
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
