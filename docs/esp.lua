--// SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

--// VARIABLES
local fovEnabled = false
local fovRadius = 150
local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Color = Color3.fromRGB(0, 255, 0)
fovCircle.Thickness = 1
fovCircle.NumSides = 64
fovCircle.Filled = false

--// UI SETUP
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "FOV_UI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 90)
frame.Position = UDim2.new(0, 20, 0, 370)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0

local toggleBtn = Instance.new("TextButton", frame)
toggleBtn.Size = UDim2.new(0, 180, 0, 30)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.Text = "FOV: OFF"
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 14

local sizeLabel = Instance.new("TextLabel", frame)
sizeLabel.Size = UDim2.new(0, 80, 0, 20)
sizeLabel.Position = UDim2.new(0, 10, 0, 50)
sizeLabel.Text = "Radius: " .. fovRadius
sizeLabel.BackgroundTransparency = 1
sizeLabel.TextColor3 = Color3.new(1, 1, 1)
sizeLabel.Font = Enum.Font.SourceSans
sizeLabel.TextSize = 14

local plusBtn = Instance.new("TextButton", frame)
plusBtn.Size = UDim2.new(0, 20, 0, 20)
plusBtn.Position = UDim2.new(0, 100, 0, 50)
plusBtn.Text = "+"
plusBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
plusBtn.TextColor3 = Color3.new(1,1,1)

local minusBtn = Instance.new("TextButton", frame)
minusBtn.Size = UDim2.new(0, 20, 0, 20)
minusBtn.Position = UDim2.new(0, 125, 0, 50)
minusBtn.Text = "-"
minusBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minusBtn.TextColor3 = Color3.new(1,1,1)

--// BUTTON FUNCTIONS
toggleBtn.MouseButton1Click:Connect(function()
    fovEnabled = not fovEnabled
    toggleBtn.Text = fovEnabled and "FOV: ON" or "FOV: OFF"
    fovCircle.Visible = fovEnabled
end)

plusBtn.MouseButton1Click:Connect(function()
    fovRadius = math.clamp(fovRadius + 10, 50, 400)
    sizeLabel.Text = "Radius: " .. fovRadius
    fovCircle.Radius = fovRadius
end)

minusBtn.MouseButton1Click:Connect(function()
    fovRadius = math.clamp(fovRadius - 10, 50, 400)
    sizeLabel.Text = "Radius: " .. fovRadius
    fovCircle.Radius = fovRadius
end)

--// FUNCTION: Lock Target
local function getClosestVisiblePlayer()
    local closestPlayer = nil
    local closestDist = fovRadius
    local maxLockDistance = 150 -- ระยะล็อกสูงสุด (หน่วย: studs)

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local headPos = head.Position
            local screenPoint, onScreen = camera:WorldToViewportPoint(headPos)
            local distanceToPlayer = (headPos - camera.CFrame.Position).Magnitude

            if onScreen and distanceToPlayer <= maxLockDistance then
                -- ตรวจสิ่งกีดขวาง
                local rayParams = RaycastParams.new()
                rayParams.FilterType = Enum.RaycastFilterType.Blacklist
                rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
                rayParams.IgnoreWater = true

                local rayResult = workspace:Raycast(camera.CFrame.Position, (headPos - camera.CFrame.Position).Unit * distanceToPlayer, rayParams)

                if not rayResult or rayResult.Instance:IsDescendantOf(player.Character) then
                    -- ไม่มีสิ่งกีดขวาง หรือ สิ่งที่โดนคือร่างของเป้าหมายเอง
                    local distOnScreen = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)).Magnitude
                    if distOnScreen < closestDist then
                        closestDist = distOnScreen
                        closestPlayer = player
                    end
                end
            end
        end
    end

    return closestPlayer
end


--// MAIN LOOP
RunService.RenderStepped:Connect(function()
    local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    fovCircle.Position = center
    fovCircle.Radius = fovRadius

    if fovEnabled then
        local target = getClosestVisiblePlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local targetPos = target.Character.Head.Position
            local camPos = camera.CFrame.Position
            local direction = (targetPos - camPos).Unit
            camera.CFrame = CFrame.new(camPos, camPos + direction)
        end
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.B then
        fovEnabled = not fovEnabled
        toggleBtn.Text = fovEnabled and "FOV: ON" or "FOV: OFF"
        fovCircle.Visible = fovEnabled
    end
end)

local function closeFOV()
    screenGui:Destroy()  -- ปิด FOV UI
end

-- ฟังก์ชันการซ่อน UI ทั้งหมดเมื่อกด M
local uiVisible = true  -- ตัวแปรนี้ใช้เก็บสถานะการแสดง UI
local detailFrames = {frame}  -- ถ้ามีเฟรมอื่น ๆ ที่ต้องการซ่อนด้วย สามารถใส่เข้าไปในนี้ได้

local function toggleUIVisibility()
    uiVisible = not uiVisible
    screenGui.Enabled = uiVisible
end

-- เชื่อมต่อการกดปุ่ม "X" เพื่อปิด FOV UI
toggleBtn.MouseButton1Click:Connect(function()
    closeFOV()  -- ปิด FOV UI
end)

-- เชื่อมต่อการกดปุ่ม "M" เพื่อซ่อน/แสดง UI ทั้งหมด
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.M then
        toggleUIVisibility()  -- ซ่อนหรือแสดง UI ทั้งหมด
    end
end)
