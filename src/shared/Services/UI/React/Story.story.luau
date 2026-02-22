local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local ReactUI = require(script.Parent.ReactUI)
local e = React.createElement

return function(parent)
	local root = ReactRoblox.createRoot(parent)
	local app = e(ReactUI.UI)
	root:render(app)

	return function()
		root:unmount()
	end
end
