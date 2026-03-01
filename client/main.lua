local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('royal_ads:client:ShowAd', function(text, name)
    SendNUIMessage({
        type = "showAd",
        text = text,
        name = name
    })
end)

RegisterCommand('ad', function()
    local input = lib.inputDialog('რეკლამის შექმნა', {
        { type = 'textarea', label = 'რეკლამის ტექსტი (ფასი: 15$)', description = 'რისი დარეკლამება გსურთ?', required = true, min = 10, max = 200 }
    })

    if not input then return end

    TriggerServerEvent('royal_ads:server:PurchaseAd', input[1])
end, false)
