-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.333638012, 0, 0.493146598, 0)
Frame.Size = UDim2.new(0, 291, 0, 37)
Frame.Style = Enum.FrameStyle.RobloxRound

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.173746213, 0, -0.0124181798, 0)
TextButton.Size = UDim2.new(0, 185, 0, 20)
TextButton.Style = Enum.ButtonStyle.RobloxButton
TextButton.Font = Enum.Font.Unknown
TextButton.Text = "ENABLE"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

TextLabel.Parent = TextButton
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.0571397953, 0, 0.964196801, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "VERSION: 1.1"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

TextLabel_2.Parent = TextButton
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(-0.0440126173, 0, -6.62860107, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
TextLabel_2.Font = Enum.Font.Unknown
TextLabel_2.Text = "ANTI-BAN"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 14.000

TextLabel_3.Parent = TextButton
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(-0.0562288836, 0, 3.13490915, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 50)
TextLabel_3.Font = Enum.Font.Unknown
TextLabel_3.Text = "t.me/Deltascriptsss"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 14.000

-- Scripts:

local function CCLPHTI_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local button = script.Parent
	
	local function advancedShield()
		-- Базовый слой: перехват основных функций
		pcall(function()
			game.Players.LocalPlayer:GetPropertyChangedSignal("Parent"):Connect(function()
				if game.Players.LocalPlayer.Parent == nil then
					game.Players.LocalPlayer.Parent = game.Players
				end
			end)
		end)
	
		-- Слой подмены: фальшивые вызовы API
		local fakeApi = {
			ReportAbuse = function() return true end,
			Kick = function() warn("Kick attempt blocked") end
		}
	
		-- Слой маскировки: случайные вызовы легитимных функций
		local legitActions = {
			function() game:GetService("TeleportService"):GetLocalPlayer() end,
			function() game:GetService("MarketplaceService"):GetProductInfo(123) end
		}
	
		-- Активация защиты
		while true do
			-- Выполняем легитимные действия
			for _, action in pairs(legitActions) do
				pcall(action)
			end
	
			-- Обновляем фальшивое API
			for name, func in pairs(fakeApi) do
				pcall(function()
					game[name] = func
					game.Players.LocalPlayer[name] = func
				end)
			end
	
			wait(math.random(3, 7))
		end
	end
	
	button.MouseButton1Click:Connect(function()
		coroutine.wrap(advancedShield)()
		warn("ADVANCED SHIELD ACTIVE | TEST MODE")
	end)
end
coroutine.wrap(CCLPHTI_fake_script)()
local function WUZSOA_fake_script() -- Frame.Drag 
	local script = Instance.new('LocalScript', Frame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(WUZSOA_fake_script)()
