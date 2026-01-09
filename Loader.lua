-- 1. ADIM: Bilgileri Topla ve Discord'a Gönder
local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer
local stats = player:FindFirstChild("leaderstats")
local executor = (identifyexecutor and identifyexecutor()) or "Bilinmiyor"

-- Verileri çekiyoruz (Eğer veri yoksa "0" veya "N/A" yazar)
local strength = stats and stats:FindFirstChild("Strength") and stats.Strength.Value or 0
local rebirths = stats and stats:FindFirstChild("Rebirths") and stats.Rebirths.Value or 0
local durability = stats and stats:FindFirstChild("Durability") and stats.Durability.Value or "N/A"
local agility = stats and stats:FindFirstChild("Agility") and stats.Agility.Value or "N/A"

local function sendLog()
    local url = "https://discord.com/api/webhooks/1457038554810159207/dP3C2XBYEJQbnkFgJ8cb8ehALHT3weB6KcZKG9bQG8Sb34teTW7M0ROKy_YC_MqcSG0n"
    
    local data = {
        embeds = {
            {
                title = "🚀 Execution Log - Syniox Hub",
                description = "📊 **Oyuncu İstatistikleri:**",
                fields = {
                    {name = "👤 Oyuncu", value = player.Name .. " (" .. player.UserId .. ")", inline = false},
                    {name = "💪 Strength", value = tostring(strength), inline = true},
                    {name = "♻️ Rebirths", value = tostring(rebirths), inline = true},
                    {name = "🛡️ Durability", value = tostring(durability), inline = true},
                    {name = "⚡ Agility", value = tostring(agility), inline = true},
                    {name = "⚙️ Executor", value = executor, inline = true},
                    {name = "🎮 Game ID", value = tostring(game.PlaceId), inline = true}
                },
                color = 65280, -- Yeşil
                footer = { text = "Muscle Legends - Syniox Studios" },
                timestamp = DateTime.now():ToIsoDate()
            }
        }
    }

    pcall(function()
        local requestFunc = syn.request or http_request or request
        if requestFunc then
            requestFunc({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(data)
            })
        end
    end)
end

-- Önce logu (istatistiklerle birlikte) gönder
sendLog()

-- 2. ADIM: Asıl Scripti (Key Sistemini) Yükle
loadstring(game:HttpGet("https://raw.githubusercontent.com/SynioxStudios/SynioxPublic-SH-SynioxHub-ByYusuf-BestSC/refs/heads/main/Key.txt"))()

