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
MenuTop.Size = UDim2.new(0, 384, 0, 32)
MenuTop.Position = UDim2.new(0, 0, 0, 0)
MenuTop.Image = "rbxthumb://type=Asset&id=119324806847241&w=768&h=32"
MenuTop.ScaleType = Enum.ScaleType.Slice
MenuTop.SliceCenter = Rect.new(32, 0, 352, 32)
MenuTop.ResampleMode = Enum.ResamplerMode.Pixelated
MenuTop.ZIndex = 6
MenuTop.Active = true
MenuTop.Parent = MenuFrame
