local QBCore = exports['qb-core']:GetCoreObject()

local AdQueue = {}
local ProcessingQueue = false
local AdDuration = 10000 -- Duration in ms (10 seconds)
local AdBuffer = 1000 -- Extra time between ads to ensuring smooth transition

-- Function to process the ad queue
local function ProcessQueue()
    if ProcessingQueue then return end
    ProcessingQueue = true

    CreateThread(function()
        while #AdQueue > 0 do
            local currentAd = table.remove(AdQueue, 1)

            -- Trigger event to show ad to ALL players
            TriggerClientEvent('royal_ads:client:ShowAd', -1, currentAd.text, currentAd.name)

            -- Wait for the duration of the ad plus a small buffer
            Wait(AdDuration + AdBuffer)
        end
        ProcessingQueue = false
    end)
end

-- Event: Purchase Advertisement
RegisterServerEvent('royal_ads:server:PurchaseAd', function(text)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local price = 15 -- Set price as requested

    if Player.Functions.RemoveMoney('cash', price, "advertisement") then
        local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
        
        -- Add to queue
        table.insert(AdQueue, {
            text = text,
            name = name
        })

        TriggerClientEvent('QBCore:Notify', src, "რეკლამა შეძენილია " .. price .. "$-ად", "success")

        -- Attempt to process queue
        ProcessQueue()
    else
        TriggerClientEvent('QBCore:Notify', src, "თქვენ არ გაქვთ საკმარისი თანხა (საჭიროა " .. price .. "$ ნაღდი ფული)", "error")
    end
end)
