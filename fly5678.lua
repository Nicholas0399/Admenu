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
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local bodyGyro = Instance.new("BodyGyro", character.PrimaryPart)
bodyGyro.P = 9e4
bodyGyro.maxTorque = Vector3.new(9e4, 9e4, 9e4)
bodyGyro.cframe = character.PrimaryPart.CFrame
local bodyVelocity = Instance.new("BodyVelocity", character.PrimaryPart)
bodyVelocity.velocity = Vector3.new(0, 0, 0)
bodyVelocity.maxForce = Vector3.new(9e4, 9e4, 9e4)

local function fly()
    flying = not flying
    if flying then
        while flying do
            local moveDirection = humanoid.MoveDirection
            bodyGyro.cframe = workspace.CurrentCamera.CoordinateFrame
            bodyVelocity.velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * 50) + Vector3.new(0, 0, 0)
            wait()
        end
    else
        bodyGyro:Destroy()
        bodyVelocity:Destroy()
    end
end

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
