---
title: 'angular-gettext API'
template: main.jade
---

# gettextCatalog service
Usage:

```js
angular.module("myApp").controller("MyCtrl", function ($scope, gettextCatalog) {
    // Do things with gettextCatalog
});
```

## Fields

* `debug` (default: `false`): Whether or not to prefix untranslated strings with `[MISSING]: `.
* `strings`: An object of loaded translation strings. Shouldn't be used directly.
* `baseLanguage`: The default language, in which you're application is written. This defaults to English and it's generally a bad idea to use anything else: if your language has different pluralization rules you'll end up with incorrect translations. **Deprecated**
* `currentLanguage`: The current language. **Warning:** Do not set this field directly, use the `setCurrentLanguage` method.

## Methods

### `setCurrentLanguage(lang)`
Sets the current language and makes sure that all translations get updated correctly.

### `setStrings(language, strings)`
Processes an object of string definitions. [More details here.](/dev-guide/manual-setstrings/)

### `getStringForm(string, n)`
Get the correct pluralized (but untranslated) string for the value of `n`.

### `getString(string, context)`
Translate a string with the given context. Uses Angular.JS interpolation, so something like this will do what you expect:

```js
var hello = gettextCatalog.getString("Hello {{name}}!", { name: "Ruben" });
// var hello will be "Hallo Ruben!" in Dutch.
```

The `context` parameter is optional: pass `null` (or don't pass anything) if you're not using it: this skips interpolation and is a lot faster.

### `getPlural(n, string, stringPlural, context)`
Translate a plural string with the given context.

### `loadRemote(url)`
Load a set of translation strings from a given URL. This should be a JSON catalog generated with `grunt-angular-gettext`.

# translate directive
See [Using the `translate` directive](/dev-guide/annotate/).

# translate filter
See [Using the `translate` filter](/dev-guide/annotate/#attributes).
