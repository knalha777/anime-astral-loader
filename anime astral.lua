-- ============================================
-- LOADER - ANIME ASTRAL SIMULATOR (CORRIGIDO)
-- ============================================

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- CONFIGURAÇÕES
local BASE_URL = "https://raw.githubusercontent.com/SEU_USUARIO/SEU_REPO/refs/heads/main"
local SCRIPT_NAME = "animeastral.lua"

-- PLACE ID CORRETO DO SEU JOGO
local CORRECT_PLACE_ID = 102072869879193
local CORRECT_UNIVERSE_ID = 10502841145

-- VERIFICA SE É O JOGO CORRETO
local placeId = game.PlaceId
local universeId = game.GameId

local isAnimeAstral = (placeId == CORRECT_PLACE_ID or universeId == CORRECT_UNIVERSE_ID)

if not isAnimeAstral then
    -- Mensagem de erro se não for o jogo certo
    local player = game:GetService("Players").LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "LoaderError"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.fromOffset(400, 150)
    frame.Position = UDim2.fromScale(0.5, 0.5)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    frame.Parent = gui
    
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, -40, 1, -40)
    text.Position = UDim2.fromOffset(20, 20)
    text.BackgroundTransparency = 1
    text.Text = "❌ Este loader é exclusivo para:\nANIME ASTRAL SIMULATOR"
    text.TextColor3 = Color3.fromRGB(255, 80, 80)
    text.TextSize = 18
    text.Font = Enum.Font.GothamBold
    text.TextWrapped = true
    text.Parent = frame
    
    task.delay(3, function()
        gui:Destroy()
    end)
    
    return
end

-- CARREGA O SCRIPT
print("🚀 Carregando Anime Astral Simulator...")
print("📍 Place ID:", placeId)

local url = BASE_URL .. "/" .. SCRIPT_NAME

local success, err = pcall(function()
    local content = game:HttpGet(url)
    loadstring(content)()
end)

if success then
    print("✅ Script carregado com sucesso!")
else
    warn("❌ Erro ao carregar: " .. tostring(err))
    print("Verifique se o arquivo existe no GitHub.")
end
