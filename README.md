---
title: Producción gráfica de documentos acádemicos con Pandoc
authot: Lisandro Fernández
abstract: |
  Pandoc como entorno textutal de producción de documentos
  académicos. El texto plano beneficia a todos los usuarios, deben poder
  encontrar lo que necesitan, comprender lo que encuentran y usarlo para realizar
  tareas.
bibliography: referencias.bib
csl: ieee.csl
#csl: iso690-author-date-es.csl
#csl: apa-annotated-bibliography.csl
---

# Producción gráfica de documentos acádemicos con Pandoc

El presente documento propone el uso de Pandoc como entorno puramente textual
de producción gráfica de documentos académicos ó de alta complejidad @caleb.
El texto plano beneficia a todos los usuarios, deben poder encontrar lo que
necesitan, comprender lo que encuentran y usarlo para realizar tareas @das.

# Pandoc

Powerful, extensible, and feature-packed academic publishing toolkit. Build and
customize with Pandoc, utilize prebuilt a typesetting system (TeX) and
components, and bring projects to life with powerful filters.

## Generar PDF

```console
pandoc README.md --mathjax \
   -F pandoc-crossref -F mermaid-filter --citeproc \
   --template=plantilla --pdf-engine-opt=-shell-escape \
   -s --toc --toc-depth=3 --number-sections --columns=80 \
   -o README.pdf

# ó
make pdf

```


# Citas y referencias bibliogáficas 

Este es el ejemplo de referencia @moolenaar2000.

Una referencia con paginas [@knuth1986texbook, p.12-23].


# Gráficos y diagramas

```
~~~mermaid
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
~~~
```

~~~mermaid
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
~~~


~~~mermaid
gitGraph
   commit
   commit
   branch develop
   commit
   commit
   commit
   checkout main
   commit
   commit
~~~

~~~mermaid
sequenceDiagram
    participant dotcom
    participant iframe
    participant viewscreen
    dotcom->>iframe: loads html w/ iframe url
    iframe->>viewscreen: request template
    viewscreen->>iframe: html & javascript
    iframe->>dotcom: iframe ready
    dotcom->>iframe: set mermaid data on iframe
    iframe->>iframe: render mermaid
~~~



~~~mermaid
erDiagram

          CUSTOMER }|..|{ DELIVERY-ADDRESS : has

          CUSTOMER ||--o{ ORDER : places

          CUSTOMER ||--o{ INVOICE : "liable for"

          DELIVERY-ADDRESS ||--o{ ORDER : receives

          INVOICE ||--|{ ORDER : covers

          ORDER ||--|{ ORDER-ITEM : includes

          PRODUCT-CATEGORY ||--|{ PRODUCT : contains

          PRODUCT ||--o{ ORDER-ITEM : "ordered in"
~~~

~~~mermaid
gantt

    dateFormat  YYYY-MM-DD

    title       Adding GANTT diagram functionality to mermaid

    excludes    weekends

    %% (`excludes` accepts specific dates in YYYY-MM-DD format, days of the week ("sunday") or "weekends", but not the word "weekdays".)



    section A section

    Completed task            :done,    des1, 2014-01-06,2014-01-08

    Active task               :active,  des2, 2014-01-09, 3d

    Future task               :         des3, after des2, 5d

    Future task2              :         des4, after des3, 5d



    section Critical tasks

    Completed task in the critical line :crit, done, 2014-01-06,24h

    Implement parser and jison          :crit, done, after des1, 2d

    Create tests for parser             :crit, active, 3d

    Future task in critical line        :crit, 5d

    Create tests for renderer           :2d

    Add to mermaid                      :1d

    Functionality added                 :milestone, 2014-01-25, 0d



    section Documentation

    Describe gantt syntax               :active, a1, after des1, 3d

    Add gantt diagram to demo page      :after a1  , 20h

    Add another diagram to demo page    :doc1, after a1  , 48h



    section Last section

    Describe gantt syntax               :after doc1, 3d

    Add gantt diagram to demo page      :20h

    Add another diagram to demo page    :48h
~~~

~~~mermaid
journey

    title My working day

    section Go to work

      Make tea: 5: Me

      Go upstairs: 3: Me

      Do work: 1: Me, Cat

    section Go home

      Go downstairs: 5: Me

      Sit down: 5: Me
~~~

## MathJax

When $a \ne 0$, there are two solutions to \(ax^2 + bx + c = 0\) and they are
$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$



# Markdown 

This Markdown cheat sheet provides a quick overview of all the Markdown syntax
elements. It can’t cover every edge case, so if you need more information about
any of these elements, refer to the reference guides for 
[basic syntax](https://www.markdownguide.org/basic-syntax) and
[extended syntax](https://www.markdownguide.org/extended-syntax).

## Basic Syntax

These are the elements outlined in John Gruber’s original design document. All Markdown applications support these elements.

### Heading

# H1
## H2
### H3

### Bold

**bold text**

### Italic

*italicized text*

### Blockquote

> blockquote

### Ordered List

1. First item
2. Second item
3. Third item

### Unordered List

- First item
- Second item
- Third item

### Code

`code`

### Horizontal Rule

---

### Link

[Markdown Guide](https://www.markdownguide.org)

### Image

![alt text](https://www.markdownguide.org/assets/images/tux.png)

## Extended Syntax

These elements extend the basic syntax by adding additional features. Not all Markdown applications support these elements.

### Table

| Syntax | Description |
| ----------- | ----------- |
| Header | Title |
| Paragraph | Text |

### Fenced Code Block

https://pandoc.org/MANUAL.html#fenced-code-blocks

https://pandoc.org/MANUAL.html#syntax-highlighting


```console
pandoc --print-highlight-style pygments > my.theme
```

```json
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

### Footnote

Here's a sentence with a footnote. [^1]

[^1]: This is the footnote.

### Heading ID

### My Great Heading {#custom-id}

### Definition List

term
: definition

### Strikethrough

~~The world is flat.~~

### Task List

- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media

### Emoji

That is so funny! :joy:

(See also [Copying and Pasting Emoji](https://www.markdownguide.org/extended-syntax/#copying-and-pasting-emoji))

### Highlight

I need to highlight these ==very important words==.

### Subscript

H~2~O

### Superscript

X^2^


# Referencias
