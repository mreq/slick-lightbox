#############################
gulp     = require 'gulp'
coffee   = require 'gulp-coffee'
cssmin   = require 'gulp-cssmin'
ecstatic = require 'ecstatic'
gutil    = require 'gulp-util'
http     = require 'http'
less     = require 'gulp-less'
shell    = require 'gulp-shell'
uglify   = require 'gulp-uglifyjs'
#############################
gulp.task 'coffee', ->
	gulp
		.src 'src/scripts/*.coffee'
		.pipe coffee( bare: true ).on('error', gutil.log)
		.pipe gulp.dest 'src/scripts/'

gulp.task 'less', ->
	gulp
		.src 'src/styles/*.less'
		.pipe less( compress: true )
		.pipe gulp.dest 'src/styles/'
#############################
gulp.task 'uglify', ->
	gulp
		.src 'dist/slick-lightbox.js'
		.pipe uglify 'slick-lightbox.min.js', outSourceMap: true
		.pipe gulp.dest 'dist/'

gulp.task 'coffeedoc', shell.task(['coffeedoc src/scripts/slick-lightbox.coffee'])
gulp.task 'buildGHPages', shell.task(['jade index.jade'])
#############################
gulp.task 'watch', ->
	gulp.watch 'src/scripts/*.coffee', ['coffee']
	gulp.watch 'src/styles/*.less', ['less']
	gulp.watch ['index.jade', 'README.md'], ['buildGHPages']
#############################
gulp.task 'preBuild', ['coffee', 'less'], ->
	# Copy css and JS
	gulp
		.src ['src/styles/slick-lightbox.css', 'src/scripts/slick-lightbox.js']
		.pipe gulp.dest 'dist/'
gulp.task 'build', ['preBuild'], ->
	# Uglify, coffeedoc and gh-pages
	gulp.start 'uglify', 'coffeedoc', 'buildGHPages'

gulp.task 'server', ->
	gulp.start 'coffee', 'less', 'watch'
	http
		.createServer ecstatic( root: __dirname )
		.listen 9000
#############################
gulp.task 'default', ->
	gulp.start 'server'
