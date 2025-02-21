local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "确认身份",
    Text = "正在验证....",
    Duration = 3, 
})

local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local WhitelistedPlayers = {
    ["DFTRQ24"] = true,
    ["gffddaweyjvxssssf"] = true,
    ["mike_10554"] = true,
    [""] = true,
    [""] = true,
    [""] = true,
    [""] = true,
    [""] = true,
    [""] = true,
    [""] = true,
    
}

local function IsWhitelisted(player)
    return WhitelistedPlayers[player.Name] or false
end

local localPlayer = Players.LocalPlayer

local isLocalPlayerWhitelisted = IsWhitelisted(localPlayer)

if isLocalPlayerWhitelisted then
    StarterGui:SetCore("SendNotification", {
        Title = "白名单认证",
        Text = "玩家:"..localPlayer.Name.."，检测完毕白名单玩家，稍后会加载脚本",
        Duration = 7,
    })
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\114\111\98\108\111\120\45\121\101\47\81\81\53\49\53\57\54\54\57\57\49\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\88\73\65\79\45\89\69\46\108\117\97\34\41\41\40\41")()
else
setclipboard("Q群：710957769")  
    localPlayer:Kick("你没有被加入白名单，请到QQ群710957769获得，4元，已复制")
end
