-- RCD script example, (spawning dummy)

local hrpReplacement = Instance.new("Part", game:GetService("Players").LocalPlayer.Character)
hrpReplacement.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
hrpReplacement.Transparency = 1
hrpReplacement.Anchored = true
hrpReplacement.CanCollide = false

-- RejectCharacterDeletion SEMI-bypassed by ficello
-- private method found 28/02/2023 (Replicate Welds ONLY)
-- make roblox exploiting great again

-- weld will be saved in a client sided part called "Your username Protected Welds", you'll have again full control of ur welds

function Attachments(P0,P1,POS,ROT) -- credit to the guy who made this align function
    local AlignPosition = Instance.new("AlignPosition", P0)
    local AlignOrientation = Instance.new("AlignOrientation", P0)
    local Attachment1 = Instance.new("Attachment", P0)
    local Attachment2 = Instance.new("Attachment", P1)
    AlignPosition.Attachment0 = Attachment1
    AlignOrientation.Attachment0 = Attachment1
    AlignPosition.Attachment1 = Attachment2
    AlignOrientation.Attachment1 = Attachment2
    AlignPosition.Responsiveness = 300
    AlignPosition.MaxForce = 5e9
    AlignOrientation.MaxTorque = 5e9
    AlignOrientation.Responsiveness = 300
    AlignOrientation.ReactionTorqueEnabled = false
    Attachment1.Position = POS or Vector3.new(0,0,0)
    Attachment1.Orientation = ROT or Vector3.new(0,0,0)
end

function patchWelds()
    if game:GetService("Players").LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        
        lp.Character = nil -- permadeath
        lp.Character = char -- bypass
        
        local hrp = char:FindFirstChild("HumanoidRootPart") 
        if hrp == nil then return end 
        
        hrp:Destroy()  
        wait(6)
        local protectedWelds = Instance.new("Part", workspace)
        protectedWelds.Name = lp.Name .. " Protected Welds"
        protectedWelds.Anchored = true
        protectedWelds.CFrame = char.UpperTorso.CFrame
        protectedWelds.CanCollide = false
        protectedWelds.Transparency = 1
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "RejectCharacterDeletion bypass by ficello", 
            Text  = "You can now reset without any issues", 
            Icon  = "rbxassetid://17703918" 
        })
        wait(3)
        for k, v in pairs(char:GetChildren()) do
            if v:IsA("Accessory") then
                Attachments(v.Handle, protectedWelds, Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))
            end
        end
    elseif game:GetService("Players").LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        
        lp.Character = nil -- permadeath
        lp.Character = char -- bypass
        
        local hrp = char:FindFirstChild("HumanoidRootPart") 
        if hrp == nil then return end 
        
        hrp:Destroy() 
        wait(6)
        local protectedWelds = Instance.new("Part", workspace)
        protectedWelds.Name = lp.Name .. " Protected Welds"
        protectedWelds.Anchored = true
        protectedWelds.CFrame = char.Torso.CFrame
        protectedWelds.CanCollide = false
        protectedWelds.Transparency = 1
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "RejectCharacterDeletion bypass by ficello", 
            Text  = "You can now reset without any issues", 
            Icon  = "rbxassetid://17703918" 
        })
        wait(3)
        for k, v in pairs(char:GetChildren()) do
            if v:IsA("Accessory") then
                Attachments(v.Handle, protectedWelds, Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))
            end
        end
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "RejectCharacterDeletion bypass by ficello", 
            Text  = "tf rig r u using lmao", 
            Icon  = "rbxassetid://17703918" 
        })
    end
end


-- "bypassing" RejectCharacterDeletion
patchWelds()
-- end

wait(4)

local gsPlayers = game:GetService("Players")
local LP = gsPlayers.LocalPlayer

local Dummy = game:GetObjects("rbxassetid://8246626421")[1]
Dummy.Parent = workspace
Dummy:MoveTo(Vector3.new(hrpReplacement.Position.X,hrpReplacement.Position.Y,hrpReplacement.Position.Z))

for k, v in pairs(Dummy:GetChildren()) do
    if v:IsA("BasePart") then
        v.Transparency = 1
    end
end

workspace[LP.Name .. " Protected Welds"]:Destroy() -- destroying secure welds

for k,v in pairs(LP.Character:GetChildren()) do
    if v:IsA("Accessory") then
        v.Handle:FindFirstChild("Attachment"):Destroy() -- destroying basic welds
    end
end

function Netless()
    for i,v in next, workspace[game.Players.LocalPlayer.Name]:GetChildren() do
        if v:IsA("BasePart") then 
            v.Velocity = Vector3.new(0,-32.5,0)
        elseif v:IsA("Accessory") then 
            v.Handle.Velocity = Vector3.new(0,-32.5,0)
        end
    end
end
 
Netlessing = game:GetService("RunService").Heartbeat:Connect(Netless)


Attachments(LP.Character["watermelon"].Handle, Dummy["Head"], Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))
Attachments(LP.Character["MeshPartAccessory"].Handle, Dummy["Torso"], Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))
Attachments(LP.Character["LavanderHair"].Handle, Dummy["Left Arm"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
Attachments(LP.Character["Pink Hair"].Handle, Dummy["Right Arm"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
Attachments(LP.Character["Pal Hair"].Handle, Dummy["Left Leg"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
Attachments(LP.Character["Kate Hair"].Handle, Dummy["Right Leg"], Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
