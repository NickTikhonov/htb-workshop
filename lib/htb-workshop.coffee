{CompositeDisposable} = require 'atom'
request = require "request"
cheerio = require "cheerio"

download = (url) ->
  return new Promise (resolve, reject) ->
    request url, (error, response, body) ->
      if !error && response.statusCode == 200
        resolve body
      else
        reject message: "Unable to download the page."

scrape = (body) ->
  $ = cheerio.load(body)
  return $('div.accepted-answer code').text()


module.exports = HtbWorkshop =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'htb-workshop:fetch': => @fetch()

  deactivate: ->
    @subscriptions.dispose()

  fetch: ->
    if editor = atom.workspace.getActiveTextEditor()
      url = editor.getSelectedText()
      download(url).then (body) ->
        console.log scrape body
      , (err) ->
        console.log err
