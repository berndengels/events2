const mix = require('laravel-mix');
mix.webpackConfig({
//    target: 'node',
    resolve: {
        alias: {
            jquery: "jquery/src/jquery"
        }
    },
    externals: {
        canvas: "commonjs canvas" // Important (2)
    }
});

mix.autoload({
        'jquery': ['jQuery', '$']
    })
    .setPublicPath('public')
    .js('resources/js/app.js', 'public/js')
//    .js('resources/js/payment-stripe.js', 'public/js')
    .js('resources/js/app-admin.js', 'public/js')
//    .js(['resources/js/admin/admin.js'], 'public/js')
    .sass('resources/sass/admin/admin.scss', 'public/css')
    .sass('resources/sass/app.scss', 'public/css')
    .sass('resources/sass/app-admin.scss', 'public/css')
    .sass('resources/sass/pure.scss', 'public/css')
    .sass('resources/sass/pdf.scss', 'css/pdf.css')
    .copy('resources/vendor/calendar/zabuto_calendar.min.js', 'public/vendor/calendar/js')
    .copy('resources/vendor/calendar/zabuto_calendar.min.css', 'public/vendor/calendar/css')
    .copy('node_modules/bootstrap-datepicker/dist', 'public/vendor/bootstrap-datepicker')
    .copy('node_modules/dropzone/dist/min/dropzone.min.js', 'public/vendor/dropzone/js')
    .copy('node_modules/dropzone/dist/min/dropzone.min.css', 'public/vendor/dropzone/css')
    .copy('node_modules/jstree/dist/jstree.min.js', 'public/vendor/jstree/js')
    .copy('node_modules/cropperjs/dist/cropper.css', 'public/vendor/cropperjs/css')
    .copy('node_modules/tinymce', 'public/vendor/tinymce')
    .copy('resources/vendor/tinymce/plugins/responsivefilemanager', 'public/vendor/tinymce/plugins/responsivefilemanager')
    .copy('resources/vendor/tinymce/filemanager', 'public/vendor/filemanager')
    .copy('node_modules/jstree/dist/jstree.min.js', 'public/vendor/jstree/js')
    .copy('node_modules/jstree/dist/themes', 'public/vendor/jstree/css')
    .copy('node_modules/leaflet/dist', 'public/vendor/leaflet')
    .copyDirectory('node_modules/@fortawesome/fontawesome-free/webfonts', 'public/webfonts')
//    .postCss('resources/css/app.css', 'public/css', [])
    .vue()
;

if (mix.inProduction()) {
    mix.version();
}
