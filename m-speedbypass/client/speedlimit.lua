local hasBypass = false
local speedLimitMph = 135.0
local speedLimitMs = speedLimitMph * 0.44704 

Citizen.CreateThread(function()
    TriggerServerEvent('speedLimiter:checkPermission')
end)

RegisterNetEvent('speedLimiter:setBypass')
AddEventHandler('speedLimiter:setBypass', function(bypass)
    hasBypass = bypass
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == playerPed then
            if not hasBypass then
                local currentSpeed = GetEntitySpeed(vehicle)
                if currentSpeed > speedLimitMs then
                    SetVehicleMaxSpeed(vehicle, speedLimitMs)
                else
                    SetVehicleMaxSpeed(vehicle, 0.0) 
                end
            else
                SetVehicleMaxSpeed(vehicle, 0.0)
            end
        end
    end
end)