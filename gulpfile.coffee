#############################
gulp     = require 'gulp'
http     = require 'http'
ecstatic = require 'ecstatic'
gutil    = require 'gulp-util'
coffee   = require 'gulp-coffee'
less     = require 'gulp-less'
uglify   = require 'gulp-uglify'
shell    = require 'gulp-shell'
#############################
paths =
	less: './src/styles/*.less'
	coffee: './src/scripts/*.coffee'
	uglify: './dist/*.js'
#############################
gulp.task 'coffee', ->
	gulp
		.src paths.coffee
		.pipe coffee( bare: true ).on('error', gutil.log)
		.pipe gulp.dest './src/scripts/'

gulp.task 'less', ->
	gulp
		.src paths.less
		.pipe less( compress: true )
		.pipe gulp.dest './src/styles/'
#############################
gulp.task 'uglify', ->
	gulp
		.src paths.uglify
		.pipe uglify()
		.pipe gulp.dest './dist/'

gulp.task 'coffeedoc', shell.task(['coffeedoc ./src/scripts/slick-lightbox.coffee'])
#############################
gulp.task 'watch', ->
	gulp.watch paths.coffee, ['coffee']
	gulp.watch paths.less, ['less']
#############################
gulp.task 'build', ->
	gulp.start 'coffee', 'less'
	gulp
		.src ['./src/scripts/slick-lightbox.js', './src/styles/slick-lightbox.css']
		.pipe gulp.dest './dist/'
	gulp.start 'uglify', 'coffeedoc'

gulp.task 'server', ->
	gulp.start 'coffee', 'less', 'watch'
	http
		.createServer ecstatic( root: __dirname + '/src' )
		.listen 9000
#############################
gulp.task 'default', ->
	gulp.start 'server'
