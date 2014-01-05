try
  config = require(process.cwd()+'/config/express')
catch error
  if error.code is 'MODULE_NOT_FOUND'
    console.log "You must have #{process.cwd()}/config/express.json"
  else
    console.log(error)
  process.exit(1)

module.exports = config[process.env.NODE_ENV] || config['development']
