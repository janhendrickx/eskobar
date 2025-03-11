const { src, dest, watch, series, parallel } = require('gulp');
const sass = require('gulp-sass')(require('sass'));
const cleanCSS = require('gulp-clean-css');
const concat = require('gulp-concat');
const browserSync = require('browser-sync').create();
const fs = require('fs');
const path = require('path');

// Pad naar je SSL-certificaat en sleutel (pas deze paden aan naar je eigen certificaten)
const certPath = path.join('/Applications/ServBay/ssl/private/tls-certs/eskobar.local', 'eskobar.local.crt');
const keyPath = path.join('/Applications/ServBay/ssl/private/tls-certs/eskobar.local', 'eskobar.local.key');

// Compile Sass naar CSS
function compileSass(done) {
    src('web/assets/sass/**/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(concat('style.css'))
        .pipe(dest('web/assets/css'))
        .pipe(browserSync.stream());
    done();
}

// Minify CSS
function minifyCSS(done) {
    console.log('Minifying CSS...');
    src('web/assets/css/style.css')
        .pipe(cleanCSS({ compatibility: 'ie8' }))
        .pipe(concat('style.min.css'))
        .pipe(dest('web/assets/css'));
    done();
}

// BrowserSync initialiseren
function initBrowserSync(done) {
    browserSync.init({
        proxy: {
            target: "https://eskobar.local", // Zorg ervoor dat dit je lokale domein is
            proxyReq: [
                function(proxyReq) {
                    proxyReq.setHeader('Host', 'eskobar.local');
                }
            ]
        },
        notify: false,
        open: 'external',
        host: "eskobar.local",
        port: 3000,
        https: {
            key: keyPath,
            cert: certPath
        },
    });
    done();
}

// Watch voor wijzigingen
function watchFiles(done) {
    watch('web/assets/sass/**/*.scss', series(compileSass, minifyCSS));
    watch('web/assets/css/**/*.css').on('change', browserSync.reload);
    watch('templates/**/*.twig').on('change', browserSync.reload);
    done();
}

// Default task
exports.default = series(
    parallel(compileSass, minifyCSS),
    initBrowserSync,
    watchFiles
);
