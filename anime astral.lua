-- ============================================
-- LOADER - ANIME ASTRAL SIMULATOR
-- ============================================

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- CONFIGURAÇÕES
local BASE_URL = "https://raw.githubusercontent.com/SEU_USUARIO/SEU_REPO/refs/heads/main"
local SCRIPT_NAME = "animeastral.lua"

-- VERIFICA SE É O JOGO CORRETO
local placeId = game.PlaceId
local universeId = game.GameId

local isAnimeAstral = (placeId == 9797806474 or universeId == 102072869879193)

if not isAnimeAstral then
    -- Mostra mensagem de erro se não for o jogo certo
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
local url = BASE_URL .. "/" .. SCRIPT_NAME
print("[LOADER] Carregando Anime Astral Simulator...")

local success, err = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not success then
    warn("[LOADER] Erro ao carregar: " .. tostring(err))
    print("❌ Falha ao carregar o script. Verifique sua conexão.")
else
    print("✅ Script carregado com sucesso!")
end