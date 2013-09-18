---
title: 'Configuring'
template: main.jade
---

# Configuring angular-gettext

## Setting the language

Set the language by setting a language code on the catalog:

```javascript
angular.module('myApp').run(function (gettextCatalog) {
    gettextCatalog.currentLanguage = 'nl';
});
```

You can do this anywhere in your application, the use of a `run` block above is just an example.

## Highlighting untranslated strings

You can enable a debugging mode to clearly indicate untranslated strings:

```javascript
angular.module('myApp').run(function (gettextCatalog) {
    gettextCatalog.debug = true;
});
```

This will prepend `[MISSING]:` to each untranslated string.

<a href="/dev-guide/" class="btn btn-primary">All done! Back to the developer guide.</a>
