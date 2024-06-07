-- Ваш скрипт для стилизации кнопок и основной логики
local function styleButton(button)
    button.BackgroundColor3 = Color3.new(0.2, 0.6, 0.8) -- Цвет фона (можно изменить по желанию)
    button.TextColor3 = Color3.new(1, 1, 1) -- Цвет текста (белый)
    button.BorderSizePixel = 0 -- Убираем рамку
    button.Size = UDim2.new(0, 200, 0, 50) -- Размер кнопки (можно изменить по желанию)
    button.Font = Enum.Font.SourceSansBold -- Шрифт текста
    button.TextSize = 24 -- Размер текста
    button.AutoButtonColor = false -- Отключаем автоматическое изменение цвета при нажатии
    button.BackgroundTransparency = 0.2 -- Прозрачность фона
    button.TextWrapped = true -- Перенос текста
    button.ZIndex = 2 -- Приоритет отображения
    button.ClipsDescendants = true -- Обрезка потомков, если выходят за границы кнопки

    -- Овальная форма
    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0.5, 0) -- Овальная форма (0.5 радиус)
    uicorner.Parent = button
end

-- Применение стиля к существующим кнопкам
styleButton(mine)
styleButton(closebutton)
styleButton(mini)
styleButton(mini2)

-- Обновленный скрипт
mine.MouseButton1Down:connect(function()
    if speeds == 1 then
        speed.Text = 'cannot be less than 1'
        wait(1)
        speed.Text = speeds
    else
        speeds = speeds - 1
        speed.Text = speeds
        if nowe == true then
            tpwalking = false
            for i = 1, speeds do
                spawn(function()
                    local hb = game:GetService("RunService").Heartbeat
                    tpwalking = true
                    local chr = game.Players.LocalPlayer.Character
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
                end)
            end
        end
    end
end)

closebutton.MouseButton1Click:Connect(function()
    main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
    up.Visible = false
    down.Visible = false
    onof.Visible = false
    plus.Visible = false
    speed.Visible = false
    mine.Visible = false
    mini.Visible = false
    mini2.Visible = true
    main.Frame.BackgroundTransparency = 1
    closebutton.Position = UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
    up.Visible = true
    down.Visible = true
    onof.Visible = true
    plus.Visible = true
    speed.Visible = true
    mine.Visible = true
    mini.Visible = true
    mini2.Visible = false
    main.Frame.BackgroundTransparency = 0
    closebutton.Position = UDim2.new(0, 0, -1, 27)
end)
