marked = require 'marked'
hljs = require 'highlight.js'

module.exports = (env, callback) ->
    marked.setOptions {
        highlight: (code, lang) ->
            return hljs.highlightAuto(code).value
    }
    callback()
