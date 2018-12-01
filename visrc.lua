require('vis')
require('editorconfig/editorconfig') -- https://github.com/vktec/vis-editorconfig
require('vis-commentary/vis-commentary') -- https://github.com/lutobler/vis-commentary
require('vis-cursors/cursors') -- https://github.com/erf/vis-cursors

vis.events.subscribe(vis.events.INIT, function()
  -- Your global configuration options
  vis:map(vis.modes.NORMAL, "\\q", function()
    vis:command('q!')
  end)

  vis:map(vis.modes.NORMAL, "\\w", function()
    vis:command('wq')
  end)

  vis:map(vis.modes.NORMAL, '<Up>', '<C-y>')
  vis:map(vis.modes.NORMAL, '<Down>', '<C-e>')

  vis:map(vis.modes.NORMAL, '[ ', 'O<Escape>')
  vis:map(vis.modes.NORMAL, '] ', 'o<Escape>')

  vis:map(vis.modes.NORMAL, 'j', 'gj')
  vis:map(vis.modes.NORMAL, 'k', 'gk')

  vis:command('set autoindent')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
  -- Your per window configuration options e.g.
  vis:command('set number')
  vis:command('set show-tabs')
  vis:command('set theme dark-16')
end)

