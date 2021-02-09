# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

# toggle between light and dark themes
# credit to https://discuss.atom.io/t/changing-the-theme-with-a-keymap/15129
# atom.commands.add 'atom-workspace',
#   'themes:toggle': ->
#     activeThemes = atom.themes.getActiveThemes()
#     if activeThemes.join(':').indexOf('dark') is -1
#       atom.themes.setEnabledThemes(["atom-dark-syntax", "atom-dark-ui"])
#     else
#       atom.themes.setEnabledThemes(["atom-light-syntax", "atom-light-ui"])
