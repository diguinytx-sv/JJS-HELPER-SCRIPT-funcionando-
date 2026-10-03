--========================================================
-- JJS HELPER — HUB EDITION
-- 480 x 300 | Dark + Transparent + Blue
--========================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer

pcall(function()
    local old = CoreGui:FindFirstChild("JJSHelper")
    if old then old:Destroy() end
end)

local PANEL_W, PANEL_H = 480, 300

local C = {
    Panel = Color3.fromRGB(10, 14, 20),
    Panel2 = Color3.fromRGB(14, 19, 27),
    Button = Color3.fromRGB(18, 25, 34),
    Hover = Color3.fromRGB(25, 35, 46),
    Blue = Color3.fromRGB(72, 157, 205),
    BlueDark = Color3.fromRGB(49, 105, 137),
    Text = Color3.fromRGB(232, 236, 242),
    Soft = Color3.fromRGB(148, 158, 172),
    Stroke = Color3.fromRGB(55, 94, 116)
}

local Gui = Instance.new("ScreenGui")
Gui.Name = "JJSHelper"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = CoreGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(PANEL_W, PANEL_H)
Main.Position = UDim2.new(0.5, -PANEL_W/2, 0.5, -PANEL_H/2)
Main.BackgroundColor3 = C.Panel
Main.BackgroundTransparency = 0.12
Main.BorderSizePixel = 0
Main.Parent = Gui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = C.Stroke
Stroke.Thickness = 1
Stroke.Transparency = 0.15
Stroke.Parent = Main

--========================================================
-- HEADER
--========================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 42)
Header.BackgroundTransparency = 1
Header.Parent = Main

-- LOGO JJS
local Logo = Instance.new("ImageLabel")
Logo.Name = "JJSLogo"
Logo.Size = UDim2.fromOffset(27, 27)
Logo.Position = UDim2.fromOffset(8, 7)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://70814805890666"
Logo.ScaleType = Enum.ScaleType.Fit
Logo.Parent = Header

-- AVATAR
local Avatar = Instance.new("ImageLabel")
Avatar.Name = "Avatar"
Avatar.Size = UDim2.fromOffset(27, 27)
Avatar.Position = UDim2.fromOffset(39, 7)
Avatar.BackgroundTransparency = 1
Avatar.Parent = Header

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = Avatar

local AvatarStroke = Instance.new("UIStroke")
AvatarStroke.Color = Color3.fromRGB(78,118,140)
AvatarStroke.Thickness = 1
AvatarStroke.Parent = Avatar

pcall(function()
    local image = Players:GetUserThumbnailAsync(
        Player.UserId,
        Enum.ThumbnailType.HeadShot,
        Enum.ThumbnailSize.Size100x100
    )

    Avatar.Image = image
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.fromOffset(150, 18)
Title.Position = UDim2.fromOffset(73, 5)
Title.BackgroundTransparency = 1
Title.Text = "JJS Helper"
Title.TextColor3 = C.Text
Title.TextSize = 14
Title.Font = Enum.Font.GothamSemibold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Display = Instance.new("TextLabel")
Display.Size = UDim2.fromOffset(170, 15)
Display.Position = UDim2.fromOffset(73, 21)
Display.BackgroundTransparency = 1
Display.Text = Player.DisplayName
Display.TextColor3 = C.Soft
Display.TextSize = 11
Display.Font = Enum.Font.Gotham
Display.TextXAlignment = Enum.TextXAlignment.Left
Display.Parent = Header

-- MINIMIZE
local Min = Instance.new("TextButton")
Min.Size = UDim2.fromOffset(30, 30)
Min.Position = UDim2.new(1, -68, 0, 6)
Min.BackgroundTransparency = 1
Min.Text = "−"
Min.TextColor3 = C.Soft
Min.TextSize = 20
Min.Font = Enum.Font.Gotham
Min.Parent = Header

-- CLOSE
local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(30, 30)
Close.Position = UDim2.new(1, -36, 0, 6)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.TextColor3 = C.Soft
Close.TextSize = 19
Close.Font = Enum.Font.Gotham
Close.Parent = Header

--========================================================
-- BODY
--========================================================

local Body = Instance.new("Frame")
Body.Position = UDim2.fromOffset(7, 43)
Body.Size = UDim2.new(1, -14, 1, -50)
Body.BackgroundTransparency = 1
Body.Parent = Main

-- SIDEBAR
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 108, 1, 0)
Sidebar.BackgroundColor3 = C.Panel2
Sidebar.BackgroundTransparency = 0.2
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Body

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 8)
SidebarCorner.Parent = Sidebar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 7)
SidePadding.PaddingLeft = UDim.new(0, 6)
SidePadding.PaddingRight = UDim.new(0, 6)
SidePadding.PaddingBottom = UDim.new(0, 7)
SidePadding.Parent = Sidebar

local SideList = Instance.new("UIListLayout")
SideList.Padding = UDim.new(0, 4)
SideList.SortOrder = Enum.SortOrder.LayoutOrder
SideList.Parent = Sidebar

-- CONTEÚDO
local Content = Instance.new("Frame")
Content.Position = UDim2.fromOffset(115, 0)
Content.Size = UDim2.new(1, -115, 1, 0)
Content.BackgroundTransparency = 1
Content.Parent = Body

--========================================================
-- PÁGINAS
--========================================================

local Pages = {}
local Tabs = {}

local function CreatePage(Name)
    local Page = Instance.new("Frame")
    Page.Name = Name
    Page.Size = UDim2.fromScale(1, 1)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.Parent = Content

    Pages[Name] = Page

    return Page
end

local function CreateTab(Name, Icon, Order)
    local Button = Instance.new("TextButton")

    Button.Name = Name
    Button.Size = UDim2.new(1, 0, 0, 31)
    Button.BackgroundColor3 = C.Button
    Button.BackgroundTransparency = 1
    Button.BorderSizePixel = 0
    Button.Text = "   " .. Icon .. "  " .. Name
    Button.TextColor3 = C.Soft
    Button.TextSize = 11
    Button.Font = Enum.Font.GothamMedium
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.LayoutOrder = Order
    Button.Parent = Sidebar

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button

    local ActiveBar = Instance.new("Frame")
    ActiveBar.Size = UDim2.fromOffset(2, 17)
    ActiveBar.Position = UDim2.new(0, 0, 0.5, -8)
    ActiveBar.BackgroundColor3 = C.Blue
    ActiveBar.BorderSizePixel = 0
    ActiveBar.Visible = false
    ActiveBar.Parent = Button

    Tabs[Name] = {
        Button = Button,
        Bar = ActiveBar
    }

    return Button
end

local Home = CreatePage("Home")
local Builder = CreatePage("Builder")
local Tools = CreatePage("Tools")
local AI = CreatePage("AI")
local Guide = CreatePage("Guide")
local Settings = CreatePage("Settings")

CreateTab("Home", "⌂", 1)
CreateTab("Builder", "◆", 2)
CreateTab("Tools", "◇", 3)
CreateTab("AI", "AI", 4)
CreateTab("Guide", "?", 5)
CreateTab("Settings", "⚙", 6)

--========================================================
-- TÍTULOS
--========================================================

local function PageTitle(Page, TitleText, SubtitleText)

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -10, 0, 25)
    Title.Position = UDim2.fromOffset(5, 4)
    Title.BackgroundTransparency = 1
    Title.Text = TitleText
    Title.TextColor3 = C.Text
    Title.TextSize = 16
    Title.Font = Enum.Font.GothamSemibold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Page

    local Subtitle = Instance.new("TextLabel")
    Subtitle.Size = UDim2.new(1, -10, 0, 20)
    Subtitle.Position = UDim2.fromOffset(5, 29)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = SubtitleText or ""
    Subtitle.TextColor3 = C.Soft
    Subtitle.TextSize = 10
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Subtitle.Parent = Page
end

PageTitle(Home, "JJS Helper", "Workshop helper • compact edition")
PageTitle(Builder, "Builder", "Controles do JJS Helper")
PageTitle(Tools, "Tools", "Ferramentas auxiliares")
PageTitle(AI, "AI Helper", "Pergunte sobre as ferramentas")
PageTitle(Guide, "Guide", "Referência rápida")
PageTitle(Settings, "Settings", "Configurações da interface")

--========================================================
-- HOME
--========================================================

local HomeInfo = Instance.new("TextLabel")
HomeInfo.Size = UDim2.new(1, -20, 0, 100)
HomeInfo.Position = UDim2.fromOffset(10, 70)
HomeInfo.BackgroundColor3 = C.Button
HomeInfo.BackgroundTransparency = 0.25
HomeInfo.Text =
    "Use a sidebar para navegar.\n\n" ..
    "Builder: ferramentas do Workshop\n" ..
    "AI: assistente + lista de comandos\n" ..
    "Guide: referências rápidas"

HomeInfo.TextColor3 = C.Text
HomeInfo.TextSize = 11
HomeInfo.Font = Enum.Font.Gotham
HomeInfo.TextWrapped = true
HomeInfo.TextXAlignment = Enum.TextXAlignment.Left
HomeInfo.TextYAlignment = Enum.TextYAlignment.Top
HomeInfo.Parent = Home

local HomeCorner = Instance.new("UICorner")
HomeCorner.CornerRadius = UDim.new(0, 8)
HomeCorner.Parent = HomeInfo

local HomePadding = Instance.new("UIPadding")
HomePadding.PaddingTop = UDim.new(0, 10)
HomePadding.PaddingLeft = UDim.new(0, 12)
HomePadding.Parent = HomeInfo

--========================================================
-- BUILDER
--========================================================

local BuilderList = Instance.new("ScrollingFrame")
BuilderList.Position = UDim2.fromOffset(6, 56)
BuilderList.Size = UDim2.new(1, -12, 1, -62)
BuilderList.BackgroundTransparency = 1
BuilderList.BorderSizePixel = 0
BuilderList.ScrollBarThickness = 2
BuilderList.CanvasSize = UDim2.new()
BuilderList.Parent = Builder

local Grid = Instance.new("UIGridLayout")
Grid.CellSize = UDim2.new(0.5, -6, 0, 42)
Grid.CellPadding = UDim2.fromOffset(7, 7)
Grid.SortOrder = Enum.SortOrder.LayoutOrder
Grid.Parent = BuilderList

local function BuilderButton(Name, Order, Callback)

    local Button = Instance.new("TextButton")

    Button.BackgroundColor3 = C.Button
    Button.BackgroundTransparency = 0.15
    Button.BorderSizePixel = 0
    Button.Text = Name
    Button.TextColor3 = C.Text
    Button.TextSize = 11
    Button.Font = Enum.Font.GothamMedium
    Button.LayoutOrder = Order
    Button.Parent = BuilderList

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Button

    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.12), {
            BackgroundColor3 = C.Hover
        }):Play()
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.12), {
            BackgroundColor3 = C.Button
        }):Play()
    end)

    Button.MouseButton1Click:Connect(function()
        if Callback then
            Callback()
        end
    end)

    return Button
end

BuilderButton("COPY", 1, function()
    print("[JJS Helper] COPY")
end)

BuilderButton("PASTE", 2, function()
    print("[JJS Helper] PASTE")
end)

BuilderButton("BRANCH", 3, function()
    print("[JJS Helper] BRANCH")
end)

BuilderButton("CONNECT", 4, function()
    print("[JJS Helper] CONNECT")
end)

BuilderButton("ANIMATION", 5, function()
    print("[JJS Helper] ANIMATION")
end)

BuilderButton("VFX", 6, function()
    print("[JJS Helper] VFX")
end)

BuilderButton("SOUND", 7, function()
    print("[JJS Helper] SOUND")
end)

BuilderButton("NPC", 8, function()
    print("[JJS Helper] NPC")
end)

Grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    BuilderList.CanvasSize =
        UDim2.fromOffset(0, Grid.AbsoluteContentSize.Y + 10)
end)

--========================================================
-- TOOLS
--========================================================

local ToolsInfo = Instance.new("TextLabel")
ToolsInfo.Position = UDim2.fromOffset(10, 65)
ToolsInfo.Size = UDim2.new(1, -20, 0, 90)
ToolsInfo.BackgroundColor3 = C.Button
ToolsInfo.BackgroundTransparency = 0.2
ToolsInfo.Text =
    "Ferramentas auxiliares ficam separadas " ..
    "do Builder para manter a interface limpa."

ToolsInfo.TextColor3 = C.Text
ToolsInfo.TextSize = 11
ToolsInfo.Font = Enum.Font.Gotham
ToolsInfo.TextWrapped = true
ToolsInfo.TextXAlignment = Enum.TextXAlignment.Left
ToolsInfo.TextYAlignment = Enum.TextYAlignment.Top
ToolsInfo.Parent = Tools

local ToolsCorner = Instance.new("UICorner")
ToolsCorner.CornerRadius = UDim.new(0, 8)
ToolsCorner.Parent = ToolsInfo

--========================================================
-- AI CHAT
--========================================================

local Chat = Instance.new("ScrollingFrame")
Chat.Position = UDim2.fromOffset(7, 55)
Chat.Size = UDim2.new(1, -14, 1, -100)
Chat.BackgroundColor3 = C.Button
Chat.BackgroundTransparency = 0.2
Chat.BorderSizePixel = 0
Chat.ScrollBarThickness = 2
Chat.CanvasSize = UDim2.new()
Chat.Parent = AI

local ChatCorner = Instance.new("UICorner")
ChatCorner.CornerRadius = UDim.new(0, 8)
ChatCorner.Parent = Chat

local ChatLayout = Instance.new("UIListLayout")
ChatLayout.Padding = UDim.new(0, 5)
ChatLayout.SortOrder = Enum.SortOrder.LayoutOrder
ChatLayout.Parent = Chat

local ChatPadding = Instance.new("UIPadding")
ChatPadding.PaddingTop = UDim.new(0, 7)
ChatPadding.PaddingLeft = UDim.new(0, 7)
ChatPadding.PaddingRight = UDim.new(0, 7)
ChatPadding.Parent = Chat

local function AddMessage(Text, IsUser)

    local Label = Instance.new("TextLabel")

    Label.Size = UDim2.new(1, 0, 0, 0)
    Label.AutomaticSize = Enum.AutomaticSize.Y
    Label.BackgroundTransparency = 1

    Label.Text =
        (IsUser and "Você: " or "AI: ") ..
        Text

    Label.TextColor3 =
        IsUser and C.Text or C.Soft

    Label.TextSize = 10
    Label.Font = Enum.Font.Gotham
    Label.TextWrapped = true
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Chat

    task.defer(function()
        Chat.CanvasSize =
            UDim2.fromOffset(
                0,
                ChatLayout.AbsoluteContentSize.Y + 15
            )

        Chat.CanvasPosition =
            Vector2.new(
                0,
                math.max(0, Chat.AbsoluteCanvasSize.Y)
            )
    end)
end

--========================================================
-- AI INPUT
--========================================================

local Input = Instance.new("TextBox")
Input.Position = UDim2.new(0, 7, 1, -38)
Input.Size = UDim2.new(1, -67, 0, 31)
Input.BackgroundColor3 = C.Button
Input.BackgroundTransparency = 0.1
Input.BorderSizePixel = 0
Input.PlaceholderText = "Pergunte... ou use /clear"
Input.PlaceholderColor3 = C.Soft
Input.Text = ""
Input.TextColor3 = C.Text
Input.TextSize = 10
Input.Font = Enum.Font.Gotham
Input.ClearTextOnFocus = false
Input.Parent = AI

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 7)
InputCorner.Parent = Input

local Send = Instance.new("TextButton")
Send.Position = UDim2.new(1, -54, 1, -38)
Send.Size = UDim2.fromOffset(47, 31)
Send.BackgroundColor3 = C.BlueDark
Send.BorderSizePixel = 0
Send.Text = "➤"
Send.TextColor3 = C.Text
Send.TextSize = 15
Send.Font = Enum.Font.GothamBold
Send.Parent = AI

local SendCorner = Instance.new("UICorner")
SendCorner.CornerRadius = UDim.new(0, 7)
SendCorner.Parent = Send

--========================================================
-- AI RESPONSE
--========================================================

local function ClearChat()

    for _, Child in ipairs(Chat:GetChildren()) do
        if Child:IsA("TextLabel") then
            Child:Destroy()
        end
    end

    Chat.CanvasPosition = Vector2.zero
    Chat.CanvasSize = UDim2.new()
end

local function AIResponse(Query)

    local S = string.lower(Query)

    if S:find("branch") or S:find("galho") then
        return "Branch/Galho é usado para criar uma ramificação lógica."

    elseif S:find("connect") then
        return "Connect é usado para conectar partes do sistema."

    elseif S:find("light") then
        return "O Light Block trabalha como um sistema de ligar/desligar."

    elseif S:find("npc") then
        return "O NPC Block permite trabalhar com NPCs."

    elseif S:find("animation") or S:find("anima") then
        return "Animation é usado para trabalhar com animações."

    elseif S:find("vfx") then
        return "VFX é usado para efeitos visuais."

    elseif S:find("sound") or S:find("som") then
        return "Sound é usado para trabalhar com sons."

    elseif S:find("copy") then
        return "Copy serve para copiar o conteúdo suportado pelo Helper."

    elseif S:find("paste") then
        return "Paste serve para colar o conteúdo copiado."

    elseif S:find("oi") or S:find("olá") or S:find("ola") then
        return "Fala! Pode perguntar sobre Branch, Connect, NPC, Animation, VFX ou Sound."

    else
        return "Posso ajudar com Branch, Connect, Light, NPC, Animation, VFX, Sound, Copy e Paste."
    end
end

local function Submit()

    local Query = Input.Text

    if Query == "" then
        return
    end

    Input.Text = ""

    if string.lower(Query) == "/clear" then
        ClearChat()
        return
    end

    AddMessage(Query, true)
    AddMessage(AIResponse(Query), false)
end

Send.MouseButton1Click:Connect(Submit)

Input.FocusLost:Connect(function(EnterPressed)

    if EnterPressed then
        Submit()
    end

end)

AddMessage(
    "Olá! Pergunte sobre uma ferramenta ou use /clear.",
    false
)

--========================================================
-- LISTA DE COMANDOS
--========================================================

local Commands = Instance.new("ScrollingFrame")
Commands.Position = UDim2.fromOffset(7, 55)
Commands.Size = UDim2.new(1, -14, 1, -62)
Commands.BackgroundColor3 = C.Button
Commands.BackgroundTransparency = 0.2
Commands.BorderSizePixel = 0
Commands.ScrollBarThickness = 2
Commands.Visible = false
Commands.Parent = AI

local CommandsCorner = Instance.new("UICorner")
CommandsCorner.CornerRadius = UDim.new(0, 8)
CommandsCorner.Parent = Commands

local CommandLayout = Instance.new("UIListLayout")
CommandLayout.Padding = UDim.new(0, 4)
CommandLayout.Parent = Commands

local CommandPadding = Instance.new("UIPadding")
CommandPadding.PaddingTop = UDim.new(0, 7)
CommandPadding.PaddingLeft = UDim.new(0, 8)
CommandPadding.Parent = Commands

local CommandList = {
    "/clear  — limpar o chat",
    "Como faço um Branch?",
    "Como funciona o Connect?",
    "Como uso o NPC?",
    "Como funciona o Light Block?",
    "Como faço um VFX?",
    "Como trabalho com Sound?",
    "Como uso Animation?",
    "Como funciona Copy?",
    "Como funciona Paste?"
}

for _, Text in ipairs(CommandList) do

    local Label = Instance.new("TextLabel")

    Label.Size = UDim2.new(1, -10, 0, 24)
    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = C.Text
    Label.TextSize = 10
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Commands

end

-- BOTÃO COMANDOS

local CommandsButton = Instance.new("TextButton")
CommandsButton.Position = UDim2.new(1, -112, 0, 31)
CommandsButton.Size = UDim2.fromOffset(100, 20)
CommandsButton.BackgroundTransparency = 1
CommandsButton.Text = "Comandos"
CommandsButton.TextColor3 = C.Blue
CommandsButton.TextSize = 9
CommandsButton.Font = Enum.Font.GothamMedium
CommandsButton.Parent = AI

local ChatVisible = true

CommandsButton.MouseButton1Click:Connect(function()

    ChatVisible = not ChatVisible

    Chat.Visible = ChatVisible
    Input.Visible = ChatVisible
    Send.Visible = ChatVisible

    Commands.Visible = not ChatVisible

    if ChatVisible then
        CommandsButton.Text = "Comandos"
    else
        CommandsButton.Text = "Voltar ao chat"
    end

end)

--========================================================
-- GUIDE
--========================================================

local GuideText = Instance.new("TextLabel")
GuideText.Position = UDim2.fromOffset(10, 62)
GuideText.Size = UDim2.new(1, -20, 1, -70)
GuideText.BackgroundTransparency = 1

GuideText.Text =
    "Branch / Galho\n" ..
    "Connect\n" ..
    "Light Block\n" ..
    "NPC Block\n" ..
    "Animation Block\n" ..
    "VFX\n" ..
    "Sound\n\n" ..
    "Use Builder para acessar os controles."

GuideText.TextColor3 = C.Text
GuideText.TextSize = 11
GuideText.Font = Enum.Font.Gotham
GuideText.TextXAlignment = Enum.TextXAlignment.Left
GuideText.TextYAlignment = Enum.TextYAlignment.Top
GuideText.Parent = Guide

--========================================================
-- SETTINGS
--========================================================

local SettingsInfo = Instance.new("TextLabel")
SettingsInfo.Position = UDim2.fromOffset(10, 65)
SettingsInfo.Size = UDim2.new(1, -20, 0, 80)
SettingsInfo.BackgroundColor3 = C.Button
SettingsInfo.BackgroundTransparency = 0.2

SettingsInfo.Text =
    "Interface compacta\n" ..
    "Logo JJS ativa\n" ..
    "Avatar e DisplayName ativos"

SettingsInfo.TextColor3 = C.Text
SettingsInfo.TextSize = 11
SettingsInfo.Font = Enum.Font.Gotham
SettingsInfo.TextXAlignment = Enum.TextXAlignment.Left
SettingsInfo.TextYAlignment = Enum.TextYAlignment.Top
SettingsInfo.Parent = Settings

local SettingsCorner = Instance.new("UICorner")
SettingsCorner.CornerRadius = UDim.new(0, 8)
SettingsCorner.Parent = SettingsInfo

--========================================================
-- TROCA DE ABA
--========================================================

local function ShowPage(Name)

    for PageName, Page in pairs(Pages) do
        Page.Visible = (PageName == Name)
    end

    for TabName, Data in pairs(Tabs) do

        local Selected = TabName == Name

        Data.Bar.Visible = Selected

        Data.Button.TextColor3 =
            Selected and C.Text or C.Soft

        Data.Button.BackgroundTransparency =
            Selected and 0.45 or 1

    end
end

for Name, Data in pairs(Tabs) do

    Data.Button.MouseEnter:Connect(function()

        if not Data.Bar.Visible then

            TweenService:Create(
                Data.Button,
                TweenInfo.new(0.12),
                {BackgroundTransparency = 0.55}
            ):Play()

        end

    end)

    Data.Button.MouseLeave:Connect(function()

        if not Data.Bar.Visible then

            TweenService:Create(
                Data.Button,
                TweenInfo.new(0.12),
                {BackgroundTransparency = 1}
            ):Play()

        end

    end)

    Data.Button.MouseButton1Click:Connect(function()
        ShowPage(Name)
    end)
end

ShowPage("Home")

--========================================================
-- DRAG MOBILE / PC
--========================================================

local Dragging = false
local DragStart
local StartPosition
local DragInput

Header.InputBegan:Connect(function(InputObject)

    if InputObject.UserInputType == Enum.UserInputType.MouseButton1
        or InputObject.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = InputObject.Position
        StartPosition = Main.Position

        InputObject.Changed:Connect(function()

            if InputObject.UserInputState ==
                Enum.UserInputState.End then

                Dragging = false

            end

        end)
    end
end)

Header.InputChanged:Connect(function(InputObject)

    if InputObject.UserInputType ==
        Enum.UserInputType.MouseMovement
        or InputObject.UserInputType ==
        Enum.UserInputType.Touch then

        DragInput = InputObject

    end
end)

UserInputService.InputChanged:Connect(function(InputObject)

    if InputObject == DragInput and Dragging then

        local Delta =
            InputObject.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,

            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )

    end
end)

--========================================================
-- MINIMIZAR
--========================================================

local Minimized = false

Min.MouseButton1Click:Connect(function()

    Minimized = not Minimized

    if Minimized then

        Body.Visible = false

        Main:TweenSize(
            UDim2.fromOffset(PANEL_W, 42),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.18,
            true
        )

        Min.Text = "+"

    else

        Main:TweenSize(
            UDim2.fromOffset(PANEL_W, PANEL_H),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.18,
            true
        )

        Body.Visible = true
        Min.Text = "−"

    end
end)

--========================================================
-- FECHAR
--========================================================

Close.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

print("[JJS Helper] Hub Edition carregado.")
