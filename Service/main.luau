warn("DA-H // Привет!") -- Выводит приветственное сообщение в консоль
gamename = ""

-- Загружаем необходимые библиотеки
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))() -- Библиотека Fluent для создания интерфейса
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DaHawakere/DA-H/refs/heads/main/Main/Modules/SaveManager_RU.lua"))() -- Модуль для сохранений
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DaHawakere/DA-H/refs/heads/main/Main/Modules/InterfaceManager_RU.lua"))() -- Модуль для управления интерфейсом

-- Информация о текущем игроке
local Player = game.Players.LocalPlayer -- Игрок
local PlayerName = Player.Name -- Имя игрока
local PlayerChar = Player.Character -- Персонаж игрока
local PlayerHuma = PlayerChar.Humanoid -- Humanoid
local PlayRig = PlayerHuma.RigType --Rigtype R6/R15

-- Создание окна интерфейса с использованием Fluent
local Window = Library:CreateWindow{ 
    Title = "DA-H // " .. gamename, -- Заголовок окна
    SubTitle = "Придумай сам что тут написано...", -- Подзаголовок окна
    TabWidth = 160, -- Ширина вкладки
    Size = UDim2.fromOffset(830, 525), -- Размер окна
    Resize = true, -- Возможность изменения размера окна
    MinSize = Vector2.new(470, 380), -- Минимальный размер окна
    Acrylic = true, -- Включение эффекта блюра
    Theme = "Dark", -- Тема интерфейса
    MinimizeKey = Enum.KeyCode.RightControl -- Клавиша для минимизации
}

-- Определяем табы для интерфейса
local Tabs = { 
    Main = Window:CreateTab{ 
        Title = "Общее", -- Заголовок вкладки
        Icon = "phosphor-users-bold" -- Иконка вкладки
    },
    Settings = Window:CreateTab{
        Title = "Настройки",
        Icon = "settings"
    },
    Loader = Window:CreateTab{
        Title = "Хабы",
        Icon = "github"
    },
}

-- Настройка уведомлений
Library:Notify{ 
    Title = "DA-H", -- Заголовок уведомления
    Content = "Идет загрузка!", -- Контент уведомления
    SubContent = nil, -- Дополнительный контент уведомления
    Duration = 5 -- Время отображения уведомления
}

-- Создание параграфов с информацией в вкладке Main
local MainParagraph = Tabs.Main:CreateParagraph("MainParagraph", {
    Title = "Здраствуй, " .. PlayerName, -- Заголовок параграфа
    Content = "Игра: " .. "Не поддерживается" .. "\nИнфa:\nXП - " .. PlayerHuma.Health .. "/" .. PlayerHuma.MaxHealth .. " Скорость - " .. PlayerHuma.WalkSpeed .. " Сила прыжка - " .. PlayerHuma.JumpPower, -- Контент параграфа
})

-- Кнопка для загрузки Plutonium Hub с подтверждением
Tabs.Loader:CreateButton{ 
    Title = "Загрузить Plutonium Hub", 
    Description = "(Это не мое, так что баги - не моя вина)", 
    Callback = function() 
        Window:Dialog{ 
            Title = "Точно?", 
            Content = "Уверен?", 
            Buttons = { 
                { 
                    Title = "Confirm", 
                    Callback = function() 
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))() 
                        print("DA-H | Принятие загрузки Plutonium Hub") 
                    end
                },
                {
                    Title = "Cancel", 
                    Callback = function() 
                        print("DA-H | Отказ от загрузки Plutonium Hub") 
                    end
                }
            }
        }
    end
}

-- Аналогичная кнопка для загрузки BlackKing Hub
Tabs.Loader:CreateButton{ 
    Title = "Загрузить BlackKing Hub", 
    Description = "(Это не мое, так что баги - не моя вина)", 
    Callback = function() 
        Window:Dialog{ 
            Title = "Точно?", 
            Content = " ", 
            Buttons = { 
                { 
                    Title = "Confirm", 
                    Callback = function() 
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/KINGHUB01/BlackKing/main/BlackKing'))() 
                        print("DA-H | Принятие загрузки BlackKing Hub") 
                    end
                },
                {
                    Title = "Cancel", 
                    Callback = function() 
                        print("DA-H | Отказ от загрузки BlackKing Hub") 
                    end
                }
            }
        }
    end
}

-- Кнопка для выдачи предмета
Tabs.Main:Button({ 
    Title = "Выдать предмет на дрочку", 
    Description = "Работает с R6/R15", 
    Callback = function() 
        if PlayRig == Enum.HumanoidRigType.R6 then R6: loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))() else loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))() end -- Загрузка скрипта для R6/R15
    end
})



local FBToggle_T = Tabs.Main:CreateToggle("FBToggle_T", {Title = "Светлота - Fullbright", Default = false })

-- Старые значения для освещения
local OldBrightness = game.Lighting.Brightness
local OldClocktime = game.Lighting.ClockTime
local OldFogEnd = game.Lighting.FogEnd
local OldGlobalShadows = game.Lighting.GlobalShadows
local OldOutdoorAmbient = game.Lighting.OutdoorAmbient

-- Функция для изменения светлоты
local function FBToggle_F()
    if FBToggle_T.Value then
        -- на да
		local OldBrightness = game.Lighting.Brightness
		local OldClocktime = game.Lighting.ClockTime
		local OldFogEnd = game.Lighting.FogEnd
		local OldGlobalShadows = game.Lighting.GlobalShadows
		local OldOutdoorAmbient = game.Lighting.OutdoorAmbient

        game.Lighting.Brightness = 5
        game.Lighting.ClockTime = 14
        game.Lighting.FogEnd = 100000
        game.Lighting.GlobalShadows = false
        game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else
        -- на нет
        game.Lighting.Brightness = OldBrightness
        game.Lighting.ClockTime = OldClocktime
        game.Lighting.FogEnd = OldFogEnd
        game.Lighting.GlobalShadows = OldGlobalShadows
        game.Lighting.OutdoorAmbient = OldOutdoorAmbient
    end
end


FBToggle_T:OnChanged(function() --Активация при переключении
    FBToggle_F() --Функция которая включает/выключает светлоту
end)

-- Параграф с информацией о игре
local ParagraphGameF = Tabs.Main:CreateParagraph("ParagraphGameF", { 
    Title = "Для игры", 
    Content = "(На заметку, игра не поддержана.)", 
    TitleAlignment = "Middle", 
    ContentAlignment = Enum.TextXAlignment.Center 
})

-- Другой параграф с информацией по типу тг и так далее.
local ParagraphDrygoe = Tabs.Main:CreateParagraph("ParagraphDrygoe", { 
    Title = "Другое", 
    Content = nil, 
    TitleAlignment = "Middle", 
    ContentAlignment = Enum.TextXAlignment.Center 
})

-- Сохранение и настройка менеджеров интерфейса и сохранений
SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes{}

-- Построение секций для настроек и конфигураций
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- Выбор первой вкладки
Window:SelectTab(1)

-- Уведомление о загрузке скрипта
Library:Notify{
    Title = "DA-H",
    Content = "Скрипт успешно загрузился!",
    Duration = 8
}

-- Загрузка автозагружаемой конфигурации
SaveManager:LoadAutoloadConfig()

-- Бесконечный цикл обновления информации о общей информации
while wait(0.05) do
    PlayerChar = Player.Character
    PlayerHuma = PlayerChar.Humanoid

    MainParagraph:SetValue("Игра: Не поддержана" .. "\nИнфa:\nXП - " .. PlayerHuma.Health .. "/" .. PlayerHuma.MaxHealth .. " Скорость - " .. PlayerHuma.WalkSpeed .. " Сила прыжка - " .. PlayerHuma.JumpPower) 
end
