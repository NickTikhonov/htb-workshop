{CompositeDisposable} = require 'atom'

module.exports = HtbWorkshop =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'htb-workshop:fetch': => @fetch()

  deactivate: ->
    @subscriptions.dispose()

  fetch: ->
    if editor = atom.workspace.getActiveTextEditor()
      selected = editor.getSelectedText()
      console.log selected
      editor.insertText(selected.split("").reverse().join(""))
