return function(window)
local ServerFunctions = {

    ["压力"] = function()
        local creds = window:Tab("压力",'123097590035361')
        local creditsyui = creds:section("脚本内容", true)

        creditsyui:Button("压力",function()
            loadstring(game:HttpGet(('https://github.com/DocYogurt/Main/raw/main/Scripts/Pressure')))()
        end)

        creditsyui:Button("自动修电箱",function()
            local function monitorGenerators(generatorName)
                for _, room in pairs(workspace.Rooms:GetChildren()) do
                    local interactables = room:FindFirstChild("Interactables")

                    if interactables then
                        for _, generator in pairs(interactables:GetChildren()) do
                            if generator.Name == generatorName and generator:FindFirstChild("Fixed") and generator:FindFirstChild("RemoteFunction") and generator:FindFirstChild("RemoteEvent") then
                                local proximityPrompt = generator.ProxyPart:FindFirstChild("ProximityPrompt")

                                generator.RemoteFunction:InvokeServer()

                                spawn(function()
                                    while true do
                                        local distance = (game.Players.LocalPlayer.Character.PrimaryPart.Position - generator.ProxyPart.Position).Magnitude

                                        if distance <= proximityPrompt.MaxActivationDistance and generator.Fixed.Value < 100 then
                                            local args = {
                                                [1] = true
                                            }
                                            generator.RemoteEvent:FireServer(unpack(args))
                                        end

                                        wait(0)
                                    end
                                end)
                            end
                        end
                    end
                end
            end

            monitorGenerators("Generator")
            monitorGenerators("EncounterGenerator")

            workspace.Rooms.ChildAdded:Connect(function()
                monitorGenerators("Generator")
                monitorGenerators("EncounterGenerator")
            end)
        end)

        creditsyui:Button("免疫",function()
            for _, room in pairs(workspace.Rooms:GetChildren()) do
                room.Locker.Folder.Enter:InvokeServer()
            end
        end)

        creditsyui:Button("无敌 ",function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Pressure-*-Mode-15992"))()
        end)

        creditsyui:Button("DX",function()
            loadstring(game:HttpGet(('https://github.com/DocYogurt/Main/raw/main/Scripts/Pressure')))()
        end)

        creditsyui:Button("压力3",function()
            loadstring(game:HttpGet("https://github.com/Drop56796/CreepyEyeHub/blob/main/obfuscate.lua?raw=true"))()
        end)
    end,

    ["造船寻宝"] = function()
        local creds = window:Tab("造船寻宝", "7733765398")
        local creditsMLSB = creds:section("功能", true)   

        creditsMLSB:Button("自动刷金条", function()
            loadstring(game:HttpGet("https://pastebin.com/raw/Lyy77rnr",true))()
        end)  

        creditsMLSB:Toggle("自动刷钱", "",false, function(value)
            getgenv().TreasureAutoFarm = {
                Enabled = value,
                Teleport = 2,
                TimeBetweenRuns = 5
            }

            local Players = game:GetService("Players")
            local Workspace = game:GetService("Workspace")
            local Lighting = game:GetService("Lighting")

            local LocalPlayer = Players.LocalPlayer

            local autoFarm = function(currentRun)
                local Character = LocalPlayer.Character
                local NormalStages = Workspace.BoatStages.NormalStages

                for i = 1, 10 do
                    local Stage = NormalStages["CaveStage" .. i]
                    local DarknessPart = Stage:FindFirstChild("DarknessPart")

                    if (DarknessPart) then
                        print("Teleporting to next stage: Stage " .. i)
                        Character.HumanoidRootPart.CFrame = DarknessPart.CFrame

                        local Part = Instance.new("Part", LocalPlayer.Character)
                        Part.Anchored = true
                        Part.Position = LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 6, 0)

                        wait(getgenv().TreasureAutoFarm.Teleport)
                        Part:Destroy()
                    end
                end

                print("Teleporting to the end")
                repeat wait()
                    Character.HumanoidRootPart.CFrame = NormalStages.TheEnd.GoldenChest.Trigger.CFrame
                until Lighting.ClockTime ~= 14

                local Respawned = false
                local Connection
                Connection = LocalPlayer.CharacterAdded:Connect(function()
                    Respawned = true
                    Connection:Disconnect()
                end)

                repeat wait() until Respawned
                wait(getgenv().TreasureAutoFarm.TimeBetweenRuns)
                print("Auto Farm: Run " .. currentRun .. " finished")
            end

            local autoFarmRun = 1
            while wait() do
                if (getgenv().TreasureAutoFarm.Enabled) then
                    print("Initialising Auto Farm: Run " .. autoFarmRun)
                    autoFarm(autoFarmRun)
                    autoFarmRun = autoFarmRun + 1
                end
            end
        end) 

        creditsMLSB:Toggle("自动刷金币", "text", false, function(FARM)
            _G.FARMs = FARM
            while _G.FARMs do
                wait()
                pcall(function()
                    game.Workspace.Gravity = 0
                    wait(0.5)
                    local TweenService = game:GetService("TweenService")
                    local Tw = TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {CFrame = CFrame.new(-51.05019, 43.5682182, 702.193481, -0.999886811, -0.000135422233, 0.0150433034, 8.65181704e-09, 0.999959469, 0.00900237076, -0.0150439134, 0.00900135189, -0.999846339)}
                    ):Play()
                    wait(1)
                    local TweenService = game:GetService("TweenService")
                    local Tw = TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(30, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {CFrame = CFrame.new(-50.4467354, 34.108551, 8676.95117, -0.999937415, -0.000405743311, 0.0111814411, -6.1212857e-09, 0.999342263, 0.0362627953, -0.0111888004, 0.0362605266, -0.999279737)}
                    ):Play()
                    wait(30)
                    local TweenService = game:GetService("TweenService")
                    local Tw = TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {CFrame = CFrame.new(-54.1517258, -359.077667, 9497.03418, -0.99982208, 0.00359633542, -0.0185163822, -7.16419102e-09, 0.981655717, 0.190661997, 0.0188623965, 0.190628082, -0.981481075)}
                    ):Play()
                    wait(5)
                    game.Workspace.Gravity = 200
                    wait(20)
                end)
            end
        end)   

        creditsMLSB:Toggle("快速刷金币", "text", false, function(FARM2)
            _G.FARM2s = FARM2
            while _G.FARM2s do
                wait()
                pcall(function()
                    game.Workspace.Gravity = 0
                    wait(0.5)
                    local TweenService = game:GetService("TweenService")
                    local Tw = TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {CFrame = CFrame.new(-51.05019, 43.5682182, 702.193481, -0.999886811, -0.000135422233, 0.0150433034, 8.65181704e-09, 0.999959469, 0.00900237076, -0.0150439134, 0.00900135189, -0.999846339)}
                    ):Play()
                    wait(1)
                    local TweenService = game:GetService("TweenService")
                    local Tw = TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {CFrame = CFrame.new(-50.4467354, 34.108551, 8676.95117, -0.999937415, -0.000405743311, 0.0111814411, -6.1212857e-09, 0.999342263, 0.0362627953, -0.0111888004, 0.0362605266, -0.999279737)}
                    ):Play()
                    wait(5)
                    local TweenService = game:GetService("TweenService")
                    local Tw = TweenService:Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {CFrame = CFrame.new(-51.05019, 43.5682182, 702.193481, -0.999886811, -0.000135422233, 0.0150433034, 8.65181704e-09, 0.999959469, 0.00900237076, -0.0150439134, 0.00900135189, -0.999846339)}
                    ):Play()
                    wait(5)
                    local Event = game:GetService("Workspace").ClaimRiverResultsGold
                    Event:FireServer()
                    wait(0.1)
                    game.Players.LocalPlayer.Character.Humanoid.Health = -1000
                    wait(0.1)
                    game.Workspace.Gravity = 200
                    wait(7)
                end)
            end
        end)

        creditsMLSB:Toggle("自动索赔金币", "text", false, function(GlaimGold)
            _G.ClaimGolds = ClaimGold
            while _G.ClaimGolds do
                wait()
                pcall(function()
                    local Event = game:GetService("Workspace").ClaimRiverResultsGold
                    Event:FireServer()
                end)
            end
        end)       

        creditsMLSB:Button("工具包", function()
            loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
        end)
    end,

    ["doors"] = function()
        local creds = window:Tab("doors", "7733779610")
        local Tab61 = creds:section("doors2", true)    

        Tab61:Button("ZS脚本“卡密nrty”", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/ZS%20III", true))()     
        end)

        local Tab85 = creds:section("doors1", true)

        Tab85:Toggle("刷新时通知", "TZ", false, function(TZ)
            _G.IE = (TZ and true or false) 
            LatestRoom.Changed:Connect(function() 
                if _G.IE == true then 
                    local n = ChaseStart.Value - LatestRoom.Value 
                    if 0 < n and n < 4 then 
                        Notification:Notify("请注意", "事件可能刷新于" .. tostring(n) .. " 房间","rbxassetid://17360377302",3) 
                    end 
                end 
            end) 
            workspace.ChildAdded:Connect(function(inst) 
                if inst.Name == "RushMoving" and _G.IE == true then 
                    Notify("请注意", "Rush 已刷新","rbxassetid://17360377302",3) 
                elseif inst.Name == "AmbushMoving" and _G.IE == true then 
                    Notify("请注意", "Ambush 已刷新","rbxassetid://17360377302",3) 
                end 
            end)
        end)

        Tab85:Toggle("自动躲避Rush/Ambush", "ADB", false, function(ADB)
            _G.Avoid = (ADB and true or false) 
            workspace.ChildAdded:Connect(function(inst) 
                if inst.Name == "RushMoving" and _G.Avoid == true then 
                    Notify("请注意!", "正在躲避 Rush.","rbxassetid://17360377302",3) 
                    local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position 
                    local con = game:GetService("RunService").Heartbeat:Connect(function() 
                        game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) 
                    end) 
                    inst.Destroying:Wait() 
                    con:Disconnect() 
                    game.Players.LocalPlayer.Character:MoveTo(OldPos) 
                elseif inst.Name == "AmbushMoving" and _G.Avoid == true then 
                    Notify("注意!", "正在躲避 Ambush.","rbxassetid://17360377302",3) 
                    local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position 
                    local con = game:GetService("RunService").Heartbeat:Connect(function() 
                        game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0)) 
                    end) 
                    inst.Destroying:Wait() 
                    con:Disconnect() 
                    game.Players.LocalPlayer.Character:MoveTo(OldPos) 
                end 
            end)
        end)

        Tab85:Toggle("无 Screech", "NCH", false, function(NCH)
            _G.NS = (NCH and true or false) 
            workspace.CurrentCamera.ChildAdded:Connect(function(child) 
                if child.Name == "Screech" and _G.NS == true then 
                    child:Destroy() 
                end 
            end)
        end)

        Tab85:Toggle("透视钥匙","GTQR15",false,function(state)
            if state then
                _G.GTQR15ESPInstances = {}
                local esptable = {doors = {}}

                local function createBillboard(instance, name, color)
                    local bill = Instance.new("BillboardGui", game.CoreGui)
                    bill.AlwaysOnTop = true
                    bill.Size = UDim2.new(0, 100, 0, 50)
                    bill.Adornee = instance
                    bill.MaxDistance = 2000

                    local mid = Instance.new("Frame", bill)
                    mid.AnchorPoint = Vector2.new(0.5, 0.5)
                    mid.BackgroundColor3 = color
                    mid.Size = UDim2.new(0, 8, 0, 8)
                    mid.Position = UDim2.new(0.5, 0, 0.5, 0)
                    Instance.new("UICorner", mid).CornerRadius = UDim.new(1, 0)

                    local txt = Instance.new("TextLabel", bill)
                    txt.AnchorPoint = Vector2.new(0.5, 0.5)
                    txt.BackgroundTransparency = 1
                    txt.TextColor3 = color
                    txt.Size = UDim2.new(1, 0, 0, 20)
                    txt.Position = UDim2.new(0.5, 0, 0.7, 0)
                    txt.Text = name

                    task.spawn(function()
                        while bill do
                            if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                                bill.Enabled = false
                                bill.Adornee = nil
                                bill:Destroy()
                            end
                            task.wait()
                        end
                    end)
                end

                local function monitorGTQR15()
                    for _, instance in pairs(workspace:GetDescendants()) do
                        if instance:IsA("Model") and instance.Name == "KeyObtain" then
                            createBillboard(instance, "钥匙", Color3.new(255, 0, 0)) 
                        end
                    end
                    workspace.DescendantAdded:Connect(function(instance)
                        if instance:IsA("Model") and instance.Name == "KeyObtain" then
                            createBillboard(instance, "钥匙", Color3.new(255, 0, 0))
                        end
                    end)
                end

                monitorGTQR15()
                table.insert(_G.GTQR15ESPInstances, esptable)
            else
                if _G.GTQR15ESPInstances then
                    _G.GTQR15ESPInstances = nil
                end
            end
        end)        

        Tab85:Toggle("门透视","GTQR15",false,function(state)
            if state then
                _G.GTQR15ESPInstances_Doors = {}
                local esptable = {doors = {}}

                local function createBillboard(instance, name, color)
                    local bill = Instance.new("BillboardGui", game.CoreGui)
                    bill.AlwaysOnTop = true
                    bill.Size = UDim2.new(0, 100, 0, 50)
                    bill.Adornee = instance
                    bill.MaxDistance = 2000

                    local mid = Instance.new("Frame", bill)
                    mid.AnchorPoint = Vector2.new(0.5, 0.5)
                    mid.BackgroundColor3 = color
                    mid.Size = UDim2.new(0, 8, 0, 8)
                    mid.Position = UDim2.new(0.5, 0, 0.5, 0)
                    Instance.new("UICorner", mid).CornerRadius = UDim.new(1, 0)

                    local txt = Instance.new("TextLabel", bill)
                    txt.AnchorPoint = Vector2.new(0.5, 0.5)
                    txt.BackgroundTransparency = 1
                    txt.TextColor3 = color
                    txt.Size = UDim2.new(1, 0, 0, 20)
                    txt.Position = UDim2.new(0.5, 0, 0.7, 0)
                    txt.Text = name

                    task.spawn(function()
                        while bill do
                            if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                                bill.Enabled = false
                                bill.Adornee = nil
                                bill:Destroy()
                            end
                            task.wait()
                        end
                    end)
                end

                local function monitorGTQR15()
                    for _, instance in pairs(workspace:GetDescendants()) do
                        if instance:IsA("Model") and instance.Name == "Door" then
                            createBillboard(instance, "门", Color3.new(255, 0, 0)) 
                        end
                    end
                    workspace.DescendantAdded:Connect(function(instance)
                        if instance:IsA("Model") and instance.Name == "Door" then
                            createBillboard(instance, "门", Color3.new(255, 0, 0))
                        end
                    end)
                end

                monitorGTQR15()
                table.insert(_G.GTQR15ESPInstances_Doors, esptable)
            else
                if _G.GTQR15ESPInstances_Doors then
                    _G.GTQR15ESPInstances_Doors = nil
                end
            end
        end)        

        Tab85:Toggle("金币透视","GTQR15",false,function(state)
            if state then
                _G.GTQR15ESPInstances_Gold = {}
                local esptable = {doors = {}}

                local function createBillboard(instance, name, color)
                    local bill = Instance.new("BillboardGui", game.CoreGui)
                    bill.AlwaysOnTop = true
                    bill.Size = UDim2.new(0, 100, 0, 50)
                    bill.Adornee = instance
                    bill.MaxDistance = 2000

                    local mid = Instance.new("Frame", bill)
                    mid.AnchorPoint = Vector2.new(0.5, 0.5)
                    mid.BackgroundColor3 = color
                    mid.Size = UDim2.new(0, 8, 0, 8)
                    mid.Position = UDim2.new(0.5, 0, 0.5, 0)
                    Instance.new("UICorner", mid).CornerRadius = UDim.new(1, 0)

                    local txt = Instance.new("TextLabel", bill)
                    txt.AnchorPoint = Vector2.new(0.5, 0.5)
                    txt.BackgroundTransparency = 1
                    txt.TextColor3 = color
                    txt.Size = UDim2.new(1, 0, 0, 20)
                    txt.Position = UDim2.new(0.5, 0, 0.7, 0)
                    txt.Text = name

                    task.spawn(function()
                        while bill do
                            if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                                bill.Enabled = false
                                bill.Adornee = nil
                                bill:Destroy()
                            end
                            task.wait()
                        end
                    end)
                end

                local function monitorGTQR15()
                    for _, instance in pairs(workspace:GetDescendants()) do
                        if instance:IsA("Model") and instance.Name == "GoldPile" then
                            createBillboard(instance, "金币", Color3.new(255, 0, 0)) 
                        end
                    end
                    workspace.DescendantAdded:Connect(function(instance)
                        if instance:IsA("Model") and instance.Name == "GoldPile" then
                            createBillboard(instance, "金币", Color3.new(255, 0, 0))
                        end
                    end)
                end

                monitorGTQR15()
                table.insert(_G.GTQR15ESPInstances_Gold, esptable)
            else
                if _G.GTQR15ESPInstances_Gold then
                    _G.GTQR15ESPInstances_Gold = nil
                end
            end
        end)        

        Tab85:Button("剪刀",function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
        end)

        Tab85:Button("十字架",function()
            loadstring(game:HttpGet("https://pastebin.com/raw/FCSyG6Th"))()
        end)
    end,

    ["一次尘土飞扬的旅行"] = function()
        local creds = window:Tab("一次尘土飞扬的旅行", "7733674153")
        local credits = creds:section("到达20000过程", true)  

        credits:Button("尘土飞扬的旅行1", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip"))()       
        end) 

        credits:Button("自动到达20000", function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local teleportLocations = {
                CFrame.new(-20.408166885375977, -11.34829044342041, 1809.8782958984375),
                CFrame.new(257.45782470703125, 58.954708099365234, -4186.28955078125),
                CFrame.new(515.4042358398438, 72.82687377929688, -10186.2861328125),
                CFrame.new(123.37289428710938, -66.69212341308594, -16188.0537109375),
                CFrame.new(232.33438110351562, 147.98423767089844, -22189.32421875),
                CFrame.new(713.6531982421875, 102.16617584228516, -28190.58984375),
                CFrame.new(910.4205322265625, -137.20584106445312, -34189.23046875),
                CFrame.new(1141.0308837890625, 148.53587341308594, -40185.35546875),
                CFrame.new(1357.2171630859375, 87.61758422851562, -46190.3125),
                CFrame.new(1606.8338623046875, -174.83712768554688, -52188.765625),
                CFrame.new(1503.0009765625, 210.8280792236328, -82185.9140625),
                CFrame.new(734.9932861328125, -117.6973876953125, -112190.21875),
            }
            local teleportDelay = 0.5
            local function teleportToLocations()
                for _, location in ipairs(teleportLocations) do
                    humanoidRootPart.CFrame = location
                    print("正在进行你的指令" .. tostring(location))
                    wait(teleportDelay)
                end
                print("已经到达指令尽头")
            end

            teleportToLocations()
        end)

        local credits2 = creds:section("传送", true)

        credits2:Button("距离1000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20.408166885375977, -11.34829044342041, 1809.8782958984375)
        end)

        credits2:Button("距离2000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(257.45782470703125, 58.954708099365234, -4186.28955078125)
        end)  

        credits2:Button("距离3000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(515.4042358398438, 72.82687377929688, -10186.2861328125)
        end)   

        credits2:Button("距离4000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123.37289428710938, -66.69212341308594, -16188.0537109375)
        end)

        credits2:Button("距离5000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(232.33438110351562, 147.98423767089844, -22189.32421875)
        end)

        credits2:Button("距离6000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(713.6531982421875, 102.16617584228516, -28190.58984375)
        end)

        credits2:Button("距离7000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(910.4205322265625, -137.20584106445312, -34189.23046875)
        end)

        credits2:Button("距离8000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1141.0308837890625, 148.53587341308594, -40185.35546875)
        end)

        credits2:Button("距离9000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1357.2171630859375, 87.61758422851562, -46190.3125)
        end)

        credits2:Button("距离10000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1606.8338623046875, -174.83712768554688, -52188.765625)
        end)

        credits2:Button("距离15000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1503.0009765625, 210.8280792236328, -82185.9140625)
        end)

        credits2:Button("距离20000", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(734.9932861328125, -117.6973876953125, -112190.21875)
        end)
    end,

    ["忍者传奇"] = function()
        local creds = window:Tab("忍者传奇", "7733798747")
        local RZCQ = creds:section("功能", true)

        autoswing = false
        function swinging()
            spawn(function()
                while autoswing == true do
                    task.wait()
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
                    if not autoswing then break end
                end
            end)
        end

        autosell = false
        function selling()
            spawn(function()
                while autosell == true do
                    task.wait(.01)
                    if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                        game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                        wait(.1)
                        game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame = game.Workspace.Part.CFrame
                        if not autosell then break end
                    end
                end
            end)
        end

        autosellmax = false
        function maxsell()
            spawn(function()
                while autosellmax == true do
                    task.wait()
                    if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                        if game.Players.LocalPlayer.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
                            game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                            task.wait()
                            game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame = game.Workspace.Part.CFrame
                        end
                    end
                    if not autosellmax then break end
                end
            end)
        end

        autobuyswords = false
        function buyswords()
            spawn(function()
                while autobuyswords == true do
                    task.wait()
                    if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                        local oh1 = "buyAllSwords"
                        local oh2 = {"Ground", "Astral Island", "Space Island", "Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island"}
                        for i = 1, #oh2 do
                            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                        end
                    end
                    if not autobuyswords then break end
                end
            end)
        end

        autobuybelts = false
        function buybelts()
            spawn(function()
                while autobuybelts == true do
                    task.wait()
                    if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                        local oh1 = "buyAllBelts"
                        local oh2 = {"Ground", "Astral Island", "Space Island", "Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island"}
                        for i = 1, #oh2 do
                            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                        end
                    end
                    if not autobuybelts then break end
                end
            end)
        end

        autobuyranks = false
        function buyranks()
            spawn(function()
                while autobuyranks == true do
                    task.wait()
                    if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                        local oh1 = "buyRank"
                        local oh2 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
                        for i = 1, #oh2 do
                            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i].Name)
                        end
                    end
                    if not autobuyranks then break end
                end
            end)
        end

        autobuyskill = false
        function buyskill()
            spawn(function()
                while autobuyskill == true do
                    task.wait()
                    if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                        local oh1 = "buyAllSkills"
                        local oh2 = {"Ground", "Astral Island", "Space Island", "Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island"}
                        for i = 1, #oh2 do
                            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                        end
                    end
                    if not autobuyskill then break end
                end
            end)
        end

        autobuyshurikens = false
        function buyshurikens()
            spawn(function()
                while autobuyshurikens == true do
                    task.wait()
                    if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                        local oh1 = "buyAllShurikens"
                        local oh2 = {"Ground", "Astral Island", "Space Island", "Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island"}
                        for i = 1, #oh2 do
                            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                        end
                    end
                    if not autobuyshurikens then break end
                end
            end)
        end

        RZCQ:Toggle("自动挥舞","", false, function(v)
            if v or not v then
                getgenv().autoswing = v
                while true do
                    if not getgenv().autoswing then return end
                    for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:FindFirstChild("ninjitsuGain") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                            break
                        end
                    end
                    local A_1 = "swingKatana"
                    local Event = game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(A_1)
                    wait()
                end
            end
        end)

        RZCQ:Toggle("自动售卖", "ATSELL", false, function(ATSELL)
            getgenv().autosell = ATSELL 
            while true do 
                if not getgenv().autosell then return end 
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
                wait(0.1) 
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0) 
                wait(0.1) 
            end
        end)

        RZCQ:Toggle("购买排名", "ATBP", false, function(ATBP)
            getgenv().autobuyranks = ATBP 
            while true do 
                if not getgenv().autobuyranks then return end 
                local deku1 = "buyRank" 
                for i = 1, #ranks do 
                    game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(deku1, ranks[i]) 
                end 
                wait(0.1) 
            end
        end)

        RZCQ:Toggle("购买腰带", "ATBYD", false, function(ATBYD)
            getgenv().autobuybelts = ATBYD 
            while true do 
                if not getgenv().autobuybelts then return end 
                local A_1 = "buyAllBelts" 
                local A_2 = "Inner Peace Island" 
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent 
                Event:FireServer(A_1, A_2) 
                wait(0.5) 
            end
        end)

        RZCQ:Toggle("购买技能", "ATB", false, function(ATB)
            getgenv().autobuyskills = ATB 
            while true do 
                if not getgenv().autobuyskills then return end 
                local A_1 = "buyAllSkills" 
                local A_2 = "Inner Peace Island" 
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent 
                Event:FireServer(A_1, A_2) 
                wait(0.5) 
            end
        end)

        RZCQ:Toggle("自动购买剑", "ATBS", false, function(ATBS)
            getgenv().autobuy = ATBS 
            while true do 
                if not getgenv().autobuy then return end 
                local A_1 = "buyAllSwords" 
                local A_2 = "Inner Peace Island" 
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent 
                Event:FireServer(A_1, A_2) 
                wait(0.5) 
            end
        end)

        RZCQ:Button("解锁所有岛", function()
            for _, v in next, game.workspace.islandUnlockParts:GetChildren() do 
                if v then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.islandSignPart.CFrame 
                    wait(.5) 
                end 
            end
        end)

        RZCQ:Button("解锁所有通行证", function()
            game:GetService("ReplicatedStorage").gamepassIds["+2 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["+3 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["+4 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["+100 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["+200 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["+20 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["+60 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["Infinite Ammo"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["Infinite Ninjitsu"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["Permanent Islands Unlock"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["x2 Coins"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["x2 Damage"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["x2 Health"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["x2 Ninjitsu"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["x2 Speed"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["Faster Sword"].Parent = game.Players.LocalPlayer.ownedGamepasses
            game:GetService("ReplicatedStorage").gamepassIds["x3 Pet Clones"].Parent = game.Players.LocalPlayer.ownedGamepasses
        end)

        local RZQC = creds:section("传送功能", true)

        RZQC:Button("传送到出生点", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.665502548217773, 3.4228405952453613, 29.919952392578125)
        end)
        RZQC:Button("传送到附魔岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.17238235473633, 766.1807861328125, -138.44842529296875)
        end)
        RZQC:Button("传送到神秘岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.97178649902344, 4047.380859375, 42.0699577331543)
        end)
        RZQC:Button("传送到太空岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.83824157714844, 5657.18505859375, 73.5014877319336)
        end)
        RZQC:Button("传送到冻土岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.28330993652344, 9285.18359375, 77.36406707763672)
        end)
        RZQC:Button("传送到永恒岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.34817504882812, 13680.037109375, 73.3861312866211)
        end)
        RZQC:Button("传送到沙暴岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.37144470214844, 17686.328125, 72.00334167480469)
        end)
        RZQC:Button("传送到雷暴岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.19349670410156, 24070.021484375, 78.05432891845703)
        end)
        RZQC:Button("传送到远古炼狱岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.27163696289062, 28256.294921875, 69.3790283203125)
        end)
        RZQC:Button("传送到午夜暗影岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.74267578125, 33206.98046875, 57.495574951171875)
        end)
        RZQC:Button("传送到神秘灵魂岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.76148986816406, 39317.5703125, 61.06639862060547)
        end)
        RZQC:Button("传送到冬季奇迹岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.2720184326172, 46010.5546875, 55.941951751708984)
        end)
        RZQC:Button("传送到黄金大师岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.32339477539062, 52607.765625, 56.69411849975586)
        end)
        RZQC:Button("传送到龙传奇岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.35226440429688, 59594.6796875, 77.53300476074219)
        end)
        RZQC:Button("传送到赛博传奇岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.3321075439453, 66669.1640625, 72.21722412109375)
        end)
        RZQC:Button("传送到天岚超能岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.48077392578125, 70271.15625, 57.02311325073242)
        end)
        RZQC:Button("传送到混沌传奇岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)
        end)
        RZQC:Button("传送到灵魂融合岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.9700927734375, 79746.984375, 58.54051971435547)
        end)
        RZQC:Button("传送到黑暗元素岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.697265625, 83198.984375, 72.73107147216797)
        end)
        RZQC:Button("传送到内心和平岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.3157501220703, 87051.0625, 66.78429412841797)
        end)
        RZQC:Button("传送到炽烈漩涡岛", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.08216857910156, 91246.0703125, 69.56692504882812)
        end)
        RZQC:Button("传送到35倍金币区域", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.2938232421875, 91245.765625, 120.54232788085938)
        end)
        RZQC:Button("传送到死亡宠物", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4593.21337890625, 130.87181091308594, 1430.2239990234375)
        end)
    end,

    ["骨折模拟器"] = function()
        local BBTab = window:Tab("骨折模拟器", "")

        local moneySec = BBTab:section("金钱与通行证", true)

        local moneyInput = 0
        moneySec:Textbox("刷取金钱", "money_input", "输入你想刷的数值", function(val)
            moneyInput = tonumber(val) or 0
        end)

        moneySec:Button("获取金钱 (重进生效)", function()
            if moneyInput > 0 then
                local args = { [1] = "money", [2] = moneyInput }
                game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("UpdateStat"):InvokeServer(unpack(args))
                if getgenv().Ye_Notify then 
                    getgenv().Ye_Notify("骨折模拟器", "金钱已增加: " .. tostring(moneyInput), 3) 
                end
            else
                if getgenv().Ye_Notify then 
                    getgenv().Ye_Notify("错误", "请输入有效的数字", 2) 
                end
            end
        end)

        moneySec:Button("一键获取重力泡泡通行证", function()
            local args1 = { "Gravity Bubble", 5, true }
            game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("UpdateStat"):InvokeServer(unpack(args1))

            local args2 = { "utility", "Gravity Bubble", true }
            game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("UpdateStat"):InvokeServer(unpack(args2))

            if getgenv().Ye_Notify then 
                getgenv().Ye_Notify("骨折模拟器", "重力泡泡通行证已解锁！", 3) 
            end
        end)

        local levelSec = BBTab:section("美化显示", true)

        local levelInput = 0
        levelSec:Textbox("显示等级美化", "level_input", "输入显示的等级数值", function(val)
            levelInput = tonumber(val) or 0
        end)

        levelSec:Button("应用等级美化", function()
            if levelInput > 0 then
                game:GetService("ReplicatedStorage").Functions.UpdateLevel:FireServer(levelInput)
                if getgenv().Ye_Notify then 
                    getgenv().Ye_Notify("骨折模拟器", "展示等级已修改为: " .. tostring(levelInput), 3) 
                end
            end
        end)

        local statSec = BBTab:section("属性刷取 (每次+100)", true)
        statSec:Label("属性增加后无法撤回")

        local statsList = {
            {"技能冷却", "cooldownlevel"},
            {"扭伤等级", "sprainslevel"},
            {"摩擦等级", "frictionlevel"},
            {"燃料等级", "fuellevel"},
            {"错位等级", "dislocationslevel"},
            {"刹车等级", "breakslevel"},
            {"飞行控制", "flightlevel"},
            {"弹跳等级", "elasticitylevel"},
            {"玩家跳跃", "jumplevel"},
            {"玩家速度", "speedlevel"}
        }

        for _, stat in ipairs(statsList) do
            statSec:Button(stat[1] .. " +100", function()
                game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("UpdateStat"):InvokeServer(stat[2], 100)
                if getgenv().Ye_Notify then 
                    getgenv().Ye_Notify("骨折模拟器", stat[1] .. " 属性已增加 100", 2) 
                end
            end)
        end
    end,
    ["举重模拟器"] = function()
        local UITab4 = window:Tab("举重模拟器",'7733674153')
        local aboutxksans = UITab4:section("主要功能",true)

        aboutxksans:Toggle("自动举重","text",false,function(s)
            toggle = Value
            while toggle do wait()
                local ohTable1 = {
                    [1] = "GainMuscle"
                }
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohTable1)
            end
        end)

        aboutxksans:Toggle("自动卖","text",false,function(s)
            tog = Value
            while tog do wait()
                local ohTable1 = {
                    [1] = "SellMuscle"
                }
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohTable1)
            end
        end)

        aboutxksans:Button("打开商店",function()
            game:GetService("Players").LocalPlayer.PlayerGui["Main_Gui"]["UpgradeMenu_Frame"].Visible = true
        end)
    end,

    ["钓鱼模拟器"] = function()
        local UI3Tab4 = window:Tab("钓鱼模拟器",'7733674153')
        local aboutkun = UI3Tab4:section("主要功能",true)

        aboutkun:Toggle("跳跃","text",false,function(s)
            shared.toggle = State
            if shared.toggle then
                fuckMonster = game:GetService("RunService").Stepped:Connect(function()
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") then
                            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                for i, getTools in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                    if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                                        plrTools = getTools.Name
                                    end
                                end
                                teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                                wait(1)
                                game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                                break
                            elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                EquipTool()
                                break
                            end
                        end
                    end
                end)
            else
                fuckMonster:Disconnect()
                teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
            end
        end)

        aboutkun:Toggle("自动杀鲨鱼","text",false,function(State)
            shared.toggle = State
            if shared.toggle then
                fuckMonster = game:GetService("RunService").Stepped:Connect(function()
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") then
                            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                for i, getTools in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                    if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                                        plrTools = getTools.Name
                                    end
                                end
                                teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                                wait(1)
                                game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                                break
                            elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                EquipTool()
                                break
                            end
                        end
                    end
                end)
            else
                fuckMonster:Disconnect()
                teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
            end
        end)

        aboutkun:Toggle("自动钓鱼","text",false,function(bool)
            if bool then
                local rodName = false
                while not rodName do
                    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:FindFirstChild("FishingRodScript") then
                            rodName = v.Name
                            break
                        end
                    end
                    wait()
                end

                bBobber = game.Players.LocalPlayer.Character:WaitForChild(rodName).Bobbers.Bobber.Fish.Changed:Connect(
                    function(fishVal)
                        if fishVal ~= nil then
                            game.Workspace:WaitForChild(tostring(fishVal))
                            wait()
                            game.ReplicatedStorage.CloudClientResources.Communication.Events.FishedDone:FireServer()
                            wait()
                            game.ReplicatedStorage.CloudClientResources.Communication.Events.ResetFishingRod:FireServer()
                            wait()
                        end
                        if game.Players.LocalPlayer.Character:WaitForChild(rodName).Bobbers.Bobber:FindFirstChild("FishWeld") then
                            for p, q in pairs(game.Players.LocalPlayer.Character:WaitForChild(rodName).Bobbers.Bobber:GetChildren()) do
                                if q.Name == "FishWeld" then
                                    q:Destroy()
                                end
                            end
                        end
                    end
                )
            else 
                bBobber:Disconnect()
            end
        end)

        aboutkun:Toggle("自动杀boss","text",false,function(State)
            shared.toggle = State
            if shared.toggle then
                fuckMobby = game:GetService("RunService").Stepped:Connect(function()
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and v.Name == "MobbyWood" then
                            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                for i, getTools in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                    if getTools:IsA("Tool") and  getTools:FindFirstChild("GripC1") then
                                        plrTools = getTools.Name
                                    end
                                end
                                teleport(v.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0))
                                wait(1)
                                game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[v.Name], tostring(plrTools), true)
                                break
                            elseif not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                EquipTool()
                                break
                            end
                        end
                    end
                end)
            else
                fuckMobby:Disconnect()
                teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
            end
        end)

        aboutkun:Toggle("减少延迟","text",false,function(State)
            toggle = State
            if toggle then
                while toggle do 
                    wait(30)
                    for i, v in pairs(game.Workspace.DroppedItems:GetChildren()) do
                        if v:IsA("Model") then
                            v:Destroy()
                        end
                    end
                end
            end
        end)

        aboutkun:Toggle("自动锁定稀有物品","text",false,function(State)
            toggle = State
            if toggle then
                while toggle do 
                    wait(.1)
                    for i, v in pairs(game.Players.LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetChildren()) do
                        if string.match(v.Name, "key") then
                            for i, model in pairs(v:GetDescendants()) do
                                if model:IsA("Tool") then
                                    if model.RarityLevel.Value >= 5 then
                                        if v.DraggableComponent.Contents.LockIcon.Visible == false then
                                            print(v.Name, model.Name, model.RarityLevel.Value)
                                            local args = {
                                                [1] = "Tools",
                                                [2] = v.Name,
                                                [3] = true
                                            }
                                            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(args))
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)

        aboutkun:Toggle("自动抓捕","text",false,function(State)
            toggle = State
            while toggle do
                wait(2.6)
                game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
            end
        end)

        aboutkun:Toggle("自动售卖","text",false,function(State)
            toggle = State
            while toggle do
                wait(2.6)
                game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer("SellEverything")
            end
        end)

        aboutkun:Toggle("每日宝箱","text",false,function(State)
            toggle = State
            while toggle do
                for i, v in pairs(game.Workspace.Islands:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                    end
                end            
            end
        end)

        aboutkun:Toggle("随机宝箱","text",false,function(State)
            toggle = State
            while toggle do
                for i, v in pairs(game.Workspace.RandomChests:GetDescendants()) do
                    if v:IsA("Model") and string.match(v.Name, "Chest") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        wait(1)
                        fireproximityprompt(v.HumanoidRootPart.ProximityPrompt)
                    end
                end            
            end
        end)

        local wood_types = {"选择", "Earth Egg","Alien Egg","Dominus Egg","Ice Egg","Lava Egg","Heavens Egg","Toy Egg","Mine Egg"}
        if not game.workspace:FindFirstChild("PFA") then 
            local part = Instance.new("Part") 
            part.Name = "PFA" 
            part.Parent = game.workspace 
            part.CFrame = CFrame.new(-1087, -40, 1670) 
            part.Size = Vector3.new(50, 0, 50) 
            part.Anchored = true 
            part.Reflectance = 1 
        end

        function C() 
            spawn(function () 
                while getgenv().C do
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                        TPCFrame(CFrame.new(-1087, -35, 1670))
                        if v.ToolTip == "Weight" then 
                            v.Parent = game.Players.LocalPlayer.Character 
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then 
                            game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate() 
                        end
                    end 
                    wait()
                end
            end)
        end

        function U() 
            spawn(function () 
                while getgenv().U do
                    local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Damage_Multiplier"}}
                    game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
                    local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Health_Multiplier"}}
                    game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
                    local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Jump_Power"}}
                    game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
                    local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Walk_Speed"}}
                    game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
                    local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Pet_Space"}}
                    game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
                    local args = {[1] = "S_Controller_Upgrades_Upgrade",[2] = {[1] = "Pet_Inventory"}}
                    game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
                    wait()
                end
            end)
        end

        function R() 
            spawn(function () 
                while getgenv().R do
                    local args = {[1] = "S_Controller_Rebirth_Rebirth",[2] = {}}
                    game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteEvent:FireServer(unpack(args))
                    wait()
                end
            end)
        end

        function H(E) 
            spawn(function () 
                while getgenv().H do
                    local args = {[1] = "S_Controller_Eggs_Buy",[2] = {[1] = E}}
                    game:GetService("ReplicatedStorage").Shared.Services:FindFirstChild("3 | Network").RemoteFunction:InvokeServer(unpack(args))
                    wait()
                end
            end)
        end
    end,

    ["感染性微笑"] = function()
        local UITab4 = window:Tab("感染性微笑",'7733955969')
        local aboutxknb = UITab4:section("功能",true)

        aboutxknb:Button("防止微笑感染",function()
            for _,v in pairs(game.workspace:GetDescendants()) do
                if string.find(v.Name,"Infector") then
                    v:Destroy()
                end
            end
        end)

        aboutxknb:Button("取消门",function()
            for _,v in pairs(game.workspace:GetDescendants()) do
                if string.find(v.Name,"AntiSmiler") then
                    v:Destroy()
                end
            end
        end)

        aboutxknb:Button("开启反外挂",function()
            workspace.Map.AntiHack:Destroy() 
            game.Players.LocalPlayer.Character.AntiFly:Destroy()
        end)

        aboutxknb:Toggle("速度-微笑感染","text",false,function(s)
            getgenv().SlowDownSpeed = getgenv().SlowDownSpeed or 16
            getgenv().NoSlowDown = Value
            if getgenv().NoSlowDown then
                SteppedConnection = game:GetService("RunService").Stepped:Connect(function()
                    pcall(function()
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().SlowDownSpeed
                    end)
                end)
            else
                if SteppedConnection then
                    SteppedConnection:Disconnect()
                    SteppedConnection = nil
                end
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
        end)

        aboutxknb:Toggle("打击微笑感染","text",false,function(s)
            getgenv().InfectAura = Value
            if getgenv().InfectAura then
                getgenv().InfectAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                    pcall(function()
                        game:GetService("Players").LocalPlayer.Character.Infected.InfectEvent:FireServer()
                    end)
                end)
            else
                if getgenv().InfectAuraConnection then
                    getgenv().InfectAuraConnection:Disconnect()
                    getgenv().InfectAuraConnection = nil
                end
            end
        end)

        aboutxknb:Toggle("打击","text",false,function(s)
            getgenv().HitAura = s
            if getgenv().HitAura then
                getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        if character then
                            local bat = character:FindFirstChildOfClass("Tool")
                            if bat and bat.Name == "Bat" and bat:FindFirstChild("SwingEvent") then
                                bat.SwingEvent:FireServer()
                            end
                            if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                                packedice.SwingEvent:FireServer()
                            end
                        end
                    end)
                end)
            else
                if getgenv().HitAuraConnection then
                    getgenv().HitAuraConnection:Disconnect()
                    getgenv().HitAuraConnection = nil
                end
            end
        end)

        aboutxknb:Toggle("瓶子打击","text",false,function(s)
            getgenv().HitAura = s
            if getgenv().HitAura then
                getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                    pcall(function()
                        local character = game:GetService("Players").LocalPlayer.Character
                        if character then
                            local bottle = character:FindFirstChildOfClass("Tool")
                            if bottle and bottle.Name == "Bottle" and bottle:FindFirstChild("SwingEvent") then
                                bottle.SwingEvent:FireServer()
                            end
                            if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                                packedice.SwingEvent:FireServer()
                            end
                        end
                    end)
                end)
            else
                if getgenv().HitAuraConnection then
                    getgenv().HitAuraConnection:Disconnect()
                    getgenv().HitAuraConnection = nil
                end
            end
        end)    
    end,

    ["自然灾害"] = function()
        local UITab4 = window:Tab("自然灾害",'7733920226')
        local aboutkknb = UITab4:section("功能",true)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local plr = Players.LocalPlayer

        getgenv().Ye_BH_Violent = false
        getgenv().Ye_BH_ViolentConn = nil
        getgenv().Ye_BH_Art = false
        getgenv().Ye_BH_ArtConn = nil
        getgenv().Ye_BH_ArtShape = "Heart"

        local function startSuction(part, attachment)
            if not part or not part.Parent then return end
            if part:FindFirstChild("YeBH_Align") then return end

            local att0 = Instance.new("Attachment", part)
            local align = Instance.new("AlignPosition", part)
            align.Name = "YeBH_Align"
            align.Attachment0 = att0
            align.Attachment1 = attachment
            align.MaxForce = 5e8
            align.MaxVelocity = 500
            align.Responsiveness = 200
            align.RigidityEnabled = true

            part.CanCollide = false
            part.AssemblyLinearVelocity = Vector3.zero
            part.AssemblyAngularVelocity = Vector3.zero
        end

        local function stopSuction(part)
            if not part then return end
            local align = part:FindFirstChild("YeBH_Align")
            if align then align:Destroy() end
            local att0 = part:FindFirstChildOfClass("Attachment")
            if att0 and att0.Name ~= "YeBH_Att1" then att0:Destroy() end
            part.CanCollide = true
            part.AssemblyLinearVelocity = Vector3.new(math.random(-200, 200), math.random(100, 400), math.random(-200, 200))
            part.AssemblyAngularVelocity = Vector3.new(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500))
        end

        aboutkknb:Toggle("暴力黑洞", "", false, function(state)
            getgenv().Ye_BH_Violent = state

            if state then
                local anchor = Instance.new("Part")
                anchor.Name = "YeBH_Center"
                anchor.Size = Vector3.new(1, 1, 1)
                anchor.Transparency = 1
                anchor.CanCollide = false
                anchor.Anchored = true
                anchor.Parent = workspace

                local attachment = Instance.new("Attachment", anchor)
                local suckedParts = {}
                local scanned = false

                task.spawn(function()
                    while getgenv().Ye_BH_Violent do
                        pcall(function()
                            settings().Physics.AllowSleep = false
                            settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
                            if sethiddenproperty then
                                sethiddenproperty(plr, "SimulationRadius", math.huge)
                                sethiddenproperty(plr, "MaxSimulationRadius", math.huge)
                            end
                        end)
                        task.wait(0.5)
                    end
                end)

                getgenv().Ye_BH_ViolentConn = RunService.Heartbeat:Connect(function()
                    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
                        anchor.Position = Vector3.new(0, -500, 0)
                        return
                    end

                    local center = plr.Character.HumanoidRootPart.Position + Vector3.new(0, 45, 0)
                    anchor.Position = center

                    for part, _ in pairs(suckedParts) do
                        if not part or not part.Parent then suckedParts[part] = nil end
                    end

                    if not scanned then
                        local allParts = workspace:GetDescendants()
                        for _, part in ipairs(allParts) do
                            if not part:IsA("BasePart") then continue end
                            if part.Anchored or not part.CanCollide then continue end
                            if part == anchor then continue end

                            local isPlayerPart = false
                            for _, p in ipairs(Players:GetPlayers()) do
                                if p.Character and part:IsDescendantOf(p.Character) then
                                    isPlayerPart = true
                                    break
                                end
                            end
                            if isPlayerPart or suckedParts[part] then continue end

                            startSuction(part, attachment)
                            suckedParts[part] = true
                        end
                        scanned = true
                    end

                    local angle = tick() * 3
                    local count = 0
                    for part, _ in pairs(suckedParts) do
                        if part and part.Parent then
                            count = count + 1
                            part.AssemblyAngularVelocity = Vector3.new(math.random(-200, 200), 600, math.random(-200, 200))
                            local orbitAngle = angle + (count / math.max(#suckedParts, 1)) * math.pi * 2
                            part.AssemblyLinearVelocity = part.AssemblyLinearVelocity:Lerp(
                                Vector3.new(math.cos(orbitAngle) * 50, (center.Y - part.Position.Y) * 3, math.sin(orbitAngle) * 50),
                                0.3
                            )
                        end
                    end
                end)
            else
                if getgenv().Ye_BH_ViolentConn then
                    getgenv().Ye_BH_ViolentConn:Disconnect()
                    getgenv().Ye_BH_ViolentConn = nil
                end
                for _, part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("BasePart") and part:FindFirstChild("YeBH_Align") then
                        stopSuction(part)
                    end
                end
                local center = workspace:FindFirstChild("YeBH_Center")
                if center then center:Destroy() end
            end
        end)

        aboutkknb:Toggle("艺术黑洞", "", false, function(state)
            getgenv().Ye_BH_Art = state

            if state then
                local anchor = Instance.new("Part")
                anchor.Name = "YeBH_ArtCenter"
                anchor.Size = Vector3.new(1, 1, 1)
                anchor.Transparency = 1
                anchor.CanCollide = false
                anchor.Anchored = true
                anchor.Parent = workspace

                local attachment = Instance.new("Attachment", anchor)
                local artParts = {}

                task.spawn(function()
                    while getgenv().Ye_BH_Art do
                        pcall(function()
                            settings().Physics.AllowSleep = false
                            settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
                            if sethiddenproperty then
                                sethiddenproperty(plr, "SimulationRadius", math.huge)
                                sethiddenproperty(plr, "MaxSimulationRadius", math.huge)
                            end
                        end)
                        task.wait(0.5)
                    end
                end)

                getgenv().Ye_BH_ArtConn = RunService.Heartbeat:Connect(function()
                    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
                        anchor.Position = Vector3.new(0, -500, 0)
                        return
                    end

                    local center = plr.Character.HumanoidRootPart.Position + Vector3.new(0, 25, 0)
                    anchor.Position = center
                    local time = tick()

                    for part, _ in pairs(artParts) do
                        if not part or not part.Parent then artParts[part] = nil end
                    end

                    local allParts = workspace:GetDescendants()
                    for _, part in ipairs(allParts) do
                        if not part:IsA("BasePart") then continue end
                        if part.Anchored or not part.CanCollide then continue end
                        if part == anchor then continue end

                        local isPlayerPart = false
                        for _, p in ipairs(Players:GetPlayers()) do
                            if p.Character and part:IsDescendantOf(p.Character) then
                                isPlayerPart = true
                                break
                            end
                        end
                        if isPlayerPart or artParts[part] then continue end

                        startSuction(part, attachment)
                        artParts[part] = true
                    end

                    local total = math.max(#artParts, 1)
                    local i = 0
                    for part, _ in pairs(artParts) do
                        if part and part.Parent then
                            i = i + 1
                            local offset
                            local currentShape = getgenv().Ye_BH_ArtShape

                            if currentShape == "Sphere" then
                                local phi = math.acos(1 - 2 * (i - 0.5) / total)
                                local theta = math.pi * (1 + math.sqrt(5)) * i + time * 0.5
                                offset = Vector3.new(
                                    18 * math.sin(phi) * math.cos(theta),
                                    18 * math.cos(phi),
                                    18 * math.sin(phi) * math.sin(theta)
                                )
                            elseif currentShape == "Heart" then
                                local t = (i / total) * math.pi * 2 + time * 0.3
                                local x = 16 * math.sin(t)^3
                                local y = 13 * math.cos(t) - 5 * math.cos(2*t) - 2 * math.cos(3*t) - math.cos(4*t)
                                offset = CFrame.Angles(0, time * 0.5, 0) * Vector3.new(x * 1.2, y * 1.2, 0)
                            else
                                local p = ((i / total) * 3 + time * 0.5) % 3
                                local r = 20
                                local p1, p2
                                if p < 1 then
                                    p1, p2 = Vector3.new(0, r, 0), Vector3.new(-r, -r, 0)
                                elseif p < 2 then
                                    p1, p2 = Vector3.new(-r, -r, 0), Vector3.new(r, -r, 0)
                                else
                                    p1, p2 = Vector3.new(r, -r, 0), Vector3.new(0, r, 0)
                                end
                                offset = CFrame.Angles(0, time * 0.5, 0) * p1:Lerp(p2, p % 1)
                            end

                            local align = part:FindFirstChild("YeBH_Align")
                            if align and align.Attachment1 then
                                align.Attachment1.Parent.Position = center + offset
                            end
                            part.AssemblyAngularVelocity = Vector3.new(0, 200, 0)
                        end
                    end
                end)
            else
                if getgenv().Ye_BH_ArtConn then
                    getgenv().Ye_BH_ArtConn:Disconnect()
                    getgenv().Ye_BH_ArtConn = nil
                end
                for _, part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("BasePart") and part:FindFirstChild("YeBH_Align") then
                        stopSuction(part)
                    end
                end
                local center = workspace:FindFirstChild("YeBH_ArtCenter")
                if center then center:Destroy() end
            end
        end)

        aboutkknb:Dropdown("选择黑洞形状","BHShapeDropdown", {"Heart", "Sphere", "Triangle"}, function(selectedShape)
            getgenv().Ye_BH_ArtShape = selectedShape
        end)

        aboutkknb:Toggle("自动赢", "",false, function(bool)
            _G.autowinfarm = bool;
            while wait(.1) do
                if _G.autowinfarm == true then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-236, 180, 360, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                end
            end
        end)    

        aboutkknb:Button("黑洞脚本", function()
            local UserInputService = game:GetService("UserInputService")
            local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
            local Folder = Instance.new("Folder", game:GetService("Workspace"))
            local Part = Instance.new("Part", Folder)
            local Attachment1 = Instance.new("Attachment", Part)
            Part.Anchored = true
            Part.CanCollide = false
            Part.Transparency = 1
            local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
            local NetworkAccess = coroutine.create(function()
                settings().Physics.AllowSleep = false
                while game:GetService("RunService").RenderStepped:Wait() do
                    for _, Players in next, game:GetService("Players"):GetPlayers() do
                        if Players ~= game:GetService("Players").LocalPlayer then
                            Players.MaximumSimulationRadius = 0
                            sethiddenproperty(Players, "SimulationRadius", 0)
                        end
                    end
                    game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
                    setsimulationradius(math.huge)
                end
            end)
            coroutine.resume(NetworkAccess)

            local function EnhanceAndInvinciblePart(part)
                if part:IsA("Part") and part.Anchored == false and part.Parent:FindFirstChild("Humanoid") == nil and part.Parent:FindFirstChild("Head") == nil and part.Name ~= "Handle" then
                    Mouse.TargetFilter = part
                    for _, x in next, part:GetChildren() do
                        if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                            x:Destroy()
                        end
                    end
                    if part:FindFirstChild("Attachment") then part:FindFirstChild("Attachment"):Destroy() end
                    if part:FindFirstChild("AlignPosition") then part:FindFirstChild("AlignPosition"):Destroy() end
                    if part:FindFirstChild("Torque") then part:FindFirstChild("Torque"):Destroy() end
                    part.CanCollide = false
                    local Torque = Instance.new("Torque", part)
                    Torque.Torque = Vector3.new(100000, 100000, 100000)
                    local AlignPosition = Instance.new("AlignPosition", part)
                    local Attachment2 = Instance.new("Attachment", part)
                    Torque.Attachment0 = Attachment2
                    AlignPosition.MaxForce = 9999999999999999
                    AlignPosition.MaxVelocity = math.huge
                    AlignPosition.Responsiveness = 200
                    AlignPosition.Attachment0 = Attachment2
                    AlignPosition.Attachment1 = Attachment1
                end
            end

            for _, part in next, game:GetService("Workspace"):GetDescendants() do
                EnhanceAndInvinciblePart(part)
            end

            game:GetService("Workspace").DescendantAdded:Connect(function(part)
                EnhanceAndInvinciblePart(part)
            end)

            UserInputService.InputBegan:Connect(function(input, isProcessed)
                if input.KeyCode == Enum.KeyCode.E and not isProcessed then
                    Updated = Mouse.Hit + Vector3.new(0, 5, 0)
                end
            end)

            spawn(function()
                while game:GetService("RunService").RenderStepped:Wait() do
                    Attachment1.WorldCFrame = Updated
                end
            end)
        end)

        local xiaoyepreparation = aboutkknb:Label("下一个灾害是:")
        aboutkknb:Toggle("预测灾害2","",false,function(val)        
            nextdis = val
            while wait(1) and nextdis do
                local SurvivalTag = plr.Character:FindFirstChild("SurvivalTag")
                if SurvivalTag then
                    if SurvivalTag.Value == "Blizzard" and nextdis then xiaoyepreparation.Text = "下一个灾害是：暴风雨"
                    elseif SurvivalTag.Value == "Sandstorm" and nextdis then xiaoyepreparation.Text = "下一个灾害是：沙尘暴"		        
                    elseif SurvivalTag.Value == "Tornado" and nextdis then xiaoyepreparation.Text = "下一个灾害是：龙卷风"
                    elseif SurvivalTag.Value == "Volcanic Eruption" and nextdis then xiaoyepreparation.Text = "下一个灾害是：火山"
                    elseif SurvivalTag.Value == "Flash Flood" and nextdis then xiaoyepreparation.Text = "下一个灾害是：洪水"
                    elseif SurvivalTag.Value == "Deadly Virus" and nextdis then xiaoyepreparation.Text = "下一个灾害是：病毒"
                    elseif SurvivalTag.Value == "Tsunami" and nextdis then xiaoyepreparation.Text = "下一个灾害是：海啸"
                    elseif SurvivalTag.Value == "Acid Rain" and nextdis then xiaoyepreparation.Text = "下一个灾害是：酸雨"
                    elseif SurvivalTag.Value == "Fire" and nextdis then	xiaoyepreparation.Text = "下一个灾害是：火灾"
                    elseif SurvivalTag.Value == "Meteor Shower" and nextdis then xiaoyepreparation.Text = "下一个灾害是：流星雨"
                    elseif SurvivalTag.Value == "Earthquake" and nextdis then xiaoyepreparation.Text = "下一个灾害是：地震"
                    elseif SurvivalTag.Value == "Thunder Storm" and nextdis then xiaoyepreparation.Text = "下一个灾害是：雷暴"
                    else
                        Message.Visible = false
                    end
                end
            end
        end)

        aboutkknb:Button("获取气球", function()
            local plyr = game.Players.LocalPlayer
            local char = plyr.Character
            if not char then return end

            local hum = char:FindFirstChildOfClass("Humanoid")
            local rigType = hum and hum.RigType or Enum.HumanoidRigType.R6

            local torso, ra, la, rs, ls
            if rigType == Enum.HumanoidRigType.R6 then
                torso = char.Torso
                ra = char["Right Arm"]
                la = char["Left Arm"]
                rs = char.Torso["Right Shoulder"]
                ls = char.Torso["Left Shoulder"]
            else
                torso = char.UpperTorso
                ra = char.RightUpperArm
                la = char.LeftUpperArm
                rs = char.RightShoulder
                ls = char.LeftShoulder
            end

            if not torso or not ra or not la then return end

            local mouse = plyr:GetMouse()
            local Run = game:GetService("RunService")
            local equipped = false
            local idle = true

            local part1 = Instance.new("Part")
            part1.Size = Vector3.new(1, 3, 1)
            part1.TopSurface = 0
            part1.BottomSurface = 0
            part1.CanCollide = false
            part1.Parent = char

            local special = Instance.new("SpecialMesh")
            special.MeshId = "http://www.roblox.com/asset/?id=25498565"
            special.TextureId = "http://www.roblox.com/asset/?id=26725707"
            special.Scale = Vector3.new(2, 2, 2)
            special.Parent = part1

            local w = Instance.new("Weld")
            w.Part0 = torso
            w.Part1 = part1
            w.C0 = CFrame.new(-0.4, -1.4, -0.5) * CFrame.Angles(-0.5, 0, 0.2)
            w.Parent = part1

            local part2 = Instance.new("Part")
            part2.Size = Vector3.new(1, 3, 1)
            part2.TopSurface = 0
            part2.BottomSurface = 0
            part2.CanCollide = false
            part2.Parent = char

            local special2 = Instance.new("SpecialMesh")
            special2.MeshId = "http://www.roblox.com/asset/?id=25498565"
            special2.TextureId = "http://www.roblox.com/asset/?id=26725707"
            special2.Scale = Vector3.new(2, 2, 2)
            special2.Parent = part2

            local w2 = Instance.new("Weld")
            w2.Part0 = torso
            w2.Part1 = part2
            w2.C0 = CFrame.new(0.4, -1.4, -0.5) * CFrame.Angles(-0.5, 0, -0.2)
            w2.Parent = part2

            local tool = Instance.new("HopperBin")
            tool.Name = "气球"
            tool.TextureId = "http://www.roblox.com/asset/?id=27471616"
            tool.Parent = plyr.Backpack

            tool.Selected:Connect(function()
                mouse.Button1Down:Connect(function()
                    if equipped then return end
                    equipped = true

                    task.spawn(function()
                        while equipped do
                            if rs then rs.CurrentAngle = 0 end
                            if ls then ls.CurrentAngle = 0 end
                            Run.Stepped:Wait()
                        end
                    end)

                    task.spawn(function()
                        idle = false
                        task.spawn(function()
                            for _ = 1, 10 do
                                w.C0 = w.C0 * CFrame.new(0, 0.02, 0)
                                w2.C0 = w2.C0 * CFrame.new(0, 0.02, 0)
                                Run.Stepped:Wait()
                            end
                            task.wait(0.15)
                            for _ = 1, 10 do
                                w.C0 = w.C0 * CFrame.new(0, -0.02, 0)
                                w2.C0 = w2.C0 * CFrame.new(0, -0.02, 0)
                                Run.Stepped:Wait()
                            end
                        end)()

                        local p = Instance.new("Part")
                        p.Name = "Platform"
                        p.Transparency = 1
                        p.Size = Vector3.new(4, 1, 4)
                        p.Anchored = true
                        p.CanCollide = true
                        p.Parent = workspace

                        local targetY = torso.Position.Y - 6
                        p.CFrame = CFrame.new(torso.Position.X, targetY, torso.Position.Z)

                        task.delay(0.5, function()
                            p:Destroy()
                        end)
                    end)

                    for _ = 1, 5 do
                        if rs and rs.C0 then rs.C0 = rs.C0 * CFrame.Angles(-0.2, 0, 0) end
                        if ls and ls.C0 then ls.C0 = ls.C0 * CFrame.Angles(-0.2, 0, 0) end
                        Run.Stepped:Wait()
                    end
                    task.wait(0.02)
                    for _ = 1, 5 do
                        if rs and rs.C0 then rs.C0 = rs.C0 * CFrame.Angles(0.2, 0, 0) end
                        if ls and ls.C0 then ls.C0 = ls.C0 * CFrame.Angles(0.2, 0, 0) end
                        Run.Stepped:Wait()
                    end
                    idle = true
                    equipped = false
                end)
            end)

            task.spawn(function()
                while idle and part1 and part1.Parent do
                    for i = 0, 3 do
                        w.C0 = w.C0 * CFrame.Angles(0, 0.002 * i, 0)
                        w2.C0 = w2.C0 * CFrame.Angles(0, -0.002 * i, 0)
                        Run.Stepped:Wait()
                    end
                    task.wait(0.2)
                    for i = 0, 3 do
                        w.C0 = w.C0 * CFrame.Angles(0, -0.002 * i, 0)
                        w2.C0 = w2.C0 * CFrame.Angles(0, 0.002 * i, 0)
                        Run.Stepped:Wait()
                    end
                    task.wait(0.3)
                end
            end)
        end)

        aboutkknb:Toggle("预测灾害","",false,function(val)        
            nextdis = val
            while wait(5) and nextdis do
                local SurvivalTag = plr.Character:FindFirstChild("SurvivalTag")
                if SurvivalTag then
                    if SurvivalTag.Value == "Blizzard" and nextdis then Ye_Notify("叶脚本", "下一个灾难是暴风雪",  1)
                    elseif SurvivalTag.Value == "Sandstorm" and nextdis then Ye_Notify("叶脚本", "下一个灾难是沙尘暴",  1)
                    elseif SurvivalTag.Value == "Tornado" and nextdis then Ye_Notify("叶脚本", "下一个灾难是龙卷风",  1)
                    elseif SurvivalTag.Value == "Volcanic Eruption" and nextdis then Ye_Notify("叶脚本", "下一个灾难是火山",  1)
                    elseif SurvivalTag.Value == "Flash Flood" and nextdis then Ye_Notify("叶脚本", "下一个灾难是洪水",  1)
                    elseif SurvivalTag.Value == "Deadly Virus" and nextdis then Ye_Notify("叶脚本", "下一个灾难是病毒",  1)
                    elseif SurvivalTag.Value == "Tsunami" and nextdis then Ye_Notify("叶脚本", "下一个灾难是海啸",  1)
                    elseif SurvivalTag.Value == "Acid Rain" and nextdis then Ye_Notify("叶脚本", "下一个灾难是酸雨",  1)
                    elseif SurvivalTag.Value == "Fire" and nextdis then	Ye_Notify("叶脚本", "下一个灾难是火焰",  1)
                    elseif SurvivalTag.Value == "Meteor Shower" and nextdis then Ye_Notify("叶脚本", "下一个灾难是流星雨",  1)
                    elseif SurvivalTag.Value == "Earthquake" and nextdis then Ye_Notify("叶脚本", "下一个灾难是地震",  1)
                    elseif SurvivalTag.Value == "Thunder Storm" and nextdis then Notify("叶脚本", "下一个灾难是雷暴",  1) wait(10)        
                    else
                        Message.Visible = false
                    end
                end
            end
        end)    

        aboutkknb:Toggle("地图投票界面", "Map Voting UI", false, function(bool)
            if bool == false then 
                game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = false
            end
            if bool == true then 
                game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = true
            end
        end)

        aboutkknb:Toggle("游戏岛悬崖碰撞", "Togglelnfo", false, function(bool)
            for i, v in pairs (game.workspace:GetDescendants())do
                if v.Name == 'LowerRocks' then
                    v.CanCollide = bool
                end
            end
        end)

        aboutkknb:Button("禁用坠落损坏",function()
            local FallDamageScript = (game.Players.LocalPlayer.Character ~= nil) and game.Players.LocalPlayer.Character:FindFirstChild("FallDamageScript") or nil
            if FallDamageScript then
                FallDamageScript:Destroy()
            end
        end)

        aboutkknb:Toggle("自动禁用坠落伤害", "Toggleelnfo", false, function(bool)
            _G.NoFallDamage = bool;
            while wait(0.5) do
                if _G.NoFallDamage == true then
                    local FallDamageScript = (game.Players.LocalPlayer.Character ~= nil) and game.Players.LocalPlayer.Character:FindFirstChild("FallDamageScript") or nil
                    if FallDamageScript then
                        FallDamageScript:Destroy()
                    end 
                end 
            end
        end)

        aboutkknb:Button("移除灾难界面(暴风雪和沙尘暴)",function()
            game.Players.LocalPlayer.PlayerGui.BlizzardGui:destroy()
            game.Players.LocalPlayer.PlayerGui.SandStormGui:destroy()
        end)

        aboutkknb:Button("叶脚本-黑洞脚本", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/%E5%8F%B6%E8%84%9A%E6%9C%AC%E9%BB%91%E6%B4%9E.lua"))()
        end)

        aboutkknb:Button("黑洞脚本2", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-AURA/main/kawaii_aura.lua", true))()
        end)

        aboutkknb:Button("黑洞脚本3", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GoofyBlox/GoofyZ/refs/heads/main/Best/Vortex.lua", true))()
        end)

        aboutkknb:Button("黑洞脚本环绕V2",function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BOOSBS/666/refs/heads/main/656"))()
        end)

        local AutoClickSpam = false
        aboutkknb:Toggle("变nood", "AutoClickLoop", false, function(state)
            AutoClickSpam = state
            if state then
                task.spawn(function()
                    local Workspace = game:GetService("Workspace")
                    local count = 0
                    while AutoClickSpam do
                        local balloon = Workspace:FindFirstChild("BillboardBalloon")
                        local apple = Workspace:FindFirstChild("BillboardApple")

                        local balloonClick = balloon and balloon:FindFirstChild("Board") and balloon.Board:FindFirstChildOfClass("ClickDetector")
                        local appleClick = apple and apple:FindFirstChild("Board") and apple.Board:FindFirstChildOfClass("ClickDetector")

                        if balloonClick then fireclickdetector(balloonClick) end
                        if appleClick then fireclickdetector(appleClick) end

                        count = count + 1
                        if count % 50 == 0 then task.wait() end
                    end
                end)
            end
        end)

        aboutkknb:Toggle("开启游戏岛悬崖碰撞体积", "Togglelnfo", false, function(bool)
            for i, v in pairs (game.workspace:GetDescendants())do
                if v.Name == 'LowerRocks' then
                    v.CanCollide = bool
                end
            end
        end)

        aboutkknb:Toggle("在水上行走", "ToggleInfo", false, function(bool)
            if bool == false then 
                game.Workspace.WaterLevel.CanCollide = false
                game.Workspace.WaterLevel.Size = Vector3.new(10, 1, 10)
            end
            if bool == true then 
                game.Workspace.WaterLevel.CanCollide = true
                game.Workspace.WaterLevel.Size = Vector3.new(5000, 1, 5000)
            end
        end)

        aboutkknb:Toggle("自动存活", "ToggleInfo", false, function(bool)
            _G.autowinfarm = bool;
            while wait(.1) do
                if _G.autowinfarm == true then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-236, 180, 360, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                end
            end
        end)

        aboutkknb:Button("打印下一次灾难", function()
            warn(game.Players.LocalPlayer.Character.SurvivalTag.Value)      
        end) 
    end,

    ["伐木大亨"] = function()
        local creds = window:Tab("伐木大亨",'123097590035361')
        local creditsFDD = creds:section("主要功能", true)

        creditsFDD:Button("伐木大亨",function()
            loadstring(game:HttpGet("https://api.canhub.dev/code"))()
        end)

        local creditsFDD2 = creds:section("传送功能", true)

        creditsFDD2:Dropdown("传送", 'Dropdown',
            {'出生点', '木材反斗城', '土地商店', '桥', '码头', '椰子岛', '洞穴', '鲨鱼斧合成',
             '火山', '沼泽', '家具店', '盒子车行', '连锁逻辑店', '鲍勃的小店', '画廊', '雪山',
             '灵视神殿', '怪人', '小绿盒', '滑雪小屋', '黄金木洞穴', '小鸟斧头', "灯塔"},
            function(b)
                if b == '木材反斗城' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(270, 4, 60)
                elseif b == '出生点' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(174, 10.5, 66)
                elseif b == '土地商店' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(270, 3, -98)
                elseif b == '桥' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112, 37, -892)
                elseif b == '码头' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1136, 0, -206)
                elseif b == '椰子岛' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2614, -4, -34)
                elseif b == '洞穴' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3590, -177, 415)
                elseif b == '火山' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1588, 623, 1069)
                elseif b == '沼泽' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1216, 131, -822)
                elseif b == '家具店' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(486, 3, -1722)
                elseif b == '盒子车行' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(509, 3, -1458)
                elseif b == '雪山' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1487, 415, 3259)
                elseif b == '连锁逻辑店' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4615, 7, -794)
                elseif b == '鲍勃的小店' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(292, 8, -2544)
                elseif b == '画廊' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5217, -166, 721)
                elseif b == '灵视神殿' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1608, 195, 928)
                elseif b == '怪人' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1071, 16, 1141)
                elseif b == '小绿盒' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1667, 349, 1474)
                elseif b == '滑雪小屋' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1244, 59, 2290)
                elseif b == '黄金木洞穴' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1080, -5, -942)
                elseif b == '鲨鱼斧合成' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(330.259735, 45.7998505, 1943.30823, 0.972010553, -8.07546598e-08, 0.234937176,
                        7.63610259e-08, 1, 2.77986647e-08, -0.234937176, -9.08055142e-09, 0.972010553)
                elseif b == '小鸟斧头' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4813.1, 33.5, -978.8)
                elseif b == '灯塔' then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1464.8, 356.3, 3257.2)
                end
            end)
    end,

    ["一路向西"] = function()
        local creds = window:Tab("一路向西",'123097590035361')
        local creditsiu = creds:section("一路向西", true)

        creditsiu:Button("一路向西1",function()
            loadstring(game:HttpGet("https://pastefy.app/q08owYGG/raw"))()
        end)

        creditsiu:Button("一路向西2",function()
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/Drifter0507/scripts/main/westbound"),true))()
        end)

        creditsiu:Button("全图杀人", function()
            local L_1_ = true;
            local L_2_ = game.Players.LocalPlayer.Character.HumanoidRootPart;
            local L_3_ = L_2_.Position - Vector3.new(5, 0, 0)

            game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(L_4_arg1)
                if L_4_arg1 == 'f' then
                    L_1_ = not L_1_
                end;
                if L_4_arg1 == 'r' then
                    L_2_ = game.Players.LocalPlayer.Character.HumanoidRootPart;
                    L_3_ = L_2_.Position - Vector3.new(5, 0, 0)
                end
            end)

            for L_5_forvar1, L_6_forvar2 in pairs(game.Players:GetPlayers()) do
                if L_6_forvar2 == game.Players.LocalPlayer then
                else
                    local L_7_ = coroutine.create(function()
                        game:GetService('RunService').RenderStepped:Connect(function()
                            local L_8_, L_9_ = pcall(function()
                                local L_10_ = L_6_forvar2.Character;
                                if L_10_ then
                                    if L_10_:FindFirstChild("HumanoidRootPart") then
                                        if L_1_ then
                                            L_6_forvar2.Backpack:ClearAllChildren()
                                            for L_11_forvar1, L_12_forvar2 in pairs(L_10_:GetChildren()) do
                                                if L_12_forvar2:IsA("Tool") then
                                                    L_12_forvar2:Destroy()
                                                end
                                            end;
                                            L_10_.HumanoidRootPart.CFrame = CFrame.new(L_3_)
                                        end
                                    end
                                end
                            end)
                            if L_8_ then
                            else
                                warn("Unnormal error: "..L_9_)
                            end
                        end)
                    end)
                    coroutine.resume(L_7_)
                end
            end;

            game.Players.PlayerAdded:Connect(function(L_13_arg1)   
                if L_13_arg1 == game.Players.LocalPlayer then
                else
                    local L_14_ = coroutine.create(function()
                        game:GetService('RunService').RenderStepped:Connect(function()
                            local L_15_, L_16_ = pcall(function()
                                local L_17_ = L_13_arg1.Character;
                                if L_17_ then
                                    if L_17_:FindFirstChild("HumanoidRootPart") then
                                        if L_1_ then
                                            L_13_arg1.Backpack:ClearAllChildren()
                                            for L_18_forvar1, L_19_forvar2 in pairs(L_17_:GetChildren()) do
                                                if L_19_forvar2:IsA("Tool") then
                                                    L_19_forvar2:Destroy()
                                                end
                                            end;
                                            L_17_.HumanoidRootPart.CFrame = CFrame.new(L_3_)
                                        end
                                    end
                                end
                            end)
                            if L_15_ then
                            else
                                warn("Unnormal error: "..L_16_)
                            end
                        end)
                    end)
                    coroutine.resume(L_14_)
                end           
            end)
        end)

        creditsiu:Button("无跌落伤害",function()
            local gamemt = getrawmetatable(game)
            local oldNc = gamemt.__namecall
            setreadonly(gamemt, false)

            gamemt.__namecall = newcclosure(function(self, ...)
            if (getnamecallmethod() == 'FireServer' and self.Name == 'ChangeCharacter') then
                local args = {...}
                if (args[1] and args[1] == 'Damage') then
                return nil
                end
            end 
            return oldNc(self, ...)
            end)
        end)

        creditsiu:Button("快速拾取",function()
            local v15 = require(game:GetService("Workspace")[game.Players.LocalPlayer.Name].ContextActions.ContextMain);
            v15:New({
            RobPlayerLength = 0.1, 
            FixWallLength = 0.1, 
            CrackSafeLength = 0.1, 
            RobSafeLength = 0.1, 
            RobRegisterLength = 0.1, 
            PickCellLength = 0.1, 
            SkinAnimalLength = 0.1
            }, 200, 
            { "Get out of my shop! Outlaws are not welcome here!", "Hey, scoundrel! Get out before I call the sheriff!", "You're an outlaw! We don't serve your type here!" }, 
            { "This here's a bandit camp! Get out!", "Get lost, cowboy!", "Are you an outlaw? Didn't think so! Scram!" });
        end)

        creditsiu:Button("范围伤害",function()
            loadstring(game:HttpGet(('https://pastebin.com/raw/rLGRxq0W')))()
        end)

        creditsiu:Button("无后座力",function()
            local mods = {
                FanFire = true, 
                camShakeResist = 0, 
                prepTime = 0, 
                equipTime = 0, 
                Spread = 0, 
                InstantFireAnimation = true
            }

            for _, gun in pairs(require(game:GetService("ReplicatedStorage").GunScripts.GunStats)) do
                for prop, value in pairs(mods) do
                    if gun[prop] then
                        gun[prop] = value
                    end
                end
            end
        end)

        creditsiu:Button("一秒换弹",function()
            local mods = {
                FanFire = true, 
                prepTime = 0, 
                equipTime = 0, 
                camShakeResist = 0, 
                ReloadAnimationSpeed = 10, 
                ReloadSpeed = 0, 
                Spread = 0, 
                InstantFireAnimation = true
            }

            for _, gun in pairs(require(game:GetService("ReplicatedStorage").GunScripts.GunStats)) do
                for prop, value in pairs(mods) do
                    if gun[prop] then
                        gun[prop] = value
                    end
                end
            end
        end)

        creditsiu:Button("子弹汇聚",function()
            local mods = {
                FanFire = true, 
                prepTime = 0, 
                equipTime = 0, 
                camShakeResist = 0, 
                ReloadAnimationSpeed = 10, 
                ReloadSpeed = 0, 
                Spread = 0, 
                HipFireAccuracy = 0, 
                ZoomAccuracy = 0, 
                InstantFireAnimation = true
            }

            for _, gun in pairs(require(game:GetService("ReplicatedStorage").GunScripts.GunStats)) do
                for prop, value in pairs(mods) do
                    if gun[prop] then
                        gun[prop] = value
                    end
                end
            end
        end)

        creditsiu:Button("无限备弹",function()
            local mods = {
                FanFire = true, 
                prepTime = 0, 
                equipTime = 0, 
                MaxShots = math.huge, 
                camShakeResist = 0, 
                ReloadAnimationSpeed = 10, 
                ReloadSpeed = 0, 
                Spread = 0, 
                InstantFireAnimation = true
            }

            for _, gun in pairs(require(game:GetService("ReplicatedStorage").GunScripts.GunStats)) do
                for prop, value in pairs(mods) do
                    if gun[prop] then
                        gun[prop] = value
                    end
                end
            end
        end)

        creditsiu:Button("滚筒",function()
            local args = {[1] = "StoneCreek",[2] = false}game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack(args))
        end)

        creditsiu:Button("岩石溪",function()
            local args = {[1] = "StoneCreek",[2] = false}game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack(args))
        end)

        creditsiu:Button("灰色山脊",function()
            local args = {[1] = "Grayridge",[2] = false}game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack(args))
        end)

        creditsiu:Button("大矿洞",function()
            local args = {[1] = "Quarry",[2] = false}game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack(args))
        end)

        creditsiu:Button("堡垒",function()
            local args = {[1] = "FortCassidy",[2] = true}game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack(args))
        end)

        creditsiu:Button("阿瑟堡",function()
            local args = {[1] = "FortArthur",[2] = true}game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack(args))
        end)

        creditsiu:Button("红色岩石营地",function()
            local args = {[1] = "RedRocks",[2] = true}game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack(args))
        end)

        creditsiu:Toggle("自动出售","开关",false,function(v)
            getgenv().sell = v
            sell()
        end)

        creditsiu:Toggle("手枪子弹","开关",false,function(v)
            getgenv().buyammo1 = v
            buyammo1()
        end)

        creditsiu:Toggle("步枪子弹","开关",false,function(v)
            getgenv().buyammo2 = v
            buyammo2()
        end)

        creditsiu:Toggle("购买箭矢","开关",false,function(v)
            getgenv().buyammo3 = v
            buyammo3()
        end)

        creditsiu:Toggle("霰弹子弹","开关",false,function(v)
            getgenv().buyammo4 = v
            buyammo4()
        end)

        creditsiu:Toggle("狙击子弹","开关",false,function(v)
            getgenv().buyammo5 = v
            buyammo5()
        end)

        creditsiu:Toggle("小型炸药","开关",false,function(v)
            getgenv().buyammo6 = v
            buyammo6()
        end)

        creditsiu:Toggle("大型炸药","开关",false,function(v)
            getgenv().buyammo7 = v
            buyammo7()
        end)

        creditsiu:Toggle("白天","开关",false,function()
            if not _G.FullBrightExecuted then
                _G.FullBrightEnabled = false
                _G.NormalLightingSettings = {
                    Brightness = game:GetService("Lighting").Brightness,
                    ClockTime = game:GetService("Lighting").ClockTime,
                    FogEnd = game:GetService("Lighting").FogEnd,
                    GlobalShadows = game:GetService("Lighting").GlobalShadows,
                    Ambient = game:GetService("Lighting").Ambient
                }

                game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
                    if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                        _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                        if not _G.FullBrightEnabled then
                            repeat wait() until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").Brightness = 1
                    end
                end)

                game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
                    if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                        _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                        if not _G.FullBrightEnabled then
                            repeat wait() until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").ClockTime = 12
                    end
                end)

                game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
                    if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                        _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                        if not _G.FullBrightEnabled then
                            repeat wait() until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").FogEnd = 786543
                    end
                end)

                game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
                    if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                        _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                        if not _G.FullBrightEnabled then
                            repeat wait() until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").GlobalShadows = false
                    end
                end)

                game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
                    if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                        _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                        if not _G.FullBrightEnabled then
                            repeat wait() until _G.FullBrightEnabled
                        end
                        game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                    end
                end)

                game:GetService("Lighting").Brightness = 1
                game:GetService("Lighting").ClockTime = 12
                game:GetService("Lighting").FogEnd = 786543
                game:GetService("Lighting").GlobalShadows = false
                game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

                local LatestValue = true
                spawn(function()
                    repeat wait() until _G.FullBrightEnabled
                    while wait() do
                        if _G.FullBrightEnabled ~= LatestValue then
                            if not _G.FullBrightEnabled then
                                game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                                game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                                game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                                game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                                game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                            else
                                game:GetService("Lighting").Brightness = 1
                                game:GetService("Lighting").ClockTime = 12
                                game:GetService("Lighting").FogEnd = 786543
                                game:GetService("Lighting").GlobalShadows = false
                                game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                            end
                            LatestValue = not LatestValue
                        end
                    end
                end)
            end

            _G.FullBrightExecuted = true
            _G.FullBrightEnabled = not _G.FullBrightEnabled
        end)

        creditsiu:Button("手持近战",function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/CX5200/Sword-Guest/main/killQWQ'))()
        end)
    end,
    ["刀刃球"] = function()
        local creds = window:Tab("刀刃球",'123097590035361')
        local creditsvb = creds:section("刀刃球", true)
        creditsvb:Toggle("自动击球1", "开关", false, function(v)
            if v then
                local function GetBall()
                    for _, v1 in ipairs(workspace.Ball:GetChildren()) do
                        if v1:GetAttribute("realBall") and v1:IsA("BasePart") then
                            return v1
                        end
                    end
                end
                game:GetService("RunService").Heartbeat:Connect(function()
                    local ball = GetBall()
                    if ball then
                        local BallSpeed = ball.zoomies.VectorVelocity.Magnitude
                        local BallPos = ball.Position
                        local Distance = game:GetService("Players").LocalPlayer:DistanceFromCharacter(BallPos) - 12
                        local Time = Distance / BallSpeed
                        if Time <= 0.7 then
                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
                        end
                    end
                end)
            end
        end)
        creditsvb:Button("自动击球2", function()
            local L0_0 = game.Name
            if L0_0 == "Blade Ball Game" then
                while true do
                    game.ParryBladeBall()
                    wait(0.5)
                end
            else
                notifications:notify{
                    Title = "脚本中心", Description = "", Icon = 17493876383,
                    Accept = { Text = "好的", Callback = function() print(":D") end }, Length = 5
                }
            end
        end)    
        creditsvb:Button("自动招架", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SPHubReal/SP_Hub/refs/heads/main/BladeBall"))()     
        end)
        creditsvb:Button("刀刃球1",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/RedCircleBlock"))() end)
        creditsvb:Button("刀刃球2",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))() end)
        creditsvb:Button("刀刃球3",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))() end)
        creditsvb:Button("刀刃球4",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MagoKazinn/Makzinn_hub/main/makzinn_Hub"))() end)
        creditsvb:Button("刀刃球5",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Fsploit/Flux-Z-Beta/refs/heads/main/Flux-Z-Beta-Blade-Ball.lua"))() end)
    end,

    ["最坚强的战场"] = function()
        local creds = window:Tab("最坚强的战场",'123097590035361')
        local creditsky = creds:section("最坚强的战场", true)
        creditsky:Button("垃圾桶大王",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))() end)  
        creditsky:Button("最坚强的战场1",function() loadstring(game:HttpGet('https://freenote.biz/raw/xkcdkgyhkx',true))() end)
        creditsky:Button("最坚强的战场2",function() loadstring(game:HttpGet("https://pastefy.app/HxjXAU2d/raw"))() end)
        creditsky:Button("最坚强的战场3",function() loadstring(Game:HttpGet("https://pastefy.app/oKLqVHKF/raw"))() end)
        creditsky:Button("最坚强的战场4",function() loadstring(game:HttpGet("https://pastefy.app/REPoaFWC/raw",true))() end)
        creditsky:Button("最坚强的战场5",function() loadstring(game:HttpGet(('https://raw.githubusercontent.com/zeuise0002/SSSWWW222/main/README.md'),true))() end)
        creditsky:Button("最坚强的战场6",function() loadstring(Game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/tsbscripts/main/Main"))() end)
        creditsky:Button("最坚强的战场7",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RealOfficialSkully/Smm/main/Smm"))() end)
        creditsky:Button("最坚强的战场8",function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-JJS-GOJO-22766"))() end)
    end,

    ["破坏者谜团"] = function()
        local creds = window:Tab("破坏者谜团",'123097590035361')
        local creditsdf = creds:section("破坏者谜团", true)
        creditsdf:Button("破坏者谜团1",function() loadstring(game:HttpGet(("https://raw.githubusercontent.com/Ethanoj1/EclipseMM2/master/Script"),true))() end)
        creditsdf:Button("破坏者谜团2",function() loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))() end)
        creditsdf:Button("YARHM", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))() end)
        creditsdf:Toggle("玩家透视","",false, function(state)
            getgenv().AllEsp = state
            for _, billboard in ipairs(ESPFolder:GetChildren()) do
                if billboard:IsA("BillboardGui") then
                    local playerName = billboard.Name:sub(1, -10)
                    local player = game.Players:FindFirstChild(playerName)
                    if player and player.Character then
                        local hasKnife = player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife")
                        local hasGun = player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun")
                        if not (hasKnife or hasGun) then billboard.Enabled = state end
                    end
                end
            end
        end)
        creditsdf:Toggle("警长透视","",false, function(state)
            getgenv().SheriffEsp = state
            for _, billboard in ipairs(ESPFolder:GetChildren()) do
                if billboard:IsA("BillboardGui") then
                    local playerName = billboard.Name:sub(1, -10)
                    local player = game.Players:FindFirstChild(playerName)
                    if player and (player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun")) then billboard.Enabled = state end
                end
            end
        end)
        creditsdf:Toggle("杀手透视","",false, function(state)
            getgenv().MurderEsp = state
            for _, billboard in ipairs(ESPFolder:GetChildren()) do
                if billboard:IsA("BillboardGui") then
                    local playerName = billboard.Name:sub(1, -10)
                    local player = game.Players:FindFirstChild(playerName)
                    if player and (player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife")) then billboard.Enabled = state end
                end
            end
        end)
        creditsdf:Toggle("子弹范围","",false, function(Value)
            local __namecall
            __namecall = hookmetamethod(game, "__namecall", function(self, ...)
                local method = getnamecallmethod()
                local args = { ... }
                if not checkcaller() then
                    if typeof(self) == "Instance" then
                        if self.Name == "ShootGun" and method == "InvokeServer" then
                            if Toggles.SilentAim.Value and Options.SilentAim:GetState() then
                                if murderer then
                                    local root = murderer.Character.PrimaryPart
                                    local velocity = root.AssemblyLinearVelocity
                                    local aimPosition = root.Position + (velocity * Vector3.new(Options.Prediction.Value / 200, 0, Options.Prediction.Value / 200))
                                    args[2] = aimPosition
                                end
                            end
                        end
                    end
                end
                return __namecall(self, unpack(args))
            end)
        end)
    end,

    ["监狱人生"] = function()
        local creds = window:Tab("监狱人生",'123097590035361')
        local creditswm = creds:section("脚本", true)
        creditswm:Button("无敌模式", function() loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))() end)
        creditswm:Button("杀死所有人", function() loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))() end)
        creditswm:Toggle("自动杀所有人","text",false,function(state)
            if state then
                print("Toggle On")
                isAutoKillRunning = true
                spawn(AutoKillLoop)
                spawn(AutoJump)
            else
                print("Toggle Off")
                isAutoKillRunning = false
            end
        end)
        creditswm:Toggle("删除门","text",false,function(state)
            if state then
                print("Toggle On")
                for i,v in pairs(workspace.Doors:GetChildren()) do v.Parent = game:service"ReplicatedStorage".nikodoors end
            else
                print("Toggle Off")
                for i,v in pairs(game:service"ReplicatedStorage".nikodoors:GetChildren()) do v.Parent = workspace.Doors end
            end
        end)
        creditswm:Button("逮捕所有罪犯", function()
            wait(0.1)
            Player = game.Players.LocalPlayer
            Pcf = Player.Character.HumanoidRootPart.CFrame
            for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
                if v.Name ~= Player.Name then
                    local i = 10
                    repeat
                        wait()
                        i = i-1
                        game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
                        Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                    until i == 0
                end
            end
        end)
        creditswm:Button("变钢铁侠", function() loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))() end)
        creditswm:Button("变死神", function() loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))() end)
        creditswm:Button("变车模型", function() loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))() end)
        creditswm:Button("变成警察", function() workspace.Remote.TeamEvent:FireServer("Bright blue"); end)
        creditswm:Button("变成囚犯", function() workspace.Remote.TeamEvent:FireServer("Bright orange"); end)
        creditswm:Button("手里剑秒杀",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/PSXhuge/1/114514/jian"))() end)
        creditswm:Button("监狱人生1",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/dalloc2/Roblox/main/TigerAdmin.lua"))() end)
        creditswm:Button("监狱人生2",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))() end)
        creditswm:Button("监狱人生汉化",function() loadstring(game:HttpGetAsync("https://pastebin.com/raw/fYMnAEeJ"))() end)
        creditswm:Button("监狱人生3",function() loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\48\48\108\88\112\108\111\105\116\101\114\47\103\48\48\108\88\112\108\111\105\116\101\114\47\109\97\105\110\47\70\101\37\50\48\98\121\112\97\115\115\34\44\32\116\114\117\101\41\41\40\41\10")() end)
        creditswm:Button("监狱人生4",function() loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/xRawnder/main/HubMoblie'))() end)

        local creditszo = creds:section("传送功能", true) 
        creditszo:Button("警卫室",function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875) end)
        creditszo:Button("监狱室内",function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875) end)
        creditszo:Button("监狱室外",function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875) end)
        creditszo:Button("犯罪复活点",function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875) end)
        creditszo:Button("传送院子", function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(788.5759887695312, 97.99992370605469, 2455.056640625) end)
        creditszo:Button("传送警车库", function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.7301635742188, 98.20000457763672, 2503.56982421875) end)
        creditszo:Button("传送死人下水道", function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(917.4256591796875, 78.69828033447266, 2416.18359375) end)
        creditszo:Button("传送食堂", function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(921.0059204101562, 99.98993682861328, 2289.23095703125) end)
    end,

    ["巴掌模拟器"] = function()
        local creds = window:Tab("巴掌模拟器",'123097590035361')
        local creditsxpo = creds:section("巴掌模拟器", true) 
        creditsxpo:Toggle("无CD","Toggle" ,false, function(Value)
            local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
            bazhangmnq = Value
            while bazhangmnq do
                local localscript = tool:FindFirstChildOfClass("LocalScript")
                local localscriptclone = localscript:Clone()
                localscriptclone = localscript:Clone()
                localscriptclone:Clone()
                localscript:Destroy()
                localscriptclone.Parent = tool
                wait(0.1)
            end
        end)
        creditsxpo:Button("巴掌光环", function(bool)
            getgenv().SlapAura = bool
            if bool == true then
                while getgenv().SlapAura do
                    task.wait(.005)
                    pcall(function()
                        for Index, Player in next, game.Players:GetPlayers() do
                            if Player ~= game.Players.LocalPlayer and Player.Character and Player.Character:FindFirstChild("entered") then
                                if Player.Character:FindFirstChild("Head") then
                                    if Player.Character.Head:FindFirstChild("UnoReverseCard") == nil and Player.Character:FindFirstChild("rock") == nil then 
                                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                            local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                                            if 25 >= Magnitude then
                                                shared.gloveHits[getGlove()]:FireServer(Player.Character:WaitForChild("Head"))
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end) 
        creditsxpo:Button("获取计数器手套", function()
            fireclickdetector(game.Workspace.CounterLever.ClickDetector)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
            wait(0.2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            wait(121)
            for i,v in pairs(workspace.Maze:GetDescendants()) do
                if v:IsA("ClickDetector") then fireclickdetector(v) end
            end
        end)
        creditsxpo:Toggle("地牢亮度","Toggle" ,false, function(Value)
            Light = Value
            if not Light then game.Lighting.Ambient = Color3.new(0, 0, 0) end
        end)
        creditsxpo:Dropdown("传送","Dropdown",{"安全区","竞技场","埃及岛","果实岛","盘子","锦标赛","默认竞技场"},function(Value)
            if Value == "安全区" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Spot.CFrame * CFrame.new(0,40,0)
            elseif Value == "竞技场" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
            elseif Value == "埃及岛" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215, -15.5, 0.5)
            elseif Value == "果实岛" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.island5.Union.CFrame * CFrame.new(0,3.25,0)
            elseif Value == "盘子" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,2,0)
            elseif Value == "锦标赛" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
            elseif Value == "默认竞技场" then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120,360,-3) end
        end)
        creditsxpo:Toggle("复古技能","Toggle" ,false, function(Value)
            RetroSpam = Value
            while RetroSpam do game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility) task.wait() end
        end)
        creditsxpo:Dropdown("复古技能选择","Dropdown",{"Rocket Launcher","Ban Hammer","Bomb"}, function(Value) RetroAbility = Value end)
        creditsxpo:Toggle("自动捡糖果","Toggle",false, function(Value)
            CandyCornFarm = Value
            while CandyCornFarm do
                for i, v in pairs(workspace.CandyCorns:GetChildren()) do
                    if v:FindFirstChildWhichIsA("TouchTransmitter") then v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end
                end
                task.wait()
            end
        end)
        creditsxpo:Toggle("获取炼金术师材料","Toggle", false, function(Value)
            AlchemistIngredients = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
                while AlchemistIngredients do
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Mushroom")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Glowing Mushroom")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Fire Flower")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Winter Rose")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dark Root")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dire Flower")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Autumn Sprout")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Elder Wood")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Hazel Lily")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Wild Vine")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Jade Stone")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Lamp Grass")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Plane Flower")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blood Rose")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Red Crystal")
                    game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blue Crystal")
                    task.wait()
                end
            end
        end)
        creditsxpo:Toggle("自动加入竞技场","Toggle", false, function(Value)
            AutoEnterArena = Value
            while AutoEnterArena do
                if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
                end
                task.wait()
            end
        end)
        creditsxpo:Toggle("自动光波球","Toggle", false, function(Value)
            if Person == nil then Person = game.Players.LocalPlayer.Name end
            _G.RojoSpam = Value
            while _G.RojoSpam do
                game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
                task.wait()
            end
        end)
        creditsxpo:Button("Rojo技能", function(Value)
            _G.RojoSpam = Value
            game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Charge")
            wait(6)
            game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
            task.wait()
        end)
        creditsxpo:Toggle("音符技能","Toggle", false, function(Value)
            _G.RhythmSpam = Value
            while _G.RhythmSpam do game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion",0) task.wait() end
        end)
        creditsxpo:Toggle("Null技能","Toggle", false, function(Value)
            NullSpam = Value
            while NullSpam do game:GetService("ReplicatedStorage").NullAbility:FireServer() task.wait() end
        end)
        creditsxpo:Toggle("自动拾取黄金果实","Toggle", false, function(Value)
            SlappleFarm = Value
            while SlappleFarm do
                for i, v in ipairs(workspace.Arena.island5.Slapples:GetDescendants()) do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Glove" and v:FindFirstChildWhichIsA("TouchTransmitter") then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
                task.wait()
            end
        end)
        creditsxpo:Toggle("自动捡飞行宝珠","Toggle", false, function(Value)
            Jetfarm = Value
            while Jetfarm do
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "JetOrb" and v:FindFirstChild("TouchInterest") then
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                    end
                end
                task.wait()
            end
        end)
        creditsxpo:Toggle("自动捡相位球","Toggle", false, function(Value)
            Phasefarm = Value
            while Phasefarm do
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "PhaseOrb" and v:FindFirstChild("TouchInterest") then
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                    end
                end
                task.wait()
            end
        end)
        creditsxpo:Toggle("自动刷bob","Toggle", false, function(Value)
            ReplicaFarm = Value
            while ReplicaFarm do
                for i, v in pairs(workspace:GetChildren()) do
                    if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
                        game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                    end
                end
                task.wait()
                game:GetService("ReplicatedStorage").Duplicate:FireServer()
                task.wait(7)
            end
        end)
        creditsxpo:Toggle("无限反转","Toggle", false, function(Value)
            _G.InfReverse = Value
            while _G.InfReverse do game:GetService("ReplicatedStorage").ReverseAbility:FireServer() wait(6) end
        end)
        creditsxpo:Toggle("彩虹角色(装备黄金手套)","Toggle", false, function(Value)
            _G.Rainbow = Value
            while _G.Rainbow do
                for i = 0,1,0.001*25 do game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.new(Color3.fromHSV(i,1,1))) task.wait() end
            end
        end)
        creditsxpo:Toggle("防击飞","Toggle", false, function(Value)
            AntiRagdoll = Value
            if AntiRagdoll then
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                game.Players.LocalPlayer.CharacterAdded:Connect(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
                        if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
                            repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                            game.Players.LocalPlayer.Character.Torso.Anchored = false
                        end
                    end)
                end)
            end
        end)
        creditsxpo:Toggle("反虚空(锦标赛也有效果)","Toggle", false, function(Value)
            game.Workspace.dedBarrier.CanCollide = Value
            game.Workspace.TAntiVoid.CanCollide = Value
        end)
        creditsxpo:Toggle("防死亡屏障","Toggle", false, function(Value)
            if Value == true then
                for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do if v.ClassName == "Part" and v.Name == "BLOCK" then v.CanTouch = false end end
                workspace.DEATHBARRIER.CanTouch = false
                workspace.DEATHBARRIER2.CanTouch = false
                workspace.dedBarrier.CanTouch = false
                workspace.ArenaBarrier.CanTouch = false
                workspace.AntiDefaultArena.CanTouch = false
            else
                for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do if v.ClassName == "Part" and v.Name == "BLOCK" then v.CanTouch = true end end
                workspace.DEATHBARRIER.CanTouch = true
                workspace.DEATHBARRIER2.CanTouch = true
                workspace.dedBarrier.CanTouch = true
                workspace.ArenaBarrier.CanTouch = true
                workspace.AntiDefaultArena.CanTouch = true
            end
        end)
        creditsxpo:Toggle("反巴西","Toggle", false, function(Value)
            if Value == true then for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do v.CanTouch = false end
            else for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do v.CanTouch = true end end
        end)
        creditsxpo:Toggle("反死亡方块","Toggle", false, function(Value)
            if Value == true then workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
            else workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true end
        end)
        creditsxpo:Toggle("反上帝技能","Toggle", false, function(Value)
            AntiTimestop = Value
            while AntiTimestop do
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v.ClassName == "Part" then v.Anchored = false end end
                task.wait()
            end
        end)
        creditsxpo:Toggle("反鱿鱼","Toggle", false, function(Value)
            AntiSquid = Value
            if AntiSquid == false then game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true end
            while AntiSquid do
                if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false end
                task.wait()
            end
        end)
        creditsxpo:Toggle("反神圣杰克","Toggle", false, function(Value) game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value end)
        creditsxpo:Toggle("反传送带","Toggle", false, function(Value) game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value end)
        creditsxpo:Toggle("反板砖","Toggle", false, function(Value)
            AntiBrick = Value
            while AntiBrick do for i,v in pairs(game.Workspace:GetChildren()) do if v.Name == "Union" then v.CanTouch = false end end task.wait() end
        end)
        creditsxpo:Toggle("反Null","Toggle", false, function(Value)
            AntiNull = Value
            while AntiNull do
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Imp" and v:FindFirstChild("Body") then shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true) end
                end
                task.wait()
            end
        end)
        creditsxpo:Button("自动刷巴掌",function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Farm'))() end)
        creditsxpo:Button("巴掌模拟器1",function() loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))() end)
        creditsxpo:Button("巴掌模拟器2",function() loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))() end)
        creditsxpo:Button("巴掌模拟器3",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))() end)
        creditsxpo:Button("巴掌模拟器4",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Dusty1234567890/Ab-admin-glove-badge/main/Ab%20glovr%20badge%20admin"))() end)
        creditsxpo:Button("巴掌模拟器5",function() loadstring(game:HttpGet(("https://raw.githubusercontent.com/Donjosx/SlapBattle_Scripts/main/God_Mode_V2")))() end)
        creditsxpo:Button("巴掌模拟器6",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))() end)
        creditsxpo:Button("巴掌模拟器7",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))() end)
        creditsxpo:Button("巴掌模拟器8",function() loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))() end)
        creditsxpo:Button("巴掌模拟器9",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/bazhang"))() end)
    end,

    ["兵工厂"] = function()
        local creds = window:Tab("兵工厂",'123097590035361')
        local creditsswq = creds:section("兵工厂", true)
        creditsswq:Button("无限子弹",function()
            while wait(0.5) do
                game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 100
                game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 100
            end
        end)
        creditsswq:Button("快速射击",function()
            local replicationstorage = game.ReplicatedStorage
            for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
                if v.Name == "Auto" then v.Value = true end
                if v.Name == "RecoilControl" then v.Value = 0 end
                if v.Name == "MaxSpread" then v.Value = 0 end
                if v.Name == "ReloadTime" then v.Value = 0 end
                if v.Name == "FireRate" then v.Value = 0.05 end
                if v.Name == "Crit" then v.Value = 20 end
            end       
        end)
        creditsswq:Button("开启透视",function()
            _G.FriendColor = Color3.fromRGB(0, 0, 255)
            _G.EnemyColor = Color3.fromRGB(255, 0, 0)
            _G.UseTeamColor = true

            local Holder = Instance.new("Folder", game.CoreGui)
            Holder.Name = "ESP"

            local Box = Instance.new("BoxHandleAdornment")
            Box.Name = "nilBox"
            Box.Size = Vector3.new(1, 2, 1)
            Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
            Box.Transparency = 0.7
            Box.ZIndex = 0
            Box.AlwaysOnTop = false
            Box.Visible = false

            local NameTag = Instance.new("BillboardGui")
            NameTag.Name = "nilNameTag"
            NameTag.Enabled = false
            NameTag.Size = UDim2.new(0, 200, 0, 50)
            NameTag.AlwaysOnTop = true
            NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
            local Tag = Instance.new("TextLabel", NameTag)
            Tag.Name = "Tag"
            Tag.BackgroundTransparency = 1
            Tag.Position = UDim2.new(0, -50, 0, 0)
            Tag.Size = UDim2.new(0, 300, 0, 20)
            Tag.TextSize = 15
            Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
            Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
            Tag.TextStrokeTransparency = 0.4
            Tag.Text = "nil"
            Tag.Font = Enum.Font.SourceSansBold
            Tag.TextScaled = false

            local LoadCharacter = function(v)
                repeat wait() until v.Character ~= nil
                v.Character:WaitForChild("Humanoid")
                local vHolder = Holder:FindFirstChild(v.Name)
                vHolder:ClearAllChildren()
                local b = Box:Clone()
                b.Name = v.Name .. "Box"
                b.Adornee = v.Character
                b.Parent = vHolder
                local t = NameTag:Clone()
                t.Name = v.Name .. "NameTag"
                t.Enabled = true
                t.Parent = vHolder
                t.Adornee = v.Character:WaitForChild("Head", 5)
                if not t.Adornee then return UnloadCharacter(v) end
                t.Tag.Text = v.Name
                b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
                t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
                local Update
                local UpdateNameTag = function()
                    if not pcall(function()
                            v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                            local maxh = math.floor(v.Character.Humanoid.MaxHealth)
                            local h = math.floor(v.Character.Humanoid.Health)
                        end) then
                        Update:Disconnect()
                    end
                end
                UpdateNameTag()
                Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
            end

            local UnloadCharacter = function(v)
                local vHolder = Holder:FindFirstChild(v.Name)
                if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
                    vHolder:ClearAllChildren()
                end
            end

            local LoadPlayer = function(v)
                local vHolder = Instance.new("Folder", Holder)
                vHolder.Name = v.Name
                v.CharacterAdded:Connect(function() pcall(LoadCharacter, v) end)
                v.CharacterRemoving:Connect(function() pcall(UnloadCharacter, v) end)
                v.Changed:Connect(function(prop)
                    if prop == "TeamColor" then
                        UnloadCharacter(v)
                        wait()
                        LoadCharacter(v)
                    end
                end)
                LoadCharacter(v)
            end

            local UnloadPlayer = function(v)
                UnloadCharacter(v)
                local vHolder = Holder:FindFirstChild(v.Name)
                if vHolder then vHolder:Destroy() end
            end

            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                spawn(function() pcall(LoadPlayer, v) end)
            end

            game:GetService("Players").PlayerAdded:Connect(function(v) pcall(LoadPlayer, v) end)
            game:GetService("Players").PlayerRemoving:Connect(function(v) pcall(UnloadPlayer, v) end)
            game:GetService("Players").LocalPlayer.NameDisplayDistance = 0

            if _G.Reantheajfdfjdgs then return end
            _G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

            local players = game:GetService("Players")
            local plr = players.LocalPlayer

            function esp(target, color)
                if target.Character then
                    if not target.Character:FindFirstChild("GetReal") then
                        local highlight = Instance.new("Highlight")
                        highlight.RobloxLocked = true
                        highlight.Name = "GetReal"
                        highlight.Adornee = target.Character
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = color
                        highlight.Parent = target.Character
                    else
                        target.Character.GetReal.FillColor = color
                    end
                end
            end

            while task.wait() do
                for i, v in pairs(players:GetPlayers()) do
                    if v ~= plr then
                        esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
                    end
                end
            end
        end)
        creditsswq:Toggle("速度","开关",false,function(v)
            if v == true then
                sudu = game:GetService("RunService").Heartbeat:Connect(function()
                    if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and game:GetService("Players").LocalPlayer.Character.Humanoid.Parent then
                        if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                            game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 10)
                        end
                    end
                end)
            elseif not v and sudu then
                sudu:Disconnect()
                sudu = nil
            end
        end)
        creditsswq:Slider('速度设置', '',  1, 1, 1000,false, function(v) Speed = v end)
        creditsswq:Button("无限跳跃",function()
            game:GetService("UserInputService").JumpRequest:connect(function()
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")		
            end)
        end)
        creditsswq:Button("兵工厂1",function() loadstring(game:HttpGet("https://pastefy.app/2YdrWHxV/raw"))() end)
        creditsswq:Button("兵工厂2",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Arsenal/MainFile"))() end)
        creditsswq:Button("兵工厂3",function() loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal"))() end)
        creditsswq:Button("兵工厂4",function() loadstring(game:HttpGet(('https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init'), true))() end)
    end,
    ["驾驶帝国"] = function()
        local HttpService = game:GetService("HttpService")
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local TweenService = game:GetService("TweenService")
        local LocalPlayer = Players.LocalPlayer

        local ConfigFileName = "DrivingEmpire_YeScript.json"

        getgenv().AutoRobbing = false
        getgenv().ATMTweenSpeed = 300
        getgenv().MoneyThreshold = 500000 
        getgenv().ClickDelay = 1 
        getgenv().AntiCopEnabled = true
        getgenv().AntiCopStrategy = "自动交钱"
        getgenv().ThreatDistance = 250
        getgenv().RetryDropOffInterval = 60
        getgenv().NextDropOffCheck = 0
        getgenv().ATMsRobbed = 0 

        getgenv().AutoDelivery = false
        getgenv().PickupWaitTime = 5.2

        local ATMScoutPoints = {
            Vector3.new(189.46, 16.76, 3685.89),
            Vector3.new(-2133.87, 24.69, 2469.92),
            Vector3.new(419.15, 33.86, 1398.23),
            Vector3.new(-2768.18, 33.40, 4288.60),
            Vector3.new(-1452.69, 35.94, 4603.92),
            Vector3.new(-820.83, 29.98, -398.42),
            Vector3.new(-293.80, 37.20, -489.80)
        }

        local function LoadConfig()
            if isfile and isfile(ConfigFileName) then
                pcall(function()
                    local rawData = readfile(ConfigFileName)
                    local data = HttpService:JSONDecode(rawData)
                    if data then
                        getgenv().ATMTweenSpeed = data.ATMTweenSpeed or 300
                        getgenv().MoneyThreshold = data.MoneyThreshold or 500000
                        getgenv().ClickDelay = data.ClickDelay or 1
                        getgenv().AntiCopEnabled = data.AntiCopEnabled
                        if getgenv().AntiCopEnabled == nil then getgenv().AntiCopEnabled = true end
                        getgenv().AntiCopStrategy = data.AntiCopStrategy or "自动交钱"
                        getgenv().ThreatDistance = data.ThreatDistance or 250
                        getgenv().RetryDropOffInterval = data.RetryDropOffInterval or 60
                        getgenv().PickupWaitTime = data.PickupWaitTime or 5.2
                    end
                end)
            end
        end

        local function SaveConfig()
            if writefile then
                local data = {
                    ATMTweenSpeed = getgenv().ATMTweenSpeed,
                    MoneyThreshold = getgenv().MoneyThreshold,
                    ClickDelay = getgenv().ClickDelay,
                    AntiCopEnabled = getgenv().AntiCopEnabled,
                    AntiCopStrategy = getgenv().AntiCopStrategy,
                    ThreatDistance = getgenv().ThreatDistance,
                    RetryDropOffInterval = getgenv().RetryDropOffInterval,
                    PickupWaitTime = getgenv().PickupWaitTime
                }
                pcall(function()
                    writefile(ConfigFileName, HttpService:JSONEncode(data))
                    if getgenv().Ye_Notify then Ye_Notify("配置保存", "设置已成功保存", 3) end
                end)
            end
        end

        LoadConfig()

        local cachedCharParts = {}
        local function toggleNoclip(state)
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChild("Humanoid")

            if state then
                if hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
                end
                if not getgenv().noclipConn and char then
                    table.clear(cachedCharParts)
                    for _, v in ipairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then
                            table.insert(cachedCharParts, v)
                        elseif v:IsA("Weld") and v.Name == "SeatWeld" then
                            v:Destroy()
                        end
                    end
                    getgenv().noclipConn = RunService.Stepped:Connect(function()
                        for i = 1, #cachedCharParts do
                            if cachedCharParts[i] and cachedCharParts[i].Parent then
                                cachedCharParts[i].CanCollide = false
                            end
                        end
                    end)
                end
            else
                if getgenv().noclipConn then 
                    getgenv().noclipConn:Disconnect() 
                    getgenv().noclipConn = nil
                end
                if hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    hum:ChangeState(Enum.HumanoidStateType.Running)
                end
                for i = 1, #cachedCharParts do
                    if cachedCharParts[i] and cachedCharParts[i].Parent then
                        cachedCharParts[i].CanCollide = true
                    end
                end
                table.clear(cachedCharParts)
            end
        end

        local function safeLand()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not char or not hrp then return end
            hrp.Velocity = Vector3.new(0,0,0)
            hrp.RotVelocity = Vector3.new(0,0,0)
            toggleNoclip(false)
            task.wait(0.05)
            hrp.Anchored = false
        end

        local function lockCameraOn(targetPos)
            getgenv().camLerpAlpha = 0
            local camera = workspace.CurrentCamera
            if not camera then return end
            getgenv().startCamCFrame = camera.CFrame
            RunService:BindToRenderStep("YeScriptCamLock", Enum.RenderPriority.Camera.Value + 1, function(dt)
                local cam = workspace.CurrentCamera
                local char = LocalPlayer.Character
                local head = char and char:FindFirstChild("Head")
                if not cam or not head then return end
                local camOffset = head.Position + Vector3.new(0, 2.5, 4) 
                local goalCFrame = CFrame.lookAt(camOffset, targetPos)
                if getgenv().camLerpAlpha < 1 then
                    getgenv().camLerpAlpha = math.min(1, getgenv().camLerpAlpha + dt * 3.5) 
                    cam.CFrame = getgenv().startCamCFrame:Lerp(goalCFrame, getgenv().camLerpAlpha)
                else
                    cam.CFrame = goalCFrame
                end
            end)
        end

        local function unlockCamera()
            pcall(function() RunService:UnbindFromRenderStep("YeScriptCamLock") end)
        end

        local DETab = window:Tab("驾驶帝国", "123097590035361") 
        local RobSec = DETab:section("ATM 自动刷钱", true)
        local DeliverySec = DETab:section("送货员自动刷钱", true)
        local ConfigSaveSec = DETab:section("通用配置管理", true)

        local badATMs = {} 

        local function isPolice(player)
            return player.TeamColor == BrickColor.new("Deep blue")
        end

        local function isAreaCamped(pos, radius)
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and isPolice(p) and p.Character then
                    local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and (hrp.Position - pos).Magnitude <= radius then
                        return true
                    end
                end
            end
            return false
        end

        local function checkNearbyThreats()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return false end
            return isAreaCamped(hrp.Position, getgenv().ThreatDistance)
        end

        local function getCurrentStolenMoney()
            local currentMoney = 0
            pcall(function()
                local char = LocalPlayer.Character
                local head = char and char:FindFirstChild("Head")
                local bb = head and head:FindFirstChild("CharacterBillboard")
                if bb then
                    local maxDetected = 0
                    for _, desc in ipairs(bb:GetDescendants()) do
                        if desc:IsA("TextLabel") and desc.Visible then
                            for numStr in string.gmatch(desc.Text, "%$ ?([%d,]+)") do
                                local n = tonumber((string.gsub(numStr, ",", ""))) or 0
                                if n > maxDetected then maxDetected = n end
                            end
                        end
                    end
                    currentMoney = maxDetected
                end
            end)
            return currentMoney
        end

        local function findNearestATM()
            local target = nil
            local dist = math.huge
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return nil end
            for k, expireTime in pairs(badATMs) do
                if tick() > expireTime then badATMs[k] = nil end
            end
            local spawners = workspace:FindFirstChild("Game") and workspace.Game:FindFirstChild("Jobs") and workspace.Game.Jobs:FindFirstChild("CriminalATMSpawners")
            if spawners then
                for _, spawner in ipairs(spawners:GetChildren()) do
                    local prompt = nil
                    for _, desc in ipairs(spawner:GetDescendants()) do
                        if desc:IsA("ProximityPrompt") then
                            prompt = desc
                            break
                        end
                    end
                    if prompt and prompt.Enabled and not badATMs[prompt] then
                        local partLoc = prompt.Parent
                        if partLoc and partLoc:IsA("Attachment") then partLoc = partLoc.Parent end
                        local wall = nil
                        for _, desc in ipairs(spawner:GetDescendants()) do
                            if desc.Name == "Wall" and desc:IsA("BasePart") then
                                wall = desc
                                break
                            end
                        end
                        local posPart = wall or partLoc
                        if posPart and posPart:IsA("BasePart") then
                            local d = (hrp.Position - posPart.Position).Magnitude
                            if d < dist then 
                                dist = d
                                target = {p = prompt, posPart = posPart, camPart = partLoc, distance = d} 
                            end
                        end
                    end
                end
            end
            return target
        end

        local function tweenToPos(targetVec, speedOverride, scanForATMs)
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return false end
            local dist = (hrp.Position - targetVec).Magnitude
            local speed = speedOverride or getgenv().ATMTweenSpeed
            local t_time = math.max(0.05, dist / speed)
            local faceCFrame = CFrame.lookAt(hrp.Position, Vector3.new(targetVec.X, hrp.Position.Y, targetVec.Z))
            hrp.CFrame = faceCFrame
            local goalCFrame = CFrame.new(targetVec) * (faceCFrame - faceCFrame.Position)
            local tween = TweenService:Create(hrp, TweenInfo.new(t_time, Enum.EasingStyle.Linear), {CFrame = goalCFrame})
            tween:Play()
            if not scanForATMs then
                task.wait(t_time + 0.1)
                return false
            end   
            local elapsed = 0
            local checkInterval = 0.5
            while elapsed < t_time do
                if not getgenv().AutoRobbing then tween:Cancel(); return false end
                if getgenv().AntiCopEnabled and checkNearbyThreats() then
                    tween:Cancel()
                    return false
                end
                local nearestATM = findNearestATM()
                if nearestATM and nearestATM.distance < 2000 then 
                    tween:Cancel()
                    return true 
                end
                task.wait(checkInterval)
                elapsed = elapsed + checkInterval
            end
            return false
        end

        local function patrolRandom()
            unlockCamera() 
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            toggleNoclip(true)
            hrp.Anchored = true
            local scoutPos = ATMScoutPoints[math.random(1, #ATMScoutPoints)]
            local interruptedByATM = tweenToPos(Vector3.new(scoutPos.X, scoutPos.Y + 5, scoutPos.Z), nil, true)
            if not interruptedByATM then
                safeLand() 
                task.wait(1.5)
            end
        end

        local function doDropOff()
            unlockCamera() 
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return false end
            toggleNoclip(true)
            hrp.Anchored = true
            local jobsFolder = workspace:WaitForChild("Game", 5) and workspace.Game:WaitForChild("Jobs", 5)
            local dropOffSpawners = jobsFolder and jobsFolder:WaitForChild("CriminalDropOffSpawners", 5)
            local dropOffSpawner = dropOffSpawners and dropOffSpawners:WaitForChild("CriminalDropOffSpawnerPermanent", 5)
            if dropOffSpawner then
                local targetPos = dropOffSpawner:GetPivot().Position
                if getgenv().AntiCopEnabled and isAreaCamped(targetPos, getgenv().ThreatDistance) then
                    return false
                end
                local safeY = targetPos.Y + 3 
                local outPos = Vector3.new(targetPos.X + 25, safeY, targetPos.Z + 25)
                local inPos = Vector3.new(targetPos.X, safeY, targetPos.Z)
                hrp.CFrame = CFrame.new(outPos)
                task.wait(0.1)
                safeLand() 
                task.wait(0.1)
                tweenToPos(inPos, 150, false)
                local hum = char:FindFirstChild("Humanoid")
                local timeout = 0
                while getCurrentStolenMoney() > 0 and timeout < 8 and getgenv().AutoRobbing do
                    tweenToPos(outPos, 200, false)
                    task.wait(0.1)
                    if hum then hum.Jump = true end
                    tweenToPos(inPos, 200, false)
                    task.wait(0.5)
                    timeout = timeout + 1
                end
                return true
            else
                safeLand()
                return false
            end
        end

        local function handleThreat()
            if not getgenv().AntiCopEnabled then return false end
            if not checkNearbyThreats() then return false end
            unlockCamera()
            if getgenv().AntiCopStrategy == "自动交钱" and (getCurrentStolenMoney() > 0 or getgenv().ATMsRobbed > 0) then
                if tick() >= getgenv().NextDropOffCheck then
                    local success = doDropOff()
                    if not success then
                        getgenv().NextDropOffCheck = tick() + getgenv().RetryDropOffInterval
                        patrolRandom()
                    else
                        getgenv().ATMsRobbed = 0
                        getgenv().NextDropOffCheck = tick() + 15
                    end
                else
                    patrolRandom()
                end
            else
                patrolRandom()
            end
            return true
        end

        local function startAutoRob()
            getgenv().ATMsRobbed = 0
            badATMs = {}    
            task.spawn(function()
                while getgenv().AutoRobbing do
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChild("Humanoid")
                    if not char or not hrp or not hum or hum.Health <= 0 or hrp.Position.Y < -500 then
                        task.wait(2)
                        continue
                    end
                    if getgenv().AntiCopEnabled and handleThreat() then
                        task.wait(0.5)
                        continue
                    end
                    local currentMoney = getCurrentStolenMoney()
                    if (currentMoney >= getgenv().MoneyThreshold or getgenv().ATMsRobbed >= 15) and tick() >= getgenv().NextDropOffCheck then
                        local success = doDropOff()
                        if success then
                            getgenv().ATMsRobbed = 0 
                            getgenv().NextDropOffCheck = tick() + 15 
                        else
                            getgenv().NextDropOffCheck = tick() + getgenv().RetryDropOffInterval
                        end
                        task.wait(1)
                        continue 
                    end
                    local target = findNearestATM()
                    if target then
                        target.p.RequiresLineOfSight = false
                        target.p.MaxActivationDistance = 50
                        target.p.HoldDuration = 3
                        toggleNoclip(true)
                        hrp.Anchored = true
                        local safeY = target.posPart.Position.Y + (target.posPart.Size.Y / 2) + 3 
                        tweenToPos(Vector3.new(target.posPart.Position.X, safeY, target.posPart.Position.Z), nil, false)
                        safeLand() 
                        task.wait(0.1) 
                        local camPos = target.posPart.Position
                        if target.camPart then
                            if target.camPart:IsA("Attachment") then
                                camPos = target.camPart.WorldPosition
                            elseif target.camPart:IsA("Model") then
                                camPos = target.camPart:GetPivot().Position
                            elseif target.camPart:IsA("BasePart") then
                                camPos = target.camPart.Position
                            end
                        end
                        lockCameraOn(camPos) 
                        task.wait(getgenv().ClickDelay) 
                        local maxAttempts = 2
                        local robSuccess = false
                        local interrupted = false
                        for attempt = 1, maxAttempts do
                            if not getgenv().AutoRobbing or not target.p.Enabled then break end
                            target.p:InputHoldBegin()
                            local waitTime = 0
                            while getgenv().AutoRobbing and target.p.Enabled and waitTime < 3.5 do
                                if getgenv().AntiCopEnabled and checkNearbyThreats() then 
                                    interrupted = true
                                    break 
                                end
                                task.wait(0.1)
                                waitTime = waitTime + 0.1
                            end
                            target.p:InputHoldEnd()
                            if interrupted then break end
                            task.wait(0.5)
                            if not target.p.Enabled or not target.p.Parent then
                                robSuccess = true
                                getgenv().ATMsRobbed = getgenv().ATMsRobbed + 1 
                                break 
                            else
                                if attempt < maxAttempts then task.wait(0.5) end
                            end
                        end
                        unlockCamera() 
                        if interrupted then
                            handleThreat()
                            continue
                        end               
                        if not robSuccess and getgenv().AutoRobbing then 
                            badATMs[target.p] = tick() + 60
                            patrolRandom() 
                        end
                    else
                        patrolRandom()
                    end
                end
                unlockCamera()
                safeLand() 
            end)
        end

        RobSec:Slider('平移速度', 'RobSpeedSlider', getgenv().ATMTweenSpeed, 10, 500, false, function(Value)
            getgenv().ATMTweenSpeed = Value
        end)

        RobSec:Slider('到达后停顿(秒)', 'ClickDelaySlider', getgenv().ClickDelay, 0, 5, false, function(Value)
            getgenv().ClickDelay = Value
        end)

        RobSec:Textbox('自动交钱阈值', 'DropOffLimitInput', tostring(getgenv().MoneyThreshold), function(Value)
            getgenv().MoneyThreshold = tonumber(Value) or 500000
        end)

        RobSec:Toggle("开启防抓检测", "AntiCopToggle", getgenv().AntiCopEnabled, function(state)
            getgenv().AntiCopEnabled = state
        end)

        RobSec:Dropdown("防抓策略", "AntiCopDrop", {"自动交钱", "自动逃跑"}, getgenv().AntiCopStrategy, function(Value)
            getgenv().AntiCopStrategy = Value
        end)

        RobSec:Label("如果有警察蹲守交钱点，会自动悬空")
        RobSec:Slider('防抓检测范围(Studs)', 'AntiCopDistSlider', getgenv().ThreatDistance, 50, 1000, false, function(Value)
            getgenv().ThreatDistance = Value
        end)

        RobSec:Slider('提现点冷却(秒)', 'RetryCooldownSlider', getgenv().RetryDropOffInterval, 10, 300, false, function(Value)
            getgenv().RetryDropOffInterval = Value
        end)

        RobSec:Toggle("开启自动 ATM 刷钱", "auto_atm_rob", false, function(state)
            getgenv().AutoRobbing = state
            if state then
                pcall(function() game:GetService("ReplicatedStorage").Remotes.RequestStartJobSession:FireServer("Criminal", "jobPad") end)
                startAutoRob()
                if getgenv().Ye_Notify then Ye_Notify("叶脚本", "已启动", 3) end
            else
                unlockCamera()
                safeLand()
                if getgenv().Ye_Notify then Ye_Notify("叶脚本", "已停止", 3) end
            end
        end)

        RobSec:Button("手动恢复正常状态", function()
            unlockCamera()
            safeLand()
        end)

        local function resetJobSession()
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.RequestStartJobSession:FireServer("Criminal", "jobPad")
            end)
            task.wait(1.5)
            pcall(function()
                local args = {
                    [1] = "Delivery",
                    [2] = "jobPad"
                }
                game:GetService("ReplicatedStorage").Remotes.RequestStartJobSession:FireServer(unpack(args))
            end)
            task.wait(1.5)
        end

        local function getActivePointInstance()
            local effectsFolder = workspace:FindFirstChild("DeliveryLocationEffects")
            if not effectsFolder then return nil end
            for _, child in ipairs(effectsFolder:GetChildren()) do
                if child:IsA("BasePart") then
                    return child
                elseif child:IsA("Model") and child.PrimaryPart then
                    return child
                end
            end
            return nil
        end

        local function forceInstantTeleport(targetPos)
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            hrp.Velocity = Vector3.zero
            hrp.Anchored = true
            hrp.CFrame = CFrame.new(targetPos)
            pcall(function()
                LocalPlayer:RequestStreamAroundAsync(targetPos)
            end)
            local lockTime = 1.5 
            local startTime = tick()
            local lockConn
            lockConn = RunService.Heartbeat:Connect(function()
                if hrp then
                    hrp.Velocity = Vector3.zero
                    hrp.CFrame = CFrame.new(targetPos)
                end
            end)
            task.wait(lockTime)
            if lockConn then 
                lockConn:Disconnect() 
                lockConn = nil 
            end
            if hrp then 
                hrp.Anchored = false 
            end
        end

        local function startAutoDelivery()
            task.spawn(function()
                local isPickupState = true 
                local waitTimeout = 0 
                while getgenv().AutoDelivery do
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if not hrp then task.wait(1); continue end
                    local currentPoint = getActivePointInstance()
                    if currentPoint then
                        waitTimeout = 0 
                        local targetPos = currentPoint:IsA("BasePart") and currentPoint.Position or currentPoint.PrimaryPart.Position
                        local radius = 15
                        if currentPoint:IsA("BasePart") then
                            radius = math.max(currentPoint.Size.X, currentPoint.Size.Z) / 2
                        elseif currentPoint:IsA("Model") and currentPoint.PrimaryPart then
                            radius = math.max(currentPoint.PrimaryPart.Size.X, currentPoint.PrimaryPart.Size.Z) / 2
                        end
                        local centerPos = targetPos + Vector3.new(0, 4, 0) 
                        toggleNoclip(true)
                        local angle = math.rad(math.random(0, 360))
                        local direction = Vector3.new(math.cos(angle), 0, math.sin(angle))
                        if isPickupState then
                            local edgePos = centerPos + direction * (radius - 1)
                            forceInstantTeleport(edgePos)
                            local startTime = tick()
                            while getActivePointInstance() == currentPoint and tick() - startTime < (getgenv().PickupWaitTime + 2) and getgenv().AutoDelivery do
                                local jitterAngle = angle + math.rad(math.random(-5, 5))
                                local jitterDir = Vector3.new(math.cos(jitterAngle), 0, math.sin(jitterAngle))
                                hrp.Velocity = Vector3.zero
                                hrp.CFrame = CFrame.new(centerPos + jitterDir * (radius - 1))
                                task.wait(0.1)
                            end
                            if getActivePointInstance() ~= currentPoint then
                                isPickupState = false 
                            else
                                safeLand()
                            end
                        else
                            local outsidePos = centerPos + direction * (radius + 25) 
                            forceInstantTeleport(outsidePos)
                            task.wait(0.3) 
                            local timeout = 0
                            local maxRetries = 60 
                            while getActivePointInstance() == currentPoint and timeout < maxRetries and getgenv().AutoDelivery do
                                local jitterAngle = angle + math.rad(math.random(-5, 5))
                                local jitterDir = Vector3.new(math.cos(jitterAngle), 0, math.sin(jitterAngle))
                                hrp.Velocity = Vector3.zero
                                hrp.CFrame = CFrame.new(centerPos + jitterDir * (radius - 1))
                                task.wait(0.1)
                                timeout = timeout + 1
                            end
                            if getActivePointInstance() ~= currentPoint then
                                isPickupState = true 
                            else
                                safeLand()
                            end
                        end
                    else
                        waitTimeout = waitTimeout + 1
                        if waitTimeout > 16 then
                            if getgenv().Ye_Notify then Ye_Notify("叶脚本", "重置...", 3) end
                            resetJobSession()
                            isPickupState = true 
                            waitTimeout = 0
                            task.wait(1)
                        else
                            task.wait(0.5)
                        end
                    end
                end
                safeLand()
            end)
        end

        DeliverySec:Slider('拿箱等待(秒)', 'PickupWaitSlider', getgenv().PickupWaitTime, 1, 8, true, function(Value)
            getgenv().PickupWaitTime = Value
        end)

        DeliverySec:Toggle("开启自动送货", "auto_delivery", false, function(state)
            getgenv().AutoDelivery = state
            if state then
                pcall(function()
                    local args = {
                        [1] = "Delivery",
                        [2] = "jobPad"
                    }
                    game:GetService("ReplicatedStorage").Remotes.RequestStartJobSession:FireServer(unpack(args))
                end)
                startAutoDelivery()
            else
                safeLand()
            end
        end)

        DeliverySec:Button("手动恢复正常状态", function()
            safeLand()
        end)

        ConfigSaveSec:Button("保存当前所有配置", function()
            SaveConfig()
        end)
    end,

    ["铲雪模拟器"] = function()
        local creds = window:Tab("铲雪模拟器",'123097590035361')
        local creditsve = creds:section("铲雪模拟器", true) 

        creditsve:Toggle("自动收集雪","", false, function(Value)
            toggle = Value
            while toggle do wait()
                local args = {
                    [1] = workspace:WaitForChild("HitParts"):WaitForChild("Snow1"),
                    [2] = "Snow1",
                    [3] = "MagicWand"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("e8eGb8RgRXFcug8q"):FireServer(unpack(args))
            end
        end)

        creditsve:Toggle("自动出售雪（要传送到指定地方）",   "",false, function(Value)
            toggle = Value
            while toggle do wait()
                local args = {
                    [1] = "SellSnow",
                    [2] = "Frosty"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            end
        end)

        local creditsve2 = creds:section("传送功能", true)  

        creditsve2:Button("传送出售雪的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.4659423828125, 15.846257209777832, -66.55204010009766)
        end)

        creditsve2:Button("传送买车的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90.10160064697266, 16.051794052124023, -141.703125)
        end)

        creditsve2:Button("传送买工具的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.7429962158203, 16.39700698852539, -12.935890197753906)
        end)

        creditsve2:Button("传送买背包的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(348.6633605957031, 17.03822898864746, -16.793842315673828)
        end)

        creditsve2:Button("传送买假日礼物的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(154.57424926757812, 16.215335845947266, 147.10423278808594)
        end)

        creditsve2:Button("传送买宠物的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.49563598632812, 17.887277603149414, 278.3686218261719)
        end)

        creditsve2:Button("传送超大铲雪的地方", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-391.4309997558594, 15.84949016571045, 150.15187072753906)
        end)  
    end,

    ["彩虹朋友"] = function()
        local creds = window:Tab("彩虹朋友",'123097590035361')
        local creditscy = creds:section("彩虹朋友", true)

        creditscy:Button("彩虹朋友1",function()
            loadstring(game:HttpGet("https://pastefy.app/XoNv04vR/raw"))()
        end)

        creditscy:Button("自动收集", function()
            attempts = 0
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("TouchTrigger") and attempts < 10 then
                    attempts = attempts + 1
                    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.TouchTrigger,0)
                end
            end
        end)

        creditscy:Button("自动放置", function()
            game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true)
            firetouchinterest(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true), game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            task.wait()
            firetouchinterest(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true), game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        end)

        creditscy:Toggle("怪物透视","",false, function(bool)
            if bool then
                local runService = game:GetService("RunService")
                event = runService.RenderStepped:Connect(function()
                    for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                        if not v:FindFirstChild("Lol") then
                            local esp = Instance.new("Highlight", v)
                            esp.Name = "Lol"
                            esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            esp.FillColor = Color3.new(0, 0, 255)
                        end
                    end
                end)
            end
            if not bool then
                event:Disconnect()
                for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                    if v:FindFirstChild("Lol") then v:FindFirstChild("Lol"):Destroy() end
                end
            end
        end)

        creditscy:Toggle("物品透视","",false, function(bool)
            if bool then
                local runService = game:GetService("RunService")
                event = runService.RenderStepped:Connect(function()
                    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:FindFirstChild("TouchTrigger") then
                            if not v:FindFirstChild("Lol") then
                                local esp = Instance.new("Highlight", v)
                                esp.Name = "Lol"
                                esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                esp.FillColor = Color3.new(0, 255, 0)
                            end
                        end
                    end
                end)
            end
            if not bool then
                event:Disconnect()
                for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:FindFirstChild("TouchTrigger") and v:FindFirstChild("Lol") then
                        v:FindFirstChild("Lol"):Destroy()
                    end
                end
            end
        end)
    end,

    ["汽车经销商大亨"] = function()
        local creds = window:Tab("汽车经销商大亨",'123097590035361')
        local creditsha = creds:section("汽车经销商大亨", true)

        creditsha:Toggle("自动驾驶","",false, function(state)
            getfenv().auto = (state and true or false)
            while getfenv().auto do
                local chr = game.Players.LocalPlayer.Character
                local car = chr.Humanoid.SeatPart.Parent.Parent
                dist = (chr.HumanoidRootPart.Position-car.Engine.CFrame.LookVector*1000).Magnitude
                local TweenService = game:GetService("TweenService")
                local TweenInfoToUse = TweenInfo.new(dist/1000, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true, 0)

                local TweenValue = Instance.new("CFrameValue")
                TweenValue.Value = car:GetPrimaryPartCFrame()

                TweenValue.Changed:Connect(function()
                    car:SetPrimaryPartCFrame(TweenValue.Value)
                end)
                local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=car.Engine.CFrame+car.Engine.CFrame.LookVector*1000})
                OnTween:Play()
                OnTween.Completed:Wait()
            end
        end)

        creditsha:Toggle("自动收集零件","",false, function(state)
            getfenv().test = (state and true or false)
            while getfenv().test do
                wait()
                local function update()
                    local count = game:GetService("Players").LocalPlayer.PlayerGui.Menu.Event.Frame.PrizeFrame.ProgressBar.Count
                    local text = count.Text:split("/")
                    local num = tonumber(text[1])
                    return num
                end
                for i,v in pairs(workspace:GetChildren()) do
                    if v.ClassName == "Model" and not v:FindFirstChild("Part") and v:FindFirstChild("Owned") and update() ~= 12 and getfenv().test == true then
                        repeat wait()
                            game.Players.LocalPlayer.Character:PivotTo(v.WorldPivot)
                        until v:FindFirstChild("Part") or getfenv().test == false
                    end
                end
                for i,v in pairs(workspace:GetChildren()) do
                    if v.ClassName == "Model" and v:FindFirstChild("Part") and v:FindFirstChild("Owned") and update() ~= 12 and getfenv().test == true then
                        game.Players.LocalPlayer.Character:PivotTo(v.WorldPivot)
                        local ohye = update()
                        local test = nil
                        for a,b in pairs(v:GetChildren()) do
                            if b.ClassName == "MeshPart" and b.Transparency < 0.5 then
                                test = b
                            end
                        end
                        if test~= nil then
                            repeat task.wait()
                                game.Players.LocalPlayer.Character:PivotTo(v.WorldPivot)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game)
                            until test.Transparency > 0.5 or getfenv().test == false
                            repeat task.wait()
                                game:GetService("ReplicatedStorage").Remotes.EventController.PerformAction:FireServer("AssembleCarPart", {})
                            until ohye ~= update()
                        end
                    end
                end
            end
        end)

        creditsha:Toggle("自动送货","",false, function(state)
            getfenv().deliver = (state and true or false)
            spawn(function()
                while getfenv().deliver do
                    task.wait()
                    pcall(function()
                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                            wait(5)
                            getfenv().spawned = false
                        end
                    end)
                end
            end)

            while getfenv().deliver do
                wait()
                pcall(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                        task.wait(0.1)
                        for i,v in pairs(workspace.ActionTasksGames.Jobs:GetDescendants()) do
                            if v.Name == "DeliveryPart" and v.Transparency ~= 1 then
                                getfenv().spawned = false
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame)
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.new(-30,20,-10))
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.Angles(0,math.rad(90),0))
                                for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:GetChildren()) do
                                    if v.ClassName == "Model" and v:GetAttribute("StockTurbo") then
                                        for a,b in pairs(workspace.ActionTasksGames.Jobs:GetChildren()) do
                                            if b.ClassName == "Model" and b:GetAttribute("JobId") then
                                                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["Action"] = "TryToCompleteJob",["JobId"] = b:GetAttribute("JobId")})
                                                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),["Action"] = "CollectReward"})
                                            end
                                        end
                                    end 
                                end
                            end
                        end
                    elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false and getfenv().spawned ~= true then
                        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(_G.remotetable)
                        getfenv().spawned = true
                        wait(0.1)
                    end
                end)
            end
        end)

        creditsha:Toggle("自动售卖汽车","",false, function(state)
            getfenv().Customer = (state and true or false)
            while getfenv().Customer do
                task.wait()
                pcall(function()
                    local function plot()
                        for i,v in pairs(workspace.Tycoons:GetDescendants()) do
                            if v.Name == "Owner" and v.ClassName == "StringValue" and string.find(v.Parent.Name,"Plot") and v.Value == game.Players.LocalPlayer.Name or v.Name == "Owner" and v.ClassName == "StringValue" and string.find(v.Parent.Name,"Slot") and v.Value == game.Players.LocalPlayer.Name then
                                tycoon = v.Parent
                            end
                        end
                        return tycoon
                    end
                    _G.rat = nil
                    local customer
                    for i,v in pairs(plot().Dealership:GetChildren()) do
                        if v.ClassName == "Model" and v.PrimaryPart ~= nil and v.PrimaryPart.Name == "HumanoidRootPart" then
                            customer = v
                        end
                    end
                    local text = customer:GetAttribute("OrderSpecBudget"):split(";")
                    local num = tonumber(text[2])
                    local plr = game.Players.LocalPlayer
                    local guis = plr.PlayerGui
                    local menu = guis.Menu
                    local req = guis.Dialogue.CarSpec.Frame.Frame
                    for i,v in pairs(menu.Shop.Cars.Frame.Frame:GetDescendants()) do
                        if v.Name == "PriceValue" and tonumber(string.gsub(v.Value,",",""):split("$")[2]) > tonumber(text[1]) and tonumber(string.gsub(v.Value,",",""):split("$")[2]) < tonumber(text[2]) then
                            local ok =tonumber(string.gsub(v.Value,",",""):split("$")[2])
                            if ok < num then
                                num = ok
                                _G.rat = v
                            end
                        end
                    end
                    textn = 1
                    repeat wait()
                        text = _G.rat.Parent.Name:split("")[textn]
                        textn=textn+1
                    until tonumber(text) == nil
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({["Action"] = "AcceptOrder",["OrderId"] = customer:GetAttribute("OrderId")})
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({["Specs"] = {["Springs"] = customer:GetAttribute("OrderSpecSprings"),["Color"] = customer:GetAttribute("OrderSpecColor"),["Rims"] = customer:GetAttribute("OrderSpecRims"),["Car"] = text.._G.rat.Parent.Name:split(tostring(_G.rat.Parent.Name:split("")[textn-1]))[2],["RimColor"] = customer:GetAttribute("OrderSpecRimColor")},["Action"] = "CompleteOrder",["OrderId"] = customer:GetAttribute("OrderId")})
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({["Action"] = "CollectReward",["OrderId"] = customer:GetAttribute("OrderId")})
                    repeat wait()
                    until customer.Parent == nil or getfenv().Customer == false
                end)
            end
        end)

        creditsha:Toggle("自动升级","",false, function(state)
            getfenv().buyer = (state and true or false )
            while getfenv().buyer do
                task.wait()
                local function plot()
                    for i,v in pairs(workspace.Tycoons:GetDescendants()) do
                        if v.Name == "Owner" and v.ClassName == "StringValue" and v.Value == game.Players.LocalPlayer.Name then
                            tycoon = v.Parent
                        end
                    end
                    return tycoon
                end
                pcall(function()
                    for i,v in pairs(plot().Dealership.Purchases:GetChildren()) do 
                        if getfenv().buyer == true and v.TycoonButton.Button.Transparency == 0 then
                            game:GetService("ReplicatedStorage").Remotes.Build:FireServer("BuyItem", v.Name)
                            wait(0.3)
                        end 
                    end   
                end)
            end
        end)

        creditsha:Toggle("删除弹出窗口","",false, function(state)
            getfenv().annoy = (state and true or false )
            if getfenv().annoy == true then
                getfenv().fun =game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function(ok)
                    if ok.Name == "Popup2" then
                        ok:Destroy()
                    end
                end)
            elseif getfenv().annoy == false then
                getfenv().fun:Disconnect()
            end
        end)

        creditsha:Toggle("自动送货2","",false, function(state)
            getfenv().deliver2 = (state and true or false)
            game.Players.LocalPlayer.Character.Head.Anchored = false
            spawn(function()
                while getfenv().deliver2 do
                    task.wait()
                    pcall(function()
                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                            wait(5)
                            getfenv().spawned = false
                        end
                    end)
                end
            end)
            local function gettruck()
                local truck = nil
                for i,v in pairs(workspace.Cars:GetChildren()) do
                    if v.Name == "DeliveryTruck" and v:GetAttribute("JobId") == _G.remotetable.Jobs[1].Id then
                        truck = v
                    end
                end
                return truck or "no truck found"
            end
            spawn(function()
                timeout = 0
                while getfenv().deliver2 do
                    task.wait()
                    if gettruck() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart== nil and timeout < 10 then
                        timeout = timeout + 1
                        wait(1)
                    elseif gettruck() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart== nil and timeout >= 10 then
                        timeout = 0
                        gettruck():Destroy()
                        wait(1)
                    elseif gettruck() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart~= nil  then
                        timeout = 0
                        wait(1)
                    end
                end
            end)
            spawn(function()
                while getfenv().deliver2 do
                    task.wait()
                    if getfenv().checkif ~= nil then
                        wait(40)
                        getfenv().checkif = nil
                    end
                end
            end)
            getfenv().checkif = nil
            while getfenv().deliver2 do
                wait()
                if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                    task.wait(0.1)
                    for i,v in pairs(workspace.ActionTasksGames.Jobs:GetDescendants()) do
                        if v.Name == "DeliveryPart" and v.Transparency ~= 1 and game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil then
                            game.Players.LocalPlayer.Character.Head.Anchored = false
                            tppart = v
                            getfenv().spawned = false
                            game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame)
                            game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.new(-30,30,-10))
                            game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.Angles(0,math.rad(90),0))
                            for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:GetChildren()) do
                                if v.ClassName == "Model" and v:GetAttribute("StockTurbo") then
                                    repeat wait(0.1)
                                        pcall(function()
                                            game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame)
                                            game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame*CFrame.new(-30,30,-10))
                                            game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame*CFrame.Angles(0,math.rad(90),0))
                                        end)
                                        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["Action"] = "TryToCompleteJob",["JobId"] = v.Name})
                                    until game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Enabled == true or game.Players.LocalPlayer.Character.Humanoid.SeatPart == nil or getfenv().deliver2 == false
                                    game.Players.LocalPlayer.Character.Head.Anchored = false
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                                    local function getstars()
                                        local stars = 0
                                        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Frame.Stars:GetChildren()) do
                                            if string.find(v.Name,"Star") and v.ImageColor3 == Color3.fromRGB(255, 189, 34) then
                                                stars = stars+1
                                            end
                                        end
                                        return stars
                                    end
                                    local function isused(hi)
                                        yeno = nil
                                        for i,v in pairs(_G.usedids) do
                                            if v == hi then
                                                yeno = "Vehicle was already used"
                                            end
                                        end
                                        return yeno
                                    end
                                    if tonumber(getstars()) < getfenv().stars and game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Enabled == true and getfenv().checkif == nil then
                                        whate = nil
                                        if type(_G.usedids) ~= "table" then
                                            _G.usedids = {}
                                        end
                                        for i,v in pairs(getgc(true)) do
                                            if type(v) == "table" and rawget(v,"MoneyReward") ~= nil and whate == nil and getfenv().checkif == nil then
                                                task.wait()
                                                if tonumber(v.MoneyReward) > getfenv().smaller and tonumber(v.MoneyReward) < getfenv().bigger and whate == nil and getfenv().checkif == nil and isused(v.Id) ~= "Vehicle was already used" then
                                                    task.wait()
                                                    table.insert(_G.usedids,v.Id)
                                                    whate = v
                                                    _G.remotetable = {["Truck"] = "DeliveryTruck",["Action"] = "StartDeliveryJob",["Jobs"] = {[1] = {["Id"] = whate.Id,["Image"] = "http://www.roblox.com/asset/?id=7962599980",["CFrame"] = CFrame.new(-1476.16199, 601.700134, 3489.31299, -1, 0, 0, 0, 1, 0, 0, 0, -1),["JobData"] = whate}}}
                                                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                                                        wait(0.5)
                                                        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),["Action"] = "CollectReward"})
                                                        wait(0.5)
                                                        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars").Enabled = false
                                                    end
                                                    getfenv().checkif = true
                                                end
                                            end
                                        end
                                    end
                                    wait()
                                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                                        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars").Enabled = false
                                        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),["Action"] = "CollectReward"})
                                    end                  
                                end
                            end 
                        end
                    end
                elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false and gettruck() == "no truck found" then
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                        pcall(function()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  tppart.CFrame
                            game.Players.LocalPlayer.Character.Head.Anchored = true
                        end)
                        wait(1)
                    end
                    whate = nil
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(_G.remotetable)
                    local unstck = 0
                    repeat wait()
                        unstck=unstck+1
                    until gettruck() ~= "no truck found" or getfenv().deliver2 == false or unstck > 100
                    game.Players.LocalPlayer.Character.Head.Anchored = false
                end
            end
        end)

        creditsha:Toggle("自动圣诞节漂移","",false, function(state)
            _G.oh = (state and true or false)
            for i,v in pairs(workspace:GetDescendants()) do
                if v.Name == "DriftAsphalt" then
                    v.Velocity = v.CFrame.LookVector*0
                end
            end
            while _G.oh do
                task.wait()
                if game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true then
                    if _G.velo ~= true then
                        for i,v in pairs(workspace:GetDescendants()) do
                            if v.Name == "DriftAsphalt" then
                                v.Velocity = v.CFrame.LookVector*1000
                            end
                        end
                        _G.velo = true
                    end
                    if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(-2055.981689453125, 654.3567504882812, 7831.22900390625)) > 20 then
                        game:GetService("Players").LocalPlayer.PlayerGui.Animation.DriftPoints.Position = UDim2.new(0.5, 0,1, -130)
                        local chr = game.Players.LocalPlayer.Character
                        local car = chr.Humanoid.SeatPart.Parent.Parent
                        car:PivotTo(CFrame.new(-2055.981689453125, 654.3567504882812, 7831.22900390625))
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == false then
                    local chr = game.Players.LocalPlayer.Character
                    local car = chr.Humanoid.SeatPart.Parent.Parent
                    car:PivotTo(CFrame.new(-2068.947021484375, 656.533447265625, 7767.55810546875))
                    wait(0.1)
                    workspace.Races.RaceHandler.StartLobby:FireServer("Xmas")
                    wait(1)
                end
            end
        end)
    end,

    ["刷钱整合"] = function()
        local creds = window:Tab("刷钱整合",'123097590035361')
        local creditseo = creds:section("整合", true)
        local currentTruckTask = nil

        creditseo:Toggle("卡车刷钱", "", false, function(state)
            getfenv().auto = state

            if not state then
                if currentTruckTask then
                    currentTruckTask.cancelled = true
                    currentTruckTask = nil
                end
                return
            end

            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local plr = Players.LocalPlayer

            local function waitForCar(carName, timeout)
                local folder = workspace:WaitForChild("SpawnedCars")
                local start = os.clock()
                while os.clock() - start < timeout do
                    local car = folder:FindFirstChild(carName)
                    if car then return car end
                    task.wait(0.25)
                end
                return nil
            end

            local function getSeat(car)
                for _, v in ipairs({"DriveSeat","DriverSeat","Seat"}) do
                    local s = car:FindFirstChild(v)
                    if s then return s end
                end
            end

            local lastSwitch = 0
            local isResetting = false

            currentTruckTask = getgenv().Ye_Engine:AddTask({
                name = "YE_TruckFarm_Core",
                priority = "Normal",
                interval = 0.4,      
                repeating = true,    
                action = function(taskObj)
                    if not getfenv().auto then 
                        taskObj.cancelled = true 
                        return 
                    end

                    local chr = plr.Character
                    if not chr then return end
                    local hum = chr:FindFirstChild("Humanoid")
                    if not hum then return end
                    local gui = plr:FindFirstChild("PlayerGui")
                    if not gui then return end

                    local pkg = gui:FindFirstChild("PackagesUI")
                    local billboard = pkg and pkg:FindFirstChildOfClass("BillboardGui")

                    if billboard and hum.SeatPart then
                        local seat = hum.SeatPart
                        local car = seat.Parent

                        pcall(function()
                            car.PrimaryPart = car.Body:FindFirstChild("#Weight") or car.Body["#Weight"]
                            car:PivotTo(billboard.Adornee.CFrame * CFrame.new(0, 10, -20))
                        end)

                        local truckUI = gui:FindFirstChild("TruckingJobUI")
                        if truckUI and truckUI:FindFirstChild("interaction") and truckUI.interaction.Visible then
                            local text = truckUI.interaction.title.Text

                            task.spawn(function()
                                pcall(function()
                                    if string.find(text, "Load") and not string.find(text, "Unload") then
                                        ReplicatedStorage.Packages.Shared.Network.RemoteFunctions.ClientCoalRequester:InvokeServer("LoadCoal")
                                    elseif string.find(text, "Unload") then
                                        ReplicatedStorage.Packages.Shared.Network.RemoteFunctions.ClientCoalRequester:InvokeServer("UnloadCoal")
                                    end
                                end)
                            end)
                        end
                    else
                        if not isResetting and (os.clock() - lastSwitch > 6) then
                            isResetting = true
                            lastSwitch = os.clock()

                            task.spawn(function()
                                pcall(function()
                                    if hum.Sit then
                                        hum.Sit = false
                                        task.wait(0.4)
                                    end
                                    local brokenAChassis = gui:FindFirstChild("A-Chassis Interface")
                                    if brokenAChassis then
                                        brokenAChassis:Destroy() 
                                    end
                                end)

                                pcall(function()
                                    ReplicatedStorage.Feature_RemoteEvent.TeamSwitch:FireServer("Civilian")
                                    task.wait(0.4)
                                    ReplicatedStorage.Feature_RemoteEvent.TeamSwitch:FireServer("Trucker")
                                end)

                                task.wait(0.6)

                                pcall(function()
                                    ReplicatedStorage.Packages.Shared.Network.RemoteFunctions.ClientRequestCoalTrucks:InvokeServer()
                                end)

                                task.wait(0.4)

                                pcall(function()
                                    ReplicatedStorage.Packages.Shared.Network.RemoteFunctions.ClientRequestCoalJob:InvokeServer(workspace.TruckingJob.Coal.routeA, "2012 Shacman M3000 4X2")
                                end)

                                local carName = plr.Name .. "'s Car"
                                local car = waitForCar(carName, 7)

                                if car then
                                    local seat = getSeat(car)
                                    if seat then
                                        local root = chr:FindFirstChild("HumanoidRootPart")
                                        if root then
                                            root.CFrame = seat.CFrame + Vector3.new(0, 0.5, 0) 
                                            task.wait(0.15)
                                            seat:Sit(hum)
                                        end
                                    end
                                end
                                isResetting = false 
                            end)
                        end
                    end
                end
            })
        end)

        creditseo:Button("出租车大亨", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Taxi%20Boss"))()           
        end)  
        creditseo:Button("汽车经销商大亨",function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/bnm387/bnm/refs/heads/main/car%20dealer.txt'))()
        end)     
        creditseo:Button("格林维尔",function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Marco8643/test/refs/heads/main/green'))()
        end)     
    end,

    ["奎尔湖"] = function()
        local creds = window:Tab("奎尔湖",'123097590035361')
        local creditskw = creds:section("奎尔湖", true)

        creditskw:Toggle("无敌模式","", false, function(Value)
            game.ReplicatedStorage.DamageHumanoid:FireServer(-2e9)
        end)

        creditskw:Button("无限金钱", function()
            local money = { [1] = -9999, [2] = "Buy" }
            game:GetService("ReplicatedStorage").Pay:FireServer(unpack(money))
        end)

        creditskw:Button("无限金币", function()
            local gold = { [1] = game:GetService("Players").LocalPlayer.GoldCoins, [2] = 99999 }
            game:GetService("ReplicatedStorage").ChangeValue:FireServer(unpack(gold))
        end)

        creditskw:Button("给所有物品", function()
            game.ReplicatedStorage.GiveTool:FireServer("SeaScooter")
            game.ReplicatedStorage.GiveTool:FireServer("Lantern")
            game.ReplicatedStorage.GiveTool:FireServer("Compass")
            game.ReplicatedStorage.GiveTool:FireServer("ItemFinder")
            game.ReplicatedStorage.GiveTool:FireServer("Aquabreather")
        end)

        creditskw:Button("红色套装", function() game.ReplicatedStorage.ChangeOutfits:FireServer("FireSuit") end)
        creditskw:Button("黄色套装", function() game.ReplicatedStorage.ChangeOutfits:FireServer("HazmatSuit") end)
        creditskw:Button("海盗套装", function() game.ReplicatedStorage.ChangeOutfits:FireServer("PirateCostume") end)
        creditskw:Button("动力套装", function() game.ReplicatedStorage.ChangeOutfits:FireServer("SuperScuba") end)
    end,

    ["餐厅大亨3"] = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        pcall(function()
            hookfunction(require(ReplicatedStorage:FindFirstChild("Source"):FindFirstChild("Utility"):FindFirstChild("NPC"):FindFirstChild("PathUtility")).GetMovementTime, function(...)
                return 0.1
            end)
        end)

        function GetFriend()
            for _, v in next, Players:GetPlayers() do
                if LocalPlayer:IsFriendsWith(v.UserId) then
                    return v
                end
            end
            return nil
        end

        local Data = {
            ["自动收集钱"] = false,
            ["自动收集餐具"] = false,
            ["自动烹饪"] = false,
            ["自动给食物"] = false,
            ["自动拿订单"] = false,
            ["自动接订单"] = false,
            ["自动选桌子"] = false,
            ["自动拿零钱"] = false,
        }

        local Main = window:Tab("餐厅大亨3", "123097590035361")
        local AutoSection = Main:section("经营自动化", true)

        AutoSection:Toggle("自动收集钱","", false, function(state)
            Data["自动收集钱"] = state
            task.spawn(function()
                while Data["自动收集钱"] do
                    pcall(function()
                        for _, v in pairs(workspace.Tycoons:GetChildren()) do
                            if v.Player.Value == LocalPlayer then
                                for _, a in pairs(v.Items.Surface:GetChildren()) do
                                    if a:FindFirstChild("Bill") then
                                        ReplicatedStorage.Events.Restaurant.TaskCompleted:FireServer({
                                            ["Tycoon"] = v,
                                            ["Name"] = "CollectBill",
                                            ["FurnitureModel"] = a
                                        })
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.5)
                end
            end)
        end)

        AutoSection:Toggle("自动收集餐具","", false, function(state)
            Data["自动收集餐具"] = state
            task.spawn(function()
                while Data["自动收集餐具"] do
                    pcall(function()
                        for _, v in pairs(workspace.Tycoons:GetChildren()) do
                            if v.Player.Value == LocalPlayer then
                                for _, a in pairs(v.Items.Surface:GetChildren()) do
                                    if a.Name:find("T") and a:FindFirstChild("Trash") then
                                        ReplicatedStorage.Events.Restaurant.TaskCompleted:FireServer({
                                            ["Tycoon"] = v,
                                            ["Name"] = "CollectDishes",
                                            ["FurnitureModel"] = a
                                        })
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.5)
                end
            end)
        end)

        AutoSection:Toggle("自动烹饪","", false, function(state)
            Data["自动烹饪"] = state
            task.spawn(function()
                while Data["自动烹饪"] do
                    pcall(function()
                        for _, v in pairs(workspace.Tycoons:GetChildren()) do
                            if v:FindFirstChild("Player") and v.Player.Value == LocalPlayer then
                                for _, a in pairs(v.Items.Surface:GetDescendants()) do
                                    if a.Name:find("Oven") then
                                        ReplicatedStorage.Events.Cook.CookInputRequested:FireServer("Interact", a.Parent, "Oven")
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.5)
                end
            end)
        end)

        AutoSection:Toggle("自动端菜(给食物)","", false, function(state)
            Data["自动给食物"] = state
            task.spawn(function()
                while Data["自动给食物"] do
                    pcall(function()
                        for _, v in pairs(workspace.Tycoons:GetChildren()) do
                            if v:FindFirstChild("Player") and v.Player.Value == LocalPlayer then
                                if #v.Objects.Food:GetChildren() > 0 then
                                    for _, a in pairs(v.Objects.Food:GetChildren()) do
                                        if not a:GetAttribute("Taken") then
                                            ReplicatedStorage.Events.Restaurant.GrabFood:InvokeServer(a)
                                            for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                                                if gui:IsA("ImageLabel") and gui.Parent and gui.Parent.Parent.Parent.Name == "CustomerSpeechUI" and gui.Parent.Parent.Size == UDim2.new(1, 0, 1, 0) then
                                                    ReplicatedStorage.Events.Restaurant.TaskCompleted:FireServer({
                                                        Name = "Serve",
                                                        GroupId = tostring(gui.Parent.Parent.Parent.Adornee.Parent.Parent.Name),
                                                        Tycoon = v,
                                                        FoodModel = a,
                                                        CustomerId = tostring(gui.Parent.Parent.Parent.Adornee.Parent.Name)
                                                    })
                                                    task.wait(0.1)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.5)
                end
            end)
        end)

        AutoSection:Toggle("自动拿订单(柜台)","", false, function(state)
            Data["自动拿订单"] = state
            task.spawn(function()
                while Data["自动拿订单"] do
                    pcall(function()
                        for _,v in next, workspace.Temp:GetChildren() do
                            if v.Name == "Part" and v:FindFirstChildOfClass("ProximityPrompt") then
                                fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"))
                            end
                        end
                    end)
                    task.wait(0.5)
                end
            end)
        end)

        AutoSection:Toggle("自动接订单(客人)","", false, function(state)
            Data["自动接订单"] = state
            task.spawn(function()
                while Data["自动接订单"] do
                    pcall(function()
                        for _, v in pairs(workspace.Tycoons:GetChildren()) do
                            if v:FindFirstChild("Player") and v.Player.Value == LocalPlayer then
                                for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                                    if gui:IsA("ImageLabel") and gui.Parent and gui.Parent.Parent.Parent.Name == "CustomerSpeechUI" and gui.Parent.Parent.Size == UDim2.new(1, 0, 1, 0) then
                                        ReplicatedStorage.Events.Restaurant.TaskCompleted:FireServer({
                                            Name = "TakeOrder",
                                            GroupId = tostring(gui.Parent.Parent.Parent.Adornee.Parent.Parent.Name),
                                            Tycoon = v,
                                            CustomerId = tostring(gui.Parent.Parent.Parent.Adornee.Parent.Name)
                                        })
                                        task.wait(0.1)
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.5)
                end
            end)
        end)

        AutoSection:Toggle("自动选桌子","", false, function(state)
            Data["自动选桌子"] = state
            task.spawn(function()
                while Data["自动选桌子"] do
                    pcall(function()
                        for _, v in pairs(workspace.Tycoons:GetChildren()) do
                            if v.Player.Value == LocalPlayer then
                                for _, a in pairs(v.Items.Surface:GetChildren()) do
                                    if a.Name:find("T") and not a:GetAttribute("InUse") then
                                        for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                                            if gui:IsA("ImageLabel") and gui.Parent and gui.Parent.Parent.Parent.Name == "CustomerSpeechUI" and gui.Parent.Parent.Size == UDim2.new(1, 0, 1, 0) then
                                                ReplicatedStorage.Events.Restaurant.TaskCompleted:FireServer({
                                                    ["FurnitureModel"] = a,
                                                    ["Tycoon"] = v,
                                                    ["Name"] = "SendToTable",
                                                    ["GroupId"] = tostring(gui.Parent.Parent.Parent.Adornee.Parent.Parent.Name)
                                                })
                                                task.wait(0.1)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end)

        AutoSection:Toggle("自动拿小费", "",false, function(state)
            Data["自动拿零钱"] = state
            task.spawn(function()
                while Data["自动拿零钱"] do
                    pcall(function()
                        for _, v in pairs(workspace.Tycoons:GetChildren()) do
                            if v:FindFirstChild("Player") and v.Player.Value == LocalPlayer then
                                ReplicatedStorage.Events.Restaurant.TipsCollected:FireServer(v)
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end)
    end

}
    return ServerFunctions
end
