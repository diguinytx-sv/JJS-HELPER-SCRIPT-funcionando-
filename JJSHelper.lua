--========================================================
-- JJS HELPER — HUB EDITION 3.0 COMPLETE
-- ReiBacon / Fármaco Aura
--========================================================
-- BASE: JJS Helper Hub Edition 2.0 / 3.0
--
-- PRESERVADO:
-- • Avatar HeadShot
-- • DisplayName
-- • Header
-- • PT / EN / ES
-- • Jin AI
-- • Personality
-- • Easter Eggs
-- • Builder
-- • Mesh Manager
-- • Auto Build
-- • Close Confirmation
-- • Minimize
-- • Drag
--
-- 3.0:
-- • Theme System
-- • Custom Theme
-- • Dynamic Background
-- • HUD Customizer
-- • Owner Mode
-- • Creator Theme
-- • Creator Dashboard
-- • Creator Credits
-- • Session Monitor
-- • Build Manager
-- • Build Vault
-- • Build Versions
-- • Build History
-- • Compare Builds
-- • Snapshots
-- • Sandbox
-- • Asset Inspector
-- • Skill DNA
-- • Skill Cinematic Preview
-- • Replay
-- • Creator Challenge
-- • Achievements
-- • Secret Room
-- • Glitch Event
-- • Experimental Lab
-- • Debug Console
-- • Jin Memory
-- • Jin Build Brain
-- • Local Import / Export
-- • Validator
-- • Mobile Scaling
--
-- IMPORTANTE:
-- Sistemas internos são locais.
-- Nenhuma API falsa do Workshop é utilizada.
--========================================================


--========================================================
-- SERVICES
--========================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer


--========================================================
-- CONFIG
--========================================================

local OWNER_USERNAME = "Uo63m"

local GUI_NAME = "JJSHelper_3_0"

local MAIN_WIDTH = 520
local MAIN_HEIGHT = 335


--========================================================
-- OWNER DETECTION
--========================================================

local OWNER_USER_ID = nil

pcall(function()
    OWNER_USER_ID =
        Players:GetUserIdFromNameAsync(
            OWNER_USERNAME
        )
end)

local IsOwner =
    Player.Name == OWNER_USERNAME
    or
    (
        OWNER_USER_ID ~= nil
        and
        Player.UserId == OWNER_USER_ID
    )

local OwnerModeEnabled = false


--========================================================
-- THEMES
--========================================================

local Themes = {

    Blue = {
        Panel = Color3.fromRGB(10,14,20),
        Panel2 = Color3.fromRGB(14,19,27),
        Button = Color3.fromRGB(18,25,34),
        Hover = Color3.fromRGB(27,38,50),
        Accent = Color3.fromRGB(72,157,205),
        AccentDark = Color3.fromRGB(49,105,137),
        Text = Color3.fromRGB(232,236,242),
        Soft = Color3.fromRGB(148,158,172),
        Stroke = Color3.fromRGB(55,94,116)
    },

    Purple = {
        Panel = Color3.fromRGB(15,10,22),
        Panel2 = Color3.fromRGB(23,15,33),
        Button = Color3.fromRGB(31,20,44),
        Hover = Color3.fromRGB(47,30,64),
        Accent = Color3.fromRGB(165,100,255),
        AccentDark = Color3.fromRGB(105,60,170),
        Text = Color3.fromRGB(239,235,247),
        Soft = Color3.fromRGB(170,158,190),
        Stroke = Color3.fromRGB(105,75,135)
    },

    Red = {
        Panel = Color3.fromRGB(22,9,10),
        Panel2 = Color3.fromRGB(32,13,15),
        Button = Color3.fromRGB(45,18,20),
        Hover = Color3.fromRGB(63,25,28),
        Accent = Color3.fromRGB(240,75,85),
        AccentDark = Color3.fromRGB(165,45,55),
        Text = Color3.fromRGB(242,232,233),
        Soft = Color3.fromRGB(180,150,153),
        Stroke = Color3.fromRGB(130,55,60)
    },

    Green = {
        Panel = Color3.fromRGB(8,18,13),
        Panel2 = Color3.fromRGB(12,27,19),
        Button = Color3.fromRGB(16,38,26),
        Hover = Color3.fromRGB(23,53,35),
        Accent = Color3.fromRGB(70,210,130),
        AccentDark = Color3.fromRGB(45,135,85),
        Text = Color3.fromRGB(229,242,234),
        Soft = Color3.fromRGB(145,175,156),
        Stroke = Color3.fromRGB(55,110,78)
    },

    Gold = {
        Panel = Color3.fromRGB(20,16,7),
        Panel2 = Color3.fromRGB(30,23,9),
        Button = Color3.fromRGB(43,32,11),
        Hover = Color3.fromRGB(60,44,15),
        Accent = Color3.fromRGB(255,205,65),
        AccentDark = Color3.fromRGB(170,130,30),
        Text = Color3.fromRGB(245,239,220),
        Soft = Color3.fromRGB(190,175,135),
        Stroke = Color3.fromRGB(125,100,45)
    },

    Dark = {
        Panel = Color3.fromRGB(5,5,7),
        Panel2 = Color3.fromRGB(9,9,12),
        Button = Color3.fromRGB(14,14,18),
        Hover = Color3.fromRGB(24,24,30),
        Accent = Color3.fromRGB(180,180,190),
        AccentDark = Color3.fromRGB(90,90,100),
        Text = Color3.fromRGB(235,235,238),
        Soft = Color3.fromRGB(145,145,150),
        Stroke = Color3.fromRGB(65,65,72)
    },

    Cyan = {
        Panel = Color3.fromRGB(5,16,20),
        Panel2 = Color3.fromRGB(8,24,30),
        Button = Color3.fromRGB(10,34,42),
        Hover = Color3.fromRGB(15,48,58),
        Accent = Color3.fromRGB(70,225,245),
        AccentDark = Color3.fromRGB(35,135,155),
        Text = Color3.fromRGB(228,242,245),
        Soft = Color3.fromRGB(145,180,188),
        Stroke = Color3.fromRGB(50,110,125)
    },

    Creator = {
        Panel = Color3.fromRGB(7,9,16),
        Panel2 = Color3.fromRGB(12,16,27),
        Button = Color3.fromRGB(18,24,37),
        Hover = Color3.fromRGB(29,38,55),
        Accent = Color3.fromRGB(72,157,205),
        AccentDark = Color3.fromRGB(45,90,125),
        Text = Color3.fromRGB(238,240,246),
        Soft = Color3.fromRGB(165,170,185),
        Stroke = Color3.fromRGB(255,210,70)
    }
}

local CurrentThemeName = "Blue"
local C = Themes.Blue


--========================================================
-- CUSTOM THEME
--========================================================

local CustomTheme = {
    Enabled = false,

    Accent = Color3.fromRGB(72,157,205),

    Transparency = 0.08,

    Glow = 1,

    DynamicBackground = true,

    Particles = true,

    MovingLines = true,

    Waves = true,

    Animations = true
}


--========================================================
-- HUD CONFIG
--========================================================

local HUD = {

    Scale = 1,

    Transparency = 0.08,

    CornerRadius = 10,

    Glow = 1,

    Animations = true
}


--========================================================
-- SESSION
--========================================================

local Session = {

    StartedAt = os.time(),

    Messages = 0,

    BuildsCreated = 0,

    BuilderActions = 0,

    MeshesAdded = 0,

    EasterEggs = 0,

    Notifications = 0,

    Snapshots = 0,

    Replays = 0,

    Challenges = 0
}


--========================================================
-- DATA
--========================================================

local Meshes = {}

local BuildProfiles = {}

local BuildHistory = {}

local Snapshots = {}

local Achievements = {}

local JinMemory = {}

local ReplayData = {}

local Challenges = {}

local ExperimentalData = {}

local ClipboardAction = nil

local CurrentBuild = nil

local CurrentVersion = 1


--========================================================
-- PERSONALITY
--========================================================

local Personality = "normal"

local PersonalityNames = {

    normal = "Normal",

    chill = "Resenha",

    technical = "Technical",

    creator = "Creator",

    experimental = "Experimental"
}


--========================================================
-- LANGUAGE
--========================================================

local CurrentLanguage = "pt"

local LANG = {

    pt = {

        home = "Início",

        builder = "Builder",

        tools = "Tools",

        ai = "IA",

        guide = "Guia",

        settings = "Config.",

        homeTitle = "JJS Helper",

        homeSub = "Workshop Helper • Hub Edition 3.0",

        builderTitle = "Builder",

        builderSub = "Editor local de criação",

        toolsTitle = "Tools",

        toolsSub = "Ferramentas auxiliares",

        aiTitle = "Jin AI",

        aiSub = "Assistente do JJS Helper",

        guideTitle = "Guia",

        guideSub = "Referência rápida",

        settingsTitle = "Settings",

        settingsSub = "Personalize seu Helper",

        placeholder = "Pergunte para Jin...",

        language = "Idioma",

        personality = "Personalidade",

        theme = "Tema",

        customTheme = "Custom Theme",

        dynamic = "Dynamic Background",

        hud = "HUD Customizer",

        normal = "Normal",

        chill = "Resenha",

        technical = "Técnica",

        add = "Adicionar",

        remove = "Remover",

        closeTitle = "Fechar JJS Helper?",

        closeText = "Tem certeza que deseja fechar o JJS Helper?",

        cancel = "Cancelar",

        close = "Fechar",

        credits = "✦ Creator Credits",

        ownerOn = "✦ OWNER MODE: ON",

        ownerOff = "OWNER MODE: OFF",

        meshEmpty = "Nenhum Mesh salvo.",

        unknown = "Ainda não entendi. Tenta falar sobre Builder, VFX, Meshes, NPC, Animation, Sound ou Auto Build.",

        generated = "Build local criado com sucesso.",

        validatorOK = "Validator: nenhuma inconsistência básica encontrada.",

        validatorBad = "Validator: existem itens que precisam ser revisados."
    },

    en = {

        home = "Home",

        builder = "Builder",

        tools = "Tools",

        ai = "AI",

        guide = "Guide",

        settings = "Settings",

        homeTitle = "JJS Helper",

        homeSub = "Workshop Helper • Hub Edition 3.0",

        builderTitle = "Builder",

        builderSub = "Local creation editor",

        toolsTitle = "Tools",

        toolsSub = "Utility tools",

        aiTitle = "Jin AI",

        aiSub = "JJS Helper assistant",

        guideTitle = "Guide",

        guideSub = "Quick reference",

        settingsTitle = "Settings",

        settingsSub = "Customize your Helper",

        placeholder = "Ask Jin...",

        language = "Language",

        personality = "Personality",

        theme = "Theme",

        customTheme = "Custom Theme",

        dynamic = "Dynamic Background",

        hud = "HUD Customizer",

        normal = "Normal",

        chill = "Chill",

        technical = "Technical",

        add = "Add",

        remove = "Remove",

        closeTitle = "Close JJS Helper?",

        closeText = "Are you sure you want to close JJS Helper?",

        cancel = "Cancel",

        close = "Close",

        credits = "✦ Creator Credits",

        ownerOn = "✦ OWNER MODE: ON",

        ownerOff = "OWNER MODE: OFF",

        meshEmpty = "No Meshes saved.",

        unknown = "I didn't fully understand. Try Builder, VFX, Meshes, NPC, Animation, Sound or Auto Build.",

        generated = "Local build created successfully.",

        validatorOK = "Validator: no basic inconsistencies found.",

        validatorBad = "Validator: some items need review."
    },

    es = {

        home = "Inicio",

        builder = "Builder",

        tools = "Herramientas",

        ai = "IA",

        guide = "Guía",

        settings = "Ajustes",

        homeTitle = "JJS Helper",

        homeSub = "Workshop Helper • Hub Edition 3.0",

        builderTitle = "Builder",

        builderSub = "Editor local de creación",

        toolsTitle = "Herramientas",

        toolsSub = "Herramientas auxiliares",

        aiTitle = "Jin IA",

        aiSub = "Asistente de JJS Helper",

        guideTitle = "Guía",

        guideSub = "Referencia rápida",

        settingsTitle = "Ajustes",

        settingsSub = "Personaliza tu Helper",

        placeholder = "Pregunta a Jin...",

        language = "Idioma",

        personality = "Personalidad",

        theme = "Tema",

        customTheme = "Tema personalizado",

        dynamic = "Fondo dinámico",

        hud = "Personalizador HUD",

        normal = "Normal",

        chill = "Resenha",

        technical = "Técnica",

        add = "Añadir",

        remove = "Eliminar",

        closeTitle = "¿Cerrar JJS Helper?",

        closeText = "¿Seguro que quieres cerrar JJS Helper?",

        cancel = "Cancelar",

        close = "Cerrar",

        credits = "✦ Creator Credits",

        ownerOn = "✦ OWNER MODE: ON",

        ownerOff = "OWNER MODE: OFF",

        meshEmpty = "No hay Meshes guardados.",

        unknown = "No entendí exactamente. Prueba Builder, VFX, Meshes, NPC, Animation, Sound o Auto Build.",

        generated = "Build local creado correctamente.",

        validatorOK = "Validator: no se encontraron inconsistencias básicas.",

        validatorBad = "Validator: hay elementos que necesitan revisión."
    }
}


local function T(Key)

    return
        (
            LANG[CurrentLanguage]
            and
            LANG[CurrentLanguage][Key]
        )
        or
        LANG.pt[Key]
        or
        Key
end


--========================================================
-- FONT
--========================================================

local function ApplyFont(Object, Weight)

    if not Object then
        return
    end

    Weight =
        Weight
        or
        Enum.FontWeight.Regular

    local Success =
        pcall(function()

            Object.FontFace =
                Font.fromName(
                    "FingerPaint",
                    Weight,
                    Enum.FontStyle.Normal
                )

        end)

    if not Success then

        pcall(function()

            Object.Font =
                Enum.Font.FredokaOne

        end)

    end
end


--========================================================
-- DESTROY OLD VERSION
--========================================================

pcall(function()

    local Old =
        CoreGui:FindFirstChild(
            GUI_NAME
        )

    if Old then
        Old:Destroy()
    end

end)


--========================================================
-- GUI
--========================================================

local Gui =
    Instance.new("ScreenGui")

Gui.Name =
    GUI_NAME

Gui.ResetOnSpawn =
    false

Gui.ZIndexBehavior =
    Enum.ZIndexBehavior.Sibling

Gui.Parent =
    CoreGui


local Main =
    Instance.new("Frame")

Main.Name =
    "Main"

Main.Size =
    UDim2.fromOffset(
        MAIN_WIDTH,
        MAIN_HEIGHT
    )

Main.Position =
    UDim2.new(
        0.5,
        -MAIN_WIDTH / 2,
        0.5,
        -MAIN_HEIGHT / 2
    )

Main.BackgroundColor3 =
    C.Panel

Main.BackgroundTransparency =
    HUD.Transparency

Main.BorderSizePixel =
    0

Main.Parent =
    Gui


local MainCorner =
    Instance.new("UICorner")

MainCorner.CornerRadius =
    UDim.new(
        0,
        HUD.CornerRadius
    )

MainCorner.Parent =
    Main


local MainStroke =
    Instance.new("UIStroke")

MainStroke.Color =
    C.Stroke

MainStroke.Thickness =
    1

MainStroke.Transparency =
    0.1

MainStroke.Parent =
    Main


local UIScale =
    Instance.new("UIScale")

UIScale.Scale =
    HUD.Scale

UIScale.Parent =
    Main


--========================================================
-- MOBILE SCALE
--========================================================

local function UpdateScale()

    local Size =
        Gui.AbsoluteSize

    if Size.X <= 0
        or
        Size.Y <= 0
    then
        return
    end

    local XScale =
        (Size.X - 20)
        / MAIN_WIDTH

    local YScale =
        (Size.Y - 20)
        / MAIN_HEIGHT

    UIScale.Scale =
        math.clamp(
            math.min(
                XScale,
                YScale
            ),
            0.62,
            1.15
        )

end


Gui:GetPropertyChangedSignal(
    "AbsoluteSize"
):Connect(
    UpdateScale
)

task.defer(
    UpdateScale
)


--========================================================
-- DYNAMIC BACKGROUND
--========================================================

local BackgroundFX =
    Instance.new("Frame")

BackgroundFX.Size =
    UDim2.fromScale(
        1,
        1
    )

BackgroundFX.BackgroundTransparency =
    1

BackgroundFX.ZIndex =
    0

BackgroundFX.Parent =
    Main


local BackgroundGradient =
    Instance.new("UIGradient")

BackgroundGradient.Color =
    ColorSequence.new({

        ColorSequenceKeypoint.new(
            0,
            Color3.fromRGB(
                20,
                45,
                70
            )
        ),

        ColorSequenceKeypoint.new(
            0.5,
            Color3.fromRGB(
                10,
                15,
                25
            )
        ),

        ColorSequenceKeypoint.new(
            1,
            Color3.fromRGB(
                20,
                35,
                55
            )
        )
    })

BackgroundGradient.Transparency =
    NumberSequence.new(
        0.8
    )

BackgroundGradient.Parent =
    BackgroundFX


task.spawn(function()

    while Gui.Parent do

        if CustomTheme.DynamicBackground
            and
            HUD.Animations
        then

            BackgroundGradient.Rotation =
                (
                    BackgroundGradient.Rotation
                    + 0.15
                )
                % 360

        end

        task.wait(
            0.03
        )

    end

end)


--========================================================
-- HEADER
--========================================================

local Header =
    Instance.new("Frame")

Header.Size =
    UDim2.new(
        1,
        0,
        0,
        45
    )

Header.BackgroundTransparency =
    1

Header.ZIndex =
    10

Header.Parent =
    Main


local Logo =
    Instance.new("ImageLabel")

Logo.Size =
    UDim2.fromOffset(
        27,
        27
    )

Logo.Position =
    UDim2.fromOffset(
        8,
        8
    )

Logo.BackgroundTransparency =
    1

Logo.Image =
    "rbxassetid://70814805890666"

Logo.ZIndex =
    11

Logo.Parent =
    Header


local Avatar =
    Instance.new("ImageLabel")

Avatar.Size =
    UDim2.fromOffset(
        27,
        27
    )

Avatar.Position =
    UDim2.fromOffset(
        39,
        8
    )

Avatar.BackgroundTransparency =
    1

Avatar.ZIndex =
    11

Avatar.Parent =
    Header


local AvatarCorner =
    Instance.new("UICorner")

AvatarCorner.CornerRadius =
    UDim.new(
        1,
        0
    )

AvatarCorner.Parent =
    Avatar


local AvatarStroke =
    Instance.new("UIStroke")

AvatarStroke.Color =
    C.Stroke

AvatarStroke.Thickness =
    1

AvatarStroke.Parent =
    Avatar


pcall(function()

    Avatar.Image =
        Players:GetUserThumbnailAsync(
            Player.UserId,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size100x100
        )

end)


local Title =
    Instance.new("TextLabel")

Title.Size =
    UDim2.fromOffset(
        180,
        18
    )

Title.Position =
    UDim2.fromOffset(
        73,
        4
    )

Title.BackgroundTransparency =
    1

Title.Text =
    "JJS Helper"

Title.TextColor3 =
    C.Text

Title.TextSize =
    14

Title.TextXAlignment =
    Enum.TextXAlignment.Left

Title.ZIndex =
    11

Title.Parent =
    Header

ApplyFont(
    Title,
    Enum.FontWeight.Bold
)


local Display =
    Instance.new("TextLabel")

Display.Size =
    UDim2.fromOffset(
        190,
        16
    )

Display.Position =
    UDim2.fromOffset(
        73,
        21
    )

Display.BackgroundTransparency =
    1

Display.Text =
    Player.DisplayName

Display.TextColor3 =
    C.Soft

Display.TextSize =
    10

Display.TextXAlignment =
    Enum.TextXAlignment.Left

Display.ZIndex =
    11

Display.Parent =
    Header

ApplyFont(
    Display
)


local OwnerBadge =
    Instance.new("TextLabel")

OwnerBadge.Size =
    UDim2.fromOffset(
        90,
        13
    )

OwnerBadge.Position =
    UDim2.fromOffset(
        73,
        34
    )

OwnerBadge.BackgroundTransparency =
    1

OwnerBadge.Text =
    ""

OwnerBadge.TextColor3 =
    Color3.fromRGB(
        255,
        215,
        80
    )

OwnerBadge.TextSize =
    8

OwnerBadge.Visible =
    false

OwnerBadge.ZIndex =
    11

OwnerBadge.Parent =
    Header

ApplyFont(
    OwnerBadge,
    Enum.FontWeight.Bold
)


--========================================================
-- HEADER BUTTONS
--========================================================

local Min =
    Instance.new("TextButton")

Min.Size =
    UDim2.fromOffset(
        30,
        30
    )

Min.Position =
    UDim2.new(
        1,
        -68,
        0,
        7
    )

Min.BackgroundTransparency =
    1

Min.Text =
    "−"

Min.TextColor3 =
    C.Soft

Min.TextSize =
    20

Min.ZIndex =
    11

Min.Parent =
    Header

ApplyFont(Min)


local Close =
    Instance.new("TextButton")

Close.Size =
    UDim2.fromOffset(
        30,
        30
    )

Close.Position =
    UDim2.new(
        1,
        -36,
        0,
        7
    )

Close.BackgroundTransparency =
    1

Close.Text =
    "×"

Close.TextColor3 =
    C.Soft

Close.TextSize =
    19

Close.ZIndex =
    11

Close.Parent =
    Header

ApplyFont(Close)


--========================================================
-- BODY
--========================================================

local Body =
    Instance.new("Frame")

Body.Position =
    UDim2.fromOffset(
        7,
        46
    )

Body.Size =
    UDim2.new(
        1,
        -14,
        1,
        -53
    )

Body.BackgroundTransparency =
    1

Body.ZIndex =
    5

Body.Parent =
    Main


local Sidebar =
    Instance.new("ScrollingFrame")

Sidebar.Size =
    UDim2.fromOffset(
        112,
        MAIN_HEIGHT - 60
    )

Sidebar.BackgroundColor3 =
    C.Panel2

Sidebar.BackgroundTransparency =
    0.18

Sidebar.BorderSizePixel =
    0

Sidebar.ScrollBarThickness =
    2

Sidebar.CanvasSize =
    UDim2.new()

Sidebar.ZIndex =
    6

Sidebar.Parent =
    Body


local SidebarCorner =
    Instance.new("UICorner")

SidebarCorner.CornerRadius =
    UDim.new(
        0,
        8
    )

SidebarCorner.Parent =
    Sidebar


local SidebarPadding =
    Instance.new("UIPadding")

SidebarPadding.PaddingTop =
    UDim.new(
        0,
        6
    )

SidebarPadding.PaddingLeft =
    UDim.new(
        0,
        6
    )

SidebarPadding.PaddingRight =
    UDim.new(
        0,
        6
    )

SidebarPadding.Parent =
    Sidebar


local SideList =
    Instance.new("UIListLayout")

SideList.Padding =
    UDim.new(
        0,
        4
    )

SideList.SortOrder =
    Enum.SortOrder.LayoutOrder

SideList.Parent =
    Sidebar


local Content =
    Instance.new("Frame")

Content.Position =
    UDim2.fromOffset(
        119,
        0
    )

Content.Size =
    UDim2.new(
        1,
        -119,
        1,
        0
    )

Content.BackgroundTransparency =
    1

Content.ZIndex =
    6

Content.Parent =
    Body


--========================================================
-- PAGES
--========================================================

local Pages = {}
local Tabs = {}
local PageTitles = {}


local function CreatePage(Name)

    local Page =
        Instance.new("Frame")

    Page.Name =
        Name

    Page.Size =
        UDim2.fromScale(
            1,
            1
        )

    Page.BackgroundTransparency =
        1

    Page.Visible =
        false

    Page.ZIndex =
        7

    Page.Parent =
        Content

    Pages[Name] =
        Page

    return Page

end


local function CreateTab(
    Name,
    Icon,
    Order
)

    local Button =
        Instance.new("TextButton")

    Button.Size =
        UDim2.new(
            1,
            0,
            0,
            31
        )

    Button.BackgroundColor3 =
        C.Button

    Button.BackgroundTransparency =
        1

    Button.BorderSizePixel =
        0

    Button.Text =
        Icon
        .."  "
        ..T(Name:lower())

    Button.TextColor3 =
        C.Soft

    Button.TextSize =
        10

    Button.TextXAlignment =
        Enum.TextXAlignment.Left

    Button.LayoutOrder =
        Order

    Button.ZIndex =
        7

    Button.Parent =
        Sidebar

    ApplyFont(
        Button,
        Enum.FontWeight.SemiBold
    )


    local Corner =
        Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(
            0,
            6
        )

    Corner.Parent =
        Button


    local Bar =
        Instance.new("Frame")

    Bar.Size =
        UDim2.fromOffset(
            2,
            17
        )

    Bar.Position =
        UDim2.new(
            0,
            0,
            0.5,
            -8
        )

    Bar.BackgroundColor3 =
        C.Accent

    Bar.BorderSizePixel =
        0

    Bar.Visible =
        false

    Bar.ZIndex =
        8

    Bar.Parent =
        Button


    Tabs[Name] = {
        Button = Button,
        Bar = Bar,
        Icon = Icon
    }

end


local Home =
    CreatePage("Home")

local Builder =
    CreatePage("Builder")

local Tools =
    CreatePage("Tools")

local AI =
    CreatePage("AI")

local Guide =
    CreatePage("Guide")

local Settings =
    CreatePage("Settings")


CreateTab(
    "Home",
    "⌂",
    1
)

CreateTab(
    "Builder",
    "◆",
    2
)

CreateTab(
    "Tools",
    "◇",
    3
)

CreateTab(
    "AI",
    "AI",
    4
)

CreateTab(
    "Guide",
    "?",
    5
)

CreateTab(
    "Settings",
    "⚙",
    6
)


--========================================================
-- TITLES
--========================================================

local function MakePageTitle(
    Page,
    TitleKey,
    SubKey
)

    local T1 =
        Instance.new("TextLabel")

    T1.Size =
        UDim2.new(
            1,
            -10,
            0,
            24
        )

    T1.Position =
        UDim2.fromOffset(
            5,
            4
        )

    T1.BackgroundTransparency =
        1

    T1.Text =
        T(TitleKey)

    T1.TextColor3 =
        C.Text

    T1.TextSize =
        16

    T1.TextXAlignment =
        Enum.TextXAlignment.Left

    T1.Parent =
        Page

    ApplyFont(
        T1,
        Enum.FontWeight.Bold
    )


    local T2 =
        Instance.new("TextLabel")

    T2.Size =
        UDim2.new(
            1,
            -10,
            0,
            20
        )

    T2.Position =
        UDim2.fromOffset(
            5,
            29
        )

    T2.BackgroundTransparency =
        1

    T2.Text =
        T(SubKey)

    T2.TextColor3 =
        C.Soft

    T2.TextSize =
        9

    T2.TextXAlignment =
        Enum.TextXAlignment.Left

    T2.Parent =
        Page

    ApplyFont(T2)


    PageTitles[Page] = {
        Title = T1,
        Subtitle = T2,
        TitleKey = TitleKey,
        SubKey = SubKey
    }

end


MakePageTitle(
    Home,
    "homeTitle",
    "homeSub"
)

MakePageTitle(
    Builder,
    "builderTitle",
    "builderSub"
)

MakePageTitle(
    Tools,
    "toolsTitle",
    "toolsSub"
)

MakePageTitle(
    AI,
    "aiTitle",
    "aiSub"
)

MakePageTitle(
    Guide,
    "guideTitle",
    "guideSub"
)

MakePageTitle(
    Settings,
    "settingsTitle",
    "settingsSub"
)


--========================================================
-- NAVIGATION
--========================================================

local function ShowPage(Name)

    for PageName,Page in pairs(Pages) do

        Page.Visible =
            PageName == Name

    end


    for TabName,Data in pairs(Tabs) do

        local Active =
            TabName == Name

        Data.Bar.Visible =
            Active

        Data.Button.BackgroundTransparency =
            Active
            and
            0.1
            or
            1

        Data.Button.BackgroundColor3 =
            C.Button

        Data.Button.TextColor3 =
            Active
            and
            C.Text
            or
            C.Soft

    end

end


for Name,Data in pairs(Tabs) do

    Data.Button.Activated:Connect(
        function()

            ShowPage(Name)

        end
    )

end


ShowPage("Home")


--========================================================
-- NOTIFICATION SYSTEM
--========================================================

local NotificationHolder =
    Instance.new("Frame")

NotificationHolder.Size =
    UDim2.fromOffset(
        225,
        200
    )

NotificationHolder.Position =
    UDim2.new(
        1,
        -235,
        0,
        10
    )

NotificationHolder.BackgroundTransparency =
    1

NotificationHolder.ZIndex =
    500

NotificationHolder.Parent =
    Gui


local NotificationLayout =
    Instance.new("UIListLayout")

NotificationLayout.Padding =
    UDim.new(
        0,
        5
    )

NotificationLayout.HorizontalAlignment =
    Enum.HorizontalAlignment.Right

NotificationLayout.VerticalAlignment =
    Enum.VerticalAlignment.Top

NotificationLayout.Parent =
    NotificationHolder


local function Notify(Text)

    Session.Notifications += 1

    local N =
        Instance.new("TextLabel")

    N.Size =
        UDim2.fromOffset(
            215,
            38
        )

    N.BackgroundColor3 =
        C.Panel2

    N.BackgroundTransparency =
        0.08

    N.BorderSizePixel =
        0

    N.Text =
        Text

    N.TextColor3 =
        C.Text

    N.TextSize =
        9

    N.TextWrapped =
        true

    N.ZIndex =
        501

    N.Parent =
        NotificationHolder

    ApplyFont(
        N,
        Enum.FontWeight.SemiBold
    )


    local Corner =
        Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(
            0,
            7
        )

    Corner.Parent =
        N


    local Stroke =
        Instance.new("UIStroke")

    Stroke.Color =
        C.Stroke

    Stroke.Thickness =
        1

    Stroke.Parent =
        N


    task.delay(
        2.5,
        function()

            if not N.Parent then
                return
            end

            local Tween =
                TweenService:Create(
                    N,
                    TweenInfo.new(
                        0.25
                    ),
                    {
                        BackgroundTransparency = 1,
                        TextTransparency = 1
                    }
                )

            Tween:Play()

            Tween.Completed:Wait()

            N:Destroy()

        end
    )

end


--========================================================
-- HISTORY
--========================================================

local function RecordHistory(
    Action,
    Details
)

    table.insert(
        BuildHistory,
        {
            Action = Action,
            Details = Details or "",
            Time = os.date(
                "%Y-%m-%d %H:%M:%S"
            )
        }
    )

    Session.BuilderActions += 1

end


--========================================================
-- ACHIEVEMENTS
--========================================================

local function UnlockAchievement(
    Name,
    Description
)

    if Achievements[Name] then
        return
    end

    Achievements[Name] = {
        Description = Description,
        Time = os.date(
            "%Y-%m-%d %H:%M:%S"
        )
    }

    Notify(
        "🏆 Achievement: "
        ..Name
    )

end


--========================================================
-- HOME
--========================================================

local HomeInfo =
    Instance.new("TextLabel")

HomeInfo.Size =
    UDim2.new(
        1,
        -20,
        0,
        155
    )

HomeInfo.Position =
    UDim2.fromOffset(
        10,
        65
    )

HomeInfo.BackgroundColor3 =
    C.Button

HomeInfo.BackgroundTransparency =
    0.2

HomeInfo.BorderSizePixel =
    0

HomeInfo.TextColor3 =
    C.Text

HomeInfo.TextSize =
    10

HomeInfo.TextWrapped =
    true

HomeInfo.TextXAlignment =
    Enum.TextXAlignment.Left

HomeInfo.TextYAlignment =
    Enum.TextYAlignment.Top

HomeInfo.Parent =
    Home

ApplyFont(HomeInfo)


local HomeCorner =
    Instance.new("UICorner")

HomeCorner.CornerRadius =
    UDim.new(
        0,
        8
    )

HomeCorner.Parent =
    Home


local HomePad =
    Instance.new("UIPadding")

HomePad.PaddingTop =
    UDim.new(
        0,
        10
    )

HomePad.PaddingLeft =
    UDim.new(
        0,
        12
    )

HomePad.PaddingRight =
    UDim.new(
        0,
        12
    )

HomePad.Parent =
    HomeInfo


local function UpdateHome()

    local OwnerText = ""

    if IsOwner then

        OwnerText =
            "\n\n👑 Owner detectado: Uo63m • ReiBacon"

    end


    HomeInfo.Text =
        "JJS Helper Hub Edition 3.0\n\n"
        ..
        (
            CurrentLanguage == "pt"
            and
            "◆ Builder — criação e organização local\n"
            .."◇ Tools — Vault, Meshes, Validator e utilidades\n"
            .."AI — Jin + Memory + comandos + Easter Eggs\n"
            .."? Guia — referência rápida\n"
            .."⚙ Settings — temas, HUD, idioma e personalidade"
            or
            CurrentLanguage == "en"
            and
            "◆ Builder — local creation and organization\n"
            .."◇ Tools — Vault, Meshes, Validator and utilities\n"
            .."AI — Jin + Memory + commands + Easter Eggs\n"
            .."? Guide — quick reference\n"
            .."⚙ Settings — themes, HUD, language and personality"
            or
            "◆ Builder — creación y organización local\n"
            .."◇ Tools — Vault, Meshes, Validator y utilidades\n"
            .."AI — Jin + Memory + comandos + Easter Eggs\n"
            .."? Guía — referencia rápida\n"
            .."⚙ Ajustes — temas, HUD, idioma y personalidad"
        )
        ..
        OwnerText

end


UpdateHome()


--========================================================
-- BUILDER DATA
--========================================================

local BuilderActions =
    {}

local CurrentSequence =
    {}

local function AddBuilderAction(
    Name
)

    table.insert(
        BuilderActions,
        Name
    )

    table.insert(
        CurrentSequence,
        {
            Type = Name,
            Properties = {},
            Time = os.date(
                "%H:%M:%S"
            )
        }
    )

    RecordHistory(
        "ADD",
        Name
    )

    UnlockAchievement(
        "First Builder Action",
        "Added your first local Builder action."
    )

end


local function RemoveSequenceAction(
    Index
)

    if CurrentSequence[Index] then

        local Removed =
            CurrentSequence[Index].Type

        table.remove(
            CurrentSequence,
            Index
        )

        RecordHistory(
            "REMOVE",
            Removed
        )

        return true

    end

    return false

end


local function MoveSequence(
    From,
    To
)

    if not CurrentSequence[From]
        or
        To < 1
        or
        To > #CurrentSequence
    then
        return false
    end

    local Item =
        table.remove(
            CurrentSequence,
            From
        )

    table.insert(
        CurrentSequence,
        To,
        Item
    )

    RecordHistory(
        "REORDER",
        Item.Type
    )

    return true

end


--========================================================
-- BUILDER UI
--========================================================

local BuilderList =
    Instance.new("ScrollingFrame")

BuilderList.Position =
    UDim2.fromOffset(
        6,
        58
    )

BuilderList.Size =
    UDim2.new(
        0.47,
        -9,
        1,
        -64
    )

BuilderList.BackgroundTransparency =
    1

BuilderList.BorderSizePixel =
    0

BuilderList.ScrollBarThickness =
    2

BuilderList.Parent =
    Builder


local BuilderLayout =
    Instance.new("UIListLayout")

BuilderLayout.Padding =
    UDim.new(
        0,
        5
    )

BuilderLayout.Parent =
    BuilderList


local SequenceList =
    Instance.new("ScrollingFrame")

SequenceList.Position =
    UDim2.new(
        0.48,
        0,
        0,
        58
    )

SequenceList.Size =
    UDim2.new(
        0.52,
        -7,
        1,
        -64
    )

SequenceList.BackgroundColor3 =
    C.Button

SequenceList.BackgroundTransparency =
    0.18

SequenceList.BorderSizePixel =
    0

SequenceList.ScrollBarThickness =
    2

SequenceList.Parent =
    Builder


local SequenceCorner =
    Instance.new("UICorner")

SequenceCorner.CornerRadius =
    UDim.new(
        0,
        8
    )

SequenceCorner.Parent =
    SequenceList


local SequenceLayout =
    Instance.new("UIListLayout")

SequenceLayout.Padding =
    UDim.new(
        0,
        4
    )

SequenceLayout.Parent =
    SequenceList


local function RefreshSequence()

    for _,Child in ipairs(
        SequenceList:GetChildren()
    ) do

        if Child:IsA(
            "TextButton"
        ) then

            Child:Destroy()

        end

    end


    for Index,Item in ipairs(
        CurrentSequence
    ) do

        local Button =
            Instance.new(
                "TextButton"
            )

        Button.Size =
            UDim2.new(
                1,
                -8,
                0,
                32
            )

        Button.BackgroundColor3 =
            C.Panel2

        Button.BorderSizePixel =
            0

        Button.Text =
            tostring(Index)
            .."  "
            ..Item.Type
            .."   [×]"

        Button.TextColor3 =
            C.Text

        Button.TextSize =
            9

        Button.Parent =
            SequenceList

        ApplyFont(Button)


        Button.Activated:Connect(
            function()

                RemoveSequenceAction(
                    Index
                )

                RefreshSequence()

            end
        )

    end


    task.defer(
        function()

            SequenceList.CanvasSize =
                UDim2.fromOffset(
                    0,
                    SequenceLayout.AbsoluteContentSize.Y
                    + 10
                )

        end
    )

end


local function BuilderButton(
    Name
)

    local Button =
        Instance.new(
            "TextButton"
        )

    Button.Size =
        UDim2.new(
            1,
            -4,
            0,
            34
        )

    Button.BackgroundColor3 =
        C.Button

    Button.BackgroundTransparency =
        0.12

    Button.BorderSizePixel =
        0

    Button.Text =
        Name

    Button.TextColor3 =
        C.Text

    Button.TextSize =
        10

    Button.Parent =
        BuilderList

    ApplyFont(
        Button,
        Enum.FontWeight.SemiBold
    )


    local Corner =
        Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(
            0,
            7
        )

    Corner.Parent =
        Button


    Button.MouseEnter:Connect(
        function()

            Button.BackgroundColor3 =
                C.Hover

        end
    )


    Button.MouseLeave:Connect(
        function()

            Button.BackgroundColor3 =
                C.Button

        end
    )


    Button.Activated:Connect(
        function()

            if Name == "COPY" then

                local Last =
                    CurrentSequence[
                        #CurrentSequence
                    ]

                if Last then

                    ClipboardAction =
                        table.clone(
                            Last
                        )

                    Notify(
                        "COPY local: "
                        ..Last.Type
                    )

                else

                    Notify(
                        "Nada para copiar."
                    )

                end

                return

            end


            if Name == "PASTE" then

                if ClipboardAction then

                    table.insert(
                        CurrentSequence,
                        table.clone(
                            ClipboardAction
                        )
                    )

                    RecordHistory(
                        "PASTE",
                        ClipboardAction.Type
                    )

                    RefreshSequence()

                    Notify(
                        "PASTE local: "
                        ..ClipboardAction.Type
                    )

                else

                    Notify(
                        "Clipboard local vazio."
                    )

                end

                return

            end


            if Name == "RESET" then

                CurrentSequence =
                    {}

                RefreshSequence()

                RecordHistory(
                    "RESET",
                    "Builder sequence"
                )

                Notify(
                    "Sequence resetada."
                )

                return

            end


            AddBuilderAction(
                Name
            )

            RefreshSequence()

        end
    )

end


BuilderButton("COPY")
BuilderButton("PASTE")
BuilderButton("BRANCH")
BuilderButton("CONNECT")
BuilderButton("ANIMATION")
BuilderButton("VFX")
BuilderButton("SOUND")
BuilderButton("NPC")
BuilderButton("RESET")


BuilderLayout:GetPropertyChangedSignal(
    "AbsoluteContentSize"
):Connect(
    function()

        BuilderList.CanvasSize =
            UDim2.fromOffset(
                0,
                BuilderLayout.AbsoluteContentSize.Y
                + 10
            )

    end
)


--========================================================
-- TOOLS
--========================================================

local ToolList =
    Instance.new("ScrollingFrame")

ToolList.Position =
    UDim2.fromOffset(
        7,
        58
    )

ToolList.Size =
    UDim2.new(
        1,
        -14,
        1,
        -65
    )

ToolList.BackgroundTransparency =
    1

ToolList.BorderSizePixel =
    0

ToolList.ScrollBarThickness =
    2

ToolList.Parent =
    Tools


local ToolLayout =
    Instance.new("UIListLayout")

ToolLayout.Padding =
    UDim.new(
        0,
        5
    )

ToolLayout.Parent =
    ToolList


local function ToolButton(
    Text,
    Callback
)

    local Button =
        Instance.new(
            "TextButton"
        )

    Button.Size =
        UDim2.new(
            1,
            -4,
            0,
            32
        )

    Button.BackgroundColor3 =
        C.Button

    Button.BackgroundTransparency =
        0.12

    Button.BorderSizePixel =
        0

    Button.Text =
        Text

    Button.TextColor3 =
        C.Text

    Button.TextSize =
        9

    Button.Parent =
        ToolList

    ApplyFont(
        Button,
        Enum.FontWeight.SemiBold
    )


    local Corner =
        Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(
            0,
            7
        )

    Corner.Parent =
        Button


    Button.Activated:Connect(
        Callback
    )

    return Button

end


--========================================================
-- MESH MANAGER
--========================================================

local function ValidMesh(
    ID
)

    return
        type(ID) == "string"
        and
        ID:match("^%d+$")
        ~= nil
        and
        tonumber(ID) > 0

end


local function AddMesh(
    ID
)

    if not ValidMesh(ID) then
        return false
    end


    for _,Existing in ipairs(
        Meshes
    ) do

        if Existing == ID then
            return false
        end

    end


    table.insert(
        Meshes,
        ID
    )

    Session.MeshesAdded += 1

    RecordHistory(
        "MESH_ADD",
        ID
    )

    return true

end


local function RemoveMesh(
    Index
)

    if Meshes[Index] then

        local ID =
            Meshes[Index]

        table.remove(
            Meshes,
            Index
        )

        RecordHistory(
            "MESH_REMOVE",
            ID
        )

        return true

    end

    return false

end


--========================================================
-- GENERIC TOOL WINDOWS
--========================================================

local function CreateToolWindow(
    Name
)

    local Frame =
        Instance.new("Frame")

    Frame.Size =
        UDim2.fromScale(
            1,
            1
        )

    Frame.BackgroundColor3 =
        C.Panel

    Frame.BackgroundTransparency =
        0.02

    Frame.Visible =
        false

    Frame.ZIndex =
        50

    Frame.Parent =
        Tools


    local Title =
        Instance.new("TextLabel")

    Title.Size =
        UDim2.new(
            1,
            -70,
            0,
            26
        )

    Title.Position =
        UDim2.fromOffset(
            10,
            7
        )

    Title.BackgroundTransparency =
        1

    Title.Text =
        Name

    Title.TextColor3 =
        C.Text

    Title.TextSize =
        15

    Title.TextXAlignment =
        Enum.TextXAlignment.Left

    Title.ZIndex =
        51

    Title.Parent =
        Frame

    ApplyFont(
        Title,
        Enum.FontWeight.Bold
    )


    local Back =
        Instance.new("TextButton")

    Back.Size =
        UDim2.fromOffset(
            55,
            26
        )

    Back.Position =
        UDim2.new(
            1,
            -65,
            0,
            6
        )

    Back.BackgroundTransparency =
        1

    Back.Text =
        "←"

    Back.TextColor3 =
        C.Accent

    Back.TextSize =
        16

    Back.ZIndex =
        51

    Back.Parent =
        Frame

    ApplyFont(Back)


    Back.Activated:Connect(
        function()

            Frame.Visible =
                false

        end
    )


    return Frame

end


--========================================================
-- MESH WINDOW
--========================================================

local MeshFrame =
    CreateToolWindow(
        "Mesh Manager"
    )


local MeshInput =
    Instance.new("TextBox")

MeshInput.Size =
    UDim2.new(
        1,
        -75,
        0,
        31
    )

MeshInput.Position =
    UDim2.fromOffset(
        10,
        42
    )

MeshInput.BackgroundColor3 =
    C.Button

MeshInput.BorderSizePixel =
    0

MeshInput.PlaceholderText =
    "Mesh ID..."

MeshInput.PlaceholderColor3 =
    C.Soft

MeshInput.TextColor3 =
    C.Text

MeshInput.TextSize =
    10

MeshInput.ZIndex =
    51

MeshInput.Parent =
    MeshFrame

ApplyFont(MeshInput)


local MeshAdd =
    Instance.new("TextButton")

MeshAdd.Size =
    UDim2.fromOffset(
        55,
        31
    )

MeshAdd.Position =
    UDim2.new(
        1,
        -65,
        0,
        42
    )

MeshAdd.BackgroundColor3 =
    C.AccentDark

MeshAdd.BorderSizePixel =
    0

MeshAdd.Text =
    "+"

MeshAdd.TextColor3 =
    C.Text

MeshAdd.TextSize =
    16

MeshAdd.ZIndex =
    51

MeshAdd.Parent =
    MeshFrame

ApplyFont(MeshAdd)


local MeshList =
    Instance.new("ScrollingFrame")

MeshList.Size =
    UDim2.new(
        1,
        -20,
        1,
        -90
    )

MeshList.Position =
    UDim2.fromOffset(
        10,
        80
    )

MeshList.BackgroundTransparency =
    1

MeshList.BorderSizePixel =
    0

MeshList.ScrollBarThickness =
    2

MeshList.ZIndex =
    51

MeshList.Parent =
    MeshFrame


local MeshLayout =
    Instance.new("UIListLayout")

MeshLayout.Padding =
    UDim.new(
        0,
        4
    )

MeshLayout.Parent =
    MeshList


local function RefreshMeshes()

    for _,Child in ipairs(
        MeshList:GetChildren()
    ) do

        if Child:IsA("Frame")
            or
            Child:IsA("TextLabel")
        then

            Child:Destroy()

        end

    end


    if #Meshes == 0 then

        local Empty =
            Instance.new(
                "TextLabel"
            )

        Empty.Size =
            UDim2.new(
                1,
                -5,
                0,
                30
            )

        Empty.BackgroundTransparency =
            1

        Empty.Text =
            T("meshEmpty")

        Empty.TextColor3 =
            C.Soft

        Empty.TextSize =
            10

        Empty.Parent =
            MeshList

        ApplyFont(Empty)

    end


    for Index,ID in ipairs(
        Meshes
    ) do

        local Item =
            Instance.new(
                "Frame"
            )

        Item.Size =
            UDim2.new(
                1,
                -5,
                0,
                32
            )

        Item.BackgroundColor3 =
            C.Button

        Item.BackgroundTransparency =
            0.1

        Item.BorderSizePixel =
            0

        Item.ZIndex =
            52

        Item.Parent =
            MeshList


        local Label =
            Instance.new(
                "TextLabel"
            )

        Label.Size =
            UDim2.new(
                1,
                -60,
                1,
                0
            )

        Label.Position =
            UDim2.fromOffset(
                8,
                0
            )

        Label.BackgroundTransparency =
            1

        Label.Text =
            "#"
            ..Index
            .."  "
            ..ID

        Label.TextColor3 =
            C.Text

        Label.TextSize =
            9

        Label.TextXAlignment =
            Enum.TextXAlignment.Left

        Label.ZIndex =
            53

        Label.Parent =
            Item

        ApplyFont(Label)


        local Remove =
            Instance.new(
                "TextButton"
            )

        Remove.Size =
            UDim2.fromOffset(
                45,
                25
            )

        Remove.Position =
            UDim2.new(
                1,
                -50,
                0.5,
                -12
            )

        Remove.BackgroundColor3 =
            C.AccentDark

        Remove.BorderSizePixel =
            0

        Remove.Text =
            "×"

        Remove.TextColor3 =
            C.Text

        Remove.TextSize =
            14

        Remove.ZIndex =
            53

        Remove.Parent =
            Item

        ApplyFont(Remove)


        Remove.Activated:Connect(
            function()

                RemoveMesh(
                    Index
                )

                RefreshMeshes()

                Notify(
                    "Mesh removido."
                )

            end
        )

    end


    task.defer(
        function()

            MeshList.CanvasSize =
                UDim2.fromOffset(
                    0,
                    MeshLayout.AbsoluteContentSize.Y
                    + 10
                )

        end
    )

end


MeshAdd.Activated:Connect(
    function()

        local ID =
            MeshInput.Text

        if AddMesh(ID) then

            MeshInput.Text =
                ""

            RefreshMeshes()

            Notify(
                "Mesh adicionado."
            )

        else

            Notify(
                "ID inválido ou duplicado."
            )

        end

    end
)


--========================================================
-- BUILD VAULT
--========================================================

local VaultFrame =
    CreateToolWindow(
        "Build Vault"
    )


local VaultList =
    Instance.new("ScrollingFrame")

VaultList.Size =
    UDim2.new(
        1,
        -20,
        1,
        -45
    )

VaultList.Position =
    UDim2.fromOffset(
        10,
        42
    )

VaultList.BackgroundTransparency =
    1

VaultList.BorderSizePixel =
    0

VaultList.ScrollBarThickness =
    2

VaultList.ZIndex =
    51

VaultList.Parent =
    VaultFrame


local VaultLayout =
    Instance.new("UIListLayout")

VaultLayout.Padding =
    UDim.new(
        0,
        5
    )

VaultLayout.Parent =
    VaultList


local function RefreshVault()

    for _,Child in ipairs(
        VaultList:GetChildren()
    ) do

        if Child:IsA(
            "TextButton"
        ) then

            Child:Destroy()

        end

    end


    for Index,Build in ipairs(
        BuildProfiles
    ) do

        local Button =
            Instance.new(
                "TextButton"
            )

        Button.Size =
            UDim2.new(
                1,
                -5,
                0,
                38
            )

        Button.BackgroundColor3 =
            C.Button

        Button.BorderSizePixel =
            0

        Button.Text =
            Build.Name
            .."  • v"
            ..tostring(
                Build.Version or 1
            )
            .."\n"
            ..tostring(
                Build.Type or "Custom"
            )

        Button.TextColor3 =
            C.Text

        Button.TextSize =
            9

        Button.TextWrapped =
            true

        Button.ZIndex =
            52

        Button.Parent =
            VaultList

        ApplyFont(Button)


        Button.Activated:Connect(
            function()

                CurrentBuild =
                    Build

                Notify(
                    "Build selecionado: "
                    ..Build.Name
                )

            end
        )

    end

end


--========================================================
-- SNAPSHOT SYSTEM
--========================================================

local function CreateSnapshot()

    local Snapshot = {

        Time =
            os.date(
                "%Y-%m-%d %H:%M:%S"
            ),

        Build =
            CurrentBuild,

        Sequence =
            table.clone(
                CurrentSequence
            ),

        Meshes =
            table.clone(
                Meshes
            )
    }


    table.insert(
        Snapshots,
        Snapshot
    )

    Session.Snapshots += 1

    RecordHistory(
        "SNAPSHOT",
        Snapshot.Time
    )

    UnlockAchievement(
        "Time Capsule",
        "Created a local snapshot."
    )

    Notify(
        "📸 Snapshot criado."
    )

end


local function RestoreSnapshot(
    Index
)

    local Snapshot =
        Snapshots[Index]

    if not Snapshot then
        return false
    end


    CurrentSequence =
        table.clone(
            Snapshot.Sequence or {}
        )

    Meshes =
        table.clone(
            Snapshot.Meshes or {}
        )

    CurrentBuild =
        Snapshot.Build


    RecordHistory(
        "RESTORE",
        tostring(Index)
    )

    Notify(
        "Snapshot restaurado."
    )

    return true

end


--========================================================
-- SANDBOX
--========================================================

local SandboxMode =
    false

local SandboxSequence = {}


local function ToggleSandbox()

    SandboxMode =
        not SandboxMode

    if SandboxMode then

        SandboxSequence =
            table.clone(
                CurrentSequence
            )

        Notify(
            "🧪 Sandbox ON — alterações isoladas."
        )

    else

        SandboxSequence =
            {}

        Notify(
            "🧪 Sandbox OFF."
        )

    end

end


--========================================================
-- SKILL DNA
--========================================================

local SkillDNA = {

    POWER = 50,

    SPEED = 50,

    RANGE = 50,

    COMPLEXITY = 50
}


local function SetDNA(
    Name,
    Value
)

    if SkillDNA[Name] then

        SkillDNA[Name] =
            math.clamp(
                tonumber(Value) or 50,
                0,
                100
            )

    end

end


--========================================================
-- CINEMATIC PREVIEW
--========================================================

local PreviewRunning =
    false


local function CinematicPreview()

    if PreviewRunning then
        return
    end

    PreviewRunning =
        true

    local Steps = {

        "START",

        "ANIMATION",

        "VFX",

        "SOUND",

        "HIT",

        "END"
    }


    for _,Step in ipairs(
        Steps
    ) do

        Notify(
            "🎬 PREVIEW → "
            ..Step
        )

        task.wait(
            0.45
        )

    end


    PreviewRunning =
        false

end


--========================================================
-- REPLAY
--========================================================

local function RecordReplay(
    Action
)

    table.insert(
        ReplayData,
        {
            Action = Action,
            Time = os.clock()
        }
    )

end


local function PlayReplay()

    if #ReplayData == 0 then

        Notify(
            "Replay vazio."
        )

        return

    end


    Session.Replays += 1

    for _,Data in ipairs(
        ReplayData
    ) do

        Notify(
            "▶ "
            ..tostring(
                Data.Action
            )
        )

        task.wait(
            0.25
        )

    end

end


--========================================================
-- CREATOR CHALLENGES
--========================================================

Challenges = {

    {
        Name = "First Build",

        Goal = "Criar um perfil local.",

        Completed = false
    },

    {
        Name = "VFX Sequence",

        Goal = "Adicionar VFX à sequência.",

        Completed = false
    },

    {
        Name = "Mesh Collector",

        Goal = "Adicionar 3 Meshes.",

        Completed = false
    },

    {
        Name = "Timeline",

        Goal = "Criar uma sequência com 4 ações.",

        Completed = false
    }
}


local function UpdateChallenges()

    if #BuildProfiles >= 1 then
        Challenges[1].Completed = true
    end

    if #Meshes >= 3 then
        Challenges[3].Completed = true
    end

    if #CurrentSequence >= 4 then
        Challenges[4].Completed = true
    end


    for _,Item in ipairs(
        CurrentSequence
    ) do

        if Item.Type == "VFX" then

            Challenges[2].Completed =
                true

        end

    end

end


--========================================================
-- DEBUG CONSOLE
--========================================================

local DebugLog = {}


local function Debug(
    Text
)

    table.insert(
        DebugLog,
        os.date(
            "%H:%M:%S"
        )
        .." | "
        ..tostring(Text)
    )

end


Debug(
    "JJS Helper initialized."
)


--========================================================
-- VALIDATOR
--========================================================

local function Validate()

    local Problems = {}


    for Index,Build in ipairs(
        BuildProfiles
    ) do

        if not Build.Name
            or
            Build.Name == ""
        then

            table.insert(
                Problems,
                "Build #"
                ..Index
                .." sem nome."
            )

        end


        if not Build.Type
            or
            Build.Type == ""
        then

            table.insert(
                Problems,
                "Build #"
                ..Index
                .." sem tipo."
            )

        end

    end


    for _,ID in ipairs(
        Meshes
    ) do

        if not ValidMesh(ID) then

            table.insert(
                Problems,
                "Mesh inválido: "
                ..tostring(ID)
            )

        end

    end


    if #Problems == 0 then

        Notify(
            T("validatorOK")
        )

    else

        Notify(
            T("validatorBad")
            .." "
            ..#Problems
            .." problema(s)."
        )

    end


    return Problems

end


--========================================================
-- AUTO BUILD
--========================================================

local function GenerateBuild(
    Name,
    Type
)

    Name =
        Name
        ~= ""
        and
        Name
        or
        "Untitled Build"


    Type =
        Type
        ~= ""
        and
        Type
        or
        "Custom"


    local Build = {

        Name = Name,

        Type = Type,

        Created =
            os.date(
                "%Y-%m-%d %H:%M:%S"
            ),

        Version = 1,

        Components =
            table.clone(
                CurrentSequence
            ),

        Meshes =
            table.clone(
                Meshes
            ),

        History = {},

        DNA =
            table.clone(
                SkillDNA
            )
    }


    table.insert(
        BuildProfiles,
        Build
    )


    CurrentBuild =
        Build

    Session.BuildsCreated += 1

    UpdateChallenges()

    UnlockAchievement(
        "First Build",
        "Created your first local build."
    )

    RecordHistory(
        "BUILD_CREATE",
        Name
    )

    return Build

end


--========================================================
-- BUILD VERSION
--========================================================

local function CreateBuildVersion()

    if not CurrentBuild then

        Notify(
            "Nenhum Build selecionado."
        )

        return

    end


    CurrentVersion += 1


    local Version = {

        Name =
            CurrentBuild.Name,

        Type =
            CurrentBuild.Type,

        Created =
            os.date(
                "%Y-%m-%d %H:%M:%S"
            ),

        Version =
            CurrentVersion,

        Components =
            table.clone(
                CurrentSequence
            ),

        Meshes =
            table.clone(
                Meshes
            ),

        DNA =
            table.clone(
                SkillDNA
            )
    }


    table.insert(
        BuildProfiles,
        Version
    )


    CurrentBuild =
        Version

    Session.BuildsCreated += 1

    RecordHistory(
        "VERSION_CREATE",
        tostring(CurrentVersion)
    )

    Notify(
        "Versão v"
        ..CurrentVersion
        .." criada."
    )

end


--========================================================
-- BUILD COMPARISON
--========================================================

local function CompareBuilds(
    A,
    B
)

    if not A
        or
        not B
    then

        return

    end


    local ACount =
        #(A.Components or {})

    local BCount =
        #(B.Components or {})

    local AMesh =
        #(A.Meshes or {})

    local BMesh =
        #(B.Meshes or {})


    Notify(
        "COMPARE: "
        ..A.Name
        .." v"
        ..tostring(
            A.Version or 1
        )
        .." → "
        ..B.Name
        .." v"
        ..tostring(
            B.Version or 1
        )
        .." | Actions "
        ..ACount
        .." → "
        ..BCount
        .." | Meshes "
        ..AMesh
        .." → "
        ..BMesh
    )

end


--========================================================
-- ASSET INSPECTOR
--========================================================

local function InspectAsset(
    ID
)

    if not ID
        or
        not tostring(ID):match("^%d+$")
    then

        Notify(
            "ID inválido."
        )

        return

    end


    Notify(
        "Asset Inspector: ID "
        ..tostring(ID)
        .." registrado para análise local."
    )

    Debug(
        "Asset inspection requested: "
        ..tostring(ID)
    )

end


--========================================================
-- JIN MEMORY
--========================================================

local function Remember(
    Text
)

    if Text == "" then
        return
    end


    table.insert(
        JinMemory,
        {
            Text = Text,

            Time =
                os.date(
                    "%H:%M:%S"
                )
        }
    )


    while #JinMemory > 25 do

        table.remove(
            JinMemory,
            1
        )

    end

end


--========================================================
-- BUILD BRAIN
--========================================================

local function BuildBrain(
    Query
)

    local S =
        string.lower(
            Query
        )


    local Suggestions = {}


    if S:find("gojo")
        or
        S:find("infinito")
    then

        table.insert(
            Suggestions,
            "Animation"
        )

        table.insert(
            Suggestions,
            "VFX"
        )

        table.insert(
            Suggestions,
            "Sound"
        )

    end


    if S:find("corte")
        or
        S:find("slash")
    then

        table.insert(
            Suggestions,
            "Animation"
        )

        table.insert(
            Suggestions,
            "VFX"
        )

    end


    if S:find("npc") then

        table.insert(
            Suggestions,
            "NPC"
        )

    end


    if #Suggestions == 0 then

        return
            "Build Brain: descreve o efeito, animação ou comportamento que você quer montar."

    end


    return
        "Build Brain — estrutura sugerida: "
        ..table.concat(
            Suggestions,
            " → "
        )
        ..". Isso é uma sugestão de organização local, não execução automática no Workshop."

end


--========================================================
-- ROYAL EASTER EGG
--========================================================

local RoyalBusy =
    false

local RoyalCooldown =
    0


local RoyalOverlay =
    Instance.new("Frame")

RoyalOverlay.Size =
    UDim2.fromScale(
        1,
        1
    )

RoyalOverlay.BackgroundColor3 =
    Color3.fromRGB(
        255,
        210,
        70
    )

RoyalOverlay.BackgroundTransparency =
    1

RoyalOverlay.Visible =
    false

RoyalOverlay.ZIndex =
    800

RoyalOverlay.Parent =
    Gui


local Crown =
    Instance.new("TextLabel")

Crown.AnchorPoint =
    Vector2.new(
        0.5,
        0.5
    )

Crown.Position =
    UDim2.fromScale(
        0.5,
        0.42
    )

Crown.Size =
    UDim2.fromOffset(
        180,
        90
    )

Crown.BackgroundTransparency =
    1

Crown.Text =
    "👑"

Crown.TextSize =
    70

Crown.TextTransparency =
    1

Crown.ZIndex =
    802

Crown.Parent =
    RoyalOverlay

ApplyFont(Crown)


local RoyalText =
    Instance.new("TextLabel")

RoyalText.AnchorPoint =
    Vector2.new(
        0.5,
        0
    )

RoyalText.Position =
    UDim2.fromScale(
        0.5,
        0.56
    )

RoyalText.Size =
    UDim2.fromOffset(
        420,
        45
    )

RoyalText.BackgroundTransparency =
    1

RoyalText.TextColor3 =
    Color3.fromRGB(
        255,
        240,
        150
    )

RoyalText.TextSize =
    19

RoyalText.TextTransparency =
    1

RoyalText.ZIndex =
    802

RoyalText.Parent =
    RoyalOverlay

ApplyFont(
    RoyalText,
    Enum.FontWeight.Bold
)


local RoyalAura =
    Instance.new("Frame")

RoyalAura.AnchorPoint =
    Vector2.new(
        0.5,
        0.5
    )

RoyalAura.Position =
    UDim2.fromScale(
        0.5,
        0.5
    )

RoyalAura.Size =
    UDim2.fromOffset(
        70,
        70
    )

RoyalAura.BackgroundTransparency =
    1

RoyalAura.ZIndex =
    801

RoyalAura.Parent =
    RoyalOverlay


local RoyalStroke =
    Instance.new("UIStroke")

RoyalStroke.Color =
    Color3.fromRGB(
        255,
        220,
        80
    )

RoyalStroke.Thickness =
    3

RoyalStroke.Transparency =
    1

RoyalStroke.Parent =
    RoyalAura


local function RoyalMessage()

    if CurrentLanguage == "pt" then

        return
            "REI BACON DETECTADO 👑"

    elseif CurrentLanguage == "en" then

        return
            "KING BACON DETECTED 👑"

    end


    return
        "REY BACON DETECTADO 👑"

end


local function TriggerRoyalEgg()

    local Now =
        os.clock()


    if RoyalBusy then
        return
    end


    if Now - RoyalCooldown < 3 then
        return
    end


    RoyalCooldown =
        Now

    RoyalBusy =
        true

    Session.EasterEggs += 1

    UnlockAchievement(
        "Royal Presence",
        "Triggered the Rei Bacon Easter Egg."
    )


    RoyalText.Text =
        RoyalMessage()

    RoyalOverlay.Visible =
        true


    TweenService:Create(
        RoyalOverlay,
        TweenInfo.new(
            0.2
        ),
        {
            BackgroundTransparency = 0.88
        }
    ):Play()


    TweenService:Create(
        Crown,
        TweenInfo.new(
            0.5,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.Out
        ),
        {
            TextTransparency = 0,
            TextSize = 80
        }
    ):Play()


    TweenService:Create(
        RoyalText,
        TweenInfo.new(
            0.6
        ),
        {
            TextTransparency = 0
        }
    ):Play()


    TweenService:Create(
        RoyalAura,
        TweenInfo.new(
            0.9
        ),
        {
            Size =
                UDim2.fromOffset(
                    330,
                    330
                )
        }
    ):Play()


    TweenService:Create(
        RoyalStroke,
        TweenInfo.new(
            0.3
        ),
        {
            Transparency = 0
        }
    ):Play()


    task.wait(
        1.4
    )


    TweenService:Create(
        RoyalOverlay,
        TweenInfo.new(
            0.4
        ),
        {
            BackgroundTransparency = 1
        }
    ):Play()


    TweenService:Create(
        Crown,
        TweenInfo.new(
            0.3
        ),
        {
            TextTransparency = 1
        }
    ):Play()


    TweenService:Create(
        RoyalText,
        TweenInfo.new(
            0.3
        ),
        {
            TextTransparency = 1
        }
    ):Play()


    TweenService:Create(
        RoyalStroke,
        TweenInfo.new(
            0.3
        ),
        {
            Transparency = 1
        }
    ):Play()


    task.wait(
        0.4
    )


    RoyalOverlay.Visible =
        false

    RoyalAura.Size =
        UDim2.fromOffset(
            70,
            70
        )

    RoyalBusy =
        false

end


--========================================================
-- AI
--========================================================

local function HasWord(
    Text,
    Word
)

    return
        Text:match(
            "%f[%a]"
            ..Word
            .."%f[%A]"
        )
        ~= nil

end


local function AIResponse(
    Query
)

    local S =
        string.lower(
            Query
        )


    Remember(
        Query
    )


    if HasWord(
        S,
        "rei"
    )
        or
        HasWord(
            S,
            "king"
        )
        or
        HasWord(
            S,
            "rey"
        )
        or
        S:find(
            "bacon"
        )
    then

        task.spawn(
            TriggerRoyalEgg
        )

        return RoyalMessage()

    end


    if S == "/status" then

        return
            "Session: "
            .."Builds="
            ..#BuildProfiles
            .." • Meshes="
            ..#Meshes
            .." • Actions="
            ..Session.BuilderActions
            .." • Eggs="
            ..Session.EasterEggs
            .." • Snapshots="
            ..#Snapshots

    end


    if S == "/meshes" then

        return
            "Meshes registrados: "
            ..#Meshes

    end


    if S == "/builds" then

        return
            "Builds registrados: "
            ..#BuildProfiles

    end


    if S == "/egg" then

        task.spawn(
            TriggerRoyalEgg
        )

        return RoyalMessage()

    end


    if S == "/memory" then

        return
            "Jin Memory: "
            ..#JinMemory
            .." registros nesta sessão."

    end


    if S == "/creator" then

        if IsOwner then

            return
                "👑 Creator Mode disponível para Uo63m."

        end

        return
            "Creator Mode não está disponível para este jogador."

    end


    if S == "/challenge" then

        UpdateChallenges()

        local Done = 0

        for _,Challenge in ipairs(
            Challenges
        ) do

            if Challenge.Completed then
                Done += 1
            end

        end

        return
            "Challenges concluídos: "
            ..Done
            .."/"
            ..#Challenges

    end


    if S == "/help" then

        return
            "/status • /meshes • /builds • /memory • /creator • /challenge • /egg • /clear"

    end


    if S:find(
        "gojo"
    )
        or
        S:find(
            "infinito"
        )
    then

        return
            BuildBrain(
                Query
            )

    end


    if S:find(
        "branch"
    )
        or
        S:find(
            "galho"
        )
    then

        return
            "Branch/Galho trabalha com ramificação lógica."

    end


    if S:find(
        "connect"
    )
    then

        return
            "Connect organiza conexões entre partes do sistema."

    end


    if S:find(
        "light"
    )
    then

        return
            "Light Block trabalha com o sistema de ligar/desligar da lógica."

    end


    if S:find(
        "npc"
    )
    then

        return
            "NPC Block trabalha com NPCs."

    end


    if S:find(
        "animation"
    )
        or
        S:find(
            "animação"
        )
        or
        S:find(
            "animacao"
        )
    then

        return
            "Animation trabalha com animações e timing."

    end


    if S:find(
        "vfx"
    )
    then

        return
            "VFX organiza efeitos visuais, timing e impacto."

    end


    if S:find(
        "sound"
    )
        or
        S:find(
            "som"
        )
    then

        return
            "Sound organiza áudio e seu timing."

    end


    if S:find(
        "mesh"
    )
    then

        return
            "Meshes são organizados localmente pelo Helper."

    end


    if S:find(
        "auto build"
    )
        or
        S:find(
            "autobuild"
        )
    then

        return
            "Auto Build cria perfis locais. Não executa uma API falsa do Workshop."

    end


    if S:find(
        "aura"
    )
    then

        return
            "Aura detectada. +999 ⚡"

    end


    if S == "oi"
        or
        S == "olá"
        or
        S == "ola"
        or
        S == "hi"
        or
        S == "hello"
    then

        if Personality == "chill" then

            return
                "Aí sim 😎 Jin na área. Manda a missão."

        elseif Personality == "technical" then

            return
                "Jin online. Sistema pronto para análise."

        elseif Personality == "creator" then

            return
                "Creator system online. Bora construir."

        elseif Personality == "experimental" then

            return
                "Jin online... modo experimental carregado."

        end


        return
            "Fala! 👋 Jin aqui. Qual é a missão?"

    end


    if S:find(
        "quem é você"
    )
        or
        S:find(
            "quem e voce"
        )
        or
        S:find(
            "who are you"
        )
    then

        return
            "Eu sou Jin, assistente interno do JJS Helper."

    end


    return
        T("unknown")

end


--========================================================
-- AI UI
--========================================================

local Chat =
    Instance.new("ScrollingFrame")

Chat.Position =
    UDim2.fromOffset(
        7,
        56
    )

Chat.Size =
    UDim2.new(
        1,
        -14,
        1,
        -98
    )

Chat.BackgroundColor3 =
    C.Button

Chat.BackgroundTransparency =
    0.2

Chat.BorderSizePixel =
    0

Chat.ScrollBarThickness =
    2

Chat.Parent =
    AI


local ChatCorner =
    Instance.new("UICorner")

ChatCorner.CornerRadius =
    UDim.new(
        0,
        8
    )

ChatCorner.Parent =
    Chat


local ChatLayout =
    Instance.new("UIListLayout")

ChatLayout.Padding =
    UDim.new(
        0,
        5
    )

ChatLayout.Parent =
    Chat


local ChatPadding =
    Instance.new("UIPadding")

ChatPadding.PaddingTop =
    UDim.new(
        0,
        7
    )

ChatPadding.PaddingLeft =
    UDim.new(
        0,
        7
    )

ChatPadding.PaddingRight =
    UDim.new(
        0,
        7
    )

ChatPadding.Parent =
    Chat


local function AddMessage(
    Text,
    IsUser
)

    Session.Messages += 1


    local Label =
        Instance.new(
            "TextLabel"
        )

    Label.Size =
        UDim2.new(
            1,
            0,
            0,
            0
        )

    Label.AutomaticSize =
        Enum.AutomaticSize.Y

    Label.BackgroundTransparency =
        1

    Label.Text =
        (
            IsUser
            and
            "Você: "
            or
            "Jin: "
        )
        ..
        Text

    Label.TextColor3 =
        IsUser
        and
        C.Text
        or
        C.Soft

    Label.TextSize =
        9

    Label.TextWrapped =
        true

    Label.TextXAlignment =
        Enum.TextXAlignment.Left

    Label.Parent =
        Chat

    ApplyFont(Label)


    task.defer(
        function()

            Chat.CanvasSize =
                UDim2.fromOffset(
                    0,
                    ChatLayout.AbsoluteContentSize.Y
                    + 15
                )

            Chat.CanvasPosition =
                Vector2.new(
                    0,
                    math.max(
                        0,
                        Chat.AbsoluteCanvasSize.Y
                    )
                )

        end
    )

end


local function ClearChat()

    for _,Child in ipairs(
        Chat:GetChildren()
    ) do

        if Child:IsA(
            "TextLabel"
        ) then

            Child:Destroy()

        end

    end


    Session.Messages = 0

end


local Input =
    Instance.new("TextBox")

Input.Position =
    UDim2.new(
        0,
        7,
        1,
        -38
    )

Input.Size =
    UDim2.new(
        1,
        -67,
        0,
        31
    )

Input.BackgroundColor3 =
    C.Button

Input.BorderSizePixel =
    0

Input.PlaceholderText =
    T("placeholder")

Input.PlaceholderColor3 =
    C.Soft

Input.TextColor3 =
    C.Text

Input.TextSize =
    9

Input.ClearTextOnFocus =
    false

Input.Parent =
    AI

ApplyFont(Input)


local Send =
    Instance.new("TextButton")

Send.Size =
    UDim2.fromOffset(
        47,
        31
    )

Send.Position =
    UDim2.new(
        1,
        -54,
        1,
        -38
    )

Send.BackgroundColor3 =
    C.AccentDark

Send.BorderSizePixel =
    0

Send.Text =
    "➤"

Send.TextColor3 =
    C.Text

Send.TextSize =
    14

Send.Parent =
    AI

ApplyFont(Send)


local function Submit()

    local Query =
        Input.Text

    if Query == "" then
        return
    end


    Input.Text =
        ""


    if string.lower(
        Query
    ) == "/clear" then

        ClearChat()

        AddMessage(
            "Chat limpo.",
            false
        )

        return

    end


    AddMessage(
        Query,
        true
    )


    RecordReplay(
        Query
    )


    task.wait(
        0.05
    )


    AddMessage(
        AIResponse(
            Query
        ),
        false
    )

end


Send.Activated:Connect(
    Submit
)


Input.FocusLost:Connect(
    function(
        EnterPressed
    )

        if EnterPressed then
            Submit()
        end

    end
)


AddMessage(
    "Fala! 👋 Jin aqui. Qual é a missão?",
    false
)


--========================================================
-- TOOLS BUTTONS
--========================================================

ToolButton(
    "BUILD VAULT",
    function()

        RefreshVault()

        VaultFrame.Visible =
            true

    end
)


ToolButton(
    "SNAPSHOT",
    CreateSnapshot
)


ToolButton(
    "SANDBOX",
    ToggleSandbox
)


ToolButton(
    "VALIDATOR",
    Validate
)


ToolButton(
    "CINEMATIC PREVIEW",
    CinematicPreview
)


ToolButton(
    "REPLAY",
    PlayReplay
)


ToolButton(
    "NEW BUILD VERSION",
    CreateBuildVersion
)


ToolButton(
    "COMPARE BUILDS",
    function()

        if #BuildProfiles >= 2 then

            CompareBuilds(
                BuildProfiles[
                    #BuildProfiles - 1
                ],
                BuildProfiles[
                    #BuildProfiles
                ]
            )

        else

            Notify(
                "Precisa de pelo menos 2 versões."
            )

        end

    end
)


ToolButton(
    "ASSET INSPECTOR",
    function()

        InspectAsset(
            Meshes[#Meshes]
        )

    end
)


ToolButton(
    "SESSION INFO",
    function()

        Notify(
            "Builds="
            ..#BuildProfiles
            .." • Meshes="
            ..#Meshes
            .." • Actions="
            ..Session.BuilderActions
        )

    end
)


ToolButton(
    "CREATE LOCAL BUILD",
    function()

        local Build =
            GenerateBuild(
                "Untitled Build",
                "Custom"
            )

        Notify(
            "Build criado: "
            ..Build.Name
        )

    end
)


ToolButton(
    "EXPORT LOCAL",
    function()

        local Data = {

            Builds =
                BuildProfiles,

            Meshes =
                Meshes,

            History =
                BuildHistory,

            Snapshots =
                Snapshots,

            Achievements =
                Achievements,

            Language =
                CurrentLanguage,

            Personality =
                Personality,

            Theme =
                CurrentThemeName
        }


        local Success,
            Result =
            pcall(
                function()

                    return
                        HttpService:JSONEncode(
                            Data
                        )

                end
            )


        if Success then

            if setclipboard then

                pcall(
                    function()

                        setclipboard(
                            Result
                        )

                    end
                )

            end


            UnlockAchievement(
                "Exporter",
                "Exported local Helper data."
            )


            Notify(
                "Export local criado."
            )

        end

    end
)


--========================================================
-- GUIDE
--========================================================

local GuideText =
    Instance.new("TextLabel")

GuideText.Size =
    UDim2.new(
        1,
        -16,
        1,
        -62
    )

GuideText.Position =
    UDim2.fromOffset(
        8,
        55
    )

GuideText.BackgroundColor3 =
    C.Button

GuideText.BackgroundTransparency =
    0.2

GuideText.BorderSizePixel =
    0

GuideText.TextColor3 =
    C.Text

GuideText.TextSize =
    9

GuideText.TextWrapped =
    true

GuideText.TextXAlignment =
    Enum.TextXAlignment.Left

GuideText.TextYAlignment =
    Enum.TextYAlignment.Top

GuideText.Parent =
    Guide

ApplyFont(GuideText)


local GuidePadding =
    Instance.new("UIPadding")

GuidePadding.PaddingTop =
    UDim.new(
        0,
        10
    )

GuidePadding.PaddingLeft =
    UDim.new(
        0,
        10
    )

GuidePadding.PaddingRight =
    UDim.new(
        0,
        10
    )

GuidePadding.Parent =
    GuideText


GuideText.Text =
    "JJS HELPER 3.0\n\n"
    ..
    "BUILDER\n"
    .."Organiza sequências locais.\n\n"
    ..
    "BUILD VAULT\n"
    .."Gerencia perfis e versões locais.\n\n"
    ..
    "SNAPSHOT\n"
    .."Salva um estado local da sessão.\n\n"
    ..
    "SANDBOX\n"
    .."Área isolada para testar configurações.\n\n"
    ..
    "SKILL DNA\n"
    .."POWER • SPEED • RANGE • COMPLEXITY\n\n"
    ..
    "CINEMATIC PREVIEW\n"
    .."Visualiza uma sequência conceitual.\n\n"
    ..
    "REPLAY\n"
    .."Reproduz ações registradas pelo Helper.\n\n"
    ..
    "JIN MEMORY\n"
    .."Memória temporária da sessão.\n\n"
    ..
    "IMPORTANTE\n"
    .."Esses sistemas são internos ao Helper e não representam uma API oficial do Workshop."


--========================================================
-- SETTINGS
--========================================================

local SettingsList =
    Instance.new("ScrollingFrame")

SettingsList.Position =
    UDim2.fromOffset(
        7,
        55
    )

SettingsList.Size =
    UDim2.new(
        1,
        -14,
        1,
        -62
    )

SettingsList.BackgroundTransparency =
    1

SettingsList.BorderSizePixel =
    0

SettingsList.ScrollBarThickness =
    2

SettingsList.Parent =
    Settings


local SettingsLayout =
    Instance.new("UIListLayout")

SettingsLayout.Padding =
    UDim.new(
        0,
        6
    )

SettingsLayout.Parent =
    SettingsList


local function SettingsButton(
    Text
)

    local Button =
        Instance.new(
            "TextButton"
        )

    Button.Size =
        UDim2.new(
            1,
            -4,
            0,
            34
        )

    Button.BackgroundColor3 =
        C.Button

    Button.BackgroundTransparency =
        0.1

    Button.BorderSizePixel =
        0

    Button.Text =
        Text

    Button.TextColor3 =
        C.Text

    Button.TextSize =
        10

    Button.Parent =
        SettingsList

    ApplyFont(
        Button,
        Enum.FontWeight.SemiBold
    )


    local Corner =
        Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(
            0,
            7
        )

    Corner.Parent =
        Button


    return Button

end


--========================================================
-- LANGUAGE
--========================================================

local LanguageButton =
    SettingsButton(
        "Idioma: Português"
    )


LanguageButton.Activated:Connect(
    function()

        if CurrentLanguage == "pt" then

            CurrentLanguage =
                "en"

        elseif CurrentLanguage == "en" then

            CurrentLanguage =
                "es"

        else

            CurrentLanguage =
                "pt"

        end


        local Names = {

            pt = "Português",

            en = "English",

            es = "Español"
        }


        LanguageButton.Text =
            T("language")
            ..": "
            ..Names[
                CurrentLanguage
            ]


        Input.PlaceholderText =
            T("placeholder")


        for Page,Data in pairs(
            PageTitles
        ) do

            Data.Title.Text =
                T(
                    Data.TitleKey
                )

            Data.Subtitle.Text =
                T(
                    Data.SubKey
                )

        end


        UpdateHome()

        RefreshMeshes()

        Notify(
            "Idioma alterado."
        )

    end
)


--========================================================
-- PERSONALITY
--========================================================

local PersonalityOrder = {

    "normal",

    "chill",

    "technical",

    "creator",

    "experimental"
}


local PersonalityIndex =
    1


local PersonalityButton =
    SettingsButton(
        "Personalidade: Normal"
    )


PersonalityButton.Activated:Connect(
    function()

        PersonalityIndex += 1


        if PersonalityIndex >
            #PersonalityOrder
        then

            PersonalityIndex =
                1

        end


        Personality =
            PersonalityOrder[
                PersonalityIndex
            ]


        PersonalityButton.Text =
            T("personality")
            ..": "
            ..PersonalityNames[
                Personality
            ]

    end
)


--========================================================
-- THEME
--========================================================

local ThemeOrder = {

    "Blue",

    "Purple",

    "Red",

    "Green",

    "Gold",

    "Dark",

    "Cyan"
}


local ThemeIndex =
    1


local ThemeButton =
    SettingsButton(
        "Tema: Blue"
    )


local function ApplyTheme()

    C =
        Themes[
            CurrentThemeName
        ]
        or
        Themes.Blue


    if IsOwner
        and
        OwnerModeEnabled
    then

        C =
            Themes.Creator

    end


    Main.BackgroundColor3 =
        C.Panel

    Main.BackgroundTransparency =
        CustomTheme.Enabled
        and
        CustomTheme.Transparency
        or
        HUD.Transparency


    MainStroke.Color =
        C.Stroke


    MainCorner.CornerRadius =
        UDim.new(
            0,
            HUD.CornerRadius
        )


    for _,Object in ipairs(
        Gui:GetDescendants()
    ) do

        if Object:IsA(
            "TextLabel"
        )
            or
            Object:IsA(
                "TextButton"
            )
            or
            Object:IsA(
                "TextBox"
            )
        then

            if Object ~= OwnerBadge then

                if Object.TextColor3 ~= Color3.fromRGB(
                    255,
                    235,
                    130
                )
                then

                    Object.TextColor3 =
                        C.Text

                end

            end

        end

    end


    Title.TextColor3 =
        C.Text


    if OwnerModeEnabled
        and
        IsOwner
    then

        Display.TextColor3 =
            Color3.fromRGB(
                255,
                235,
                130
            )

        OwnerBadge.Text =
            "✦ OWNER"

        OwnerBadge.Visible =
            true

        AvatarStroke.Color =
            Color3.fromRGB(
                255,
                210,
                70
            )

        AvatarStroke.Thickness =
            2

    else

        Display.TextColor3 =
            C.Soft

        OwnerBadge.Visible =
            false

        AvatarStroke.Color =
            C.Stroke

        AvatarStroke.Thickness =
            1

    end

end


ThemeButton.Activated:Connect(
    function()

        ThemeIndex += 1


        if ThemeIndex >
            #ThemeOrder
        then

            ThemeIndex =
                1

        end


        CurrentThemeName =
            ThemeOrder[
                ThemeIndex
            ]


        ThemeButton.Text =
            T("theme")
            ..": "
            ..CurrentThemeName


        ApplyTheme()

    end
)


--========================================================
-- CUSTOM THEME
--========================================================

local CustomThemeButton =
    SettingsButton(
        "Custom Theme: OFF"
    )


CustomThemeButton.Activated:Connect(
    function()

        CustomTheme.Enabled =
            not CustomTheme.Enabled


        CustomThemeButton.Text =
            "Custom Theme: "
            ..
            (
                CustomTheme.Enabled
                and
                "ON"
                or
                "OFF"
            )


        ApplyTheme()

        Notify(
            "Custom Theme "
            ..
            (
                CustomTheme.Enabled
                and
                "ativado."
                or
                "desativado."
            )
        )

    end
)


--========================================================
-- DYNAMIC BACKGROUND
--========================================================

local DynamicButton =
    SettingsButton(
        "Dynamic Background: ON"
    )


DynamicButton.Activated:Connect(
    function()

        CustomTheme.DynamicBackground =
            not CustomTheme.DynamicBackground


        BackgroundFX.Visible =
            CustomTheme.DynamicBackground


        DynamicButton.Text =
            "Dynamic Background: "
            ..
            (
                CustomTheme.DynamicBackground
                and
                "ON"
                or
                "OFF"
            )

    end
)


--========================================================
-- HUD
--========================================================

local HUDButton =
    SettingsButton(
        "HUD Scale: 100%"
    )


HUDButton.Activated:Connect(
    function()

        HUD.Scale +=
            0.1


        if HUD.Scale > 1.2 then

            HUD.Scale =
                0.7

        end


        UIScale.Scale =
            HUD.Scale


        HUDButton.Text =
            "HUD Scale: "
            ..math.floor(
                HUD.Scale * 100
            )
            .."%"

    end
)


--========================================================
-- OWNER MODE
--========================================================

local OwnerButton =
    SettingsButton(
        T("ownerOff")
    )


OwnerButton.Visible =
    IsOwner


OwnerButton.Activated:Connect(
    function()

        if not IsOwner then
            return
        end


        OwnerModeEnabled =
            not OwnerModeEnabled


        OwnerButton.Text =
            OwnerModeEnabled
            and
            T("ownerOn")
            or
            T("ownerOff")


        ApplyTheme()

        if OwnerModeEnabled then

            UnlockAchievement(
                "Creator Mode",
                "Activated Creator Mode."
            )

            Notify(
                "👑 Creator Mode ativado."
            )

        else

            Notify(
                "Creator Mode desativado."
            )

        end

    end
)


--========================================================
-- CREATOR DASHBOARD
--========================================================

local CreatorDashboard =
    SettingsButton(
        "👑 CREATOR DASHBOARD"
    )

CreatorDashboard.Visible =
    IsOwner


CreatorDashboard.Activated:Connect(
    function()

        if not IsOwner then
            return
        end


        Notify(
            "Creator Dashboard"
            ..
            " | Builds="
            ..#BuildProfiles
            .." | Actions="
            ..Session.BuilderActions
            .." | Eggs="
            ..Session.EasterEggs
        )

    end
)


--========================================================
-- SECRET ROOM
--========================================================

local SecretButton =
    SettingsButton(
        "???"
    )


local SecretUnlocked =
    false


SecretButton.Activated:Connect(
    function()

        if not SecretUnlocked then

            SecretUnlocked =
                true

            UnlockAchievement(
                "Secret Room",
                "Found the hidden room."
            )

            Notify(
                "🔓 SECRET ROOM DESBLOQUEADA."
            )

        else

            Notify(
                "👁️ Jin is watching..."
            )

        end

    end
)


--========================================================
-- CREATOR CREDITS
--========================================================

local CreditsButton =
    SettingsButton(
        T("credits")
    )

CreditsButton.Visible =
    IsOwner


local CreditsFrame =
    Instance.new("Frame")

CreditsFrame.Size =
    UDim2.fromScale(
        1,
        1
    )

CreditsFrame.BackgroundColor3 =
    Color3.fromRGB(
        4,
        6,
        10
    )

CreditsFrame.BackgroundTransparency =
    1

CreditsFrame.Visible =
    false

CreditsFrame.ZIndex =
    900

CreditsFrame.Parent =
    Gui


local CreditsName =
    Instance.new("TextLabel")

CreditsName.Size =
    UDim2.new(
        0.55,
        0,
        0,
        35
    )

CreditsName.Position =
    UDim2.new(
        -0.55,
        0,
        0.16,
        0
    )

CreditsName.BackgroundTransparency =
    1

CreditsName.Text =
    "FÁRMACO AURA"

CreditsName.TextColor3 =
    Color3.fromRGB(
        255,
        235,
        130
    )

CreditsName.TextSize =
    20

CreditsName.TextXAlignment =
    Enum.TextXAlignment.Left

CreditsName.ZIndex =
    902

CreditsName.Parent =
    CreditsFrame

ApplyFont(
    CreditsName,
    Enum.FontWeight.Bold
)


local CreditsText =
    Instance.new("TextLabel")

CreditsText.Size =
    UDim2.new(
        0.55,
        0,
        0.55,
        0
    )

CreditsText.Position =
    UDim2.new(
        -0.55,
        0,
        0.29,
        0
    )

CreditsText.BackgroundTransparency =
    1

CreditsText.Text =
    "Criador / Desenvolvedor\n"
    ..
    "Fármaco Aura\n\n"
    ..
    "Roblox / Personagem\n"
    ..
    "Uo63m — ReiBacon 🥓\n\n"
    ..
    "Assistente / Desenvolvimento\n"
    ..
    "Jin AI\n\n"
    ..
    "Projeto\n"
    ..
    "JJS Helper\n\n"
    ..
    "Minha jornada\n"
    ..
    "Construindo, testando e aprendendo."

CreditsText.TextColor3 =
    Color3.fromRGB(
        235,
        238,
        245
    )

CreditsText.TextSize =
    10

CreditsText.TextWrapped =
    true

CreditsText.TextXAlignment =
    Enum.TextXAlignment.Left

CreditsText.TextYAlignment =
    Enum.TextYAlignment.Top

CreditsText.ZIndex =
    902

CreditsText.Parent =
    CreditsFrame

ApplyFont(
    CreditsText
)


local CreditsAvatar =
    Instance.new("ImageLabel")

CreditsAvatar.Size =
    UDim2.fromOffset(
        150,
        267
    )

CreditsAvatar.Position =
    UDim2.new(
        1.05,
        0,
        0.5,
        -133
    )

CreditsAvatar.BackgroundColor3 =
    Color3.fromRGB(
        10,
        12,
        18
    )

CreditsAvatar.BackgroundTransparency =
    0.08

CreditsAvatar.BorderSizePixel =
    0

CreditsAvatar.ScaleType =
    Enum.ScaleType.Crop

CreditsAvatar.ImageTransparency =
    1

CreditsAvatar.ZIndex =
    902

CreditsAvatar.Parent =
    CreditsFrame


local CreditsAvatarCorner =
    Instance.new("UICorner")

CreditsAvatarCorner.CornerRadius =
    UDim.new(
        0,
        9
    )

CreditsAvatarCorner.Parent =
    CreditsAvatar


local CreditsAvatarStroke =
    Instance.new("UIStroke")

CreditsAvatarStroke.Color =
    Color3.fromRGB(
        255,
        210,
        70
    )

CreditsAvatarStroke.Thickness =
    2

CreditsAvatarStroke.Transparency =
    1

CreditsAvatarStroke.Parent =
    CreditsAvatar


pcall(function()

    CreditsAvatar.Image =
        Players:GetUserThumbnailAsync(
            Player.UserId,
            Enum.ThumbnailType.AvatarThumbnail,
            Enum.ThumbnailSize.Size420x420
        )

end)


local function PlayCredits()

    if not IsOwner then
        return
    end


    CreditsFrame.Visible =
        true


    CreditsFrame.BackgroundTransparency =
        1


    CreditsName.Position =
        UDim2.new(
            -0.55,
            0,
            0.16,
            0
        )


    CreditsText.Position =
        UDim2.new(
            -0.55,
            0,
            0.29,
            0
        )


    CreditsAvatar.Position =
        UDim2.new(
            1.05,
            0,
            0.5,
            -133
        )


    CreditsName.TextTransparency =
        1

    CreditsText.TextTransparency =
        1

    CreditsAvatar.ImageTransparency =
        1

    CreditsAvatarStroke.Transparency =
        1


    TweenService:Create(
        CreditsFrame,
        TweenInfo.new(
            0.45
        ),
        {
            BackgroundTransparency = 0.04
        }
    ):Play()


    TweenService:Create(
        CreditsName,
        TweenInfo.new(
            0.75,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Position =
                UDim2.new(
                    0.04,
                    0,
                    0.16,
                    0
                ),

            TextTransparency = 0
        }
    ):Play()


    TweenService:Create(
        CreditsText,
        TweenInfo.new(
            0.8,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Position =
                UDim2.new(
                    0.04,
                    0,
                    0.29,
                    0
                ),

            TextTransparency = 0
        }
    ):Play()


    TweenService:Create(
        CreditsAvatar,
        TweenInfo.new(
            0.8,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Position =
                UDim2.new(
                    0.67,
                    0,
                    0.5,
                    -133
                ),

            ImageTransparency = 0
        }
    ):Play()


    task.wait(
        0.8
    )


    TweenService:Create(
        CreditsAvatarStroke,
        TweenInfo.new(
            0.4
        ),
        {
            Transparency = 0
        }
    ):Play()


    task.wait(
        3
    )


    TweenService:Create(
        CreditsFrame,
        TweenInfo.new(
            0.45
        ),
        {
            BackgroundTransparency = 1
        }
    ):Play()


    TweenService:Create(
        CreditsName,
        TweenInfo.new(
            0.3
        ),
        {
            TextTransparency = 1
        }
    ):Play()


    TweenService:Create(
        CreditsText,
        TweenInfo.new(
            0.3
        ),
        {
            TextTransparency = 1
        }
    ):Play()


    TweenService:Create(
        CreditsAvatar,
        TweenInfo.new(
            0.3
        ),
        {
            ImageTransparency = 1
        }
    ):Play()


    task.wait(
        0.5
    )


    CreditsFrame.Visible =
        false

end


CreditsButton.Activated:Connect(
    PlayCredits
)


--========================================================
-- CLOSE CONFIRMATION
--========================================================

local Confirm =
    Instance.new("Frame")

Confirm.Size =
    UDim2.fromScale(
        1,
        1
    )

Confirm.BackgroundColor3 =
    Color3.fromRGB(
        0,
        0,
        0
    )

Confirm.BackgroundTransparency =
    0.3

Confirm.Visible =
    false

Confirm.ZIndex =
    700

Confirm.Parent =
    Main


local ConfirmBox =
    Instance.new("Frame")

ConfirmBox.Size =
    UDim2.fromOffset(
        270,
        125
    )

ConfirmBox.Position =
    UDim2.new(
        0.5,
        -135,
        0.5,
        -62
    )

ConfirmBox.BackgroundColor3 =
    C.Panel2

ConfirmBox.BorderSizePixel =
    0

ConfirmBox.ZIndex =
    701

ConfirmBox.Parent =
    Confirm


local ConfirmTitle =
    Instance.new("TextLabel")

ConfirmTitle.Size =
    UDim2.new(
        1,
        -20,
        0,
        25
    )

ConfirmTitle.Position =
    UDim2.fromOffset(
        10,
        10
    )

ConfirmTitle.BackgroundTransparency =
    1

ConfirmTitle.Text =
    T("closeTitle")

ConfirmTitle.TextColor3 =
    C.Text

ConfirmTitle.TextSize =
    13

ConfirmTitle.ZIndex =
    702

ConfirmTitle.Parent =
    ConfirmBox

ApplyFont(
    ConfirmTitle,
    Enum.FontWeight.Bold
)


local ConfirmText =
    Instance.new("TextLabel")

ConfirmText.Size =
    UDim2.new(
        1,
        -20,
        0,
        38
    )

ConfirmText.Position =
    UDim2.fromOffset(
        10,
        38
    )

ConfirmText.BackgroundTransparency =
    1

ConfirmText.Text =
    T("closeText")

ConfirmText.TextColor3 =
    C.Soft

ConfirmText.TextSize =
    9

ConfirmText.TextWrapped =
    true

ConfirmText.ZIndex =
    702

ConfirmText.Parent =
    ConfirmBox

ApplyFont(
    ConfirmText
)


local Cancel =
    Instance.new("TextButton")

Cancel.Size =
    UDim2.fromOffset(
        105,
        30
    )

Cancel.Position =
    UDim2.fromOffset(
        15,
        84
    )

Cancel.BackgroundColor3 =
    C.Button

Cancel.BorderSizePixel =
    0

Cancel.Text =
    T("cancel")

Cancel.TextColor3 =
    C.Text

Cancel.TextSize =
    9

Cancel.ZIndex =
    702

Cancel.Parent =
    ConfirmBox

ApplyFont(Cancel)


local ConfirmClose =
    Instance.new("TextButton")

ConfirmClose.Size =
    UDim2.fromOffset(
        105,
        30
    )

ConfirmClose.Position =
    UDim2.new(
        1,
        -120,
        0,
        84
    )

ConfirmClose.BackgroundColor3 =
    C.AccentDark

ConfirmClose.BorderSizePixel =
    0

ConfirmClose.Text =
    T("close")

ConfirmClose.TextColor3 =
    C.Text

ConfirmClose.TextSize =
    9

ConfirmClose.ZIndex =
    702

ConfirmClose.Parent =
    ConfirmBox

ApplyFont(ConfirmClose)


Close.Activated:Connect(
    function()

        Confirm.Visible =
            true

    end
)


Cancel.Activated:Connect(
    function()

        Confirm.Visible =
            false

    end
)


ConfirmClose.Activated:Connect(
    function()

        Gui:Destroy()

    end
)


--========================================================
-- MINIMIZE
--========================================================

local Minimized =
    false


Min.Activated:Connect(
    function()

        Minimized =
            not Minimized


        Body.Visible =
            not Minimized


        if Minimized then

            Main.Size =
                UDim2.fromOffset(
                    MAIN_WIDTH,
                    48
                )

        else

            Main.Size =
                UDim2.fromOffset(
                    MAIN_WIDTH,
                    MAIN_HEIGHT
                )

        end

    end
)


--========================================================
-- DRAG
--========================================================

local Dragging =
    false

local DragStart

local StartPosition


Header.InputBegan:Connect(
    function(
        InputObject
    )

        if InputObject.UserInputType ==
            Enum.UserInputType.MouseButton1
            or
            InputObject.UserInputType ==
            Enum.UserInputType.Touch
        then

            Dragging =
                true

            DragStart =
                InputObject.Position

            StartPosition =
                Main.Position

        end

    end
)


Header.InputEnded:Connect(
    function(
        InputObject
    )

        if InputObject.UserInputType ==
            Enum.UserInputType.MouseButton1
            or
            InputObject.UserInputType ==
            Enum.UserInputType.Touch
        then

            Dragging =
                false

        end

    end
)


UserInputService.InputChanged:Connect(
    function(
        InputObject
    )

        if not Dragging then
            return
        end


        if InputObject.UserInputType ==
            Enum.UserInputType.MouseMovement
            or
            InputObject.UserInputType ==
            Enum.UserInputType.Touch
        then

            local Delta =
                InputObject.Position
                - DragStart


            Main.Position =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset
                    + Delta.X,

                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset
                    + Delta.Y
                )

        end

    end
)


--========================================================
-- FINAL INITIALIZATION
--========================================================

ApplyTheme()

UpdateHome()

RefreshMeshes()

UpdateChallenges()

if IsOwner then

    Notify(
        "👑 Uo63m detectado. Creator Mode disponível."
    )

end


print(
    "[JJS Helper 3.0 COMPLETE] Loaded."
)

print(
    "[JJS Helper] Owner:",
    IsOwner
        and "Uo63m"
        or "Normal User"
)

print(
    "[JJS Helper] Theme:",
    CurrentThemeName
)

print(
    "[JJS Helper] Session initialized."
)
