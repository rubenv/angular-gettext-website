---
title: 'Settings strings manually'
template: main.jade
---

# Setting strings manually

You can set translated strings by injecting the `gettextCatalog` and using the `setStrings` method.

As an example, you may have the following code in your application:

```javascript
angular.module('myApp').run(function (gettextCatalog) {
    // Load the strings automatically during initialization.
    gettextCatalog.setStrings('nl', {
        'Hello': 'Hallo',
        'One boat': ['Een boot', '{{count}} boats']
    });
});
```

The `setStrings` method accepts two parameters:

1. `language`: A language code.
2. `strings`: A dictionary of strings. The format of this dictionary is:

   * Keys: Singular English strings (as defined in the source files)
   * Values: Either a single string for signular-only strings or an array of plural forms.

Converting translated `.po` files into angular-compatible JavaScript files can be done automatically using the [`grunt-angular-gettext`](/dev-guide/compile/) module ([instructions on how to do this](/dev-guide/compile/)).
