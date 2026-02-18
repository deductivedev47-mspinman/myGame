local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Fusion = require(ReplicatedStorage.Packages.Fusion)
local screenUI = StarterGui.Admin.Button:Clone()

local scope = Fusion.scoped(Fusion)
local hydrate = scope.Hydrate
local event = scope.OnEvent
local text = scope:Value("Hello world!")
local isHovering = scope:Value(false)
local c = Fusion.Children
local peek = scope.peek

local M = {}

function M.init(self: any)
	scope:New("TextButton")({
		Parent = self,
		AnchorPoint = Vector2.one / 2,
		Size = UDim2.fromScale(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Text = scope:Computed(function(use, _)
			return use(text)
		end),
		TextScaled = true,
		[Fusion.OnEvent("MouseEnter")] = function(...)
			text:set("Hover!")
			isHovering:set(true)
		end,
		[Fusion.OnEvent("MouseLeave")] = function(...)
			text:set("Not Hover!")
			isHovering:set(false)
		end,

		[c] = {
			scope:New("UIScale")({
				Scale = scope:Spring(
					scope:Computed(function(use, _)
						return use(isHovering) and 1.2 or 1
					end),
					scope:Computed(function(use, _)
						return 20
					end),
					scope:Computed(function(use, _)
						return use(isHovering) and 1 or 0.2
					end)
				),
			}),
		},
	})
end

function M.observed()
	--observers
	local exoticAmount = scope:Value(1000000)
	local observer = scope:Observer(exoticAmount)
	local disconnect = observer:onChange(function()
		print("new value - " .. peek(exoticAmount))
	end)

	task.wait(5)
	disconnect()
	--Usage the observer will peek/spy the negativeAmount
	local negativeAmount = scope:Value(500)
	local observer = scope:Observer(negativeAmount)
end

function M.computed()
	local numCoins = scope:Value(50)
	local price = scope:Value(10)

	local totalCoins = scope:Computed(function(use)
		return use(numCoins) - use(price)
	end)

	--
	print(peek(totalCoins))
end

function M.mine(self: any)
	local key = event("Activated")

	local ui = hydrate(scope, screenUI)({
		Parent = self,

		[key] = function(use)
			if use then
				M.computed()
			end
		end,
	})
end

return M
