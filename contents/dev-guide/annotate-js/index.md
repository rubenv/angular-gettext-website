---
title: 'Annotating JavaScript source'
template: main.jade
---

# Marking strings in JavaScript code as translatable.

If you have text that should be translated in your JavaScript code, wrap it with a call to a function named `gettext`. This module provides an injectable function to do so:

```javascript
angular.module("myApp").controller("helloController", function (gettext) {
    var myString = gettext("Hello");
});
```

The `Hello` string will be added to your `.pot` file using the code above.

Be sure to update your Grunt task to include the JavaScript files:

```javascript
grunt.initConfig({
  nggettext_extract: {
    pot: {
      'po/myApp.pot': ['src/views/*.html', 'src/js/*.js']
    },
  },
})
```