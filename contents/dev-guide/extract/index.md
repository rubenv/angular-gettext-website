---
title: 'Extracting strings'
template: main.jade
---

# Extracting strings

Let's assume you've [annotated your application](/dev-guide/annotate/). It's now time to extract these strings into a translation template. This is a `.pot` file: a standard gettext template that lists all the strings that should be translated.

<img src="grunt.png" />

We will use a [Grunt](http://gruntjs.com/) task to do this. If you haven't used Grunt before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-angular-gettext --save-dev
```
Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```javascript
grunt.loadNpmTasks('grunt-angular-gettext');
```

This plugin actually provides two task types: `nggettext_extract` and `nggettext_compile`. We'll use the former right now. The latter will be used later on, to combine the translations with your application.

In your project's Gruntfile, add a section named `nggettext_extract` to the data object passed into `grunt.initConfig()`.

```javascript
grunt.initConfig({
  nggettext_extract: {
    pot: {
      'po/myApp.pot': ['src/views/*.html']
    },
  },
})
```

After running `grunt`, this will create a `.pot` file. You can open this with any normal text editor: verify that your annotated strings are in there.

<a href="/dev-guide/translate/" class="btn btn-primary">Next: Translating your strings</a>
