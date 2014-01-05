Proactive = require('proactive-record')

module.exports = (App) ->
  
  # Rest methods
  App.get '/song/:id', (req, res) ->
    Proactive.load 'song', (Song) ->
      Song.find req.params.id, (s) ->
        if s.id
          res.send s
        else
          res.send 404

  App.post '/song', (req, res) ->
    Proactive.load 'song', (Song) ->
      s = new Song req.body

      s.save
        success: () ->
          res.send s
        errors: () ->
          res.send 500

  App.put '/song', (req, res) ->
    Proactive.load 'song', (Song) ->
      data = req.body
      Song.find data.id, (s) ->
        console.log('*************')
        console.log(s)
        console.log('*************')
        s.name = data.name
        s.email = data.email
        console.log('*************')
        console.log(s)
        console.log('*************')

        s.save
          success: () ->
            res.send s
          error: () ->
            res.send 500

  App.del '/song/:id', (req, res) ->
    console.log(req.body)
    res.send 405


  # Compound Requests
