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
local dragStart = Vector2.new()
local startPos = UDim2.new()
local startSize = UDim2.new()
local dragInput

MenuTop.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragStart = input.Position
		dragInput = input
		startPos = MenuFrame.Position
		dragging = true
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not dragging then return end
	if input ~= dragInput then return end
	local MousePos = input.Position
	local deltaX = (MousePos.X - dragStart.X)
	local deltaY = (MousePos.Y - dragStart.Y)
	local targetPos = UDim2.new(startPos.X.Scale, deltaX + startPos.X.Offset,
		startPos.Y.Scale, deltaY + startPos.Y.Offset)
	MenuFrame.Position = MenuFrame.Position:Lerp(targetPos, 0.1)
end)

MenuTop.InputEnded:Connect(function(input)
	if input == dragInput then
        dragging = false
        dragInput = nil
	end
end)
