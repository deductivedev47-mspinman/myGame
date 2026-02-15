local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Menu = require(script.Parent.Menu)
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

local module = {}

function module.init()
	local raw, set = React.useState(true)

	return e(React.Fragment, nil, {
		Menu = e(Menu.init, {
			toggle = raw,
			showUI = function()
				set(not raw)
			end,
		}),
	})
end

return module
