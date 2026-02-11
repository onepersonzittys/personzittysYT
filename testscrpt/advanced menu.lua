print ("terminal text") --verifica se o link do github funciona mandano um texto no console do roblox

local UserInputService = game:GetService("UserInputService") --pega os servicos de input do jogador, keylogger?
local RunService = game:GetService("RunService") --nao sei o que seria um run service qwp
local player = game.Players.LocalPlayer -- variavel que tranforma game.players.localplayers em apenas 'players'

-- main gui
local screenGui = Instance.new("ScreenGui") --cria um objeto screengui, permite a criacao do menu
screenGui.Name = "WinXP_Menu" -- nome do screen gui
screenGui.ResetOnSpawn = false -- faz com que o gui nao desaparessa ao morrer
screenGui.Parent = player:WaitForChild("PlayerGui") --parentscreengui funciona como uma base

--main frame
local mainFrame = Instance.new("ImageLabel") --cria um frame de imagem 9slice
mainFrame.Name = "MainFrame" -- nome do frame, uma 'variavel'
mainFrame.Size = UDim2.new(0, 360, 0, 360) --define o tamanho do frame, aqui 360 para dividir em 9 partes de 120 para o redimensionamento 
mainFrame.Position = UDim2.new(0.5, -180, 0.5,-180) --posicao que o frame se encontra, o 0.5 significa que esta centralizado no axis X e Y ao executar
mainFrame.Image = "rbxassetid://117430313677921" -- pega a imagem que eu subi ao roblox de 360 pixeis
mainFrame.ScaleType = Enum.ScaleType.Slice --tranforma a escale type em slice, dividido
mainFrame.SliceCenter = Rect.new(256, 256, 512, 512) -- deixa os cantos intactos, esticando apenas as bordas e o centro
mainFrame.ResampleMode = Enum.ResamplerMode.Pixelated -- aumenta a qualidade da imagem pixelada
mainFrame.Active = true -- mainframe ativado se torna verdadeiro
mainFrame.Parent = screenGui --faz que o frame vire o child de screengui, como se fosse um arte na moldura

--exit button
local closeBtn = Instance.new("TextButton") -- cria um objeto (botao de fechar, 'x')
closeBtn.Size = UDim2.new(0, 30, 0, 30) -- define o tamanho do botao
closeBtn.Position = UDim2.new(1, -40, 0, 10) -- define o botao em uma posicao, nesse caso, no canto superior direito
closeBtn.Text = "X" -- coloca um texto 'x' no botao
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50) --define a cor de fundo do botao
closeBtn.TextColor3 = Color3.new(1, 1, 1) -- define a cor do texo 'x'
closeBtn.Parent = mainFrame --inpermite que o botao seja um objeto separado do frame, como se fosse o detalhe da pintura dentro do frame

closeBtn.MouseButton1Click:Connect(function() --ao clique, funcao:
	mainFrame.Visible = false -- torna o frame invisivel
end) -- encerra a linha

--fly button
local flyBtn = Instance.new("TextButton") -- cria um objeto 'botao de voo'
flyBtn.Size = UDim2.new(0, 150, 0, 50) -- define o tamanho do botao
flyBtn.Position = UDim2.new(0.5, -75, 0.5, -25) -- define a posicao do botao, no caso centralizado no frame
flyBtn.Text = "fly OFF" -- o texto do botao, diz 'voo desligado'
flyBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- define a cor de fundo do botao
flyBtn.Parent = mainFrame --inpermi9te que o botao saia do frame.

local flying = false -- torna a variavel 'voo' para falso
flyBtn.MouseButton1Click:Connect(function() -- ao clique :
	flying = not flying -- inverte a ordem, 'o falso se torna verdadeiro e visse versa'
	flyBtn.Text = flying and "fly ON" or "fly OFF" --verifica a variavel voo e retorna no texto do botao como ligado ou desligado
	flyBtn.BackgroundColor3 = flying and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(220, 220, 220) --verifica a variavel voo e retorna na cor do botao
end) --encerra a linha

--parte do body velocity, o voo.
local flying = false
local speed = 80

RunService.RenderStepped:Connect(function()
	local char = player.Character
	local humanoid = char and char:FindFirstChild("Humanoid")
	local hrp = char and char:FindFirstChild("HumanoidRootPart")

	if flying and hrp and humanoid then
		humanoid:ChangeState(Enum.HumanoidStateType.Physics)

		local bv = hrp:FindFirstChild("FlyVelocity") or Instance.new("BodyVelocity")
		bv.Name = "FlyVelocity"
		bv.MaxForce = Vector3.new(1e6, 1e6 ,1e6)
		bv.Parent = hrp

		local bg = hrp:FindFirstChild("FlyGyro") or Instance.new("BodyGyro")
		bg.Name = "FlyGyro"
		bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
		bg.Parent = hrp

		local cam = workspace.CurrentCamera
		local moveDir = humanoid.MoveDirection
		
		bv.Velocity = moveDir * speed
		bg.CFrame = cam.CFrame
	else
		if hrp then
			local bv = hrp:FindFirstChild("FlyVelocity")
			local bg = hrp:FindFirstChild("FlyGyro")
			if bv then bv:Destroy() end
			if bg then bg:Destroy() end
				
			if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Physics then
				humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			end
		end
	end
end)
--drag and resize logic.
local dragging, resizing --cria as variaveis 'arrastar' e 'redimensionar'
local dragStart = Vector3.new()
local startPos = UDim2.new()
local startSize = UDim2.new() -- cria as variaveis comeco de arrastar, posicao inicial e tamanho antes de iniciativa

mainFrame.InputBegan:Connect(function(input) -- aqui eu nao consegui explicar
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		local mousePos = input.Position
		local framePos = mainFrame.AbsolutePosition
		local frameSize = mainFrame.AbsoluteSize

		if mousePos.X > (framePos.X + frameSize.X - 40) and mousePos.Y > (framePos.Y + frameSize.Y - 40) then
			resizing = true
			dragging = false
		else
			dragging = true
			resizing = false
		end
		dragStart = input.Position
		startPos = mainFrame.Position
		startSize = mainFrame.Size
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
		resizing = false
	end
end)

RunService.RenderStepped:Connect(function()
	if not (dragging or resizing) then return end

	local mousePos = UserInputService:GetMouseLocation()

	local delta = Vector2.new(mousePos.X - dragStart.X, mousePos.Y - dragStart.Y)

	if dragging then
		mainFrame.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	elseif resizing then
		mainFrame.Size = UDim2.new(
			0, math.max(120, startSize.X.Offset + delta.X),
			0, math.max(120, startSize.Y.Offset + delta.Y)
		)
	end
end)
