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
	local coins = scope:Value("uncle matt")
	local observes = scope:Observer(coins)
	--1st method onChange
	local cut = observes:onChange(function()
		print("changed " .. peek(coins))
	end)
	cut()
	--2nd method onBind
	local cut = observes:onBind(function()
		print(peek(coins))
	end)

	task.wait(2)
	print("CHANGED TO")
	coins:set("uncle matt loser? or no")
end

function M.computed()
	--Computeds
	local numCoins = scope:Value(50)
	local price = scope:Value(10)
	local observer = scope:Observer(numCoins, price)

	local totalCoins = scope:Computed(function(use)
		return use(numCoins) - use(price)
	end)
	--
	observer:onChange(function()
		print(peek(price), peek(numCoins))
	end)

	--Usage
	local num = scope:Value(2)
	local observer_2 = scope:Observer(num)

	local hardMath = scope:Computed(function(use)
		return use(num) * 100
	end)

	-- observer_2:onBind(function()
	-- 	print(peek(num) .. " 🍄Changed to🍄 - " .. peek(hardMath))
	-- end)

	--🔰 Inner Scopes
	local scoped = Fusion.scoped(Fusion)
	local double = scoped:Computed(function(use, scoped)
		local mynum = scoped:Value("🌶️")
		local current = use(mynum)
		--if peek is called this will run
		print("🌶️Creating- ", current)

		--if doCleanup() is called this will run
		table.insert(scoped, function()
			print("Destroying", current)
		end)
		return current
	end)
	--call peek(target??) or doCleanup(target??) or call peek(target??) and doCleanup(target??)

	if peek(double) then
		task.wait(5)
		scoped:doCleanup()
	end
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
