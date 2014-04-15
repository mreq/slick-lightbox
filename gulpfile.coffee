#############################
gulp     = require 'gulp'
http     = require 'http'
ecstatic = require 'ecstatic'
#############################
gulp.task 'server', ->
	http
		.createServer ecstatic( root: __dirname + '/src' )
		.listen 9000

gulp.task 'default', ->
	gulp.start 'server'
