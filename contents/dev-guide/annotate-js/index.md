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
      'po/template.pot': ['src/views/*.html', 'src/js/*.js']
    },
  },
})
```

## Translating directly in JavaScript.

You can inject `gettextCatalog` to fetch translated strings in JavaScript. Use the `getString` method for this.

```javascript
angular.module("myApp").controller("helloController", function (gettextCatalog) {
    var translated = gettextCatalog.getString("Hello");
});
```

Any string passed to `gettextCatalog.getString` is automatically marked for translation. In other words: no need to annotate these strings with `gettext()`. This also works for plurals:

```javascript
angular.module("myApp").controller("helloController", function (gettextCatalog) {
    var myString2 = gettextCatalog.getPlural(3, "Bird", "Birds");
});
```

It's not recommended to put translated strings on the scope. Use the [filter](/dev-guide/annotate/) for translations in views. The JavaScript API is meant for strings that are used in library code.

## Adding comments in JavaScript.

Similar to the [comments in HTML](/dev-guide/annotate/#comments), you can insert context comments in JavaScript using the triple forward slash syntax of `gettext`.

For example,

```javascript
angular.module("myApp").controller("helloController", function (gettext) {
    /// Verb
    var myString = gettext("File");
});
```
