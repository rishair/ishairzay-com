express = require 'express'
routes = require './routes'
app = module.exports = express.createServer()


#io = require('socket.io').listen app
#socket_handler.take io


port = parseInt process.argv[2] if process.argv.length > 2
port ?= 8000


app.configure ->
	app.set 'views', __dirname + '/views'
	app.set 'view engine', 'jade'
	#app.use express.cookieParser()
	#app.use express.session { secret: "secret sessionare" }
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use app.router
	app.use express.compiler {src:__dirname + '/public', enable: ['less']}
	app.use express.static(__dirname + '/public')



app.configure 'development', ->
	app.use express.errorHandler({dumpExceptions: true, showStack: true})

app.configure 'production', ->
	app.use express.errorHandler()



app.get '/', routes.index

app.listen port
	


console.log "Express server listening on port %d", app.address().port
