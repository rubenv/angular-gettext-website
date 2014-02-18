module.exports = (grunt) ->
    @loadNpmTasks('grunt-contrib-clean')
    @loadNpmTasks('grunt-wintersmith')
    @loadNpmTasks('grunt-zopfli')

    config =
        out: 'dist'
        wintersmithPort: 3001

    @initConfig
        config: config

        clean:
            server: [config.out]

        wintersmith:
            options:
                config: 'wintersmith.json'
            build:
                options:
                    action: 'build'
            preview:
                options:
                    action: 'preview'

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

    @registerTask 'watch', [
        'build'
        'wintersmith:preview'
    ]

    @registerTask 'build', [
        'clean'
        'wintersmith:build'
        'zopfli'
    ]
