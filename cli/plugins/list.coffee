jf = require 'jsonfile'

module.exports = (cli) ->
	cli.argv._.shift()
	try
		jf.readFile process.cwd() + '/plugins.json', (err, obj) ->
			throw err if err
			if not obj?
				console.log "There is no plugins installed yet!"
			else
				console.log "You have " + Object.keys(obj).length + " plugins installed. Their names are: "
				for key, value of obj
					console.log "- '" + key + "'"
	catch e
			console.log 'An error occured: ' + e.message