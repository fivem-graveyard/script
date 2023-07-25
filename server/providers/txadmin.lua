AddEventHandler('txAdmin:events:playerKicked', function(target, author, reason)
    if not Punishments.kick then return end
    local record = createRecord(target, nil, 'kick', reason, nil, author)
    comms.log(record)
end)

AddEventHandler('txAdmin:events:playerWarned', function(target, author, reason, actionId)
    if not Punishments.warn then return end
    local record = createRecord(target, nil, 'warn', reason, nil, author)
    comms.log(record)
end)

AddEventHandler('txAdmin:events:playerBanned',
    function(author, reason, actionId, expiration, durationInput, durationTranslated, targetNetId, targetIds,
             targetHwids, targetName, kickMessage)
        if not Punishments.ban then return end
        local record = createRecord(targetNetId, targetIds, 'ban', reason, expiration, author, targetName)
    end)
