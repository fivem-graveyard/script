local function isResourcePresent(resourceName)
    local state = GetResourceState(resourceName)
    return state == "started" or state == "starting"
end

local provider = nil

for resource, providerKey in pairs(Providers) do
    if isResourcePresent(resource) then
        provider = require(string.format('server.providers.%s', providerKey))
        break
    end
end

function createRecord(client, identifiers, punishment, reason, expiration, author, nickname)
    if identifiers == nil then
        if client == nil then
            log.error('createRecord: client and identifiers are nil')
            return nil
        end
        identifiers = {}
        for i = 0, GetNumPlayerIdentifiers(client) - 1 do
            local identifier = GetPlayerIdentifier(client, i)
            table.insert(identifiers, identifier)
        end
    end

    if client ~= nil and nickname == nil then
        nickname = GetPlayerName(client)
    end

    local record = {
        nickname = nickname,
        identifiers = identifiers,
        punishment = punishment,
        reason = reason,
        expiration = expiration,
        author = author,
        timestamp = os.time(),
    }

    return record
end
