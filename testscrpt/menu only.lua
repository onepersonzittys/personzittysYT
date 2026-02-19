print ("an eye for an eye and the world goes blind")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local WorkspaceService = game:GetService("Workspace")
local player = game.Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MenuFrame = Instance.new("ImageLabel")
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 384, 0, 384)
MenuFrame.Position = UDim2.new(0, 0, 0, -10)
MenuFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MenuFrame.Image = "rbxassetid://115569712843757"
MenuFrame.ScaleType = Enum.ScaleType.Slice 
MenuFrame.SliceCenter = Rect.new(256, 256, 512, 512)
MenuFrame.ZIndex = 5
MenuFrame.Active = true
MenuFrame.Parent = ScreenGui

local MenuTop = Instance.new("ImageLabel")
MenuTop.Name = "MenuTop"
MenuTop.Position = UDim2.new(0, 0, 0, 0)
MenuTop.Size = UDim2.new(0, 384, 0, 16)
MenuTop.Image = "rbxassetid://117813558054556"
MenuTop.BackgroundTransparency = 1
MenuTop.ScaleType = Enum.ScaleType.Slice
MenuTop.SliceCenter = Rect.new(16, 0, 352, 16)
MenuTop.ZIndex = 6
MenuTop.Active = true
MenuTop.Parent = MenuFrame

local resizeHandle = Instance.new("ImageLabel")
resizeHandle.Name = "resizeHandle"
resizeHandle.Position = UDim2.new(1, -25, 1, -25)
MenuTop.BorderSizePixel = 0
resizeHandle.Size = UDim2.new(0, 16, 0, 16)
resizeHandle.Image = "rbxassetid://81088906659577"
resizeHandle.BackgroundTransparency = 1
resizeHandle.ZIndex = 6
resizeHandle.Active = true
resizeHandle.Parent = MenuFrame
--smooth drag code

local dragging = false
local dragStart = Vector2.new()
local startPos = UDim2.new()
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
	local deltadragX = (MousePos.X - dragStart.X)
	local deltadragY = (MousePos.Y - dragStart.Y)
	local targetPos = UDim2.new(startPos.X.Scale, deltadragX + startPos.X.Offset,
		startPos.Y.Scale, deltadragY + startPos.Y.Offset)
	MenuFrame.Position = MenuFrame.Position:Lerp(targetPos, 0.1)
end)

UserInputService.InputEnded:Connect(function(input)
	if input == dragInput then
        dragging = false
        dragInput = nil

        local windowPos = MenuFrame.AbsolutePosition
		local windowX = windowPos.X
		local windowY = windowPos.Y
		local windowSize = MenuFrame.AbsoluteSize
		local snapDistance = 16
		local screenSize = camera.ViewportSize
		local screenX = screenSize.X
		local screenY = screenSize.Y
		local newX = windowX
		local newY = windowY
        if windowX <= snapDistance then
			newX = 0
		end
		if windowX + windowSize.X >= screenX - snapDistance then
			newX = screenX - windowSize.X
		end
		if windowY <= snapDistance then
			newY = 0
		end
		if windowY + windowSize.Y >= screenY - snapDistance then
			newY = screenY - windowSize.Y
		end
		MenuFrame.Position = UDim2.new(0, newX, 0, newY)
	end
end)

local resizing = false
local resizeStart = Vector2.new()
local startSize = UDim2.new()
local sizeInput

-- resizable menu :

resizeHandle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		resizeStart = input.Position
		startSize = MenuFrame.Size
		sizeInput = input
		resizing = true
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not resizing then return end
	if input ~= sizeInput then return end
	local mousePos = input.Position
	local deltaSizeX = (mousePos.X - resizeStart.X)
	local deltaSizeY = (mousePos.Y - resizeStart.Y)
	local targetWidth = startSize.X.Offset + deltaSizeX
	local targetHeight = startSize.Y.Offset + deltaSizeY
	local minWidth = 200
	local minHeight = 172
	if targetWidth < minWidth then targetWidth = minWidth
	end
	if targetHeight < minHeight then targetHeight = minHeight
	end
	MenuFrame.Size = UDim2.new(startSize.X.Scale, targetWidth, 
		startSize.Y.Scale, targetHeight)
	MenuTop.Size = UDim2.new(startSize.X.Scale, targetWidth,
		startSize.Y.Scale, 16)
end)

UserInputService.InputEnded:Connect(function(input)
	if input == sizeInput then
		resizing = false
		sizeInput = nil
	end
end)
