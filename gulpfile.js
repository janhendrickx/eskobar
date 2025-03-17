const { src, dest, watch, series, parallel } = require('gulp');
const sass = require('gulp-dart-sass'); // Gebruik gulp-dart-sass om de Legacy API te vermijden
const postcss = require('gulp-postcss');
const autoprefixer = require('autoprefixer');
const cleanCSS = require('gulp-clean-css');
const concat = require('gulp-concat');
const browserSync = require('browser-sync').create();
const path = require('path');

// Pad naar je SSL-certificaat en sleutel (pas deze paden aan naar je eigen certificaten)
const certPath = path.join('/Applications/ServBay/ssl/private/tls-certs/eskobar.local', 'eskobar.local.crt');
const keyPath = path.join('/Applications/ServBay/ssl/private/tls-certs/eskobar.local', 'eskobar.local.key');

// Compile Sass naar CSS
function compileSass() {
    const sass = require('gulp-dart-sass');
    console.log('Loaded gulp-dart-sass version:', sass.compiler.info);
    

    return src('web/assets/sass/style.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(postcss([autoprefixer()]))
        .pipe(concat('style.css'))
        .pipe(dest('web/assets/css'))
        .pipe(browserSync.stream());
}

// Minify CSS
function minifyCSS() {
    return src('web/assets/css/style.css', { allowEmpty: true })
        .pipe(cleanCSS({ compatibility: 'ie8' }).on('error', (err) => {
            console.error('Error in clean-css:', err.message);
        }))
        .pipe(concat('style.min.css'))
        .pipe(dest('web/assets/css'));
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
        open: false,
        files: [
            'web/assets/css/**/*.css',
            'templates/**/*.twig'
        ],
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
function watchFiles() {
    watch('web/assets/sass/**/*.scss', series(compileSass, minifyCSS));
    watch('web/assets/css/**/*.css').on('change', browserSync.reload);
    watch('templates/**/*.twig').on('change', browserSync.reload);
}

// Default task
exports.default = series(
    parallel(compileSass, minifyCSS),
    initBrowserSync,
    watchFiles
);