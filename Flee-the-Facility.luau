-- comment by fxengif : thank you guys for support!!

-- comment by fxengif : it actually been 6 months as I don't making script in Roblox, sooo MY CODING SKILLS ARE DROPPED

-- comment by fxengif : for some people who don't know so i only study Lua/LuaU for 2-3 years :p

-- comment by fxengif : if you want to help us added more feature in this script then DM me on discord: @fxengif

-- comment by fxengif : there actually a lot of while loop used so performance can be badly but you know it fine

-- comment by fxengif : this is a quick update, sorry. i don't have enough time.

do --// FTF \\--
--> created by fxengif <--
local function c_caller(t, f, cf, ...)
    return (type(f) == t and (cf and f() or f)) or ...
end
local isluau_ = c_caller("function", isluau, true)
local function ReadVMVersion()
    if isluau_ then return "Luau" end -- comment by fxengif : some executor has this function in their global environment like krnl
    if _VERSION and type(_VERSION) == "string" then return _VERSION end -- comment by fxengif : in Roblox global environment variable
    return "Error"
end
local VM_Version = ReadVMVersion()
local ugc = game or Game
if not VM_Version:lower():find('luau') and VM_Version ~= 'Error' then ugc.GetService(ugc, 'Players').LocalPlayer:Kick('this game not supported LuaU..(this game still Using Old VM - Lua)') end
if not ugc:IsLoaded() then
local s: boolean = pcall(function()
    ugc:Load() -- comment by fxengif : force loaded if game not loaded itself
    ugc.Loaded:Wait()
end)
if not s then repeat task.wait() until ugc:IsLoaded() end
end
local this = {Version = '1.1.0'}
local FindServiceTery = function(s) return ugc:GetService(s) end
-- local newnative = c_caller("function", newcclosure, false, function(f) return f end)
local SetClipboard = c_caller("function", setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set))
local request, LoadRawString, setidentity, getidentity = http_request or request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request), (loadstring or load), (setidentity or setthreadidentity) or (setthreadcontext or set_thread_context), (getidentity or getthreadidentity) or (getthreadcontext or get_thread_context)
-- local old_identity = getidentity and getidentity() -- comment by fxengif : maybe i will use this later.
--> created by fxengif <--
local function c_type(ty, v, lu)
    local t = lu and typeof or type
    return t(v) == ty
end
-- end --
task.spawn(function()
    if (getidentity and setidentity and c_type("number", getidentity())) and getidentity() <= 5 then
        pcall(setidentity, 8)
    end
end)
function RequestLoadRawHttp(RequestHttp: string, Loaded: boolean, b: boolean): any?
    local s, sc = xpcall(function()
        local DoLoader, m = Loaded and LoadRawString or function(r) return function() return r end end, b or false
        local response;if ugc.HttpGet then response = ugc:HttpGet(RequestHttp, m)
        elseif ugc.HttpGetAsync then response = ugc:HttpGetAsync(RequestHttp, m)
        elseif request then response = request({Url = RequestHttp, Method = "GET"}).Body end;return DoLoader(response)()
    end, function(e)
        local BF = Instance.new("BindableFunction")
        BF.OnInvoke = function(c)
            if c ~= "Close" and SetClipboard then
                SetClipboard("Https :- "..RequestHttp.."\nError Detail :- "..e)
            end
        end
        if c_type("string", e) then
            FindServiceTery"StarterGui":SetCore("SendNotification", {Title = "Error: "..RequestHttp, Text = e, Icon = "rbxassetid://7733701545", Duration = 4, Callback = BF, Button1 = "Copy", Button2 = "Close"})
        end
        return nil
    end)
    return s and sc
end
local t_str, t_num = tostring, tonumber
function CallValidFunc(obj, propfunc, arg)
    if not c_type("Instance", obj, true) then
        return "Invalid object (not an Instance)"
    end
    local s, r = pcall(function()
        return obj[propfunc](obj, arg)
    end)
    if c_type("boolean", r) then return r end
    return s and r or `Error: {t_str(r)}`
end
local GetAdvanceS = RequestLoadRawHttp("https://raw.githubusercontent.com/Backlostunking/Open-Source/refs/heads/main/GetSafeService", true) or function(s) return ugc:GetService(s) end
local getgenv_ = c_caller("function", getgenv, true, c_caller("table", getgenv))
local Genv = c_type("table", getgenv_) and getgenv_ or _G;Genv.SHub = Genv.SHub or {};Genv.SHub.MemoryService = Genv.SHub.MemoryService or {}
task.spawn(function()
local SEry = setmetatable(Genv.SHub.MemoryService, {
    __index = function(se, n)
    local ref = c_caller("function", cloneref, false, function(s) return s end)
    local s, c = pcall(function()
        return ref(GetAdvanceS(n))
    end)
    if s and c then
        pcall(rawset, se, n, c)
        return c
    end
end
});FindServiceTery = function(s) return SEry[s] end
end)
RequestLoadRawHttp("https://raw.githubusercontent.com/Backlostunking/ScriptStarOZX/refs/heads/main/IfXDarkNotification.Lua", true);local tracery_notif=createNotification;createNotification=nil
-- // this function created by Artsynia \\ --
local function IsGame_Valid(): boolean
    local thisid = 893973440
    local s, r = pcall(function()
        local Asset = FindServiceTery("AssetService")
        local PlaceAsync = CallValidFunc(Asset, "GetGamePlacesAsync")
        if not PlaceAsync then return false end
        local Page = CallValidFunc(PlaceAsync, "GetCurrentPage")
        for _, t in pairs(Page) do
            for _, pid in pairs(t) do
                if pid ~= thisid then continue end
                return true
            end
        end
    end)
    return s and r or ugc.PlaceId == thisid
end
local PInfo = CallValidFunc(FindServiceTery("MarketplaceService"), "GetProductInfo", ugc.PlaceId)
local GameName = c_type("table", PInfo) and PInfo.Name or "baba"
if not IsGame_Valid() then return tracery_notif(GameName, "this current game was incorrect, does we get it right?", 3.5) end
tracery_notif("Loading", "Please Wait...", 3.5)
-------------------------------------------------------
local UiGit, UiRaw = "https://github.com/ActualMasterOogway/Fluent-Renewed", "https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed"
local Fluent = RequestLoadRawHttp(UiGit.."/releases/latest/download/Fluent.luau", true)
local SaveManager = RequestLoadRawHttp(UiRaw.."/refs/heads/main/Addons/SaveManager.luau", true)
local InterfaceManager = RequestLoadRawHttp(UiRaw.."/refs/heads/main/Addons/InterfaceManager.luau", true)
local SWorkspace = FindServiceTery("Workspace")
local SLighting = FindServiceTery("Lighting")
local SUis = FindServiceTery("UserInputService")
local SCoreGui = FindServiceTery("CoreGui")
local SRunService = FindServiceTery("RunService")
local SPlayers = FindServiceTery("Players")
local SReplicatedStorage = FindServiceTery("ReplicatedStorage")
-- local SCurrentCamera = SWorkspace.CurrentCamera
function GetIsOnMobile()
    local IsOnMobile = false
    xpcall(function()
        IsOnMobile = table.find({Enum.Platform.Android, Enum.Platform.IOS}, SUis:GetPlatform())
        end, function()
        IsOnMobile = SUis.TouchEnabled and not SUis.KeyboardEnabled
    end)
    return IsOnMobile
end
Genv.SHub.Notify = Genv.SHub.Notify or {}
Genv.SHub.Anti = Genv.SHub.Anti or {}
Genv.SHub.Toggle = Genv.SHub.Toggle or {}
Genv.SHub.TaskSignal = Genv.SHub.TaskSignal or {}
-- // Task \\ --
--> created by fxengif <--
task.spawn(function()
  pcall(function()
   -- if table.getn(Genv.SHub.TaskSignal) >= 1 then
      for s in pairs(Genv.SHub.TaskSignal) do
         if s then s:Disconnect() end
      end
      --[[table.foreach(Genv.SHub.TaskSignal, function(s)
         if s then s:Disconnect() end
      end)]]
  -- end
  end)
end)
-- // Task End \\ --
local function isLocalPlayerExist()
    local s, e = pcall(function() SPlayers:CreateLocalPlayer() end)
    if c_type("string", e) and e:lower():find('already exist') then
        return true, s
    end
    return false, s
end
local LP = SPlayers.LocalPlayer or SPlayers:GetPropertyChangedSignal("LocalPlayer"):Wait()
do local exists, suc = isLocalPlayerExist()
    if not LP and exists and not suc then
        pcall(function()
            LP = SPlayers.localPlayer
        end)
    end
end
local LPGui = LP:FindFirstChildOfClass("PlayerGui")
function GetHiddenGui()
    local UI
     if not UI then
        local gethui_ = c_caller("function", gethui, true)
        if gethui_ then UI = gethui_
        elseif SCoreGui and SCoreGui:FindFirstChild"RobloxGui" then UI = SCoreGui.RobloxGui
        elseif SCoreGui then UI = SCoreGui
        elseif LPGui then UI = LPGui end
     end
    return UI
end
local LPC = LP.Character or LP.CharacterAdded:Wait()
local LPH = LPC:FindFirstChildWhichIsA("Humanoid")
local LPR;function GetRootChar(char)
if not (char and char.Parent) then return end
local root, Hum = nil, char:FindFirstChildWhichIsA("Humanoid")
if Hum then pcall(function() root=Hum.RootPart end) end
if not root then root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") end
return root
end
LPR=GetRootChar(LPC)
Genv.SHub.TaskSignal.InftyUte=LP.CharacterAdded:Connect(function(MYY)
repeat SRunService.Heartbeat:Wait()
LPC=MYY;LPH=LPC:FindFirstChildWhichIsA("Humanoid");LPR=GetRootChar(LPC)
until LPC and LPH and LPR
end)
local Window = Fluent:CreateWindow({Title = `SourceOnce - Tracery [ BETA ] • {GameName}`, SubTitle = "by Artsynia & fxengif, LOVE Y'ALL!!", TabWidth = 150, Size = UDim2.fromOffset(540, 385), Resize = false, Acrylic = true, Theme = "Darker", MinimizeKey = Enum.KeyCode.LeftControl})
local SFTab = {
    Main = Window:AddTab({Title = "Main", Icon = "menu"}),
    Local = Window:AddTab({Title = "Local", Icon = "user"}),
    Anti_Ify = Window:AddTab({Title = "Anti & Notify", Icon = "user-check"}),
    Game_Rg = Window:AddTab({Title = "Game & Ragebait", Icon = "server"}),
    v_cre = Window:AddTab({Title = "Project & Credit", Icon = "rbxassetid://7733955511"}),
    Content = Window:AddTab({Title = "Content & Record", Icon = "video"}),
    Other = Window:AddTab({Title = "Other", Icon = "building"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})
}
-- local FOption = Fluent.Options
do
-- // this function created by Artsynia \\ --
local function IsValidInstanceOf(inst: any, of: any?): boolean
    return c_type("Instance", inst, true) and inst.Parent and inst:IsDescendantOf(of or SWorkspace)
end
-- // this function created by Artsynia \\ --
local function GetCurrentMap(): any?
    local map = nil
    local ov = SReplicatedStorage:FindFirstChild("CurrentMap")
    if ov and ov:IsA("ObjectValue") then
        local value = ov.Value
        if IsValidInstanceOf(value) then
            map = value
        else
            ov.Value = nil
        end
    end
    if not map then
        local comp = SWorkspace:FindFirstChild("ComputerTable", true)
        if comp and IsValidInstanceOf(comp.Parent) then
            map = comp.Parent
        end
    end
    if not map then
        local pod = SWorkspace:FindFirstChild("FreezePod", true)
        if pod and IsValidInstanceOf(pod.Parent) then
            map = pod.Parent
        end
    end
    return map
end
-- // this function created by Artsynia \\ --
local function Sround(num: number, np: number): number
    local mult = 10 ^ (np or 0)
    return math.floor(num * mult + 0.5) / mult
end
-- // this function created by Artsynia \\ --
local function ToNumV(v: any): number
    if c_type("number", v) then return v end
    local n = t_num(v); return if n ~= nil then n else 0
end
-- // this function created by Artsynia \\ --
local function GetPlayerList(lyname: boolean): any
    local PObj = {}
    for _, p in pairs(SPlayers:GetPlayers()) do
          if p == LP then continue end
          table.insert(PObj, lyname and p.Name or p)
    end
    return PObj
end
-- comment by Artsynia : function for esp!!
-- // this function created by Artsynia \\ --
local function getSafeParent(SName: string?): any
    local guiParent = GetHiddenGui()
    if not SName then SName = "nia = aura" end
    local fn = `SHub_ESP_{SName}`
    local folder = guiParent and guiParent:FindFirstChild(fn)
    if not folder then
        folder = Instance.new("Folder")
        folder.Name = fn
        folder.Parent = guiParent
    end
    return folder
end
-- // this function created by Artsynia \\ --
local function applyHighlight(part: any): ()
    local hl = part:FindFirstChild("S_Highlight")
    if hl then return end
    hl = Instance.new("Highlight")
    hl.Name = "S_Highlight"
    hl.Adornee = part
    hl.FillColor = Color3.new(0, 0, 0)
    hl.OutlineColor = Color3.new(0, 0, 0)
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.FillTransparency = 0.5
    hl.OutlineTransparency = 0.85
    hl.Parent = part
end
-- comment by Artsynia : i also can make esp look more cool but I just tired to do it
-- // this function created by Artsynia \\ --
local function createBillboard(part: any, IDorN: string, ESPContainer: any): ()
    local gui = part:FindFirstChild(IDorN)
    if gui then gui:Destroy() end
    gui = Instance.new("BillboardGui")
    gui.Name = IDorN
    gui.Adornee = part
    gui.Size = UDim2.new(5, 0, 5, 0)
    gui.AlwaysOnTop = true
    gui.Parent = ESPContainer
    local label = Instance.new("TextLabel", gui)
    label.Name = "Text_Label"
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextStrokeTransparency = 0.25
    label.TextTransparency = 0.25
    label.TextSize = 11
    label.Font = Enum.Font.FredokaOne
    label.TextColor3 = Color3.new(0, 0, 0)
    label.Text = "Loading..."
    local ArrowLabel = Instance.new("TextLabel", gui)
    ArrowLabel.Name = "Arrow_Label"
    ArrowLabel.Text = "^"
    ArrowLabel.Size = UDim2.new(1, 0, 0, 20)
    ArrowLabel.Position = UDim2.new(0.5, 0, 0, 1)
    ArrowLabel.AnchorPoint = Vector2.new(0.5, 1)
    ArrowLabel.BackgroundTransparency = 1
    ArrowLabel.TextColor3 = Color3.new(1, 1, 1)
    ArrowLabel.TextStrokeTransparency = 0.25
    ArrowLabel.TextTransparency = 0.25
    ArrowLabel.Font = Enum.Font.FredokaOne
    ArrowLabel.TextScaled = true
    ArrowLabel.Rotation = 180
end
-- // this function created by Artsynia \\ --
local function GetESPId(inst: any?): string
    return `ESP_{inst:GetDebugId()}`
end
SFTab.Main:AddSection("ESP")
SFTab.Main:AddToggle("EspToggle", {Title = "Esp Player", Description = "Enable/Disable Esp Player", Default = false, Callback = function(Value)
--> created by Artsynia <--
Genv.SHub.Toggle.PEspEnable = Value
local espConnection
local roleColors = {
    Beast = Color3.fromRGB(255, 0, 0),
    Survival_Captured = Color3.fromRGB(0, 0, 255),
    Survival = Color3.fromRGB(0, 255, 0),
    Default = Color3.fromRGB(200, 200, 200)
}
local espContainer = getSafeParent("Player")
local function clearESP()
    for _, child in pairs(espContainer:GetChildren()) do
        child:Destroy()
    end
    for _, player in pairs(SPlayers:GetPlayers()) do
        if player ~= LP and player.Character then
            local hl = player.Character:FindFirstChild("S_Highlight")
            if hl then hl:Destroy() end
        end
    end
end
local function GetPlayerStats(stats)
    if not stats then return end
    local isBeast, Captured, health = stats:FindFirstChild("IsBeast"), stats:FindFirstChild("Captured"), stats:FindFirstChild("Health")
    return (isBeast.Value and roleColors.Beast) or (Captured.Value and roleColors.Survival_Captured) or (health.Value <= 0 and roleColors.Default) or roleColors.Survival
end
local function GetAlivePlayerMap()
    local map = {}
    for _, p in pairs(SPlayers:GetPlayers()) do
        map[p.Name] = true
    end
    return map
end
local function updateESP()
    local alivePlayer = GetAlivePlayerMap()
    for _, gui in pairs(espContainer:GetChildren()) do
        if gui:IsA("BillboardGui") then
            if not alivePlayer[gui.Name] then gui:Destroy() end
        end
    end
    for _, player in pairs(SPlayers:GetPlayers()) do
        if player ~= LP and player.Character then
            local char = player.Character
            local head = char:FindFirstChild("Head")
            local root = GetRootChar(char)
            local stats = player:FindFirstChild("TempPlayerStatsModule")
            local PlayerStats = GetPlayerStats(stats)
            local espGui = espContainer:FindFirstChild(player.Name)
            if not espGui then
                createBillboard(head, player.Name, espContainer)
                espGui = espContainer:FindFirstChild(player.Name)
            else
                espGui.Adornee = head
                local label, Arrow_Label = espGui:FindFirstChild("Text_Label"), espGui:FindFirstChild("Arrow_Label")
                if label then
                    local distance_Lp = Sround((root.Position - LPR.Position).Magnitude, 1)
                    label.Text = string.format("Name: %s • Studs: %d", player.Name, distance_Lp)
                    label.TextColor3 = PlayerStats
                end
                if Arrow_Label then
                    Arrow_Label.TextColor3 = PlayerStats
                end
            end
            local hl = char:FindFirstChild("S_Highlight")
            if not hl then
                applyHighlight(char)
                hl = char:FindFirstChild("S_Highlight")
            end
            if hl then
                hl.FillColor = PlayerStats
            end
        end
    end
end
local function startESP()
    if espConnection then return end
    espConnection = SRunService.RenderStepped:Connect(function()
        if not Genv.SHub.Toggle.PEspEnable then
            clearESP()
            espConnection:Disconnect()
            espConnection = nil
            return
        end
        pcall(updateESP)
    end)
end
if Genv.SHub.Toggle.PEspEnable then
    startESP()
else
    clearESP()
end
end})
SFTab.Main:AddToggle("EspComputerToggle", {Title = "Esp Computer", Description = "Enable/Disable Esp Computer", Default = false, Callback = function(Value)
--> created by Artsynia <--
Genv.SHub.Toggle.PCCEspEnable = Value
local espConnection
local espContainer = getSafeParent("Computer")
local function clearESP()
    for _, child in pairs(espContainer:GetChildren()) do
        child:Destroy()
    end
    local Map = GetCurrentMap()
    if not Map then return end
    for _, o in pairs(Map:GetChildren()) do
        if o.Name == "ComputerTable" then
            local hl = o:FindFirstChild("S_Highlight", true)
            if hl then hl:Destroy() end
        end
    end
end
local function GetComputerColor(screen)
    if not screen or not screen:IsA("BasePart") then
        return Color3.fromRGB(255, 255, 0)
    end
    return screen.Color
end
local function updateESP()
    local map = GetCurrentMap()
    if not map then clearESP() return end
    for _, o in pairs(map:GetChildren()) do
        if o.Name == "ComputerTable" then
        local part = o:FindFirstChildWhichIsA("BasePart")
        if not part then continue end
        local screen = o:FindFirstChild("Screen")
        local espColor = GetComputerColor(screen)
        local id = GetESPId(o)
        local espGui = espContainer:FindFirstChild(id)
        if not espGui then
            createBillboard(o, id, espContainer)
            espGui = espContainer:FindFirstChild(id)
        end
        if espGui then
            espGui.Adornee = o
            local label, arrow = espGui:FindFirstChild("Text_Label"), espGui:FindFirstChild("Arrow_Label")
            local dist = Sround((part.Position - LPR.Position).Magnitude, 1)
            if label then
                label.Text = string.format("Computer • %d Studs", dist)
                label.TextColor3 = espColor
            end
            if arrow then
                arrow.TextColor3 = espColor
            end
        end
        local hl = o:FindFirstChild("S_Highlight")
        if not hl then
            applyHighlight(o)
            hl = o:FindFirstChild("S_Highlight")
        end
        if hl then
            hl.FillColor = espColor
        end
     end
   end
end
local function startESP()
    if espConnection then return end
    espConnection = SRunService.RenderStepped:Connect(function()
        if not Genv.SHub.Toggle.PCCEspEnable then
            clearESP()
            espConnection:Disconnect()
            espConnection = nil
            return
        end
        pcall(updateESP)
    end)
end
if Genv.SHub.Toggle.PCCEspEnable then
    startESP()
else
    clearESP()
end
end})
SFTab.Main:AddToggle("EspFreezePodToggle", {Title = "Esp FreezePod", Description = "Enable/Disable Esp FreezePod", Default = false, Callback = function(Value)
--> created by fxengif <--
-- comment by fxengif : ima try to do it after 6 months
Genv.SHub.Toggle.FreezePodEspEnable = Value
local espConnection
local color = Color3.fromRGB(0, 0, 245)
local espContainer = getSafeParent("FreezePod")
local function clearESP()
    for _, child in pairs(espContainer:GetChildren()) do
        child:Destroy()
    end
    local Map = GetCurrentMap()
    if not Map then return end
    for _, o in pairs(Map:GetChildren()) do
        if o.Name == "FreezePod" then
            local hl = o:FindFirstChild("S_Highlight", true)
            if hl then hl:Destroy() end
        end
    end
end
local function updateESP()
    local map = GetCurrentMap()
    if not map then clearESP() return end
    for _, o in pairs(map:GetChildren()) do
        if o.Name == "FreezePod" then
        local part = o:FindFirstChildWhichIsA("BasePart")
        if not part then continue end
        local id = GetESPId(o)
        local espGui = espContainer:FindFirstChild(id)
        if not espGui then
            createBillboard(o, id, espContainer)
            espGui = espContainer:FindFirstChild(id)
        end
        if espGui then
            espGui.Adornee = o
            local label, arrow = espGui:FindFirstChild("Text_Label"), espGui:FindFirstChild("Arrow_Label")
            local dist = Sround((part.Position - LPR.Position).Magnitude, 1)
            if label then
                label.Text = string.format("FreezePod • %d Studs", dist)
                label.TextColor3 = color
            end
            if arrow then
                arrow.TextColor3 = color
            end
        end
        local hl = o:FindFirstChild("S_Highlight")
        if not hl then
            applyHighlight(o)
            hl = o:FindFirstChild("S_Highlight")
        end
        if hl then
            hl.FillColor = color
        end
     end
   end
end
local function startESP()
    if espConnection then return end
    espConnection = SRunService.RenderStepped:Connect(function()
        if not Genv.SHub.Toggle.FreezePodEspEnable then
            clearESP()
            espConnection:Disconnect()
            espConnection = nil
            return
        end
        pcall(updateESP)
    end)
end
if Genv.SHub.Toggle.FreezePodEspEnable then
    startESP()
else
    clearESP()
end
end})
SFTab.Main:AddToggle("EspExitDoorToggle", {Title = "Esp ExitDoor", Description = "Enable/Disable Esp ExitDoor", Default = false, Callback = function(Value)
--> created by fxengif <--
Genv.SHub.Toggle.ExitDoorEspEnable = Value
local espConnection
local espContainer = getSafeParent("ExitDoor")
local function clearESP()
    for _, child in pairs(espContainer:GetChildren()) do
        child:Destroy()
    end
    local Map = GetCurrentMap()
    if not Map then return end
    for _, o in pairs(Map:GetChildren()) do
        if o.Name == "ExitDoor" then
            local hl = o:FindFirstChild("S_Highlight", true)
            if hl then hl:Destroy() end
        end
    end
end
local function FindColor(part)
    if not part or not part:IsA("BasePart") then
        return Color3.fromRGB(255, 255, 0)
    end
    return part.Color
end
local function updateESP()
    local map = GetCurrentMap()
    if not map then clearESP() return end
    for _, o in pairs(map:GetChildren()) do
        if o.Name == "ExitDoor" then
        local part = o:FindFirstChildWhichIsA("BasePart")
        if not part then continue end
        local color = FindColor(o:FindFirstChild("Light"))
        local id = GetESPId(o)
        local espGui = espContainer:FindFirstChild(id)
        if not espGui then
            createBillboard(o, id, espContainer)
            espGui = espContainer:FindFirstChild(id)
        end
        if espGui then
            espGui.Adornee = o
            local label, arrow = espGui:FindFirstChild("Text_Label"), espGui:FindFirstChild("Arrow_Label")
            local dist = Sround((part.Position - LPR.Position).Magnitude, 1)
            if label then
                label.Text = string.format("ExitDoor • %d Studs", dist)
                label.TextColor3 = color
            end
            if arrow then
                arrow.TextColor3 = color
            end
        end
        local hl = o:FindFirstChild("S_Highlight")
        if not hl then
            applyHighlight(o)
            hl = o:FindFirstChild("S_Highlight")
        end
        if hl then
            hl.FillColor = color
        end
     end
   end
end
local function startESP()
    if espConnection then return end
    espConnection = SRunService.RenderStepped:Connect(function()
        if not Genv.SHub.Toggle.ExitDoorEspEnable then
            clearESP()
            espConnection:Disconnect()
            espConnection = nil
            return
        end
        pcall(updateESP)
    end)
end
if Genv.SHub.Toggle.ExitDoorEspEnable then
    startESP()
else
    clearESP()
end
end})
SFTab.Main:AddSection("Beast")
-------------------------------------------------------
--> created by fxengif <--
Genv.SHub.WPlr = Genv.SHub.WPlr or {}
local function MapToArray(map)
    local t = {}
    for name, v in pairs(map) do
        if v then
            table.insert(t, name)
        end
    end
    return t
end
local function IsWhilstPlayer(this_)
    return Genv.SHub.WPlr[this_] == true
end
do
local this = SFTab.Main:CreateDropdown("WhilstPlayer_Dropdown", {Title = "Whilst Player", Description = "Select Player to Add Whilst", Values = GetPlayerList(true), Multi = true, Default = MapToArray(Genv.SHub.WPlr), Callback = function(t_select)
     -- comment by fxengif : >> {this = bool, ...}
     Genv.SHub.WPlr = t_select
end})
local function UpdThisDropdown()
    this:SetValues(GetPlayerList(true))
end
Genv.SHub.TaskSignal.PAdded = SPlayers.PlayerAdded:Connect(UpdThisDropdown)
Genv.SHub.TaskSignal.PRemoving = SPlayers.PlayerRemoving:Connect(function(p)
    Genv.SHub.WPlr[p.Name] = nil;UpdThisDropdown()
end)
end
-------------------------------------------------------
SFTab.Main:AddSlider("SliderAura", {Title = "Set Hit Aura Range", Description = "Set Range of Hit Aura [Beast]", Default = 10, Min = 5, Max = 15, Rounding = 1, Callback = function(Value)
   Genv.SHub.HitAuraRange=ToNumV(Value)
end})
SFTab.Main:AddToggle("AuraToggle", {Title = "Hit Aura", Description = "Enable Hit Aura [Beast]", Default = false, Callback = function(Value)
 --> created by fxengif <--
 Genv.SHub.Toggle.HitAura = Value
 while Genv.SHub.Toggle.HitAura and task.wait(0.15) do
    local LHammerEvent = LPC:FindFirstChild("HammerEvent", true)
    for _, p in pairs(SPlayers:GetPlayers()) do
    if p ~= LP and not IsWhilstPlayer(p.Name) then
    local Stats = p:FindFirstChild("TempPlayerStatsModule")
    if not Stats then continue end
    local PisRagdoll, PisCaptured = Stats:FindFirstChild("Ragdoll"), Stats:FindFirstChild("Captured")
    if not (PisRagdoll and PisCaptured) then continue end
        if not (PisRagdoll.Value or PisCaptured.Value) and p.Character then
                local root = GetRootChar(p.Character)
                if root and LPC and LPR and LHammerEvent then
                    if (root.Position - LPR.Position).Magnitude <= Genv.SHub.HitAuraRange then
                    LHammerEvent:FireServer("HammerHit", root)
                end
            end
        end
     end
   end
 end
end})
SFTab.Main:AddSlider("SliderTie", {Title = "Set Auto Tie Range", Description = "Set Range of Auto Tie [Beast]", Default = 5, Min = 5, Max = 100, Rounding = 1, Callback = function(Value)
   Genv.SHub.TiePlayerRange=ToNumV(Value)
end})
SFTab.Main:AddToggle("AutoTieToggle", {Title = "Auto Tie", Description = "Enable Auto Tie Player [Beast]", Default = false, Callback = function(Value)
 --> created by fxengif <--
 Genv.SHub.Toggle.AutoTie = Value
 while Genv.SHub.Toggle.AutoTie and task.wait(0.15) do
    local LHammerEvent = LPC:FindFirstChild("HammerEvent", true)
    for _, p in pairs(SPlayers:GetPlayers()) do
    if p ~= LP and not IsWhilstPlayer(p.Name) then
    local Stats = p:FindFirstChild("TempPlayerStatsModule")
    if not Stats then continue end
    local PisRagdoll, PisCaptured = Stats:FindFirstChild("Ragdoll"), Stats:FindFirstChild("Captured")
    if not (PisRagdoll and PisCaptured) then continue end
        if (PisRagdoll.Value and not PisCaptured.Value) and p.Character then
                local root = GetRootChar(p.Character)
                if root and LPC and LPR and LHammerEvent then
                    if (root.Position - LPR.Position).Magnitude <= Genv.SHub.TiePlayerRange then
                    local pos = (c_type("Vector3", root.Position, true) and root.Position) or Vector3.zero
                    LHammerEvent:FireServer("HammerTieUp", root, pos)
                end
            end
        end
     end
   end
 end
end})
SFTab.Main:AddSection("In-Game")
SFTab.Main:AddToggle("AutoHelp_CapturedPlr_SilentToggle", {Title = "Auto help Captured Player", Description = "silent mode (no teleport, just help silently)", Default = false, Callback = function(Value)
--> created by Artsynia <--
Genv.SHub.Toggle.AutoHelpCP_silent = Value
local map = GetCurrentMap()
local RemoteEvent = SReplicatedStorage:FindFirstChild("RemoteEvent")
local Stats_LP = LP:FindFirstChild("TempPlayerStatsModule")
local Local_H = Stats_LP and Stats_LP:FindFirstChild("Health")
local Local_R = Stats_LP and Stats_LP:FindFirstChild("Ragdoll")
local Local_C = Stats_LP and Stats_LP:FindFirstChild("Captured")
local function CapturedFreezePod(cmap)
    if not (cmap and c_type('table', cmap)) then return end
    for _, o in pairs(cmap) do
        if o.Name ~= "FreezePod" then continue end
        local PodTrigger = o:FindFirstChild("PodTrigger", true)
        if PodTrigger then
            local CapturedTorso = PodTrigger:FindFirstChild("CapturedTorso")
            local Event = PodTrigger:FindFirstChild("Event")
            if CapturedTorso and Event and CapturedTorso:IsA("ObjectValue") and CapturedTorso.Value then
                return Event
            end
        end
    end
end
-- comment by fxengif : DAYYYMNNN sheee is cookingggg!!!
while Genv.SHub.Toggle.AutoHelpCP_silent and task.wait(0.05) do
    if not (Local_H and Local_R and Local_C) then continue end
    if Local_H.Value <= 0 or Local_R.Value or Local_C.Value then continue end
    if not RemoteEvent then
        RemoteEvent = SReplicatedStorage:FindFirstChild("RemoteEvent")
        continue
    end
    if not map then
        map = GetCurrentMap()
        continue
    end
    for _, p in pairs(SPlayers:GetPlayers()) do
        if p == LP then continue end
        local Stats = p:FindFirstChild("TempPlayerStatsModule")
        local Captured = Stats and Stats:FindFirstChild("Captured")
        if not (Captured and Captured:IsA("BoolValue") and Captured.Value) then continue end
        local event = CapturedFreezePod(map:GetChildren())
        if not event then continue end
        repeat
            task.wait(0.05)
            RemoteEvent:FireServer("Input", "Trigger", true, event)
            RemoteEvent:FireServer("Input", "Action", true)
        until not (Captured.Value and Genv.SHub.Toggle.AutoHelpCP_silent)
        break
    end
end
end})
SFTab.Main:AddToggle("AutoHelp_CapturedPlrToggle", {Title = "Auto help Captured Player", Description = "Teleport Version", Default = false, Callback = function(Value)
--> created by Artsynia & fxengif <--
Genv.SHub.Toggle.AutoHelpCP = Value
local function DoHelpCFrame(root)
    return root.CFrame * CFrame.new(0, -4.5, 0) * CFrame.Angles(math.rad(90), 0, 0)
end
local RemoteEvent = SReplicatedStorage:FindFirstChild("RemoteEvent")
local oldCFrame, helping = nil, false
local Stats_LP = LP:FindFirstChild("TempPlayerStatsModule")
local Local_H = Stats_LP and Stats_LP:FindFirstChild("Health")
local Local_R = Stats_LP and Stats_LP:FindFirstChild("Ragdoll")
local Local_C = Stats_LP and Stats_LP:FindFirstChild("Captured")
while Genv.SHub.Toggle.AutoHelpCP and task.wait(0.05) do
    if not (LPC and LPR and Local_H and Local_R and Local_C) then
        continue -- comment by fxengif : my favourite keyword :p
    end
    if Local_H.Value <= 0 or Local_R.Value or Local_C.Value then continue end
    if not RemoteEvent then
        RemoteEvent = SReplicatedStorage:FindFirstChild("RemoteEvent")
        continue
    end
    for _, p in pairs(SPlayers:GetPlayers()) do
        if p == LP or helping then continue end
        local Stats = p:FindFirstChild("TempPlayerStatsModule")
        local Captured = Stats and Stats:FindFirstChild("Captured")
        if not (Captured and Captured:IsA("BoolValue") and Captured.Value) then continue end
        local root = p.Character and GetRootChar(p.Character)
        if not root then continue end
        helping = true
        oldCFrame = oldCFrame or LPR.CFrame
        LPR.CFrame = DoHelpCFrame(root)
        repeat
            task.wait(0.05)
            LPR.CFrame = DoHelpCFrame(root)
            RemoteEvent:FireServer("Input", "Action", true)
        until not (Captured.Value and Genv.SHub.Toggle.AutoHelpCP) or (Local_R.Value or Local_C.Value or Local_H.Value <= 0)
        if oldCFrame and LPC then LPC:PivotTo(oldCFrame) end
        oldCFrame, helping = nil, false;break
    end
end
end})
SFTab.Main:AddSection("Other")
SFTab.Main:AddToggle("AntiFlingToggle", {Title = "Anti Fling", Description = "Noclip Player", Default = false, Callback = function(Value)
 --> created by fxengif <--
 Genv.SHub.Toggle.AntiFling = Value
 local function SAntiFling()
    for _, p in pairs(SPlayers:GetPlayers()) do
        if p ~= LP and p.Character then
                for _, c in pairs(p.Character:GetDescendants()) do
                    if c:IsA "BasePart" then
                        if c.CanCollide then
                            c.CanCollide = false
                        elseif not (c.CanCollide or Genv.SHub.Toggle.AntiFling) then
                            c.CanCollide = true;break
                       end
                  end
             end
        end
    end
 end
  while Genv.SHub.Toggle.AntiFling and SRunService.Heartbeat:Wait() do SAntiFling() end
end})
SFTab.Main:AddToggle("TFlingToggle", {Title = "Touch Fling", Description = "let's you fling player by touching them", Default = false, Callback = function(Value)
--> created by fxengif <--
Genv.SHub.Toggle.TouchFling=Value
 local vel, movel = nil, 0.05
 while Genv.SHub.Toggle.TouchFling do
    SRunService.Heartbeat:Wait()
    vel = LPR.Velocity;LPR.Velocity = vel * 9e8 + Vector3.new(0, 9e8, 0)
    SRunService.RenderStepped:Wait()
    if LPC and LPR then LPR.Velocity = vel end
    SRunService.Stepped:Wait()
    if LPC and LPR then
        LPR.Velocity = vel + Vector3.new(0, movel, 0)
        movel = movel * -1
    end
 end
end})
SFTab.Local:AddSection("Camera")
SFTab.Local:AddToggle("NoclipCameraToggle", {Title = "Noclip Camera", Description = "Make Camera Can see through the wall", Default = false, Callback = function(Value)
Genv.SHub.Toggle.CamNoclip=Value
 while Genv.SHub.Toggle.CamNoclip and task.wait(0.1) do
       if (LP.DevCameraOcclusionMode ~= Enum.DevCameraOcclusionMode.Invisicam) then
             LP.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
       end
 end
    if (LP.DevCameraOcclusionMode ~= Enum.DevCameraOcclusionMode.Zoom and not Genv.SHub.Toggle.CamNoclip) then
       LP.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Zoom
    end
end})
SFTab.Local:AddToggle("CameraDModeToggle", {Title = "Change CameraMode to default", Description = "Disable first person Camera", Default = false, Callback = function(Value)
Genv.SHub.Toggle.CamDMode=Value
 while Genv.SHub.Toggle.CamDMode and task.wait(0.1) do
       if (LP.CameraMode ~= Enum.CameraMode.Classic) then
             LP.CameraMode = Enum.CameraMode.Classic
       end
 end
end})
SFTab.Local:AddInput("Input_CamMaxZoom", {Title = "Camera Max Zoom", Default = "", Placeholder = "Set Max Zoom Distance", Numeric = true, Finished = false, Callback = function(Value)
Genv.SHub.CamMaxZoomDis=ToNumV(Value)
LP.CameraMaxZoomDistance=Genv.SHub.CamMaxZoomDis
end})
SFTab.Local:AddToggle("CameraZoomDisToggle", {Title = "Change Camera Max Zoom Distance", Description = "Enabled Auto Set Camera Max Zoom distance", Default = false, Callback = function(Value)
Genv.SHub.Toggle.CamMaxZoom=Value
 while Genv.SHub.Toggle.CamMaxZoom and task.wait(0.1) do
       if (LP.CameraMaxZoomDistance ~= Genv.SHub.CamMaxZoomDis) then
            LP.CameraMaxZoomDistance = Genv.SHub.CamMaxZoomDis
       end
 end
end})
SFTab.Local:AddSection("Local")
SFTab.Local:AddToggle("FBToggle", {Title = "Full Bright", Description = "Enable Full Bright to see anything easily", Default = false, Callback = function(Value)
--> created by Artsynia <--
Genv.SHub.Toggle.FullBright = Value
local function saveLighting()
    Genv.SHub.FB_Original = {
        Brightness = SLighting.Brightness,
        ClockTime = SLighting.ClockTime,
        FogEnd = SLighting.FogEnd,
        FogStart = SLighting.FogStart,
        GlobalShadows = SLighting.GlobalShadows,
        OutdoorAmbient = SLighting.OutdoorAmbient,
        Ambient = SLighting.Ambient
    }
    local atm = SLighting:FindFirstChildOfClass("Atmosphere")
    if atm then
        Genv.SHub.FB_Original.AtmosphereDensity = atm.Density
    end
end
local function applyFullBright()
    local atm = SLighting:FindFirstChildOfClass("Atmosphere")
    if atm then
        atm.Density = 0
    end
    SLighting.Brightness = 1.5
    SLighting.ClockTime = 14
    SLighting.FogEnd = 100000
    SLighting.FogStart = 0
    SLighting.GlobalShadows = false
    SLighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
    SLighting.Ambient = Color3.fromRGB(80, 80, 80)
end
local function restoreLighting()
    if not Genv.SHub.FB_Original then return end
    for prop, value in pairs(Genv.SHub.FB_Original) do
        if prop == "AtmosphereDensity" then
            local atm = SLighting:FindFirstChildOfClass("Atmosphere")
            if atm then
                atm.Density = value
            end
        else
            SLighting[prop] = value
        end
    end
end
  if Genv.SHub.Toggle.FullBright then
      saveLighting()
      while Genv.SHub.Toggle.FullBright and task.wait() do applyFullBright() end
  else
      task.wait(.25);restoreLighting()
  end
end})
SFTab.Local:AddInput("Input_TpwalkSpeed", {Title = "Custom TP Walk Speed", Default = "", Placeholder = "Set TP Walk Speed", Numeric = true, Finished = false, Callback = function(Value)
Genv.SHub.tpwalkSpeed = ToNumV(Value)
end})
SFTab.Local:AddToggle("TPWalk_Toggle", {Title = "TP Walk", Description = "walking fast just like walkspeed", Default = false, Callback = function(Value)
--> created by Artsynia <--
Genv.SHub.Toggle.TpWalk = Value
 while Genv.SHub.Toggle.TpWalk do
    local d = SRunService.Heartbeat:Wait()
    if not (LPC and LPH) then continue end
    if LPH.MoveDirection.Magnitude > 0 then
        LPC:TranslateBy(LPH.MoveDirection * (Genv.SHub.tpwalkSpeed or 1) * d * 10)
    end
 end
end})
SFTab.Local:AddToggle("InfJumpToggle", {Title = "Infinity Jump", Description = "Enable/Disable Infinity Jump", Default = false, Callback = function(Value)
--> created by fxengif <--
Genv.SHub.Toggle.InfJump=Value
Genv.SHub.TaskSignal.InfJump=SUis.JumpRequest:Connect(function()
    if Genv.SHub.Toggle.InfJump then
        if LPC and LPH then
            LPH:ChangeState("Jumping")
        end
    end
end)
end})
SFTab.Local:AddToggle("NoclipToggle", {Title = "Noclip", Description = "Enable/Disable Noclip", Default = false, Callback = function(Value)
--> created by fxengif <--
Genv.SHub.Toggle.Noclip = Value
 local function Noclip()
     for _, c in pairs(LPC:GetDescendants()) do 
         if c:IsA "BasePart" then
            if c.CanCollide then
                 c.CanCollide = false
             elseif not (c.CanCollide or Genv.SHub.Toggle.Noclip) then
                 c.CanCollide = true;break
             end
         end
     end
 end
 while Genv.SHub.Toggle.Noclip and SRunService.Heartbeat:Wait() do Noclip() end
end})
SFTab.Anti_Ify:AddToggle("NotifyAdminToggle", {Title = "Notification Admin Join", Description = "Show Notification when Mod/Admin Join This Server", Default = true}):OnChanged(function(Value)
 --> created by Artsynia <--
 Genv.SHub.Notify.NotifyAdmin = Value
 local CreId, cretype = ugc.CreatorId, ugc.CreatorType
 while Genv.SHub.Notify.NotifyAdmin and task.wait(2) do
    for _, p in pairs(SPlayers:GetPlayers()) do
    if cretype == Enum.CreatorType.Group then
            pcall(function() -- comment by Artsynia : sometime when request 'GetRankInGroup/GetRoleInGroup' failed (503 status), that why i use pcall
                local Rank = p:GetRankInGroup(CreId)
                if Rank >= 2 then
                    local RoleN = p:GetRoleInGroup(CreId)
                    Fluent:Notify({Title = p.Name .. " has join!", Content = "Role : " .. RoleN .. ", Rank : " .. Rank, Icon = "user-check", Duration = 1.5})
                end
            end)
        elseif cretype == Enum.CreatorType.User and p.UserId == CreId then
            Fluent:Notify({Title = p.Name .. " has join!", Content = "Role : Game Owner", Icon = "user-check", Duration = 1.5})
       end
    end
 end
end)
SFTab.Anti_Ify:AddToggle("AntiRagdollToggle", {Title = "Anti Ragdoll", Description = "No Ragdoll onLocal", Default = false, Callback = function(Value)
--> created by fxengif <--
Genv.SHub.Toggle.AntiRagdoll=Value
 local function ChangeR(bool)
    LPH:SetStateEnabled(Enum.HumanoidStateType.Physics, bool)
    LPH:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, bool)
    LPH:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, bool)
 end
 local Stats = LP:FindFirstChild("TempPlayerStatsModule")
 while Genv.SHub.Toggle.AntiRagdoll and task.wait() do
   pcall(function()
        ChangeR(not Genv.SHub.Toggle.AntiRagdoll)
        if not Stats then Stats = LP:FindFirstChild("TempPlayerStatsModule") return end
       local Ragdoll = Stats:FindFirstChild("Ragdoll")
       if Ragdoll and (Ragdoll:IsA("BoolValue") and Ragdoll.Value) then
            repeat task.wait()
                LPH:ChangeState(6);LPH:ChangeState(8)
            until LPH:GetState() == Enum.HumanoidStateType.Running
       end
   end)
 end
end})
--------------------------------------------------------------
--> created by Artsynia <--
do
SFTab.Game_Rg:AddSection("Game • Status")
local function Find(service: any, nameinst: string, des: boolean): any?
    if not service then return nil end
    return service:FindFirstChild(nameinst, des)
end
--[[local function GetStatusV(inst: any?, tostr: boolean): any?
    if not inst then return nil end
    local v = inst.Value
    return tostr and t_str(v) or v
end]]
local function BoolToWord(v: boolean): string
    return v and "Yes" or "No" -- comment by fxengif : that is v ? "Yes" : "No" :pp
end
local GameStatus_Pg, This
local function RefreshStatus()
    local isActive = Find(SReplicatedStorage, "IsGameActive")
    local strActive = BoolToWord(isActive and isActive.Value)
    local mapName = t_str(GetCurrentMap() or "None")
    local content = string.format("GameActive: %s\nCurrentMap: %s", strActive, mapName)
    if GameStatus_Pg then
        GameStatus_Pg:SetContent(content)
    end
end
This = SFTab.Game_Rg:AddToggle("AutoRefreshStatusToggle", {Title = "Auto Refresh", Description = "Refresh Game Status [RealTime]", Default = true})
GameStatus_Pg = SFTab.Game_Rg:CreateParagraph("GameStatus_Paragraph", {Title = "Game Status"})
RefreshStatus()
This:OnChanged(function(Value)
 Genv.SHub.Toggle.AutoReStatus = Value
 while Genv.SHub.Toggle.AutoReStatus and task.wait(.1) do RefreshStatus() end
end)
end --// 
-- // <𝟹 \\ --
------------------------------------------------------------------
-- comment by fxengif : i guess i also watch tiktok all day when i wake up, every morning of my lifeeee are tiktokk
SFTab.Game_Rg:AddSection("Ragebaiting Beast")
-- // this function created by fxengif \\ --
local function GetCurrentBeastHEvent(needed)
    for _, p in pairs(SPlayers:GetPlayers()) do
        if p ~= LP and p.Character then
            local c = p.Character
            if c:FindFirstChild "Hammer" then
                return not needed and c:FindFirstChild("HammerEvent", true) or c
            end
        end
    end
end
-- // this function created by fxengif \\ --
local function GetCurrentBeastPEvent(needed)
    for _, p in pairs(SPlayers:GetPlayers()) do
        if p ~= LP and p.Character then
            local c = p.Character
            if c:FindFirstChild "BeastPowers" then
                return not needed and c:FindFirstChild("PowersEvent", true) or c
            end
        end
    end
end
-- comment by fxengif : y'all knowing that making a good script actually easy to do, if you understand how these of them actually does!
SFTab.Game_Rg:AddToggle("RGSlow_BeastToggle", {Title = "Slow Beast", Description = "make beast walk slowlyyyyy", Default = false, Callback = function(Value)
Genv.SHub.Toggle.Rg_SlowBt = Value
 while Genv.SHub.Toggle.Rg_SlowBt and task.wait(0.05) do
    local event = GetCurrentBeastPEvent()
    if event then event:FireServer("Jumped") end
 end
end})
SFTab.Game_Rg:AddToggle("RGUnTie_BeastToggle", {Title = "Beast Untie Player", Description = "making beast untie player instantly", Default = false, Callback = function(Value)
Genv.SHub.Toggle.Rg_distieBt = Value
 while Genv.SHub.Toggle.Rg_distieBt and task.wait(0.05) do
    local event = GetCurrentBeastHEvent()
    if event then event:FireServer("HammerClick", true) end
 end
end})
-------------------------------------------------------
--> created by Artsynia <--
do
SFTab.Content:AddSection("Record/Showcase")
local function GetCurrentUiPlrFrame(lyLv: boolean): any?
    local plrf = LPGui:FindFirstChild("PlayerNamesFrame", true)
    if not plrf then return nil end
    for _, fm in pairs(plrf:GetChildren()) do
        if fm:IsA("Frame") and fm.Name:lower():find(LP.Name:lower(), 1, true) then
            local level, name
            for _, lbl in pairs(fm:GetChildren()) do
                if not lbl:IsA("TextLabel") then continue end
                local num = t_num(lbl.Text)
                if num then
                    level = lbl
                else
                    name = lbl
                end
            end
            return lyLv and level or name
        end
    end
end
Genv.SHub.BarsTL = Genv.SHub.BarsTL
local function GetCurrentUiPlrBars(): any?
    local plrf = LPGui:FindFirstChild("StatusBars", true)
    if not plrf then return nil end
    for _, tl in pairs(plrf:GetChildren()) do
        if tl:IsA("TextLabel") and tl.Text:lower():find(LP.Name:lower(), 1, true) then
            Genv.SHub.BarsTL = tl
        end
    end
    return Genv.SHub.BarsTL
end
Genv.SHub.CustomName = ""
Genv.SHub.CustomLevel = 100
local lv = GetCurrentUiPlrFrame(true)
local oldlvl = lv and lv.Text or 1
SFTab.Content:AddInput("Input_CustomName", {Title = "Custom Name", Default = "", Placeholder = "", Numeric = false, Finished = false, Callback = function(str)
Genv.SHub.CustomName = t_str(str)
end})
SFTab.Content:AddInput("Input_CustomLevel", {Title = "Custom Level", Default = "", Placeholder = "", Numeric = true, Finished = false, Callback = function(n)
Genv.SHub.CustomLevel = ToNumV(n)
end})
SFTab.Content:CreateToggle("EnableHide_ListName_Toggle", {Title = "Enabled Change Text Playerlist (Ui)", Description = "useful when record/showcase", Default = false, Callback = function(v) 
Genv.SHub.Toggle.HideListName = v
local name, lvl = GetCurrentUiPlrFrame(), GetCurrentUiPlrFrame(true)
 while name and lvl and not Genv.SHub.Toggle.HideListName and task.wait(.1) do
     name.Text = LP.Name; lvl.Text = oldlvl; task.wait(.2); break
 end
 while Genv.SHub.Toggle.HideListName and task.wait(0.01) do
        if not LPGui then continue end
        name, lvl = GetCurrentUiPlrFrame(), GetCurrentUiPlrFrame(true)
        if name then
            name.Text = Genv.SHub.CustomName
        end
        if lvl then
            lvl.Text = Genv.SHub.CustomLevel
        end
 end
end})
SFTab.Content:CreateToggle("EnableHide_Bars_Toggle", {Title = "Enabled Change Text Bars (Ui)", Description = "useful when record/showcase", Default = false, Callback = function(v) 
Genv.SHub.Toggle.HideBars = v
local name = GetCurrentUiPlrBars()
 while name and not Genv.SHub.Toggle.HideBars and task.wait(.1) do
     name.Text = LP.Name; task.wait(.2); break
 end
 while Genv.SHub.Toggle.HideBars and task.wait(0.01) do
        if not LPGui then continue end
        name = GetCurrentUiPlrBars()
        if name then
            name.Text = Genv.SHub.CustomName
        end
 end
end})
end
-------------------------------------------------------
SFTab.v_cre:AddSection("Project")
SFTab.v_cre:AddParagraph("Project_Paragraph", {Title = `SourceOnce - Tracery : {GameName}`, Content = `Version Beta • {this.Version}`})
SFTab.v_cre:AddSection("Credit")
SFTab.v_cre:AddParagraph("Credit_Paragraph", {Title = "Script • Creator", Content = "Creator of This Script: Artsynia, fxengif\n\nFluent Ui library Rewrite By: ActualMasterOogway\n"..UiGit.."\n\nfeature and idea by everyone <3"})
----------------------OTHER----------------------
SFTab.Other:AddSection("Current Game Information")
SFTab.Other:AddParagraph("Game_Info_Paragraph", {Title = "Info", Content = `Game VM Version: {VM_Version}`})
-------------------------------------------------------
--> created by fxengif <--
do
SFTab.Other:AddSection("Executor Environment")
local CurrentExc = c_caller("function", identifyexecutor or getexecutorname, true, "Error")
local function list_ev()
    if Genv == _G then return nil end
    local e, re = {}, 0
    for n, a in pairs(Genv) do
        if t_str(n):lower():find("shub", 1, true) then continue end
        re=re+1;table.insert(e, ("> %d | %s • type : %s"):format(re, t_str(n), type(a)))
    end
    return table.concat(e, "\n"), re
end
local this
local function refresh()
    if this then
        local result, overall = list_ev()
        this:SetContent(`see what your executor environment has:\n> Executor : {CurrentExc}\n> Overall : {overall}\n\n{result}`)
    end
end
SFTab.Other:CreateButton{
    Title = "Refresh Environment",
    Description = "Refresh List env",
    Callback = function()
        Window:Dialog{
            Title = "Confirm Refresh",
            Content = "Are You Sure, You want to refresh environment",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = refresh
                },
                {Title = "Cancel"}
            }
        }
    end
}
this = SFTab.Other:AddParagraph("Exec_Env_Paragraph", {Title = "Environment"})
end
-------------------------------------------------------
end
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("SourceOnce")
SaveManager:SetFolder("SourceOnce/FTF")
InterfaceManager:BuildInterfaceSection(SFTab.Settings)
SaveManager:BuildConfigSection(SFTab.Settings)
SaveManager:LoadAutoloadConfig()
Window:SelectTab(1)
-- comment by fxengif : our toggle button for fluent UI library :pp (mobile)
if GetIsOnMobile() then
local CurrentUi = GetHiddenGui()
if CurrentUi:FindFirstChild "ToggleShubUi" then CurrentUi.ToggleShubUi:Destroy() end
local NormalSize, HoverSize = UDim2.fromOffset(40, 40), UDim2.fromOffset(45, 45)
local ScreenGui = Instance.new "ScreenGui"
local ImageButton = Instance.new "ImageButton"
local UICorner = Instance.new("UICorner", ImageButton)
local UIStroke = Instance.new("UIStroke", ImageButton)
UIStroke.Color = Color3.new(0, 0, 0)
UIStroke.Thickness = 4
UIStroke.Transparency = 0.30
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", ImageButton)
UIAspectRatioConstraint.AspectRatio = 1.25
ScreenGui.Name = "ToggleShubUi"
ScreenGui.Parent = CurrentUi
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ImageButton.Parent = ScreenGui
ImageButton.BorderColor3 = Color3.fromRGB(255, 185, 115)
ImageButton.BackgroundTransparency = 0.35
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.Position = UDim2.new(0.1, 0, 0.1, 0)
ImageButton.Size = NormalSize
ImageButton.Image = "rbxassetid://10709810463"
ImageButton.Draggable = true
local UIGradient = Instance.new("UIGradient", ImageButton)
UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.new(0.3, 0.3, 0.3)),ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.1), NumberSequenceKeypoint.new(1, 0)}
local TweenService = FindServiceTery("TweenService")
local function rotateGradient()
    UIGradient.Rotation = 0
    local tween = TweenService:Create(UIGradient, TweenInfo.new(4, Enum.EasingStyle.Linear), {Rotation = 360})
    tween:Play()
    tween.Completed:Once(rotateGradient)
end
rotateGradient()
ImageButton.MouseButton1Click:Connect(function() local rootFV=Window.Root;rootFV.Visible = not rootFV.Visible end)
ImageButton.MouseEnter:Connect(function()
    TweenService:Create(ImageButton, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = HoverSize}):Play()
    TweenService:Create(UIStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Thickness = 6}):Play()
end)
ImageButton.MouseLeave:Connect(function()
    TweenService:Create(ImageButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = NormalSize}):Play()
    TweenService:Create(UIStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Thickness = 4}):Play()
end)
end
if Window.HideButton then Window.HideButton.Visible = false end
tracery_notif("Successfully Loaded", "Thanks for Using This script!", 5)
end --// FTF \\--
