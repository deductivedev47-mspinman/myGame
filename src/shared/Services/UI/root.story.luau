local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local rootUI = require(script.Parent.rootUI)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)

local e = React.createElement

return function(parent)
	local root = ReactRoblox.createRoot(parent)
	local app = e(rootUI)
	root:render(app)

	return function()
		root:unmount()
	end
end
