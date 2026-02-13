print ("an eye for an eye and the world goes blind")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MenuFrame = Instance.new("ImageLabel")
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 768, 0, 768)
MenuFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MenuFrame.BackGroundTransparency = 1
MenuFrame.Image = "rbxassetid://13158324522"
MenuFrame.ScaleType = Enum.ScaleType.Slice 
MenuFrame.SliceCenter = Rect.new(256, 256, 512, 512)
MenuFrame.Active = true
MenuFrame.ImageTransparency = 0
MenuFrame.ZIndex = 5
MenuFrame.Parent = ScreenGui

local MenuTop = Instance.new("ImageLabel")
MenuTop.Name = "MenuTop"
MenuTop.Size = UDim2.new(0, 768, 0, 32)
MenuTop.Position = UDim2.new(0, 0, 0, 736)
MenuFrame.BackGroundTransparency = 0
MenuTop.Image = "rbxassetid://119324806847241"
MenuTop.ScaleType = Enum.ScaleType.Slice
MenuTop.SliceCenter = Rect.new(32, 0, 64, 32)
MenuTop.Active = true
MenuTop.Parent = MenuFrame
