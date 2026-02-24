local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MainReact = require(script.Parent.MainReact)
local useEffect = require(script.Parent.useEffect)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement

return function(parent)
	local root = ReactRoblox.createRoot(parent)

	local app = e(React.Fragment, nil, e(useEffect.HealthBarUI))

	root:render(app)

	return function()
		root:unmount()
	end
end
