--// JJS Helper v2
--// by Rodrigo
--// Ferramentas de ajuda para o Skill Builder
--// Não injeta Ctrl nem simula teclas.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

--==================================================
-- LIMPAR VERSÃO ANTIGA
--==================================================

local old = game:GetService("CoreGui"):FindFirstChild("JJSHelper")
if old then
	old:Destroy()
end

--==================================================
-- GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "JJSHelper"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game:GetService("CoreGui")

local panel = Instance.new("Frame")
panel.Size = UDim2.fromOffset(175, 155)
panel.Position = UDim2.new(0.5, -87, 0.5, -77)
panel.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
panel.BackgroundTransparency = 0.12
panel.BorderSizePixel = 0
panel.ClipsDescendants = true
panel.Parent = gui

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 10)
panelCorner.Parent = panel

local panelStroke = Instance.new("UIStroke")
panelStroke.Color = Color3.fromRGB(0, 145, 255)
panelStroke.Thickness = 2
panelStroke.Parent = panel

--==================================================
-- FONTE
--==================================================

local fingerPaint

pcall(function()
	fingerPaint = Font.fromId(
		12187375716,
		Enum.FontWeight.Regular,
		Enum.FontStyle.Normal
	)
end)

local function applyFont(object)
	if fingerPaint then
		object.FontFace = fingerPaint
	else
		object.Font = Enum.Font.GothamBold
	end
end

--==================================================
-- HEADER
--==================================================

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 36)
header.BackgroundTransparency = 1
header.ZIndex = 20
header.Parent = panel

-- LOGO
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.fromOffset(25, 25)
logo.Position = UDim2.fromOffset(7, 5)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://72604906241049"
logo.ScaleType = Enum.ScaleType.Crop
logo.ZIndex = 21
logo.Parent = header

local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(1, 0)
logoCorner.Parent = logo

local logoStroke = Instance.new("UIStroke")
logoStroke.Color = Color3.fromRGB(0, 145, 255)
logoStroke.Thickness = 1
logoStroke.Parent = logo

-- TÍTULO
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -75, 1, 0)
title.Position = UDim2.fromOffset(38, 0)
title.BackgroundTransparency = 1
title.Text = "JJS Helper"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextStrokeTransparency = 0
title.ZIndex = 21
title.Parent = header
applyFont(title)

-- MINIMIZAR
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(25, 28)
minimize.Position = UDim2.new(1, -55, 0, 4)
minimize.BackgroundTransparency = 1
minimize.Text = "−"
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.TextSize = 20
minimize.TextStrokeTransparency = 0
minimize.ZIndex = 22
minimize.Parent = header
applyFont(minimize)

-- FECHAR
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(25, 28)
close.Position = UDim2.new(1, -29, 0, 4)
close.BackgroundTransparency = 1
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextSize = 15
close.TextStrokeTransparency = 0
close.ZIndex = 22
close.Parent = header
applyFont(close)

--==================================================
-- ÁREA DE SCROLL
--==================================================

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -42)
scroll.Position = UDim2.fromOffset(5, 39)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 145, 255)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollingDirection = Enum.ScrollingDirection.Y
scroll.Active = true
scroll.ZIndex = 5
scroll.Parent = panel

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -5, 0, 1000)
content.BackgroundTransparency = 1
content.Parent = scroll

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = content

--==================================================
-- FUNÇÕES VISUAIS
--==================================================

local function createSection(text)
	local section = Instance.new("TextLabel")
	section.Size = UDim2.new(1, -6, 0, 22)
	section.BackgroundTransparency = 1
	section.Text = text
	section.TextColor3 = Color3.fromRGB(80, 190, 255)
	section.TextSize = 12
	section.TextXAlignment = Enum.TextXAlignment.Left
	section.TextStrokeTransparency = 0
	section.ZIndex = 6
	section.Parent = content
	applyFont(section)

	return section
end

local function createTool(titleText, description, callback)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, -8, 0, 48)
	button.BackgroundColor3 = Color3.fromRGB(25, 25, 29)
	button.BackgroundTransparency = 0.08
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	button.Text = ""
	button.ZIndex = 6
	button.Parent = content

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 7)
	corner.Parent = button

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(45, 45, 52)
	stroke.Thickness = 1
	stroke.Parent = button

	local name = Instance.new("TextLabel")
	name.Size = UDim2.new(1, -12, 0, 19)
	name.Position = UDim2.fromOffset(7, 3)
	name.BackgroundTransparency = 1
	name.Text = titleText
	name.TextColor3 = Color3.new(1, 1, 1)
	name.TextSize = 12
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.TextStrokeTransparency = 0
	name.ZIndex = 7
	name.Parent = button
	applyFont(name)

	local desc = Instance.new("TextLabel")
	desc.Size = UDim2.new(1, -12, 0, 22)
	desc.Position = UDim2.fromOffset(7, 21)
	desc.BackgroundTransparency = 1
	desc.Text = description
	desc.TextColor3 = Color3.fromRGB(155, 155, 160)
	desc.TextSize = 9
	desc.TextWrapped = true
	desc.TextXAlignment = Enum.TextXAlignment.Left
	desc.TextYAlignment = Enum.TextYAlignment.Top
	desc.ZIndex = 7
	desc.Parent = button
	applyFont(desc)

	button.MouseEnter:Connect(function()
		stroke.Color = Color3.fromRGB(0, 145, 255)
	end)

	button.MouseLeave:Connect(function()
		stroke.Color = Color3.fromRGB(45, 45, 52)
	end)

	button.MouseButton1Click:Connect(function()
		if callback then
			callback()
		end
	end)

	return button
end

--==================================================
-- JANELA DE INFORMAÇÃO
--==================================================

local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(1, -12, 1, -48)
infoFrame.Position = UDim2.fromOffset(6, 42)
infoFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
infoFrame.BackgroundTransparency = 0.04
infoFrame.Visible = false
infoFrame.ZIndex = 15
infoFrame.Parent = panel

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 8)
infoCorner.Parent = infoFrame

local infoStroke = Instance.new("UIStroke")
infoStroke.Color = Color3.fromRGB(0, 145, 255)
infoStroke.Thickness = 1
infoStroke.Parent = infoFrame

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(1, -14, 0, 25)
infoTitle.Position = UDim2.fromOffset(7, 5)
infoTitle.BackgroundTransparency = 1
infoTitle.TextColor3 = Color3.new(1, 1, 1)
infoTitle.TextSize = 14
infoTitle.TextXAlignment = Enum.TextXAlignment.Left
infoTitle.TextStrokeTransparency = 0
infoTitle.ZIndex = 16
infoTitle.Parent = infoFrame
applyFont(infoTitle)

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, -14, 1, -42)
infoText.Position = UDim2.fromOffset(7, 32)
infoText.BackgroundTransparency = 1
infoText.TextColor3 = Color3.fromRGB(190, 190, 195)
infoText.TextSize = 10
infoText.TextWrapped = true
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.ZIndex = 16
infoText.Parent = infoFrame
applyFont(infoText)

local infoBack = Instance.new("TextButton")
infoBack.Size = UDim2.fromOffset(45, 24)
infoBack.Position = UDim2.new(1, -52, 1, -30)
infoBack.BackgroundColor3 = Color3.fromRGB(25, 25, 29)
infoBack.BorderSizePixel = 0
infoBack.Text = "VOLTAR"
infoBack.TextColor3 = Color3.new(1, 1, 1)
infoBack.TextSize = 9
infoBack.TextStrokeTransparency = 0
infoBack.ZIndex = 17
infoBack.Parent = infoFrame
applyFont(infoBack)

local backCorner = Instance.new("UICorner")
backCorner.CornerRadius = UDim.new(0, 5)
backCorner.Parent = infoBack

infoBack.MouseButton1Click:Connect(function()
	infoFrame.Visible = false
	scroll.Visible = true
end)

local function showInfo(titleText, text)
	infoTitle.Text = titleText
	infoText.Text = text
	scroll.Visible = false
	infoFrame.Visible = true
end

--==================================================
-- FERRAMENTAS
--==================================================

createSection("📋  COPY / PASTE")

createTool(
	"📦 COPY NODE",
	"Ajuda para copiar um único Node.",
	function()
		showInfo(
			"📦 COPY NODE",
			"Use a função de copiar do próprio Skill Builder para duplicar um Node. Confira se você selecionou somente o Node desejado antes de copiar."
		)
	end
)

createTool(
	"🌿 COPY BRANCH",
	"Ajuda para copiar uma Branch inteira.",
	function()
		showInfo(
			"🌿 COPY BRANCH",
			"Uma Branch pode conter vários Nodes conectados. Use a opção de copiar Branch do próprio Builder quando quiser preservar essa estrutura."
		)
	end
)

createTool(
	"🎯 COPY MOVE",
	"Ajuda para copiar um Move completo.",
	function()
		showInfo(
			"🎯 COPY MOVE",
			"Use a opção de copiar o Move inteiro quando quiser levar a estrutura completa para outro espaço disponível no Builder."
		)
	end
)

createTool(
	"📥 PASTE",
	"Guia rápido para colar conteúdo copiado.",
	function()
		showInfo(
			"📥 PASTE",
			"Depois de copiar, utilize a função de Paste do próprio Skill Builder. Confira a posição antes de confirmar para evitar colocar Nodes no lugar errado."
		)
	end
)

createSection("🧩 BUILDER")

createTool(
	"🔗 CONNECT BLOCK",
	"Guia do sistema de conexão.",
	function()
		showInfo(
			"🔗 CONNECT BLOCK",
			"Use o Connect para criar relações entre partes da lógica. Antes de testar, confira qual Node está iniciando a conexão e qual recebe a conexão."
		)
	end
)

createTool(
	"🌳 BRANCH BLOCK",
	"Guia para caminhos diferentes.",
	function()
		showInfo(
			"🌳 BRANCH BLOCK",
			"Branch permite separar a lógica em caminhos diferentes. É útil quando uma ação precisa seguir resultados ou condições diferentes."
		)
	end
)

createTool(
	"💡 LIGHT BLOCK",
	"Guia do sistema Light.",
	function()
		showInfo(
			"💡 LIGHT BLOCK",
			"O Light Block pode controlar o estado de uma parte da lógica. Confira as opções disponíveis no seu Builder antes de montar a sequência."
		)
	end
)

createTool(
	"🤖 NPC BLOCK",
	"Guia do NPC Block.",
	function()
		showInfo(
			"🤖 NPC BLOCK",
			"O NPC Block permite trabalhar com NPCs dentro do sistema do Skill Builder. Configure e teste o comportamento diretamente no Builder."
		)
	end
)

createTool(
	"🎞 ANIMATION",
	"Organização de animações.",
	function()
		showInfo(
			"🎞 ANIMATION",
			"Coloque a animação no momento certo da sequência. Teste o início, duração e transição junto com VFX e sons para evitar que os efeitos apareçam antes ou depois do movimento."
		)
	end
)

createTool(
	"✨ VFX",
	"Guia para organizar efeitos.",
	function()
		showInfo(
			"✨ VFX",
			"Combine VFX diferentes com cuidado. Evite colocar muitos efeitos exatamente no mesmo instante. Timing, escala e duração podem mudar bastante a aparência da habilidade."
		)
	end
)

createTool(
	"🔊 SOUND",
	"Guia para sincronizar sons.",
	function()
		showInfo(
			"🔊 SOUND",
			"Use sons nos momentos importantes da habilidade. Teste o início e o final do som junto com a animação e os VFX."
		)
	end
)

createTool(
	"🎯 HITBOX",
	"Guia para testar hitboxes.",
	function()
		showInfo(
			"🎯 HITBOX",
			"Teste tamanho, posição e momento da hitbox. Uma hitbox muito adiantada ou atrasada pode fazer a habilidade parecer inconsistente."
		)
	end
)

createTool(
	"💨 VELOCITY",
	"Guia para movimentos e velocidade.",
	function()
		showInfo(
			"💨 VELOCITY",
			"Use os valores de velocidade com cuidado e teste a habilidade várias vezes. Pequenas mudanças podem alterar bastante o movimento do personagem ou alvo."
		)
	end
)

createSection("📱 MOBILE")

createTool(
	"📱 MOBILE GUIDE",
	"Dicas para usar o Builder no celular.",
	function()
		showInfo(
			"📱 MOBILE GUIDE",
			"Use o scroll interno para navegar pelo Helper. Para organizar seu Move, teste uma parte por vez e aproveite Copy/Paste quando o próprio Builder permitir."
		)
	end
)

createTool(
	"⌨ MULTISELECT HELP",
	"Explica a limitação do Ctrl no celular.",
	function()
		showInfo(
			"⌨ MULTISELECT",
			"No PC, o Skill Builder pode usar Ctrl + clique para selecionar vários Nodes. Este Helper não consegue pressionar Ctrl de verdade nem injetar teclas no jogo. Use as ferramentas de seleção e cópia disponíveis no próprio Builder."
		)
	end
)

createTool(
	"🖥 PC CONTROLS",
	"Referência dos controles de PC.",
	function()
		showInfo(
			"🖥 PC CONTROLS",
			"Algumas funções do Builder foram pensadas para teclado e mouse. No celular, certas interações podem não ter equivalente direto."
		)
	end
)

createSection("⏱ TIMELINE")

createTool(
	"⏱ TIMELINE GUIDE",
	"Organize os eventos da habilidade.",
	function()
		showInfo(
			"⏱ TIMELINE GUIDE",
			"Imagine a habilidade como uma sequência: animação → efeito → impacto → som → finalização. Ajuste cada evento e teste até o timing ficar sincronizado."
		)
	end
)

createTool(
	"🎬 COMBO TIMING",
	"Ajuda para sincronizar vários eventos.",
	function()
		showInfo(
			"🎬 COMBO TIMING",
			"Quando vários Nodes acontecem juntos, teste primeiro cada parte separadamente. Depois junte tudo e ajuste os tempos."
		)
	end
)

createSection("📝 MOVE TOOLS")

createTool(
	"📝 MOVE CHECKLIST",
	"Checklist para revisar sua habilidade.",
	function()
		showInfo(
			"📝 MOVE CHECKLIST",
			"□ Animation\n□ VFX\n□ Sound\n□ Hitbox\n□ Damage\n□ Cooldown\n□ Movimento\n□ Conexões\n□ Teste final"
		)
	end
)

createTool(
	"🧪 TEST GUIDE",
	"Checklist para testar um Move.",
	function()
		showInfo(
			"🧪 TEST GUIDE",
			"Teste a habilidade várias vezes: perto, longe, parado e em movimento. Veja se Animation, VFX, Sound, Hitbox e dano acontecem no momento esperado."
		)
	end
)

createTool(
	"🔍 DEBUG GUIDE",
	"Ajuda para encontrar problemas.",
	function()
		showInfo(
			"🔍 DEBUG GUIDE",
			"Se algo não funcionar, teste a habilidade por partes. Primeiro Animation, depois conexão, VFX, Sound e Hitbox. Assim fica mais fácil descobrir qual parte está causando o problema."
		)
	end
)

createSection("⚙ HELPER")

createTool(
	"🔒 DRAG INFO",
	"Como mover o JJS Helper.",
	function()
		showInfo(
			"🔒 DRAG",
			"Arraste somente pelo Header, na parte de cima onde ficam o logo e o nome JJS Helper. Os botões e ferramentas não movem a janela."
		)
	end
)

createTool(
	"🔄 RESET INFO",
	"Informação sobre a posição da interface.",
	function()
		showInfo(
			"🔄 RESET",
			"Se você quiser reposicionar a interface, use o arrasto pelo Header. A posição não interfere no Skill Builder."
		)
	end
)

--==================================================
-- CANVAS AUTOMÁTICO
--==================================================

local function updateCanvas()
	task.wait()

	scroll.CanvasSize = UDim2.fromOffset(
		0,
		layout.AbsoluteContentSize.Y + 8
	)
end

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
updateCanvas()

--==================================================
-- MINIMIZAR / ABRIR
--==================================================

local normalSize = UDim2.fromOffset(175, 155)
local minimizedSize = UDim2.fromOffset(175, 36)

local minimized = false

local function openAnimation()
	panel.Visible = true
	panel.Size = minimizedSize

	local tween = TweenService:Create(
		panel,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{
			Size = normalSize
		}
	)

	tween:Play()
end

minimize.MouseButton1Click:Connect(function()

	if minimized then

		minimized = false
		scroll.Visible = true

		openAnimation()

	else

		minimized = true

		local tween = TweenService:Create(
			panel,
			TweenInfo.new(
				0.18,
				Enum.EasingStyle.Quint,
				Enum.EasingDirection.In
			),
			{
				Size = minimizedSize
			}
		)

		tween:Play()

	end
end)

--==================================================
-- FECHAR
--==================================================

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

--==================================================
-- ARRASTAR PELO HEADER
--==================================================

local dragging = false
local dragStart
local startPos

header.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPos = panel.Position

		input.Changed:Connect(function()

			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end

		end)

	end

end)

UserInputService.InputChanged:Connect(function(input)

	if not dragging then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - dragStart

		panel.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)

	end

end)

--==================================================
-- ABERTURA
--==================================================

panel.Visible = true
panel.Size = minimizedSize

task.wait(0.05)

openAnimation()
