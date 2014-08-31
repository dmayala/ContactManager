nodemon = require 'gulp-nodemon'
browserify = require 'gulp-browserify'

task = ->
  gulp.src './build/js/initialize.coffee', ->

  nodemon script: 'server.coffee', ext: 'html css coffee', ignore: ['./build/dist']

module.exports = task
