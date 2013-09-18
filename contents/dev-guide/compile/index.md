---
title: 'Compiling translations'
template: main.jade
---

# Compiling translations

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

Converting translated `.po` files into angular-compatible JavaScript files can be done automatically using the [`grunt-angular-gettext`](https://github.com/rubenv/grunt-angular-gettext) module.

<a href="/dev-guide/configure/" class="btn btn-primary">Next: Configuring angular-gettext</a>
