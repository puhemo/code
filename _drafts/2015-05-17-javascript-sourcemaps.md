

npm install --save-dev gulp-uglify
npm install --save-dev gulp-sourcemaps

var gulp = require('gulp');
var gutil = require('gulp-util');
var bower = require('bower');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var minifyCss = require('gulp-minify-css');
var rename = require('gulp-rename');
var sh = require('shelljs');
var uglify = require('gulp-uglify');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('default', ['build-js']);


var paths = {
  javascript: ['./www/**/*.js', '!./www/lib/**']
};

var output = {
      'javascript': './www/js'
    };


gulp.task('build-js', function() {
  return gulp.src(paths.javascript)
    .pipe(sourcemaps.init())
      .pipe(concat('bundle.js'))
     .pipe(uglify())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(output.javascript));
});

gulp.task('watch', function() {
  gulp.watch(paths.javascript, ['build-js']);
});

