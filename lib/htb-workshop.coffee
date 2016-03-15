{CompositeDisposable} = require 'atom'
request = require "request"
cheerio = require "cheerio"
google = require "google"

getLink = (query, lang) ->
  return new Promise (resolve, reject) ->
    google.resultsPerPage = 1
    google "#{query} in #{lang} site:stackoverflow.com", (err, res) ->
      if err
        reject message: "Error googling"
      else
        if res.links.length == 0
          reject message: "No results were found"
        else
          console.log res.links[0]
          resolve res.links[0].link

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
      query = editor.getSelectedText()
      lang = editor.getGrammar().name
      getLink(query, lang).then (url) ->
        download(url).then (body) ->
          console.log scrape body
        , (err) ->
          console.log err.message
      , (err) ->
        console.log err.message
