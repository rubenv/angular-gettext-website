---
title: 'Getting started'
template: main.jade
---

# Getting started

Add angular-gettext to your project:

1. Grab the files, either by copying the files from the `dist` folder or (preferably) through bower:

   ```
   bower install --save angular-gettext
   ```

2. Include the angular-gettext source files in your app:
   
   ```html
   <script src="bower_components/angular-gettext/dist/angular-gettext.min.js"></script>
   ```
   
3. Add a dependency to angular-gettext in your Angular app:

   ```js
   angular.module('myApp', ['gettext']);
   ```
   
You can now start using the `translate` directive to mark strings as translatable.

Next steps:

* [Annotate strings with the `translate` directive](/dev-guide/annotate/).
* Extract strings from the source code.
* Translate strings
* Integrate translated strings back into the application.
* Set the correct language for translations.
* [Read the rest of the developer guide](/dev-guide/).
