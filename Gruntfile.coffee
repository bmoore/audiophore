module.exports = ->
  @initConfig
    coffee:
      dev:
        expand: true
        flatten: false
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'lib'
        ext: '.js'
    express:
      options:
        script: 'app.js'
      dev:
        options:
          node_env: 'development'
      prod:
        options:
          node_env: 'production'
      test:
        options:
          node_env: 'test'
    mochaTest:
      test:
        src: ['test/**/*.coffee']
        options:
          compilers: 'coffee-script'
          reporter: 'spec'
          growl: true
    watch:
      coffee:
        files: ['src/**/*.coffee']
        tasks: ['coffee:dev']
      express:
        files: ['lib/**/*.js']
        tasks: ['express:dev'],
        options:
          spawn: false
      mocha:
        files: ['src/**/*.coffee', 'test/**/*.coffee']
        tasks: ['mochaTest']

  @loadNpmTasks 'grunt-mocha-test'
  @loadNpmTasks 'grunt-contrib-watch'
  @loadNpmTasks 'grunt-contrib-coffee'
  @loadNpmTasks 'grunt-express-server'

  @registerTask 'default', ['dev']
  @registerTask 'dev', ['coffee:dev', 'express:dev', 'watch:coffee', 'watch:express']
  @registerTask 'test', ['mochaTest', 'watch:mocha']
