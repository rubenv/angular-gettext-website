---
title: 'Getting started'
template: main.jade
---

# Getting started

The main goal of angular-gettext is to make it extremely simple to use. Here's how it works, conceptually:

<div class="row" id="gettingstarted-steps">
    <div class="col-md-3 col-sm-6">
        <div class="step">1</div>
        Write your application as usual, in English.
        <br/>
        <br class="visible-md visible-lg"/>
        <img src="step1.png" />
    </div>
    <div class="col-md-3 col-sm-6">
        <div class="step">2</div>
        Annotate the strings that should be translated.
        <br/>
        <br class="visible-md visible-lg"/>
        <img src="step2.png" />
    </div>
    <div class="col-md-3 col-sm-6">
        <div class="step">3</div>
        Use the angular-gettext tools to extract those strings to a translation template.
        <br/>
        <br class="visible-lg"/>
        <img src="step3.png" />
    </div>
    <div class="col-md-3 col-sm-6">
        <div class="step">4</div>
        Once translated, use the same tools to embed the translations back into your application.
        <img src="step4.png" />
    </div>
</div>

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
