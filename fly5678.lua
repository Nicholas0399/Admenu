-- Создание кнопки
local mobileButton = Instance.new("TextButton")
mobileButton.Name = "MobileButton"
mobileButton.Parent = script.Parent -- Предполагается, что кнопка будет находиться в родительском объекте скрипта
mobileButton.AnchorPoint = Vector2.new(0.5, 0.5) -- Установка точки привязки по центру
mobileButton.Position = UDim2.new(0.5, 0, 0.5, 0) -- Установка позиции по центру экрана
mobileButton.Size = UDim2.new(0, 200, 0, 50) -- Установка размера кнопки
mobileButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.8) -- Цвет фона
mobileButton.TextColor3 = Color3.new(1, 1, 1) -- Цвет текста
mobileButton.BorderSizePixel = 0 -- Убираем рамку
mobileButton.Font = Enum.Font.SourceSansBold -- Шрифт текста
mobileButton.TextSize = 24 -- Размер текста
mobileButton.Text = "Mobile Button" -- Текст кнопки

-- Овальная форма
local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0.5, 0) -- Овальная форма (0.5 радиус)
uicorner.Parent = mobileButton

-- Обработчик нажатия на кнопку
mobileButton.MouseButton1Click:Connect(function()
    -- Действия при нажатии на кнопку
    print("Button clicked!") -- Пример: вывод сообщения в консоль
end)
