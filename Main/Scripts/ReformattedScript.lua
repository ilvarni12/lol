--[[
    
    Deobfuscated By: @ilvarni / discord; ilvarni
    Reformatted By: @ilvarni / discord; ilvarni

    Version 1.0.3b

    Preppy-Hub.lua
    Auto-Typer for Spelling Bee.
    
    https://github.com/ilvarni12/lol/blob/main/Main/Scripts/OriginalScript.lua
    ^^ Original script without formatting [ epic chatgpt comments ] 
]]

---------------------------------------------------------------------------------
--// Services
---------------------------------------------------------------------------------
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

---------------------------------------------------------------------------------
--// Variables
---------------------------------------------------------------------------------
local Player = Players.LocalPlayer
local Events = ReplicatedStorage:WaitForChild("Events")
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

---------------------------------------------------------------------------------
--// Type Definitions
---------------------------------------------------------------------------------
export type SpellingBeeType = {
    --// Services
    Services: {
        Rayfield: any,
        Events: any,
        VIM: any
    },
    
    --// Settings
    Configuration: {
        TypingDelay: number,
        PreTypeWait: number,
        TypoCorrections: boolean,
        TypoFrequency: number,
        DynamicTyping: boolean
    },
    
    --// Data
    Settings: {
        Version: number,
        SupportedWords: number,
        LastSound: any,
        LastWord: string,
        LastTypedWord: string?,
        IsTypingWord: boolean,
        AutoTypeEnabled: boolean,
        Words: {[string]: string}
    },
    
    --// UI Components
    UI: {
        Window: any,
        MainTab: any,
        EffectTab: any,
        FontTab: any,
        OtherTab: any,
        WordLabel: any
    },
    
    --// Functions
    Initialize: (self: SpellingBeeType) -> nil,
    CreateWindow: (self: SpellingBeeType) -> nil,
    CreateMainTab: (self: SpellingBeeType) -> nil,
    CreateEffectTab: (self: SpellingBeeType) -> nil,
    CreateFontTab: (self: SpellingBeeType) -> nil,
    CreateOtherTab: (self: SpellingBeeType) -> nil,
    UpdateCurrentWord: (self: SpellingBeeType, word: string) -> nil,
    CheckSound: (self: SpellingBeeType) -> nil,
    TypeWord: (self: SpellingBeeType, word: string) -> nil,
    CreateItemButtons: (self: SpellingBeeType, tab: any, items: {{string}}, eventName: string) -> nil,
    UpdateDebugInfo: (self: SpellingBeeType) -> nil,
    FormatPlaytime: (self: SpellingBeeType, seconds: number) -> string
}

---------------------------------------------------------------------------------
--// Main Module
---------------------------------------------------------------------------------
local SpellingBee = {
    -------------------------------------------
    Services = {
        Rayfield = Rayfield,
        Events = Events,
        VIM = VirtualInputManager
    },
    -------------------------------------------
    Configuration = {
        TypingDelay = 0.25,
        PreTypeWait = 1.25,
        TypoCorrections = false,
        TypoFrequency = 20,
        DynamicTyping = false
    },
    -------------------------------------------
    Settings = {
        Version = 1.3,
        SupportedWords = 538,
        LastSound = nil,
        LastWord = "None",
        LastTypedWord = nil,
        IsTypingWord = false,
        AutoTypeEnabled = false,
        Words = loadstring(game:HttpGet("https://raw.githubusercontent.com/ilvarni12/lol/refs/heads/main/Misc/Words.lua"))()
    },
    -------------------------------------------
    UI = {
        Window = nil,
        MainTab = nil,
        EffectTab = nil,
        FontTab = nil,
        OtherTab = nil,
        WordLabel = nil
    },
    -------------------------------------------
    KeyCodeMap = {
        ["a"] = 0x41, ["b"] = 0x42, ["c"] = 0x43, ["d"] = 0x44,
        ["e"] = 0x45, ["f"] = 0x46, ["g"] = 0x47, ["h"] = 0x48,
        ["i"] = 0x49, ["j"] = 0x4A, ["k"] = 0x4B, ["l"] = 0x4C,
        ["m"] = 0x4D, ["n"] = 0x4E, ["o"] = 0x4F, ["p"] = 0x50,
        ["q"] = 0x51, ["r"] = 0x52, ["s"] = 0x53, ["t"] = 0x54,
        ["u"] = 0x55, ["v"] = 0x56, ["w"] = 0x57, ["x"] = 0x58,
        ["y"] = 0x59, ["z"] = 0x5A, ["enter"] = 0x0D
    },
    -------------------------------------------
    
    Initialize = function(self)
        print("[Spelling Bee! - Preppy Hub] Script loaded!")
        
        self:CreateWindow()
        self:CreateMainTab()
        self:CreateEffectTab()
        self:CreateFontTab()
        self:CreateOtherTab()
        
        task.spawn(function()
            while true do
                task.wait(0.3)
                self:CheckSound()
            end
        end)
        
        task.spawn(function()
            self:UpdateDebugInfo()
        end)
        
        self.Services.Rayfield:LoadConfiguration()
    end,
    
    CreateWindow = function(self)
        self.UI.Window = self.Services.Rayfield:CreateWindow({
            Name = "Spelling Bee! - Preppy Hub (discord.gg/preppyhub)",
            Icon = 128709448017056,
            LoadingTitle = "Spelling Bee! - Preppy Hub",
            LoadingSubtitle = "Thanks for using the script! <3",
            DisableRayfieldPrompts = true,
            ConfigurationSaving = {
                Enabled = true,
                FolderName = nil,
                FileName = "PreppyHub-SpellingBee"
            },
            Discord = {
                Enabled = true,
                Invite = "s3nQKytVkm",
                RememberJoins = false
            },
        })
    end,
    
    CreateMainTab = function(self)
        self.UI.MainTab = self.UI.Window:CreateTab("Auto Type", "type")
        
        self.UI.MainTab:CreateToggle({
            Name = "Auto Type",
            CurrentValue = false,
            Callback = function(state)
                self.Settings.AutoTypeEnabled = state
                if state then
                    self.Settings.LastSound = nil
                    spawn(function()
                        while self.Settings.AutoTypeEnabled do
                            if self.Settings.LastWord and not self.Settings.IsTypingWord and self.Settings.LastWord ~= self.Settings.LastTypedWord then
                                self.Settings.IsTypingWord = true
                                wait(self.Configuration.PreTypeWait)
                                
                                local CurrentText = ""
                                local MadeTypo = false
                                local TypoIndex = nil
                                local IncorrectWord = self.Settings.LastWord
                                local ExtraLetters = 0
                                
                                local TypoMap = {
                                    A = {"Q", "W", "S", "Z"},
                                    B = {"V", "G", "H", "N"},
                                    C = {"X", "D", "F", "V"},
                                    D = {"S", "E", "R", "F", "C", "X"},
                                    E = {"W", "R", "S", "D"},
                                    F = {"D", "R", "T", "G", "V", "C"},
                                    G = {"F", "T", "Y", "H", "B", "V"},
                                    H = {"G", "Y", "U", "J", "N", "B"},
                                    I = {"U", "O", "K", "J"},
                                    J = {"H", "U", "I", "K", "M", "N"},
                                    K = {"J", "I", "O", "L", "M"},
                                    L = {"K", "O", "P"},
                                    M = {"N", "J", "K"},
                                    N = {"B", "H", "J", "M"},
                                    O = {"I", "P", "K", "L"},
                                    P = {"O", "L"},
                                    Q = {"W", "A"},
                                    R = {"E", "T", "D", "F"},
                                    S = {"A", "W", "E", "D", "X", "Z"},
                                    T = {"R", "Y", "F", "G"},
                                    U = {"Y", "I", "H", "J"},
                                    V = {"C", "F", "G", "B"},
                                    W = {"Q", "E", "A", "S"},
                                    X = {"Z", "S", "D", "C"},
                                    Y = {"T", "U", "G", "H"},
                                    Z = {"A", "S", "X"}
                                }
                                
                                if self.Configuration.TypoCorrections and math.random(1, 100) <= self.Configuration.TypoFrequency then
                                    TypoIndex = math.random(2, #self.Settings.LastWord - 1) 
                                    local TypoType = math.random(1, 2) 
                                    
                                    if TypoType == 1 then
                                        IncorrectWord = self.Settings.LastWord:sub(1, TypoIndex) .. self.Settings.LastWord:sub(TypoIndex, TypoIndex) .. self.Settings.LastWord:sub(TypoIndex + 1)
                                        print("[AutoType] Typo Type: Duplicate Letter at index", TypoIndex)
                                    else
                                        local OriginalLetter = self.Settings.LastWord:sub(TypoIndex, TypoIndex):upper()
                                        
                                        if TypoMap[OriginalLetter] then
                                            local PossibleTypos = TypoMap[OriginalLetter]
                                            local RandomIndex = math.random(1, #PossibleTypos)
                                            local TypoLetter = PossibleTypos[RandomIndex]:lower() 
                                            
                                            IncorrectWord = self.Settings.LastWord:sub(1, TypoIndex - 1) .. TypoLetter .. self.Settings.LastWord:sub(TypoIndex + 1)
                                            print("[AutoType] Typo Type: Replaced Letter at index", TypoIndex, "with", TypoLetter)
                                        end
                                    end
                                    
                                    MadeTypo = true
                                    ExtraLetters = math.random(2, 4)
                                end
                                
                                local TypeUntil = MadeTypo and math.min(#IncorrectWord, TypoIndex + ExtraLetters) or #self.Settings.LastWord
                                
                                for i = 1, TypeUntil do
                                    if not self.Settings.AutoTypeEnabled then break end
                                    CurrentText = IncorrectWord:sub(1, i)
                                    Player.PlayerGui.Type.TextBox.Text = CurrentText
                                    wait(self.Configuration.TypingDelay)
                                end
                                
                                if MadeTypo then
                                    wait(self.Configuration.TypingDelay * 2)
                                    
                                    while #Player.PlayerGui.Type.TextBox.Text > TypoIndex do
                                        Player.PlayerGui.Type.TextBox.Text = Player.PlayerGui.Type.TextBox.Text:sub(1, -2)
                                        wait(self.Configuration.TypingDelay / 2)
                                    end
                                    
                                    wait(self.Configuration.TypingDelay * 2)
                                    
                                    for i = #Player.PlayerGui.Type.TextBox.Text + 1, #self.Settings.LastWord do
                                        if not self.Settings.AutoTypeEnabled then break end
                                        Player.PlayerGui.Type.TextBox.Text = self.Settings.LastWord:sub(1, i)
                                        wait(self.Configuration.TypingDelay)
                                    end
                                end
                                
                                if Player.PlayerGui.Type.TextBox.Text == self.Settings.LastWord:sub(1,1):upper() .. self.Settings.LastWord:sub(2) then
                                    self.Services.VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                    self.Services.VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                end
                                
                                self.Settings.IsTypingWord = false
                                self.Settings.LastTypedWord = self.Settings.LastWord
                            end
                            wait()
                        end
                    end)
                end
            end,
        })
        
        self.UI.MainTab:CreateSlider({
            Name = "Typing Speed",
            Range = {0.03, 0.25},
            Increment = 0.005,
            Suffix = "Seconds",
            CurrentValue = self.Configuration.TypingDelay,
            Flag = "TypingSpeedSlider",
            Callback = function(value)
                self.Configuration.TypingDelay = value
            end,
        })
        
        self.UI.MainTab:CreateSlider({
            Name = "Typing Delay",
            Range = {0.5, 2},
            Increment = 0.005,
            Suffix = "Seconds",
            CurrentValue = self.Configuration.PreTypeWait,
            Flag = "TypingDelaySlider",
            Callback = function(value)
                self.Configuration.PreTypeWait = value
            end,
        })
        
        self.UI.MainTab:CreateDivider()
        
        self.UI.WordLabel = self.UI.MainTab:CreateLabel("Current Word: None")
        
        self.UI.MainTab:CreateButton({
            Name = "Copy Current Word",
            Callback = function()
                setclipboard(self.Settings.LastWord)
                self.Services.Rayfield:Notify({
                    Title = "Word Copied!",
                    Content = "The current word has been copied to your clipboard!",
                    Image = "clipboard-copy",
                    Duration = 2,
                })
            end,
        })
        
        self.UI.MainTab:CreateDivider()
        
        self.UI.MainTab:CreateSection("Auto Type - Correcting Typos [Beta]")
        
        self.UI.MainTab:CreateToggle({
            Name = "Auto Make Correcting Typos",
            CurrentValue = self.Configuration.TypoCorrections,
            Flag = "TypoCorrectionsToggle",
            Callback = function(Value)
                self.Configuration.TypoCorrections = Value
            end,
        })
        
        self.UI.MainTab:CreateSlider({
            Name = "Auto Typo Frequency",
            Range = {5, 100},
            Increment = 5,
            Suffix = "% Chance",
            CurrentValue = self.Configuration.TypoFrequency,
            Flag = "TypoSlider",
            Callback = function(Value)
                self.Configuration.TypoFrequency = Value
            end,
        })
        
        self.UI.MainTab:CreateSection("Auto Type - Dynamic Typing Speed [Beta]")
        
        local SpeedToggle = self.UI.MainTab:CreateToggle({
            Name = "Dynamic Typing Speed",
            CurrentValue = false,
            Flag = "DynamicSpeedToggle",
            Callback = function(Value)
                self.Configuration.DynamicTyping = Value
            end,
        })
        
        local SpeedDropdown = self.UI.MainTab:CreateDropdown({
            Name = "Dynamic Typing Speed Range",
            Options = {"0.5 - 0.8", "0.3 - 0.9"},
            CurrentOption = {"0.5 - 0.8"},
            MultipleOptions = false,
            Flag = "DynamicSpeedDropdown",
            Callback = function(option)
                
            end,
        })
        
        self.UI.MainTab:CreateDivider()
        
        self.UI.MainTab:CreateLabel("Need help or having script issues? Join our Discord to chat and get support from the script developers!", "message-circle-question")
        
        self.UI.MainTab:CreateButton({
            Name = "Copy the Preppy Hub Discord invite link",
            Callback = function()
                setclipboard("https://discord.gg/s3nQKytVkm")
                self.Services.Rayfield:Notify({
                    Title = "Link Copied!",
                    Content = "The Discord invite link has been copied to your clipboard!",
                    Image = "clipboard-copy",
                    Duration = 2,
                })
            end,
        })
    end,
    
    CreateEffectTab = function(self)
        self.UI.EffectTab = self.UI.Window:CreateTab("Death Effects", "skull")
        
        self.UI.EffectTab:CreateLabel("Click on a death effect below to equip it!")
        self.UI.EffectTab:CreateLabel("Note: You can only equip death effects that you own. Earn death effects by opening crates in the Shop menu!")
        
        local Effects = {
            {"Common", "DeathEffect", "Default"},
            {"Common", "DeathEffect", "Fade"},
            
            {"Uncommon", "DeathEffect", "Hole"},
            {"Uncommon", "DeathEffect", "Tomato"},
            
            {"Rare", "DeathEffect", "Anvil"},
            {"Rare", "DeathEffect", "Boulder"},
            {"Rare", "DeathEffect", "Hook"},
            
            {"Epic", "DeathEffect", "Big Foot"},
            {"Epic", "DeathEffect", "Explosion"},
            {"Epic", "DeathEffect", "Glitch"},
            {"Epic", "DeathEffect", "Lightning"},
            
            {"Golden", "DeathEffect", "Dragon"},
            {"Golden", "DeathEffect", "Helicopter"},
            {"Golden", "DeathEffect", "Ascension"},
            
            {"Godly", "DeathEffect", "Black Hole"},
            {"Godly", "DeathEffect", "UFO"}
        }
        
        self:CreateItemButtons(self.UI.EffectTab, Effects, "EquipDeathEffect")
    end,

    CreateFontTab = function(self)
        self.UI.FontTab = self.UI.Window:CreateTab("Fonts", "case-sensitive")
        
        self.UI.FontTab:CreateLabel("Click on a font below to equip it!")
        self.UI.FontTab:CreateLabel("Note: You can only equip fonts that you own. Earn fonts by opening crates in the Shop menu!")
        
        local Fonts = {
            {"Common", "Font", "Comic Neue Angular"},
            {"Common", "Font", "Creepster"},
            {"Common", "Font", "Fondamento"},
            {"Common", "Font", "Kalam"},
            {"Common", "Font", "Patrick Hand"},
            {"Common", "Font", "Roman Antique"},
            {"Common", "Font", "Source Sans Pro"},
            
            {"Uncommon", "Font", "Amatic SC"},
            {"Uncommon", "Font", "Grenze Gotisch"},
            {"Uncommon", "Font", "Merriweather"},
            {"Uncommon", "Font", "Special Elite"},
            
            {"Rare", "Font", "Denk One"},
            {"Rare", "Font", "Fredoka One"},
            {"Rare", "Font", "Permanent Marker"},
            
            {"Epic", "Font", "Bangers"},
            {"Epic", "Font", "Indie Flower"},
            
            {"Golden", "Font", "Luckiest Guy"},
            
            {"Godly", "Font", "Press Start 2P"}
        }
        
        self:CreateItemButtons(self.UI.FontTab, Fonts, "EquipTypeFont")
    end,
    
    CreateOtherTab = function(self)
        self.UI.OtherTab = self.UI.Window:CreateTab("Other", "circle-ellipsis")
        
        local ThemeOptions = {
            ["Default"] = "Default",
            ["Amber Glow"] = "AmberGlow",
            ["Amethyst"] = "Amethyst",
            ["Bloom"] = "Bloom",
            ["Dark Blue"] = "DarkBlue",
            ["Green"] = "Green",
            ["Light"] = "Light",
            ["Ocean"] = "Ocean",
            ["Serenity"] = "Serenity"
        }
        
        local ThemeDropdown = self.UI.OtherTab:CreateDropdown({
            Name = "Change Menu Theme",
            Options = {"Default", "Amber Glow", "Amethyst", "Bloom", "Dark Blue", "Green", "Light", "Ocean", "Serenity"},
            CurrentOption = {"Default"},
            MultipleOptions = false,
            Flag = "ThemeDropdown",
            Callback = function(Options)
                local SelectedDisplayName = Options[1]
                local ThemeIdentifier = ThemeOptions[SelectedDisplayName]
                if ThemeIdentifier then
                    self.UI.Window.ModifyTheme(ThemeIdentifier)
                end
            end,
        })
        
        self.UI.OtherTab:CreateDivider()
        
        self.UI.OtherTab:CreateButton({
            Name = "Execute Infinite Yield",
            Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            end,
        })
        
        self.UI.OtherTab:CreateButton({
            Name = "Copy Server Job ID",
            Callback = function()
                setclipboard(game.JobId)
                self.Services.Rayfield:Notify({
                    Title = "Link Copied!",
                    Content = "The server Job ID has been copied to your clipboard!",
                    Image = "clipboard-copy",
                    Duration = 2,
                })
            end,
        })
        
        self.UI.OtherTab:CreateDivider()
        
        self.UI.OtherTab:CreateSection("Links")
        
        self.UI.OtherTab:CreateButton({
            Name = "Copy the Preppy Hub Discord invite link",
            Callback = function()
                setclipboard("https://discord.gg/s3nQKytVkm")
                self.Services.Rayfield:Notify({
                    Title = "Link Copied!",
                    Content = "The Discord invite link has been copied to your clipboard!",
                    Image = "clipboard-copy",
                    Duration = 2,
                })
            end,
        })
        
        self.UI.OtherTab:CreateButton({
            Name = "Copy the Preppy Hub YouTube channel link",
            Callback = function()
                setclipboard("https://www.youtube.com/@preppyhubscripts")
                self.Services.Rayfield:Notify({
                    Title = "Link Copied!",
                    Content = "The YouTube channel link has been copied to your clipboard!",
                    Image = "clipboard-copy",
                    Duration = 2,
                })
            end,
        })
        
        self.UI.OtherTab:CreateDivider()
        
        local InformationParagraph = self.UI.OtherTab:CreateParagraph({
            Title = "Debug Information",
            Content = "Loading..."
        })
        
        task.spawn(function()
            while true do
                local DiffNames = {
                    [1] = "Easy", [2] = "Normal", [3] = "Hard", [4] = "Extreme", [5] = "Randomiser"
                }
                local DifficultyText = DiffNames[ReplicatedStorage.Values.ServerDifficulty.Value] or "Unknown"
                local ServerType = ReplicatedStorage.Values.PrivateServer.Value and "Private Server" or "Public Server"
                local MaxPlayers = 10
                
                local AccountAge = Player.AccountAge .. (Player.AccountAge == 1 and " day" or " days")
                local Playtime = self:FormatPlaytime(
                    Player:FindFirstChild("PlayerData") 
                    and Player.PlayerData:FindFirstChild("Playtime") 
                    and Player.PlayerData.Playtime.Value 
                    or 0
                )

                local PlayerStars = Player:FindFirstChild("PlayerData") 
                    and Player.PlayerData:FindFirstChild("Stars") 
                    and Player.PlayerData.Stars.Value 
                    or "Unknown"

                local TotalWords = Player:FindFirstChild("PlayerData") 
                    and Player.PlayerData:FindFirstChild("TotalWords") 
                    and Player.PlayerData.TotalWords.Value 
                    or "Unknown"

                local EquippedFont = Player:FindFirstChild("PlayerData") 
                    and Player.PlayerData:FindFirstChild("TypeFont") 
                    and Player.PlayerData.TypeFont.Value 
                    or "Unknown"

                local EquippedEffect = Player:FindFirstChild("PlayerData") 
                    and Player.PlayerData:FindFirstChild("DeathEffect") 
                    and Player.PlayerData.DeathEffect.Value 
                    or "Unknown"

                local ServerPlayers = #Players:GetPlayers() .. " / " .. MaxPlayers
                
                InformationParagraph:Set({
                    Title = "Information",
                    Content = "Username: " .. Player.DisplayName .. " (@" .. Player.Name .. ")" ..
                            "\nAccount Age: " .. AccountAge ..
                            "\n\nTotal Playtime: " .. Playtime ..
                            "\nPlayer Stars: " .. PlayerStars ..
                            "\nTotal Correct Words: " .. TotalWords ..
                            "\nEquipped Font: " .. EquippedFont ..
                            "\nEquipped Death Effect: " .. EquippedEffect ..
                            "\n\nServer Difficulty: " .. DifficultyText ..
                            "\nServer Type: " .. ServerType ..
                            "\nServer Players: " .. ServerPlayers ..
                            "\n\nScript Version: V" .. self.Settings.Version ..
                            "\nSupported Words: " .. self.Settings.SupportedWords .. " / 540"
                })
                
                task.wait(60)
            end
        end)
    end,
    
    UpdateCurrentWord = function(self, word)
        if self.Settings.TypingStatus or self.Settings.LastWord == word then return end
        
        self.Settings.LastWord = word
        local CapitalizedWord = word:sub(1,1):upper() .. word:sub(2)
        
        print("[Preppy Hub] Found word: " .. CapitalizedWord)
        
        self.UI.WordLabel:Set("Current Word: " .. CapitalizedWord)
    end,
    
    CheckSound = function(self)
        local DetectedSound = nil
        
        local ServicesToCheck = {workspace, game.Lighting}
        
        for _, Service in ipairs(ServicesToCheck) do
            for _, Object in ipairs(Service:GetDescendants()) do
                if Object:IsA("Sound") and Object.Playing then
                    local ID = Object.SoundId
                    if self.Settings.Words[ID] then
                        DetectedSound = ID
                    end
                end
            end
        end
        
        if DetectedSound and DetectedSound ~= self.Settings.LastSound then
            self.Settings.LastSound = DetectedSound
            self:UpdateCurrentWord(self.Settings.Words[DetectedSound])
        end
    end,
    
    CreateItemButtons = function(self, tab, items, eventName)
        for _, ItemData in pairs(items) do
            local Difficulty, Category, Item = unpack(ItemData)
            
            tab:CreateButton({
                Name = Item .. " (" .. Difficulty .. ")",
                Callback = function()
                    self.Services.Events:WaitForChild(eventName):FireServer(Item) 
                end
            })
        end
    end,
    
    FormatPlaytime = function(self, seconds)
        local Minutes = math.floor(seconds / 60)
        local Hours = math.floor(Minutes / 60)
        seconds = seconds % 60
        Minutes = Minutes % 60
        
        local Parts = {}
        
        if Hours > 0 then
            table.insert(Parts, Hours .. (Hours == 1 and " hour" or " hours"))
        end
        if Minutes > 0 then
            table.insert(Parts, Minutes .. (Minutes == 1 and " minute" or " minutes"))
        end
        if seconds > 0 and #Parts == 0 then
            table.insert(Parts, seconds .. (seconds == 1 and " second" or " seconds"))
        end
        
        return table.concat(Parts, ", ")
    end,
    
    UpdateDebugInfo = function(self)
        while true do
            task.wait(60)
        end
    end
}

---------------------------------------------------------------------------------
--// Initialize
---------------------------------------------------------------------------------
SpellingBee:Initialize()