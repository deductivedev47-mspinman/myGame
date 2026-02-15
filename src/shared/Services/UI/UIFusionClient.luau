local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local plrGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local scope = Fusion:scoped()
local num = scope:Value(50)
local C = Fusion.Children
local showUI = scope:Value(false)
local ui = game.StarterGui:WaitForChild("UI")
local ONN = Fusion.OnEvent

local module = {}

function module:init()
	local message = scope:Computed(function(use)
		return "Nate The Dev " .. use(num)
	end)
	--printing
	task.wait(2.5)
	scope:Observer(message):onBind(function()
		print(scope.peek(message))
	end)

	task.wait(10)
	num:set(1000000)
end

function module.Changed()
	local message = scope:Computed(function(use)
		return "Nums of Coins " .. use(num)
	end)
	--print
	scope:Observer(message):onChange(function()
		print(scope.peek(message))
	end)

	task.wait(0.5)
	num:set(100)
end

function module.cleanUp()
	scope:doCleanup()
end

function module.instance()
	local message = scope:Value(100000)

	local ui = scope:New("TextLabel")({
		Name = "Greeting",
		Parent = plrGui,

		Text = message,
	})

	scope:Observer(message):onBind(function()
		print(scope.peek(message))
	end)
	task.wait(2.5)
	message:set("NateTheDev")

	local part = scope:New("Part")({
		Parent = workspace,
		Name = "Nate Part",
		Size = Vector3.new(5, 5, 5),
	})
end

function module.Parenting()
	scope:New("ScreenGui")({
		Parent = plrGui,
		Name = "Nate's GUI",
		[C] = {
			scope:New("TextLabel")({
				Text = "Nate The Dev",
				TextScaled = true,
				Size = UDim2.fromScale(0.35, 0.2),
				Position = UDim2.fromScale(0.5, 0),
				AnchorPoint = Vector2.new(0.5, -0.25),
				BackgroundColor3 = Color3.fromRGB(61, 34, 182),
			}),
		},
	})
end

function module.Hydrate()
	local UI = ui:Clone()

	scope:Hydrate(UI)({
		Name = "Nate's Frame",
		Parent = plrGui, -- 👈 IMPORTANT
		Enabled = showUI,
	})

	local frame = UI:WaitForChild("Frame")

	scope:Hydrate(frame)({
		[C] = {
			scope:New("TextButton")({
				[ONN("Activated")] = function()
					print("The button was pressed")
				end,
				Text = "Nate The Dev",
				TextScaled = true,
				Position = UDim2.fromScale(0.5, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromScale(0.2, 0.1),
			}),
		},
	})

	showUI:set(true)
end

return module
