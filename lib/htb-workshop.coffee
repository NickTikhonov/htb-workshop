HtbWorkshopView = require './htb-workshop-view'
{CompositeDisposable} = require 'atom'

module.exports = HtbWorkshop =
  htbWorkshopView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @htbWorkshopView = new HtbWorkshopView(state.htbWorkshopViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @htbWorkshopView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'htb-workshop:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @htbWorkshopView.destroy()

  serialize: ->
    htbWorkshopViewState: @htbWorkshopView.serialize()

  toggle: ->
    console.log 'HtbWorkshop was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
