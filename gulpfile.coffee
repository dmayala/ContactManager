gulp = require 'gulp'
sass = require 'gulp-sass'
browserify = require 'gulp-browserify'
rename = require 'gulp-rename'
nodemon = require 'gulp-nodemon'

gulp.task 'sass', ->
  gulp.src('./client/src/css/*.scss')
      .pipe(sass())
      .pipe(gulp.dest './client/dist/css' )

gulp.task 'browserify', ->
  gulp.src('./client/src/js/initialize.coffee', { read: false })
      .pipe(browserify {
          #transform: ['coffeeify'],
          extensions: ['.coffee']
        }) 
      .pipe(rename 'app.js')
      .pipe(gulp.dest './client/dist/js')

gulp.task 'nodemon', ->
  nodemon(script: 'server.coffee', ext: 'html scss coffee', ignore: ['./client/dist'])
          .on('change', ['sass', 'browserify'])

# Restart server on changes
gulp.task 'default', ['sass', 'browserify', 'nodemon']
