---
title: 'Annotating markup'
template: main.jade
---

# Using the `translate` directive

Strings are marked as translatable using the `translate` directive. Here's a simple example:

```xml
<h1 translate>Hello!</h1>
```

This div will automatically be translated using the translated strings (which we'll define later on). For instance, in Dutch, it might read `Hallo!`.

## Plurals

Plural strings can be annotated using two extra attributes: `translate-n` and `translate-plural`:

```xml
 <div translate translate-n="count" translate-plural="{{count}} boats">One boat</div>
```

The general format is:

```xml
 <div translate translate-n="COUNTEXPR" translate-plural="PLURALSTR">SINGULARSTR</div>
```

Depending on the value of `COUNTEXPR`, either the singular string or the plural string will be selected.

## Interpolation

Full interpolation support is available in translated strings, so the following will work as expected:

```xml
 <div translate>Hello {{name}}!</div>
```

## Attributes

Sometimes it's not an option to use an attribute (e.g. when you want to annotate an attribute value). There's a `translate` filter available for this purpose.

```xml
 <input type="text" placeholder="{{'Username'|translate}}" />
```

This filter does not support plural strings.

<a href="/dev-guide/extract/" class="btn btn-primary">Next: Extracting strings</a>
