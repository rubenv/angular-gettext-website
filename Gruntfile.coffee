httpProxy = require 'http-proxy'

proxy = new httpProxy.RoutingProxy()

mountFolder = (connect, dir) ->
    return connect.static(require('path').resolve(dir))

module.exports = (grunt) ->
    @loadNpmTasks('grunt-contrib-clean')
    @loadNpmTasks('grunt-contrib-concat')
    @loadNpmTasks('grunt-contrib-connect')
    @loadNpmTasks('grunt-contrib-copy')
    @loadNpmTasks('grunt-contrib-cssmin')
    @loadNpmTasks('grunt-contrib-htmlmin')
    @loadNpmTasks('grunt-contrib-uglify')
    @loadNpmTasks('grunt-contrib-watch')
    @loadNpmTasks('grunt-concurrent')
    @loadNpmTasks('grunt-usemin')
    @loadNpmTasks('grunt-wintersmith')
    @loadNpmTasks('grunt-zopfli')

    config =
        out: 'dist'
        tmp: '.tmp'
        previewPort: 3000
        wintersmithPort: 3001

    @initConfig
        config: config

        clean:
            dist: [config.tmp, '.sass-cache']
            server: [config.out]

        concurrent:
            options:
                logConcurrentOutput: true
            server: ['watch:wintersmith', 'wintersmith:preview']

        watch:
            options:
                livereload: true
            wintersmith:
                files: ['{templates,contents}/*{,/*}{,/*}{,/*}']
                tasks: [] # Just trigger livereload

        wintersmith:
            options:
                config: 'wintersmith.json'
            build:
                options:
                    action: 'build'
            preview:
                options:
                    action: 'preview'

        connect:
            livereload:
                options:
                    port: config.previewPort
                    hostname: '0.0.0.0'
                    middleware: (connect) ->
                        return [
                            require('connect-livereload')()
                            mountFolder(connect, __dirname)
                            (req, res) ->
                                proxy.proxyRequest(req, res, {
                                    host: 'localhost'
                                    port: config.wintersmithPort
                                })
                        ]

        copy:
            wintersmith:
                files: [
                    expand: true
                    cwd: config.tmp
                    src: ["**", "!**/*.css"]
                    dest: config.out
                ]

        useminPrepare:
            html: '<%= config.out %>/**.html'
            options:
                dest: config.out

        usemin:
            html: ['<%= config.out %>/**.html']
            options:
                dirs: [config.out, config.tmp]

        htmlmin:
            options:
                collapseWhitespace: true
                collapseBooleanAttributes: true
            dist:
                expand: true
                cwd: '<%= config.out %>'
                src: ['**/*.html']
                dest: '<%= config.out %>'
                ext: '.html'

        zopfli:
            options:
                report: true
                iterations: 25
            html:
                expand: true
                cwd: '<%= config.out %>'
                src: ['**/*.html']
                dest: '<%= config.out %>'
                ext: '.html.gz'
            js:
                expand: true
                cwd: '<%= config.out %>'
                src: ['**/*.js']
                dest: '<%= config.out %>'
                ext: '.js.gz'
            css:
                expand: true
                cwd: '<%= config.out %>'
                src: ['**/*.css']
                dest: '<%= config.out %>'
                ext: '.css.gz'

    @registerTask 'default', ['build']

    @registerTask 'server', [
        'connect:livereload'
        'concurrent:server'
    ]

    @registerTask 'build', [
        'clean'
        'wintersmith:build'
        'copy'
        'useminPrepare'
        'concat'
        'cssmin'
        'uglify'
        'usemin'
        'htmlmin'
        'zopfli'
    ]
