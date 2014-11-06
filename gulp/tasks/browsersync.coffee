browserSync = require 'browser-sync'
gulp = require 'gulp'

gulp.task 'browserSync', ['nodemon', 'build'], ->
  browserSync
    proxy: '0.0.0.0:3000'
    port: 3001
    files: [
      # watch everything in dist
      'client/dist/**'
    ]
