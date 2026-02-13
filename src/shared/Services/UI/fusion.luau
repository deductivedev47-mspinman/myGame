local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local Children = Fusion.Children

local scope = Fusion.scoped(Fusion)
local text = scope:Value("Hello world!")
local isHovering = scope:Value(false)

local module = {}

scope:New("ScreenGui")({
	Name = "Hello",
	Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
	IgnoreGuiInset = true,
	ResetOnSpawn = false,

	[Children] = {
		scope:New("TextButton")({
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

			[Children] = {
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
		}),
	},
})

return module

--[[local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Fusion = require(ReplicatedStorage.Fusion)

local Children = Fusion.Children

local scope = Fusion.scoped(Fusion)
local text = scope:Value("Hello world!")
local isHovering = scope:Value(false)

scope:New "ScreenGui"
{
    Name = "Hello",
    Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
    IgnoreGuiInset = true,
    ResetOnSpawn = false,
    
    [Children] = {
        scope:New "TextButton"
        {
            AnchorPoint = Vector2.one/2,
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
            
            [Children] = {
                scope:New "UIScale"
                {
                    Scale = scope:Spring(
                        scope:Computed(function(use, _)
                            return use(isHovering) and 1.2 or 1
                        end),
                        scope:Computed(function(use, _)
                            return  20
                        end),
                        scope:Computed(function(use, _)
                            return use(isHovering) and 1 or 0.2
                        end)
                    )
                }
            }
        }
    }
}]]
