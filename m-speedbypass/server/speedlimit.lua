RegisterServerEvent('speedLimiter:checkPermission')
AddEventHandler('speedLimiter:checkPermission', function()
    local source = source
    local hasBypass = IsPlayerAceAllowed(source, 'mspeed.bypass')
    TriggerClientEvent('speedLimiter:setBypass', source, hasBypass)
end)