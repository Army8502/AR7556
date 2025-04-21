-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local workspace = game:GetService("Workspace")

-- UI Setup
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "PlayerMonitor"

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 350, 0, 250)
mainFrame.Position = UDim2.new(0, 20, 0, 100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0, 0)

local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local scrollingFrame = Instance.new("ScrollingFrame", mainFrame)
scrollingFrame.Size = UDim2.new(1, -10, 1, -40)
scrollingFrame.Position = UDim2.new(0, 5, 0, 30)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local uiListLayout = Instance.new("UIListLayout", scrollingFrame)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 4)

local espTags = {}
local detailFrames = {}
local disabledESPPlayers = {}  -- Store ESP disable status
local highlights = {}  -- Store highlight objects

function createESP(player)
    if player == LocalPlayer then return end
    if espTags[player] then return end
    if disabledESPPlayers[player] then return end  -- Check if ESP is disabled

    local character = player.Character
    if not character then
        player.CharacterAdded:Wait()  -- Wait for character to be added
        character = player.Character
    end
    
    local head = character:FindFirstChild("Head")
    if not head then return end

    local tag = Instance.new("BillboardGui")
    tag.Adornee = head
    tag.Name = "NameTag"
    tag.Size = UDim2.new(0, 100, 0, 20)
    tag.StudsOffset = Vector3.new(0, 2, 0)
    tag.AlwaysOnTop = true
    tag.Parent = screenGui

    local nameLabel = Instance.new("TextLabel", tag)
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.TextSize = 14

    espTags[player] = tag

    -- ESP highlight for character
    local highlight = Instance.new("Highlight")
    highlight.Parent = character
    highlight.FillColor = Color3.fromRGB(255, 0, 0)  -- Red color
    highlight.FillTransparency = 0.5  -- Transparency
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineTransparency = 0.5
    highlights[player] = highlight
end

function removeESP(player)
    if espTags[player] then
        espTags[player]:Destroy()
        espTags[player] = nil
    end
    if detailFrames[player] then
        detailFrames[player]:Destroy()
        detailFrames[player] = nil
    end
    -- Remove Highlight when player leaves
    if player.Character then
        local highlight = player.Character:FindFirstChildOfClass("Highlight")
        if highlight then
            highlight:Destroy()
        end
    end
    highlights[player] = nil
end

function refreshHighlight(player)
    if highlights[player] then
        local highlight = highlights[player]
        if highlight.Parent then
            highlight:Destroy()  -- Destroy the old highlight
        end

        -- Recreate the highlight
        local character = player.Character
        if character and character:FindFirstChild("Head") then
            local newHighlight = Instance.new("Highlight")
            newHighlight.Parent = character
            newHighlight.FillColor = Color3.fromRGB(255, 0, 0)  -- Red color
            newHighlight.FillTransparency = 0.5  -- Transparency
            newHighlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            newHighlight.OutlineTransparency = 0.5
            highlights[player] = newHighlight
        end
    end
end

local emojiMap = {
    -- Weapons
    ["M24"] = "🦌",
    ["C9"] = "🔫",
    ["Draco"] = "🔫",
    ["Uzi"] = "🔫",
    ["P226"] = "🔫",
    ["Double Barrel"] = "💥",
    ["AK47"] = "🔫",
    ["Remington"] = "🔫",
    ["RPG"] = "🚀",
    ["MP5"] = "🔫",
    ["Glock"] = "🔫",
    ["Sawnoff"] = "💥",
    ["Crossbow"] = "🏹",
    ["Hunting Rifle"] = "🦌",
    ["G3"] = "🔫",
    ["Anaconda"] = "🔫",

    -- Utility Items
    ["Soda Can"] = "🥤",
    ["Rock"] = "🗿",
    ["Mug"] = "🥛",
    ["Spray Can"] = "🧯",
    ["Molotov"] = "🍾🔥",
    ["Grenade"] = "💣",
    ["Jar"] = "🥫",
    ["Fire Cracker"] = "🧨",
    ["Dumbbell Plate"] = "🏋️",
    ["Cinder Block"] = "🧱",
    ["Brick"] = "🧱",
    ["Bowling Pin"] = "🎳",
    ["Milkshake"] = "🥤",
    ["Bottle"] = "🍾",
    ["Jerry Can"] = "🛢️",
    ["Glass"] = "🥛",
    ["Tomato"] = "🍅",

    -- Melee Weapons
    ["Silver Mop"] = "🧹", 
    ["Bronze Mop"] = "🧹",
    ["Diamond Mop"] = "🧹",
    ["Gold Mop"] = "🧹",
    ["Mop"] = "🧹",

    ["Baseball Bat"] = "🏏",
    ["Barbed Baseball Bat"] = "🏏",
    ["Bike Lock"] = "🔒",

    ["Axe"] = "🪓",
    ["Tactical Axe"] = "🪓",
    ["Combat Axe"] = "🪓",

    ["Switchblade"] = "🔪",
    ["Tactical Knife"] = "🗡️",
    ["Butcher Knife"] = "🔪",
    ["Machette"] = "🔪",
    ["Shank"] = "🗡️",

    ["Tactical Shovel"] = "⛏️",
    ["Rusty Shovel"] = "⚒️",
    ["Shovel"] = "🧹",

    ["Wrench"] = "🔧",
    ["Tire Iron"] = "🛠️",
    ["Sledge Hammer"] = "🛠️",
    ["Hammer"] = "🔨",
    ["Crowbar"] = "🔩",

    ["Taser"] = "⚡",
    ["Frying Pan"] = "🍳",
    ["Rolling Pin"] = "🌀",
    ["Pool Cue"] = "🎱",
    ["Chair Leg"] = "🪑",

    ["Wooden Board"] = "🥖",
    ["Nailed Wooden Board"] = "🥖",
    ["Metal Pipe"] = "📏",
    ["Metal Baseball Bat"] = "🥎",

    -- Medical Items
    ["Bandage"] = "🩹",
    ["First Aid Kit"] = "⛑️",
    ["Blood Bag"] = "🩸",
    ["Emergency Care Kit"] = "🚑",
    ["Pain Relief"] = "💊",
    ["Energy Shot"] = "💉",
    ["Pre Workout"] = "🏋️‍♂️⚡",
    ["Bull Energy"] = "🐂⚡",
    ["Monster X"] = "👹⚡",
    ["Energy Bar Max"] = "🍫⚡"
}

local function showPlayerDetails(player)
    if detailFrames[player] then
        detailFrames[player].Visible = not detailFrames[player].Visible
        return
    end

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 150, 0, 110)
    frame.Position = UDim2.new(0, mainFrame.AbsolutePosition.X + mainFrame.AbsoluteSize.X + 10, 0, mainFrame.AbsolutePosition.Y)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true

    local layout = Instance.new("UIListLayout", frame)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center

    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        local itemCount = 0
        for _, item in ipairs(backpack:GetChildren()) do
            if item:IsA("Tool") and item.Name ~= "Fists" then
                if itemCount >= 4 then break end
                itemCount = itemCount + 1

                local label = Instance.new("TextLabel", frame)
                label.Size = UDim2.new(0, 130, 0, 20)
                label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                label.TextColor3 = Color3.new(1, 1, 1)
                label.Font = Enum.Font.SourceSans
                label.TextSize = 14
                label.TextXAlignment = Enum.TextXAlignment.Center
                label.TextYAlignment = Enum.TextYAlignment.Center
                label.BorderSizePixel = 0
                label.ClipsDescendants = true
                label.BackgroundTransparency = 0.2

                local emoji = emojiMap[item.Name] or ""  -- ใช้ emojiMap แทน weaponEmojis
                label.Text = emoji .. " " .. item.Name
            end
        end
    end

    detailFrames[player] = frame
end


-- ฟังก์ชันอัปเดตข้อมูลใน Player List
local function updatePlayerList()
    -- ลบ TextButton ที่มีอยู่ก่อน
    for _, child in pairs(scrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then 
            child:Destroy() 
        end
    end

    -- อัปเดตรายชื่อผู้เล่น
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local playerFrame = Instance.new("Frame", scrollingFrame)
            playerFrame.Size = UDim2.new(1, -5, 0, 30)
            playerFrame.BackgroundTransparency = 0
            playerFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

            local button = Instance.new("TextButton", playerFrame)
            button.Size = UDim2.new(1, -35, 1, 0)
            button.Position = UDim2.new(0, 0, 0, 0)
            button.BackgroundTransparency = 1
            button.TextColor3 = Color3.new(1, 1, 1)
            button.Font = Enum.Font.SourceSans
            button.TextSize = 16

            local backpack = player:FindFirstChild("Backpack")
            local scripts = player:FindFirstChild("PlayerScripts")
            local gui = player:FindFirstChild("PlayerGui")
            local info = {}

            if scripts then table.insert(info, "Scripts[" .. #scripts:GetChildren() .. "]") end
            if backpack then
                local count = 0
                for _, item in ipairs(backpack:GetChildren()) do
                    if item:IsA("Tool") and item.Name ~= "Fists" then
                        count = count + 1
                    end
                end
                table.insert(info, "Backpack[" .. count .. "]")
            end
            if gui then table.insert(info, "Gui[" .. #gui:GetChildren() .. "]") end

            button.Text = player.Name .. " | " .. table.concat(info, ", ")
            button.MouseButton1Click:Connect(function()
                showPlayerDetails(player)
            end)

            -- Toggle ESP button for each player
            local toggleBtn = Instance.new("TextButton", playerFrame)
            toggleBtn.Size = UDim2.new(0, 25, 0, 25)
            toggleBtn.Position = UDim2.new(1, -30, 0.5, -12)
            toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            toggleBtn.Text = disabledESPPlayers[player] and "✖" or "✔"
            toggleBtn.TextColor3 = Color3.new(1, 1, 1)
            toggleBtn.Font = Enum.Font.SourceSansBold
            toggleBtn.TextSize = 14

            toggleBtn.MouseButton1Click:Connect(function()
                disabledESPPlayers[player] = not disabledESPPlayers[player]
                toggleBtn.Text = disabledESPPlayers[player] and "✖" or "✔"
                removeESP(player)
                if not disabledESPPlayers[player] then
                    createESP(player)
                end
            end)

            -- ตรวจสอบว่า ESP ของผู้เล่นมีอยู่แล้วหรือไม่
            if not espTags[player] then
                createESP(player)
            end
        end
    end
end

-- ตั้งเวลาให้ทำการอัปเดตทุก 1 นาที
local function startUpdateLoop()
    while true do
        wait(60)  -- รอ 1 นาที
        updatePlayerList()  -- อัปเดตรายการผู้เล่น
    end
end

-- เริ่มทำงานอัปเดต
spawn(startUpdateLoop)  -- ทำให้ทำงานใน background thread

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        wait(0.1)  -- รอให้ Character พร้อมก่อน
        createESP(player)  -- สร้าง ESP เมื่อผู้เล่นเข้ามา
        updatePlayerList()  -- อัปเดตรายการผู้เล่น
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    removeESP(player)  -- ลบ ESP เมื่อผู้เล่นออกจากเกม
    updatePlayerList()  -- อัปเดตรายการผู้เล่นหลังจากผู้เล่นออก
end)


-- Toggle UI with M
local uiVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.M then
        uiVisible = not uiVisible
        mainFrame.Visible = uiVisible
        -- ซ่อนไม่ต้องยุ่งกับ ESP
        for _, frame in pairs(detailFrames) do
            frame.Visible = uiVisible
        end
    end
end)

-- Update list every 5 minutes
updatePlayerList()
while true do
    wait(60)  -- Wait for 1 minute
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            refreshHighlight(player)  -- Refresh highlight every minute
        end
    end
end

-- เพิ่มฟังก์ชันการกดกางกระบาดแล้วทำให้ Highlight ของผู้เล่นหายไป
local function toggleHighlightForPlayer(player)
    local highlight = player.Character and player.Character:FindFirstChildOfClass("Highlight")
    if highlight then
        highlight:Destroy()  -- ลบ Highlight ของผู้เล่น
    else
        -- ถ้าไม่มี Highlight, สร้างใหม่
        createESP(player)
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.M then
        uiVisible = not uiVisible
        mainFrame.Visible = uiVisible
        for _, frame in pairs(detailFrames) do
            frame.Visible = uiVisible
        end
    end
    if input.KeyCode == Enum.KeyCode.B then  -- กดปุ่ม B เพื่อสลับ Highlight ของผู้เล่น
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                toggleHighlightForPlayer(player)
            end
        end
    end
end)


