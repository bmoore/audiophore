config = require './config'
Express = require 'express'
App = Express()

App.use Express.bodyParser()
require('./controllers/song')(App)
require('./controllers/player')(App)

console.log(App.routes)

App.listen config.port
console.log "Listening on http://#{config.host}:#{config.port}/"
