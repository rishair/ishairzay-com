get = require 'get'
fs = require 'fs'



exports.index = (req, res) ->
	res.render 'index', {
		title: 'Welcome',
		layout: "layout",
		name: "Rishi Ishairzay"
	}
