module.exports = function (grunt) {
    grunt.loadNpmTasks("grunt-contrib-clean");
    grunt.loadNpmTasks("grunt-wintersmith");
    grunt.loadNpmTasks("grunt-zopfli");

    var config = {
        out: "dist",
        wintersmithPort: 3001
    };

    grunt.initConfig({
        config: config,

        clean: {
            server: [config.out]
        },

        wintersmith: {
            options: {
                config: "wintersmith.json"
            },
            build: {
                options: {
                    action: "build"
                }
            },
            preview: {
                options: {
                    action: "preview"
                }
            }
        },

        zopfli: {
            options: {
                report: true,
                iterations: 25
            },
            html: {
                expand: true,
                cwd: "<%= config.out %>",
                src: ["**/*.html"],
                dest: "<%= config.out %>",
                ext: ".html.gz"
            },
            js: {
                expand: true,
                cwd: "<%= config.out %>",
                src: ["**/*.js"],
                dest: "<%= config.out %>",
                ext: ".js.gz"
            },
            css: {
                expand: true,
                cwd: "<%= config.out %>",
                src: ["**/*.css"],
                dest: "<%= config.out %>",
                ext: ".css.gz"
            }
        }
    });

    grunt.registerTask("default", ["build"]);
    grunt.registerTask("watch", ["wintersmith:preview"]);
    grunt.registerTask("build", ["clean", "wintersmith:build", "zopfli"]);
};
