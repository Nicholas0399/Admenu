-- Создаем функцию для показа кнопки
local function showButton()
    -- Создаем GUI-элемент - кнопку
    local button = Instance.new("TextButton")
    button.Text = "Нажми меня"
    button.Size = UDim2.new(0.2, 0, 0.1, 0) -- Размер кнопки
    button.Position = UDim2.new(0.4, 0, 0.4, 0) -- Позиция кнопки
    button.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") -- Делаем кнопку дочерним элементом PlayerGui

    -- Соединяем событие "MouseClick" с функцией
    button.MouseButton1Click:Connect(function()
        print("Кнопка была нажата!")
    end)
end

-- Вызываем функцию при запуске скрипта
showButton()
