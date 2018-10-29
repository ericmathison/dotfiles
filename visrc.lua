require('vis')

vis.events.subscribe(vis.events.INIT, function()
    -- Your global configuration options
    vis:map(vis.modes.NORMAL, "\\q", function()
        vis:command('q!')
    end)

    vis:map(vis.modes.NORMAL, '<Up>', '<C-y>')
    vis:map(vis.modes.NORMAL, '<Down>', '<C-e>')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    -- Your per window configuration options e.g.
    vis:command('set number')
end)
