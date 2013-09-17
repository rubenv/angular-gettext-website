---
title: 'Getting started'
template: main.jade
---

# Getting started

The main goal of angular-gettext is to make it extremely simple to use. Here's how it works, conceptually:

1. Write your application as usual, in English.
2. Annotate the strings that should be translated.
3. Use the angular-gettext tools to extract those strings to a translation template.
4. Once translated, use the same tools to embed the translations back into your application.

## Adding angular-gettext to your project

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
* [Extract strings from the source code](/dev-guide/extract/).
* [Translate strings](/dev-guide/translate/).
* [Integrate translated strings back into the application](/dev-guide/compile/).
* [Set the correct language for translations](/dev-guide/configure/).
* [Read the rest of the developer guide](/dev-guide/).
