local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement
local event = React.Event

local react = {}

function react.UI(props)
	local isVisible, setIsVisible = React.useState(true)

	return e(
		React.Fragment,
		nil,
		e(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 0.5,
				Position = UDim2.fromScale(0.5, 0.33),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromScale(0.3, 0.35),
				Visible = isVisible,
			},
			e("UICorner", {
				CornerRadius = UDim.new(0, 12),
			}),
			e("UIStroke", {
				Color = Color3.fromRGB(255, 255, 255),
				Thickness = 5,
			})
		),

		e("TextButton", {
			Size = UDim2.fromScale(0.045, 0.07),
			Position = UDim2.fromScale(0.028, 0.55),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Text = "Menu",
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(58, 58, 58),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.5,
			[event.MouseButton1Click] = function()
				setIsVisible(function(prev)
					return not prev
				end)
			end,
		}, {
			e("UICorner", {
				CornerRadius = UDim.new(0, 12),
			}),

			e("UIStroke", {
				Thickness = 2,
				Color = Color3.fromRGB(),
			}),
		})
	)
end

function react.memo()
	local function TabButton(props)
		print("TabButton re-rendered!") -- you'll see this every time ANYTHING changes
		return e("TextButton", {
			Text = props.label,
			Size = UDim2.fromOffset(100, 50),
			[event.Activated] = function()
				props.onSelected(props.label)
			end,
		})
	end

	local function ShopUI()
		local currentTab, setCurrentTab = React.useState("Packs")

		return e(
			"Frame",
			{
				Size = UDim2.fromScale(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
			},
			e(TabButton, {
				label = "Packs",
				onSelected = setCurrentTab,
			}),
			e(TabButton, {
				label = "Lucky Blocks",
				onSelected = setCurrentTab,
			}),
			e("TextLabel", {
				Text = "Current Tab: " .. currentTab,
				Size = UDim2.fromOffset(200, 50),
				Position = UDim2.fromOffset(0, 60),
			})
		)
	end

	return e(ShopUI) -- return it!
end

return react
