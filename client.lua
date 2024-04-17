-- Constantes
local DRIVING_STYLE = 786603
local TARGET_BLIP_ID = 8

-- Variáveis de estado
local autopilotEnabled = false
local currentSpeed = Config.DEFAULT_SPEED
local targetCoords

-- Loop principal
CreateThread(function()
    while true do
        local waitTime = 1000

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle ~= 0 then
            SendDataToUI("available", true)
        else
            SendDataToUI("available", false)
            if autopilotEnabled then
                StopAutopilot()
                TriggerEvent("Notify","negado","Você saiu do carro, piloto automático desativado.")
            end
        end

        if autopilotEnabled then
            waitTime = 100

            -- Verificar se a marcação do mapa do jogador existe
            local blip = GetFirstBlipInfoId(TARGET_BLIP_ID)
            if DoesBlipExist(blip) then
                local blipCoords = GetBlipCoords(blip)
                if blipCoords ~= targetCoords then
                    targetCoords = blipCoords
                end
            end

            -- Calcular distância até o destino
            local distance = GetDistanceBetweenCoords(GetEntityCoords(vehicle), targetCoords)

            -- Verificar se está próximo do destino
            if distance > Config.STOP_DISTANCE then
                TaskVehicleDriveToCoord(playerPed, vehicle, targetCoords, currentSpeed / 3.6, 0, vehicle, DRIVING_STYLE,
                    0, true)
            else
                StopAutopilot()
                TriggerEvent("Notify","sucesso","Você chegou ao seu destino!")
            end
        end

        Wait(waitTime)
    end
end)

RegisterKeyMapping("gmdev_autopilot:toggle", "Alternar (ligado/desligado).", "KEYBOARD", "N")
RegisterCommand("gmdev_autopilot:toggle", function(source, args)
    if not IsPedInAnyVehicle(PlayerPedId()) then
        return
    end

    local player = PlayerPedId()

    if autopilotEnabled then
        StopAutopilot("Piloto automático desativado.")
    else
        local blip = GetFirstBlipInfoId(8)

        if DoesBlipExist(blip) then
            autopilotEnabled = true
            currentSpeed = Config.DEFAULT_SPEED
            targetCoords = GetBlipCoords(blip)
            ClearPedTasks(player)

            SendDataToUI("enabled", true)
            SendDataToUI("maxSpeed", currentSpeed)
            PlayAudio("https://github.com/guimilreu/gmdev_public_assets/raw/main/audio/gmdev_autopilot_activate.ogg")
        else
            TriggerEvent("Notify", "negado", "Você deve marcar um ponto no mapa.")
        end
    end
end, false)

RegisterKeyMapping("gmdev_autopilot:increaseMaxSpeed", "Aumentar velocidade máxima do veículo.", "KEYBOARD", "PLUS")
RegisterCommand("gmdev_autopilot:increaseMaxSpeed", function(source, args)
    if autopilotEnabled then
        currentSpeed = math.max(currentSpeed + Config.SPEED_INCREMENT, Config.MIN_SPEED)
        SendDataToUI("maxSpeed", currentSpeed)
    end
end)

RegisterKeyMapping("gmdev_autopilot:decreaseMaxSpeed", "Diminuir velocidade máxima do veículo.", "KEYBOARD", "MINUS")
RegisterCommand("gmdev_autopilot:decreaseMaxSpeed", function(source, args)
    if autopilotEnabled then
        currentSpeed = math.min(currentSpeed - Config.SPEED_INCREMENT, Config.MAX_SPEED)
        SendDataToUI("maxSpeed", currentSpeed)
    end
end)

function StopAutopilot()
    autopilotEnabled = false
    ClearPedTasks(PlayerPedId())
    SendDataToUI("enabled", false)
    PlayAudio("https://github.com/guimilreu/gmdev_public_assets/raw/main/audio/gmdev_autopilot_deactivate.ogg")
end

function SendDataToUI(key, value)
    SendNUIMessage({
        key = key,
        value = value
    })
end

function PlayAudio(audioSource)
    SendNUIMessage({
        audio = audioSource
    })
end
