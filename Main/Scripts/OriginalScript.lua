--[[
    Deobfuscated By: @ilvarni / discord; ilvarni

    Version 1.0.3a

    Preppy-Hub.lua
    Auto-Typer for Spelling Bee.

    ----------------------------

    Small Note; i kept their ChatGPT comments, lol.
]]


local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
print("[Spelling Bee! - Preppy Hub] Script loaded!")

local WordsList = {}

local keycodemap = {
    ["a"] = 0x41, ["b"] = 0x42, ["c"] = 0x43, ["d"] = 0x44,
    ["e"] = 0x45, ["f"] = 0x46, ["g"] = 0x47, ["h"] = 0x48,
    ["i"] = 0x49, ["j"] = 0x4A, ["k"] = 0x4B, ["l"] = 0x4C,
    ["m"] = 0x4D, ["n"] = 0x4E, ["o"] = 0x4F, ["p"] = 0x50,
    ["q"] = 0x51, ["r"] = 0x52, ["s"] = 0x53, ["t"] = 0x54,
    ["u"] = 0x55, ["v"] = 0x56, ["w"] = 0x57, ["x"] = 0x58,
    ["y"] = 0x59, ["z"] = 0x5A, ["enter"] = 0x0D,
}

local typingdelay = 0.25
local autotypeenabled = false
local lastsound = nil
local lastword = "None"
local istypingmaybe = false
local typingword = false
local pretypewait = 1.25

local typocorrections = false
local typofrequency = 20

local version = 1.3
local supportedwords = 538

local Window = Rayfield:CreateWindow({
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

local Tab = Window:CreateTab("Auto Type", "type")

Tab:CreateToggle({
    Name = "Auto Type",
    CurrentValue = false,
    Callback = function(state)
        AutoType = state
        if state then
            lastsound = nil
            spawn(function()
                while AutoType do
                    if lastword and not typingword and lastword ~= lastTypedWord then
                        typingword = true
                        wait(pretypewait)

                        local currentText = ""
                        local madeTypo = false
                        local typoIndex = nil
                        local incorrectWord = lastword
                        local extraLetters = 0

                        -- Typo mapping table (realistic replacements based on nearby keys)
                        local typoMap = {
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
                        if typocorrections and math.random(1, 100) <= typofrequency then
                            typoIndex = math.random(2, #lastword - 1) -- Avoid first and last letter
                            local typoType = math.random(1, 2) -- 1 for duplicate, 2 for random letter replacement

                            if typoType == 1 then
                                -- Duplicate letter typo
                                incorrectWord = lastword:sub(1, typoIndex) .. lastword:sub(typoIndex, typoIndex) .. lastword:sub(typoIndex + 1)
                                print("[AutoType] Typo Type: Duplicate Letter at index", typoIndex)
                            else
                                -- Replace letter typo (realistic mistyped letter)
                                local originalLetter = lastword:sub(typoIndex, typoIndex):upper()
                                
                                if typoMap[originalLetter] then
                                    local possibleTypos = typoMap[originalLetter]
                                    local randomIndex = math.random(1, #possibleTypos)
                                    local typoLetter = possibleTypos[randomIndex]:lower() -- Convert back to lowercase
                                    
                                    incorrectWord = lastword:sub(1, typoIndex - 1) .. typoLetter .. lastword:sub(typoIndex + 1)
                                    print("[AutoType] Typo Type: Replaced Letter at index", typoIndex, "with", typoLetter)
                                end
                            end

                            madeTypo = true
                            extraLetters = math.random(2, 4)
                        end

                        local typeUntil = madeTypo and math.min(#incorrectWord, typoIndex + extraLetters) or #lastword

                        -- Typing simulation
                        for i = 1, typeUntil do
                            if not AutoType then break end
                            currentText = incorrectWord:sub(1, i)
                            game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text = currentText
                            wait(typingdelay)
                        end

                        -- Typo correction process
                        if madeTypo then
                            wait(typingdelay * 2)

                            -- Backspace incorrect letters
                            while #game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text > typoIndex do
                                game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text = game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text:sub(1, -2)
                                wait(typingdelay / 2)
                            end

                            wait(typingdelay * 2)

                            -- Retype correct letters
                            for i = #game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text + 1, #lastword do
                                if not AutoType then break end
                                game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text = lastword:sub(1, i)
                                wait(typingdelay)
                            end
                        end

                        -- Submit the typed word
                        if game.Players.LocalPlayer.PlayerGui.Type.TextBox.Text == lastword:sub(1,1):upper() .. lastword:sub(2) then
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        end

                        typingword = false
                        lastTypedWord = lastword
                    end
                    wait()
                end
            end)
        end
    end,
})


Tab:CreateSlider({
    Name = "Typing Speed",
    Range = {0.03, 0.25},
    Increment = 0.005,
	Suffix = "Seconds",
    CurrentValue = typingdelay,
    Flag = "TypingSpeedSlider",
    Callback = function(value)
        typingdelay = value
    end,
})

Tab:CreateSlider({
    Name = "Typing Delay",
    Range = {0.5, 2},
    Increment = 0.005,
	Suffix = "Seconds",
    CurrentValue = pretypewait,
    Flag = "TypingDelaySlider",
    Callback = function(value)
        pretypewait = value
    end,
})

Tab:CreateDivider()

local Label = Tab:CreateLabel("Current Word: None")
Tab:CreateButton({
    Name = "Copy Current Word",
    Callback = function()
        setclipboard(lastword)
        Rayfield:Notify({
            Title = "Word Copied!",
            Content = "The current word has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

Tab:CreateDivider()

Tab:CreateSection("Auto Type - Correcting Typos [Beta]")

Tab:CreateToggle({
   Name = "Auto Make Correcting Typos",
   CurrentValue = typocorrections,
   Flag = "TypoCorrectionsToggle",
   Callback = function(Value)
	typocorrections = Value
   end,
})

Tab:CreateSlider({
   Name = "Auto Typo Frequency",
   Range = {5, 100},
   Increment = 5,
   Suffix = "% Chance",
   CurrentValue = typofrequency,
   Flag = "TypoSlider",
   Callback = function(Value)
	typofrequency = Value
   end,
})

Tab:CreateSection("Auto Type - Dynamic Typing Speed [Beta]")
local dynamictyping = false

local SpeedToggle = Tab:CreateToggle({
    Name = "Dynamic Typing Speed",
    CurrentValue = false,
    Flag = "DynamicSpeedToggle",
    Callback = function(Value)
        dynamictyping = Value
    end,
})

local SpeedDropdown = Tab:CreateDropdown({
    Name = "Dynamic Typing Speed Range",
    Options = {"0.5 - 0.8", "0.3 - 0.9"},
    CurrentOption = {"0.5 - 0.8"},
    MultipleOptions = false,
    Flag = "DynamicSpeedDropdown",
    Callback = function(option)
        
    end,
})

Tab:CreateDivider()

Tab:CreateLabel("Need help or having script issues? Join our Discord to chat and get support from the script developers!", "message-circle-question")
Tab:CreateButton({
    Name = "Copy the Preppy Hub Discord invite link",
    Callback = function()
        setclipboard("https://discord.gg/s3nQKytVkm")
        Rayfield:Notify({
            Title = "Link Copied!",
            Content = "The Discord invite link has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

local function updatecurrentword(word)
    if typingstatus or lastword == word then return end
    lastword = word
    local capitalizedWord = word:sub(1,1):upper() .. word:sub(2)

    print("[Preppy Hub] Found word: " .. capitalizedWord)

    Label:Set("Current Word: " .. capitalizedWord)

    if autotypeenabled then
        task.delay(typingdelay, function()
            if lastword == word and not istyping then
                autotypeword(capitalizedWord)
            end
        end)
    end
end

local function checksound()
    local detectedSound = nil

    local servicestocheck = {workspace, game.Lighting}
    
    for _, service in ipairs(servicestocheck) do
        for _, obj in ipairs(service:GetDescendants()) do
            if obj:IsA("Sound") and obj.Playing then
                local id = obj.SoundId
                if wordlist[id] then
                    detectedSound = id
                end
            end
        end
    end

    if detectedSound and detectedSound ~= lastsound then
        lastsound = detectedSound
        updatecurrentword(wordlist[detectedSound])
    end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")

local function createButton(tab, items, eventName)
    for _, itemData in pairs(items) do
        local difficulty, category, item = unpack(itemData)
        
        tab:CreateButton({
            Name = item .. " (" .. difficulty .. ")",
            Callback = function()
                Events:WaitForChild(eventName):FireServer(item) 
            end
        })
    end
end

local EffectTab = Window:CreateTab("Death Effects", "skull")
local EffectLabel1 = EffectTab:CreateLabel("Click on a death effect below to equip it!")
local EffectLabel2 = EffectTab:CreateLabel("Note: You can only equip death effects that you own. Earn death effects by opening crates in the Shop menu!")
local effects = {
    {"Common", "DeathEffect", "Default"}, {"Common", "DeathEffect", "Fade"}, {"Uncommon", "DeathEffect", "Hole"}, {"Uncommon", "DeathEffect", "Tomato"},
    {"Rare", "DeathEffect", "Anvil"}, {"Rare", "DeathEffect", "Boulder"}, {"Rare", "DeathEffect", "Hook"}, {"Epic", "DeathEffect", "Big Foot"},
    {"Epic", "DeathEffect", "Explosion"}, {"Epic", "DeathEffect", "Glitch"}, {"Epic", "DeathEffect", "Lightning"}, {"Golden", "DeathEffect", "Dragon"},
    {"Golden", "DeathEffect", "Helicopter"}, {"Golden", "DeathEffect", "Ascension"}, {"Godly", "DeathEffect", "Black Hole"}, {"Godly", "DeathEffect", "UFO"}
}
createButton(EffectTab, effects, "EquipDeathEffect")

local FontTab = Window:CreateTab("Fonts", "case-sensitive")
local FontLabel1 = FontTab:CreateLabel("Click on a font below to equip it!")
local FontLabel2 = FontTab:CreateLabel("Note: You can only equip fonts that you own. Earn fonts by opening crates in the Shop menu!")
local fonts = {
    {"Common", "Font", "Comic Neue Angular"}, {"Common", "Font", "Creepster"}, {"Common", "Font", "Fondamento"}, {"Common", "Font", "Kalam"},
    {"Common", "Font", "Patrick Hand"}, {"Common", "Font", "Roman Antique"}, {"Common", "Font", "Source Sans Pro"}, {"Uncommon", "Font", "Amatic SC"},
    {"Uncommon", "Font", "Grenze Gotisch"}, {"Uncommon", "Font", "Merriweather"}, {"Uncommon", "Font", "Special Elite"}, {"Rare", "Font", "Denk One"},
    {"Rare", "Font", "Fredoka One"}, {"Rare", "Font", "Permanent Marker"}, {"Epic", "Font", "Bangers"}, {"Epic", "Font", "Indie Flower"},
    {"Golden", "Font", "Luckiest Guy"}, {"Godly", "Font", "Press Start 2P"}
}
createButton(FontTab, fonts, "EquipTypeFont")

local OtherTab = Window:CreateTab("Other", "circle-ellipsis")

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

local ThemeDropdown = OtherTab:CreateDropdown({
    Name = "Change Menu Theme",
    Options = {"Default", "Amber Glow", "Amethyst", "Bloom", "Dark Blue", "Green", "Light", "Ocean", "Serenity"},
    CurrentOption = {"Default"},
    MultipleOptions = false,
    Flag = "ThemeDropdown",
    Callback = function(Options)
        local selectedDisplayName = Options[1]
        local themeIdentifier = ThemeOptions[selectedDisplayName]
        if themeIdentifier then
            Window.ModifyTheme(themeIdentifier)
        end
    end,
})

OtherTab:CreateDivider()

OtherTab:CreateButton({
   Name = "Execute Infinite Yield",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

OtherTab:CreateButton({
    Name = "Copy Server Job ID",
    Callback = function()
        setclipboard(game.JobId)
        Rayfield:Notify({
            Title = "Link Copied!",
            Content = "The server Job ID has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

OtherTab:CreateDivider()

OtherTab:CreateSection("Links")
OtherTab:CreateButton({
    Name = "Copy the Preppy Hub Discord invite link",
    Callback = function()
        setclipboard("https://discord.gg/s3nQKytVkm")
        Rayfield:Notify({
            Title = "Link Copied!",
            Content = "The Discord invite link has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

OtherTab:CreateButton({
    Name = "Copy the Preppy Hub YouTube channel link",
    Callback = function()
        setclipboard("https://www.youtube.com/@preppyhubscripts")
        Rayfield:Notify({
            Title = "Link Copied!",
            Content = "The YouTube channel link has been copied to your clipboard!",
            Image = "clipboard-copy",
            Duration = 2,
        })
    end,
})

OtherTab:CreateDivider()

local InformationParagraph = OtherTab:CreateParagraph({
    Title = "Debug Information",
    Content = "Loading..."
})

local player, rs, diffNames = game.Players.LocalPlayer, game:GetService("ReplicatedStorage"), {
    [1] = "Easy", [2] = "Normal", [3] = "Hard", [4] = "Extreme", [5] = "Randomiser"
}
local difficultyText = diffNames[rs.Values.ServerDifficulty.Value] or "Unknown"
local serverType = rs.Values.PrivateServer.Value and "Private Server" or "Public Server"
local maxPlayers = 10

local function formatPlaytime(seconds)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)
    seconds = seconds % 60
    minutes = minutes % 60

    local parts = {}

    if hours > 0 then
        table.insert(parts, hours .. (hours == 1 and " hour" or " hours"))
    end
    if minutes > 0 then
        table.insert(parts, minutes .. (minutes == 1 and " minute" or " minutes"))
    end
    if seconds > 0 and #parts == 0 then
        table.insert(parts, seconds .. (seconds == 1 and " second" or " seconds"))
    end

    return table.concat(parts, ", ")
end

local function updateDebugInfo()
    while true do
        local accountAge = player.AccountAge .. (player.AccountAge == 1 and " day" or " days")
        local playtime = formatPlaytime(player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("Playtime") and player.PlayerData.Playtime.Value or 0)
        local playerStars = player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("Stars") and player.PlayerData.Stars.Value or "Unknown"
        local totalWords = player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("TotalWords") and player.PlayerData.TotalWords.Value or "Unknown"
        local equippedFont = player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("TypeFont") and player.PlayerData.TypeFont.Value or "Unknown"
        local equippedEffect = player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("DeathEffect") and player.PlayerData.DeathEffect.Value or "Unknown"
        local serverPlayers = #game.Players:GetPlayers() .. " / " .. maxPlayers

        InformationParagraph:Set({
            Title = "Information",
            Content = "Username: " .. player.DisplayName .. " (@" .. player.Name .. ")" ..
                      "\nAccount Age: " .. accountAge ..
                      "\n\nTotal Playtime: " .. playtime ..
                      "\nPlayer Stars: " .. playerStars ..
                      "\nTotal Correct Words: " .. totalWords ..
                      "\nEquipped Font: " .. equippedFont ..
                      "\nEquipped Death Effect: " .. equippedEffect ..
                      "\n\nServer Difficulty: " .. difficultyText ..
                      "\nServer Type: " .. serverType ..
                      "\nServer Players: " .. serverPlayers ..
                      "\n\nScript Version: V" .. version ..
                      "\nSupported Words: " .. supportedwords .. " / 540"
        })

        task.wait(60)
    end
end

task.spawn(updateDebugInfo)


task.spawn(function()
    while true do
        task.wait(0.3)
        checksound()
    end
end)

Rayfield:LoadConfiguration()