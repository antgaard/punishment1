local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local preexisting = CoreGui:FindFirstChild("DiscontinuedUI")
if preexisting then preexisting:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DiscontinuedUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 420, 0, 220)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(99, 102, 241)
UIStroke.Thickness = 1.5
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame

local ScaleConstraint = Instance.new("UIScale")
ScaleConstraint.Parent = MainFrame

local function updateScale()
    local camera = Workspace.CurrentCamera
    if camera then
        local vp = camera.ViewportSize
        if vp.X < 460 or vp.Y < 260 then
            local scaleX = (vp.X - 20) / 420
            local scaleY = (vp.Y - 20) / 220
            ScaleConstraint.Scale = math.min(scaleX, scaleY, 1)
        else
            ScaleConstraint.Scale = 1
        end
    end
end
updateScale()
if Workspace.CurrentCamera then
    Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
end

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundTransparency = 1

local IconDot = Instance.new("Frame")
IconDot.Parent = TopBar
IconDot.Size = UDim2.new(0, 10, 0, 10)
IconDot.Position = UDim2.new(0, 16, 0.5, -5)
IconDot.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = IconDot

local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Parent = TopBar
HeaderTitle.Size = UDim2.new(1, -60, 1, 0)
HeaderTitle.Position = UDim2.new(0, 34, 0, 0)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Text = "NOTICE / TRIAL EXPIRED"
HeaderTitle.TextColor3 = Color3.fromRGB(200, 200, 215)
HeaderTitle.TextSize = 12
HeaderTitle.Font = Enum.Font.GothamBold
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -34, 0.5, -14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(150, 150, 165)
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.AutoButtonColor = false
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

local MainTitle = Instance.new("TextLabel")
MainTitle.Parent = MainFrame
MainTitle.Size = UDim2.new(1, -40, 0, 28)
MainTitle.Position = UDim2.new(0, 20, 0, 48)
MainTitle.BackgroundTransparency = 1
MainTitle.Text = "Free trial over!"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 20
MainTitle.Font = Enum.Font.GothamBold
MainTitle.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = MainFrame
SubTitle.Size = UDim2.new(1, -40, 0, 36)
SubTitle.Position = UDim2.new(0, 20, 0, 78)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Join new discord server to get full version."
SubTitle.TextColor3 = Color3.fromRGB(150, 150, 165)
SubTitle.TextSize = 13
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextWrapped = true
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Parent = MainFrame
DiscordBtn.Size = UDim2.new(1, -40, 0, 44)
DiscordBtn.Position = UDim2.new(0, 20, 1, -64)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
DiscordBtn.Text = "discord.gg/vmjseKFDBk  (Click to Copy)"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.TextSize = 13
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.AutoButtonColor = false
local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 10)
BtnCorner.Parent = DiscordBtn

local function dismissUI()
    TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.2)
    ScreenGui:Destroy()
end

CloseBtn.MouseButton1Click:Connect(dismissUI)

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.1), { BackgroundColor3 = Color3.fromRGB(239, 68, 68), TextColor3 = Color3.fromRGB(255, 255, 255) }):Play()
end)
CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.1), { BackgroundColor3 = Color3.fromRGB(25, 25, 35), TextColor3 = Color3.fromRGB(150, 150, 165) }):Play()
end)

DiscordBtn.MouseEnter:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(129, 140, 248) }):Play()
end)
DiscordBtn.MouseLeave:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(99, 102, 241) }):Play()
end)

DiscordBtn.MouseButton1Click:Connect(function()
    local invite = "discord.gg/vmjseKFDBk"
    if setclipboard then
        setclipboard(invite)
    elseif toclipboard then
        toclipboard(invite)
    end
    DiscordBtn.Text = "Copied to Clipboard! ✓"
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
    task.wait(2)
    DiscordBtn.Text = "discord.gg/vmjseKFDBk  (Click to Copy)"
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
end)

MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.BackgroundTransparency = 1
TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 420, 0, 220),
    BackgroundTransparency = 0
}):Play()
