print ("an eye for an eye and the world goes blind")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MenuFrame = Instance.new("ImageLabel")
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 384, 0, 384)
MenuFrame.Position = UDim2.new(0, 0, 0, -10)
MenuFrame.Image = "rbxassetid://115569712843757"
MenuFrame.ScaleType = Enum.ScaleType.Slice 
MenuFrame.SliceCenter = Rect.new(256, 256, 512, 512)
MenuFrame.ZIndex = 5
MenuFrame.Active = true
MenuFrame.Parent = ScreenGui

local MenuTop = Instance.new("ImageLabel")
MenuTop.Name = "MenuTop"
MenuTop.Size = UDim2.new(0, 384, 0, 16)
MenuTop.Position = UDim2.new(0, 0, 0, 0)
MenuTop.BorderSizePixel = 0
MenuTop.Image = "rbxassetid://74821364529931"
MenuTop.ScaleType = Enum.ScaleType.Slice
MenuTop.SliceCenter = Rect.new(32, 0, 352, 32)
MenuTop.ZIndex = 6
MenuTop.Active = true
MenuTop.Parent = MenuFrame

local dragging = false
local dragStart = Vector3.new()
local startPos = UDim2.new()
local startSize = UDim2.new()

MenuTop.InputBegan:connect(function(input)
		if UserInputService == Enum.UserInputType.Touch then
		local MousePos = Input.Position
		local FramePos = MenuFrame.AbsolutePosition
		dragging = true
	end
		dragStart = Input.Position
		startPos = MenuFrame.Position
	end
end)

UserInputService.InputEnded:connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

RunService.RenderStepped.connect(function()
	if not dragging then return end

	local MousePos = UserInputService:GetMouseLocation()

	local delta = Vector2.new(MousePos.X - dragStart.X, MousePos.Y - dragStart.Y)

	if dragging then
		MenuFrame.Position = UDim2.new(
			startPos.X, startPo.X.Offset + delta.X
			startPos.Y, startPo.Y.Offset + delta.Y
		)
	end
end)
