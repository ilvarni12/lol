--[[
    Deobfuscated By: @ilvarni / discord; ilvarni

    Reformatted By: @ilvarni / discord; ilvarni


    Version 1.0.3b

    Preppy-Hub.lua
    Auto-Typer for Spelling Bee.

    ----------------------------

    Small Note; i kept their ChatGPT comments, lol.
    Script Before Formatting ; 
]]

---------------------------------------------------------------------------------
--// Types
---------------------------------------------------------------------------------

export type Types = {
    --// Services
    Services: {
        Rayfield: any,
        VirtualInputManager: any,
        ReplicatedStorage: any,
    },
    
    --// Settings
    Settings: {
        TypingDelay: number,
        PreTypeWait: number,
        TypoFrequency: number,
        TypoCorrections: boolean,
    },
    
    --// Variables
    Variables: {
        LastSound: string?,
        LastWord: string,
        IsTypingMaybe: boolean,
        TypingWord: boolean,
        LastTypedWord: string?,
        AutoType: boolean,
    },
    
    --// Functions
    UpdateCurrentWord: (self: Types, Word: string) -> (),
    CheckSound: (self: Types) -> (),
    CreateButton: (self: Types, Tab: any, Items: {any}, EventName: string) -> (),
}

---------------------------------------------------------------------------------
--// Main Module
---------------------------------------------------------------------------------

local PreppyHub = {
    -------------------------------------------
    Services = {
        Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))(),
        VirtualInputManager = game:GetService("VirtualInputManager"),
        ReplicatedStorage = game:GetService("ReplicatedStorage"),
    },
    -------------------------------------------
    Settings = {
        TypingDelay = 0.25,
        PreTypeWait = 1.25,
        TypoFrequency = 20,
        TypoCorrections = false,
        DynamicTyping = false,
        Version = 1.3,
        SupportedWords = 538
    },
    -------------------------------------------
    Variables = {
        LastSound = nil,
        LastWord = "None",
        IsTypingMaybe = false,
        TypingWord = false,
        LastTypedWord = nil,
        AutoType = false,
    },
    -------------------------------------------
    UpdateCurrentWord = function(self, Word)
        if TypingStatus or self.Variables.LastWord == Word then 
            return 
        end
        
        self.Variables.LastWord = Word
        local CapitalizedWord = Word:sub(1,1):upper() .. Word:sub(2)

        print("[Preppy Hub] Found word: " .. CapitalizedWord)

        Label:Set(
            "Current Word: " .. CapitalizedWord
        )

        if AutoTypeEnabled then
            task.delay(
                self.Settings.TypingDelay,
                function()
                    if self.Variables.LastWord == Word and not IsTyping then
                        self:AutoTypeWord(CapitalizedWord)
                    end
                end
            )
        end
    end,
    
    CheckSound = function(self)
        local DetectedSound = nil
        local ServicesToCheck = {workspace, game.Lighting}
        
        for _, Service in ipairs(ServicesToCheck) do
            for _, Obj in ipairs(Service:GetDescendants()) do
                if Obj:IsA("Sound") and Obj.Playing then
                    local Id = Obj.SoundId
                    if WordList[Id] then
                        DetectedSound = Id
                    end
                end
            end
        end

        if DetectedSound and DetectedSound ~= self.Variables.LastSound then
            self.Variables.LastSound = DetectedSound
            self:UpdateCurrentWord(WordList[DetectedSound])
        end
    end,
    
    CreateButton = function(self, Tab, Items, EventName)
        for _, ItemData in pairs(Items) do
            local Difficulty, Category, Item = unpack(ItemData)
            
            Tab:CreateButton({
                Name = Item .. " (" .. Difficulty .. ")",
                Callback = function()
                    Events:WaitForChild(EventName):FireServer(Item) 
                end
            })
        end
    end,
    
    AutoTypeWord = function(self, Word)
        if self.Variables.TypingWord then return end
        self.Variables.TypingWord = true
        
        wait(self.Settings.PreTypeWait)
        
        local CurrentText = ""
        local MadeTypo = false
        local TypoIndex = nil
        local IncorrectWord = Word
        local ExtraLetters = 0
        
        -- Typo mapping table
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
        
        -- Determine if a typo should be made
        if self.Settings.TypoCorrections and math.random(1, 100) <= self.Settings.TypoFrequency then
            TypoIndex = math.random(2, #Word - 1)
            local TypoType = math.random(1, 2)
            
            if TypoType == 1 then
                IncorrectWord = Word:sub(1, TypoIndex) .. Word:sub(TypoIndex, TypoIndex) .. Word:sub(TypoIndex + 1)
            else
                local OriginalLetter = Word:sub(TypoIndex, TypoIndex):upper()
                
                if TypoMap[OriginalLetter] then
                    local PossibleTypos = TypoMap[OriginalLetter]
                    local RandomIndex = math.random(1, #PossibleTypos)
                    local TypoLetter = PossibleTypos[RandomIndex]:lower()
                    
                    IncorrectWord = Word:sub(1, TypoIndex - 1) .. TypoLetter .. Word:sub(TypoIndex + 1)
                end
            end
            
            MadeTypo = true
            ExtraLetters = math.random(2, 4)
        end
        
        local TypeUntil = MadeTypo and math.min(#IncorrectWord, TypoIndex + ExtraLetters) or #Word
        
        -- Typing simulation
        for i = 1, TypeUntil do
            if not self.Variables.AutoType then break end
            CurrentText = IncorrectWord:sub(1, i)
            game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text = CurrentText
            wait(self.Settings.TypingDelay)
        end
        
        -- Typo correction process
        if MadeTypo then
            wait(self.Settings.TypingDelay * 2)
            
            while #game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text > TypoIndex do
                game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text = game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text:sub(1, -2)
                wait(self.Settings.TypingDelay / 2)
            end
            
            wait(self.Settings.TypingDelay * 2)
            
            for i = #game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text + 1, #Word do
                if not self.Variables.AutoType then break end
                game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text = Word:sub(1, i)
                wait(self.Settings.TypingDelay)
            end
        end
        
        -- Submit the typed word
        if game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text == Word:sub(1,1):upper() .. Word:sub(2) then
            self.Services.VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            self.Services.VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        end
        
        self.Variables.TypingWord = false
        self.Variables.LastTypedWord = Word
    end,
}

---------------------------------------------------------------------------------
--// Initialization
---------------------------------------------------------------------------------

task.spawn(function()
    while true do
        task.wait(0.3)
        PreppyHub:CheckSound()
    end
end)
