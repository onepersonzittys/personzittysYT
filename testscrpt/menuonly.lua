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
MenuFrame.ClipsDescendants = true
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

local UIPad = Instance.new("UIPadding")
UIPad.Name = "UIPad"
UIPad.PaddingBottom = UDim.new(0, 7)
UIPad.PaddingLeft = UDim.new(0, 7)
UIPad.PaddingRight = UDim.new(0, 7)
UIPad.PaddingTop = UDim.new(0, 17)
UIPad.Parent = MenuFrame

local MainScene = 1
local CreditsScene = 1000
local currentScene = MainScene

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.Active = true
MainFrame.BackgroundTransparency = 1
MainFrame.Parent = MenuFrame

local CreditsFrame = Instance.new("Frame")
CreditsFrame.Name = "CreditsFrame"
CreditsFrame.Size = UDim2.new(1, 0, 1, 0)
CreditsFrame.Active = true
CreditsFrame.Visible = false
CreditsFrame.BackgroundTransparency = 1
CreditsFrame.Parent = MenuFrame

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
	UIPad.PaddingBottom = UDim.new(0, 7)
	UIPad.PaddingLeft = UDim.new(0, 7)
	UIPad.PaddingRight = UDim.new(0, 7)
	UIPad.PaddingTop = UDim.new(0, 17)
end)

UserInputService.InputEnded:Connect(function(input)
	if input == sizeInput then
		resizing = false
		sizeInput = nil
	end
end)


local MainGroup = Instance.new("CanvasGroup")
MainGroup.Parent = MainFrame

local LeftPad = Instance.new("Frame")
LeftPad.Name = "LeftPad"
LeftPad.Size = UDim2.new(0.3, 0, 1, 0)
LeftPad.BackgroundTransparency = 1
LeftPad.ClipsDescendants = true
LeftPad.Active = true
LeftPad.Parent = MainGroup

local RightPad = Instance.new("Frame")
RightPad.Name = "RightPad"
RightPad.Position = UDim2.new(0.3, 0, 0, 0)
RightPad.Size = UDim2.new(0.7, 0, 1, 0)
RightPad.BackgroundTransparency = 1
RightPad.ClipsDescendants = true
RightPad.Active = true
RightPad.Parent = MainGroup

local List1 = Instance.new("UIListLayout")
List1.Name = "List1"
List1.FillDirection = Enum.FillDirection.Vertical
List1.VerticalAlignment = Enum.VerticalAlignment.Top
List1.SortOrder = Enum.SortOrder.Name
List1.HorizontalFlex = Enum.UIFlexAlignment.Fill
List1.ItemLineAlignment = Enum.ItemLineAlignment.Start
List1.Padding = UDim.new(0, 4)
List1.Parent = LeftPad

local Button1 = Instance.new("TextButton")
Button1.Name = "A1"
Button1.Size = UDim2.new(1, 0, 0, 15)
Button1.Text = "A1"
Button1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Button1.ZIndex = 6
Button1.Parent = LeftPad

local Button2 = Instance.new("TextButton")
Button2.Name = "A2"
Button2.Size = UDim2.new(1, 0, 0, 17)
Button2.Text = "A2"
Button2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Button2.ZIndex = 6
Button2.Parent = LeftPad

local Button3 = Instance.new("TextButton")
Button3.Name = "X"
Button3.Size = UDim2.new(1, 0, 0, 20)
Button3.Text = "X"
Button3.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Button3.ZIndex = 6
Button3.Parent = LeftPad

local TextField1 = Instance.new("TextBox")
TextField1.Name = "Y"
TextField1.Size = UDim2.new(1, 0, 0, 50)
TextField1.MultiLine = true
TextField1.TextScaled = true
TextField1.TextTruncate = Enum.TextTruncate.AtEnd
TextField1.ZIndex = 6
TextField1.Parent = LeftPad

local Frame1 = Instance.new("Frame")
Frame1.Position = UDim2.new(0, 2, 0, 2)
Frame1.Size = UDim2.new(1, -2, 1, -2)
Frame1.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
Frame1.ZIndex = 6
Frame1.Parent = RightPad

local timescale = 2

MainButton.Activated:Connect(function(startTick, elapsed, t)
	if currentScene == MainScene then return end
	currentScene = MainScene
	MainButton.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
	CreditsFrame.Visible = false

	local startTick = tick()
	MainGroup.GroupTransparency = 1
	MainFrame.Visible = true 

	while true do
		local elapsed = tick() - startTick
		local t = math.clamp(elapsed / timescale, 0, 1)
		MainGroup.GroupTransparency = 1 - t

		if t >= 1 then break end
		task.wait()
	end

	MainGroup.GroupTransparency = 0
end)

local CreditsGroup = Instance.new("CanvasGroup")
CreditsGroup.Parent = CreditsFrame

local LeftPad1 = Instance.new("Frame")
LeftPad1.Name = "LeftPad1"
LeftPad1.Size = UDim2.new(0.3, 0, 1, 0)
LeftPad1.BackgroundTransparency = 1
LeftPad1.ClipsDescendants = true
LeftPad1.Active = true
LeftPad1.Parent = CreditsGroup

local RightPad1 = Instance.new("Frame")
RightPad1.Name = "RightPad1"
RightPad1.Position = UDim2.new(0.3, 0, 0, 0)
RightPad1.Size = UDim2.new(0.7, 0, 1, 0)
RightPad1.BackgroundTransparency = 1
RightPad1.ClipsDescendants = true
RightPad1.Active = true
RightPad1.Parent = CreditsGroup

local Text1 = Instance.new("TextLabel")
Text1.TextWrapped = true
Text1.Size = UDim2.new(1, 0, 1, 0)
Text1.Text = "Wash away the anger

Here I stand beneath
The warm and soothing rain
The droplets falling
Gently down on the terrain
Wash away the sorrow
All the stains of time
But there’s no memory
It’s only dry inside

In the mud and sinking deeper
Into a peaceful life"
Text1.ZIndex = 6
Text1.Parent = LeftPad1

local Image1 = Instance.new("ImageLabel")
Image1.Position = UDim2.new(0.2, 0, 0.2, 0)
Image1.Size = UDim2.new(0, 192, 0, 192)
Image1.BackgroundTransparency = 1
Image1.Image = "rbxassetid://100901882549557"
Image1.ResampleMode = Enum.ResamplerMode.Pixelated
Image1.ZIndex = 6
Image1.Parent = RightPad1

CreditsButton.Activated:Connect(function()
	if currentScene == CreditsScene then return end
	currentScene = CreditsScene
	CreditsButton.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
	MainFrame.Visible = false

	startTick = tick()
	CreditsGroup.GroupTransparency = 1
	CreditsFrame.Visible = true 

	while true do
		elapsed = tick() - startTick
		t = math.clamp(elapsed / timescale, 0, 1)
		CreditsGroup.GroupTransparency = 1 - t

		if t >= 1 then break end
		task.wait()
	end

	CreditsGroup.GroupTransparency = 0
end)
