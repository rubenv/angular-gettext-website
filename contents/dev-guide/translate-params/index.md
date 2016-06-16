---
title: 'Translate params'
template: main.jade
---

# Using translate params

Translate params feature gives you ability to use custom context parameters while interpolating.
This approach allows usage of angular filters, as well as custom logic, inside your translated messages without unnecessary impact on translations.
Let's take a look at simple example:

```html
<span translate translate-params-date="ctrl.modificationDate | date : 'yyyy-MM-dd HH:mm'">
    Last modified: {{date}} by {{ctrl.author}}.
</span>
```

When you extract such a string you will get:

```
Last modified: {{date}} by {{ctrl.author}}.
```

You can think of it as an alias for any expression you want to extract.
This is both easy to understand for translator and it doesn't depend on implementation detail (like date format).

## Interpolation context

Notice that in previous example we parameterized `modificationDate` variable but we've left `ctrl.author` as it was.
This is possible because every translate param extends current scope for interpolation rather then replace it.
Finally it's all up to you to decide if you want to extract all the expressions, only some of them or nothing at all.

```html
<span translate
      translate-params-date="ctrl.modificationDate | date : 'yyyy-MM-dd HH:mm'"
      translate-params-author="ctrl.author">
    Last modified: {{date}} by {{author}}.
</span>
```

## Multiple parameters

You can use as many translation params as you need with single string. Parameter declaration follows angulars convention so each param is declared as `translate-params-*`
where you can replace `*` with any snake-case variable name. Each parameter will then be available in your string under the same name written in camelCase.

```html
<span translate
      translate-params-date="ctrl.currentDate | date : 'yyyy-MM-dd'"
      translate-params-amount-usd="ctrl.amountUsd | currency : 'USD'"
      translate-params-amount-eur="ctrl.amountEur | currency : 'EUR'">
    Today's ({{date}} rate: {{amountUsd}} = {{amountEur}}.
</span>
```


## Benefits

* When you change implementation detail (e.g. date format) your translations won't break.

```html
<span translate translate-params-modification-date="ctrl.modificationDate | date : 'yyyy-MM-dd'">
    Last modified: {{modificationDate}}.
</span>
```

* You can make certain expressions more verbose for translator by making aliases for long name variables and expressions.

```html
<span translate
      translate-params-date="ctrl.modificationDate | date : 'yyyy-MM-dd'"
      translate-params-modifier="ctrl.personObject.fullName">
    Last modified: {{date}} by {{modifier}}.
</span>
```

* You can refactor your code base without updating translations file (e.g. when you decide to rename all your `ctrl` references to `vm`).

* You can avoid splitting your translations which causes loss of message context.

Here's one of previous examples without `translate-params`:

```html
<span translate>Today's</span>
<span> ({{ctrl.currentDate | date : 'yyyy-MM-dd'}}) </span>
<span translate>rate</span>
<span>: {{ctrl.amountUsd | currency : 'USD'}} = {{ctrl.amountEur | currency : 'EUR'}}</span>
```

As a result you receive two strings to translate: `Today's` and `rate`. With `translate-params` you would have received full sentence e.g.
`Today's ({{date}} rate: {{amountUsd}} = {{amountEur}}`.
