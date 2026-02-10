print("---------------------------------------")
print("code run sucess")
print("---------------------------------------")

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

--variavel de controle
local onep = Players.LocalPlayer
local noclip = false

--cria uma base ao menu do jogador.
local gui = Instance.new("ScreenGui")
gui.Name = "testfloder 3"
gui.Parent = onep:WaitForChild("PlayerGui")

-- cria um button
local button = Instance.new ("TextButton")
button.Size = UDim2.new(0, 250, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Text = "noclip toggle"
button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
button.Parent = gui

--cria um toggle
button.MouseButton1Click:Connect(function()
		print("notify player noclip toggle")
		noclip = not noclip
		
		if noclip then
		button.Text = "noclip ON"
	else
		button.Text = "noclip OFF"
	end
end)

--ativa o noclip atraves do clique
RunService.Stepped:Connect(function()
		if noclip and onep.Character then
		for _, v in pairs(onep.Character:GetDescendants()) do
			if v:IsA("BasePart") and v.CanCollide == true then
				v.CanCollide = false
			end
		end
	end
end)
