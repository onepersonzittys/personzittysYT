print ("an eye for an eye and the world goes blind")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MenuFrame = Instance.new("MenuFrame")
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 768, 0, 768)
MenuFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MenuFrame.Image = "rbxassetid://131583245485808"
MenuFrame.ScaleType = Enum.ScaleType.Slice 
MenuFrame.SliceCenter = Rect.new(256, 256, 512, 512)
MenuFrame.ResamplerMode = Enum.ResamplerMode.Pixelated
MenuFrame.Active = true
MenuFrame.Parent = ScreenGui
local function getMenuFramePos(FrameCurrentPos)
	local MenuFrameSize = MenuFrame.Size
	local width = MenuFrameSize.X.Offset
	local height = MenuFrameSize.Y.Offset

	return width, height
end

local MenuFrameX, MenuFrameY = FrameCurrentPos(script.Parent.MenuFrame)

local MenuTop = Instance.new("MenuFrame")
MenuTop.Name = "MenuTop"
MenuTop.Size = UDim2.new(0, 768, 0, 32)
MenuTop.Position = UDim2.new(0, MenuFrameX, 0, MenuFrameY + 736)
MenuTop.Image = "rbxassetid://119324806847241"
MenuTop.ScaleType = Enum.ScaleType.Slice
MenuTop.SliceCenter = Rect.new(32, 0, 64, 32)
MenuTop.ResamplerMode = Enum.ResamplerMode.Pixelated
MenuTop.Active = true
MenuTop.Parent = MenuFrame
