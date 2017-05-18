#############################

gulp     = require 'gulp'
coffee   = require 'gulp-coffee'
cssmin   = require 'gulp-cssmin'
concat   = require 'gulp-concat'
clean    = require 'gulp-clean'
ecstatic = require 'ecstatic'
gutil    = require 'gulp-util'
http     = require 'http'
sass     = require 'gulp-sass'
shell    = require 'gulp-shell'
uglify   = require 'gulp-uglifyjs'
qunit    = require 'node-qunit-phantomjs'
wrapJS   = require 'gulp-wrap-js'

#############################

gulp.task 'coffee', ->
  gulp
    .src 'src/scripts/slick-lightbox.coffee'
    .pipe coffee( bare: true ).on('error', gutil.log)
    .pipe wrapJS("""'use strict';
(function($) {

%= body %

}(jQuery));""")
    .pipe gulp.dest 'dist/'

gulp.task 'sass', ->
  gulp
    .src 'src/styles/slick-lightbox.sass'
    .pipe sass(outputStyle: 'compressed').on('error', sass.logError)
    .pipe gulp.dest 'dist/'

#############################

gulp.task 'uglify', ->
  gulp
    .src 'dist/slick-lightbox.js'
    .pipe uglify 'slick-lightbox.min.js', outSourceMap: true
    .pipe gulp.dest 'dist/'

gulp.task 'coffeedoc', shell.task(['coffeedoc src/scripts/slick-lightbox.coffee'])

gulp.task 'buildGHPages', shell.task(['jade index.jade'])

#############################

gulp.task 'testClean', ->
  gulp
    .src './test/tmp'
    .pipe clean()

gulp.task 'testCoffee', ['testClean'], ->
  gulp
    .src ['./test/boilerplate.coffee', './test/tests/*.coffee']
    .pipe coffee( bare: true ).on('error', gutil.log)
    .pipe gulp.dest('./test/tmp/')

gulp.task 'testConcat', ['testCoffee'], ->
  gulp
    .src './test/tmp/*.js'
    .pipe concat('tests.js')
    .pipe gulp.dest('./test/')

gulp.task 'test', ['testConcat', 'base'], ->
  qunit './test/test.html', { verbose: true }

#############################

gulp.task 'watch', ->
  gulp.watch 'src/scripts/*.coffee', ['coffee', 'coffeedoc']
  gulp.watch 'src/styles/*.sass', ['sass']
  gulp.watch ['index.jade', 'README.md'], ['buildGHPages']

#############################

gulp.task 'base', ->
  gulp.start 'coffee', 'coffeedoc', 'sass', 'uglify'

gulp.task 'build', ->
  gulp.start 'base', 'buildGHPages'

gulp.task 'server', ->
  gulp.start 'base', 'watch'
  http
    .createServer ecstatic( root: __dirname )
    .listen 9000

#############################

gulp.task 'default', ->
  gulp.start 'server'
