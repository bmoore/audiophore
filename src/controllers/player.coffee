fs = require 'fs'
Proactive = require('proactive-record')

module.exports = (App) ->

  App.get '/play/:id', (req, res) ->
    Proactive.load 'song', (Song) ->
      Song.find req.params.id, (s) ->
        if s.id
          truepath = process.cwd()+s.path
          fs.stat(truepath, (err, data) ->
            if err
              res.send err
              return

            dataSent = 0;
            fileStream = fs.createReadStream(truepath)
            fileStream.pipe(res)
          )
        else
          res.send 404
