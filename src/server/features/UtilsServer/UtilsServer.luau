local ServerStorage = game:GetService("ServerStorage")
type Tools = {
	Tools: { SixSeven: any },
}

return function(): Tools
	return {
		Tools = {
			SixSeven = ServerStorage.Tools.Brainrots["67"],
		},
	}
end
