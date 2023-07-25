comms = {}

function comms.request(route, method, body, headers, callback)
    if headers ~= nil then
        headers['Content-Type'] = 'application/json'
        headers['Authentication'] = APIKey
    else
        headers = {
            ['Content-Type'] = 'application/json',
            ['Authentication'] = APIKey
        }
    end

    if body == nil then
        body = {}
    end
    if type(body) == 'string' then
        body = json.encode(body)
    end

    PerformHttpRequest(APIUrl .. route, function(statusCode, response, headers)
        if statusCode == 401 then
            log.error('401: Invalid API key! Please check your configuration.')
            return
        end
        callback(statusCode, response, headers)
    end, method, body, headers)
end

function comms.log(record)
    comms.request(Routes.log, 'POST', record, nil, function(statusCode, response, headers)
        if statusCode ~= 200 then
            log.error('Failed to log record: ' .. response)
        end
    end)
end
