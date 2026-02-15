local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RootUI = require(script.Parent.RootUI)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement

return function(Parent)
	local root = ReactRoblox.createRoot(Parent)
	local app = e(RootUI.init)
	root:render(app)

	return function()
		root:unmount()
	end
end
