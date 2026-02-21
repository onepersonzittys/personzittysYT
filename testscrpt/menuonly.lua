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
MenuFrame.Position = UDim2.new(0.5, 0, 0.5, -10)
MenuFrame.Image = "rbxassetid://115569712843757"
MenuFrame.ScaleType = Enum.ScaleType.Slice 
MenuFrame.SliceCenter = Rect.new(256, 256, 512, 512)
MenuFrame.ZIndex = 5
MenuFrame.Active = true
MenuFrame.Parent = ScreenGui

local MenuTop = Instance.new("ImageLabel")
MenuTop.Name = "MenuTop"
MenuTop.Position = UDim2.new(0, -64, 0, 0)
MenuTop.Size = UDim2.new(0, 448, 0, 16)
MenuTop.Image = "rbxassetid://117813558054556"
MenuTop.AnchorPoint = Vector2.new(0.5, 0.5)
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

local MenuBar = Instance.new("Frame")
MenuBar.Name = "MenuBar"
MenuBar.Position = UDim2.new(0, -64, 0, 0)
MenuBar.Size = UDim2.new(0, 64, 0.9, 0)
MenuBar.BackgroundColor3 = Color3.fromRGB(82,82,82)
MenuBar.ZIndex = 4
MenuBar.Active = true
MenuBar.Parent = MenuFrame
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 32)
Corner.Parent = MenuBar

local BarScrolling = Instance.new("ScrollingFrame")
BarScrolling.Name = "BarScrolling"
BarScrolling.Position = UDim2.new(0, 12, 0, 32)
BarScrolling.Size = UDim2.new(1, -6, 1, -6)
BarScrolling.BackgroundTransparency = 1
BarScrolling.BorderSizePixel = 0
BarScrolling.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
BarScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
BarScrolling.ScrollBarThickness = 15
BarScrolling.ScrollingEnabled = true
BarScrolling.ClipsDescendants = true
BarScrolling.ZIndex = 5
BarScrolling.Active = true
BarScrolling.Parent = MenuBar

local SiblingListing = Instance.new("UIListLayout")
SiblingListing.Name = "SiblingListing"
SiblingListing.FillDirection = Enum.FillDirection.Vertical
SiblingListing.VerticalAlignment = Enum.VerticalAlignment.Top
SiblingListing.SortOrder = Enum.SortOrder.Name
SiblingListing.HorizontalFlex = Enum.UIFlexAlignment.Fill
SiblingListing.ItemLineAlignment = Enum.ItemLineAlignment.Start
SiblingListing.Padding = UDim.new(0, 4)
SiblingListing.Parent = BarScrolling
SiblingListing:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	BarScrolling.CanvasSize = UDim2.new(0,0,0,SiblingListing.AbsoluteContentSize.Y)
end)

local MainButton = Instance.new("TextButton")
MainButton.Name = "A1MainButton"
MainButton.Size = UDim2.new(1, -4, 0, 32)
MainButton.Text = "Main"
MainButton.Font = Enum.Font.Code
MainButton.BackgroundColor3 = Color3.fromRGB(232,233,234)
MainButton.ZIndex = 6
MainButton.Active = true
MainButton.Parent = BarScrolling

local lowCorner = Instance.new("UICorner")
lowCorner.CornerRadius = UDim.new(0, 8)
lowCorner.Parent = MainButton

MainButton.MouseEnter:Connect(function()
	MainButton.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
end)

MainButton.MouseLeave:Connect(function()
	MainButton.BackgroundColor3 = Color3.fromRGB(232,233,234)
end)

local CreditsButton = Instance.new("TextButton")
CreditsButton.Name = "ZZ1000CreditsButton"
CreditsButton.Size = UDim2.new(1, -4, 0, 32)
CreditsButton.Text = "Credits"
CreditsButton.Font = Enum.Font.Code
CreditsButton.BackgroundColor3 = Color3.fromRGB(232,233,234)
CreditsButton.ZIndex = 6
CreditsButton.Active = true
CreditsButton.Parent = BarScrolling

local lowCorner2 = Instance.new("UICorner")
lowCorner2.CornerRadius = UDim.new(0, 8)
lowCorner2.Parent = CreditsButton

CreditsButton.MouseEnter:Connect(function()
	CreditsButton.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
end)

CreditsButton.MouseLeave:Connect(function()
	CreditsButton.BackgroundColor3 = Color3.fromRGB(232,233,234)
end)

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
		local camera = workspace.CurrentCamera
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
	local frameSize = MenuFrame.AbsoluteSize
	local frameSizeX = frameSize.X
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
	MenuTop.Size = UDim2.new(0, targetWidth, 0, 16)
	MenuBar.Size = UDim2.new(0, targetWidth / 6, 0.9, 0)
end)

UserInputService.InputEnded:Connect(function(input)
	if input == sizeInput then
		resizing = false
		sizeInput = nil
	end
end)
