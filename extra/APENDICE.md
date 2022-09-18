---
title: 'APENDICE: Producción gráfica de documentos acádemicos con Pandoc'
authot: Lisandro Fernández
bibliography: referencias.bib
csl: ieee.csl
colorlinks: true
---


# Apendice

## Graficos y Diagramas

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


# Mardown example 

## Basic Syntax

These are the elements outlined in John Gruber’s original design document. All Markdown applications support these elements.
[basic syntax](https://www.markdownguide.org/basic-syntax) 

### Headings

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

### Enlaces

[Markdown Guide](https://www.markdownguide.org)

### Imagenes

<!---
# Chapter 1. Figures
{#sec:sec1}
--->

It is also possible to mix different references, like [@fig:figure1;
@tbl:table1;], which will be grouped in order they are specified.

<!---
You can even intermix this with regular citations, although it's not recommended: [@fig:figure1; @tbl:table1; @unprocessedCitation]
--->

You can also have custom chapter reference labels, like @sec:tables

Subfigures are supported, see [@fig:subfigures; @fig:subfigureB]

![alt text](https://www.markdownguide.org/assets/images/tux.png){#fig:figure1}

<div id="fig:subfigures">
![Subfigure a](https://www.markdownguide.org/assets/images/tux.png)
![Subfigure b]{#fig:subfigureB}

Subfigures caption
</div>

## Extended Syntax

These elements extend the basic syntax by adding additional features. Not all Markdown applications support these elements.
[extended syntax](https://www.markdownguide.org/extended-syntax).

### Tablas {#sec:tablas}

| Syntax      | Description |
| ----------- | ----------- |
| Header      | Title       |
| Paragraph   | Text        |


| Item         | Price | # In stock |
|--------------|:-----:|-----------:|
| Juicy Apples |  1.99 |        739 |
| Bananas      |  1.89 |          6 |

### Resaltado de sintaxis en bloques de código


es posible [Resaltado de sintaxis](https://pandoc.org/MANUAL.html#syntax-highlighting)
en
[Bloques de codigo delimitado](https://pandoc.org/MANUAL.html#fenced-code-blocks)


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

