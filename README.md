---
title: Producción gráfica de documentos acádemicos con Pandoc
authot: Lisandro Fernández
abstract: |
  Pandoc como entorno textual de producción de documentos
  académicos.
  El texto plano beneficia a todos los usuarios, deben poder
  encontrar lo que necesitan, comprender lo que encuentran y usarlo para realizar
  tareas.
bibliography: referencias.bib
csl: ieee.csl
#csl: iso690-author-date-es.csl
#csl: apa-annotated-bibliography.csl
---

# Producción gráfica de documentos acádemicos con Pandoc

Este proyecto describe el uso de
Pandoc como pieza central de un entorno puramente textual
de producción gráfica
de documentos académicos ó de complejidad considerable @caleb.

Con el sistema de composición tipográfica de alta calidad LaTeX entre bastidores;
incluye funciones diseñadas para la producción de documentación técnica y
científica.

<!--- 
[]:LaTeX es el estándar de facto para la comunicación y publicación de documentos
[]:científicos. 
--->

## Pandoc

Pandoc es una biblioteca Haskell para convertir de un formato de markUp a
otro, y una herramienta de línea de comandos que utiliza esta biblioteca.

Pandoc puede convertir entre numerosos formatos de marcado y de procesamiento
de textos, incluyendo, pero sin limitarse a, varios sabores de Markdown, HTML,
LaTeX y Word docx.


<!---
Para ver la lista completa de formatos de entrada y salida,
consulte las opciones --from y --to más abajo.
Pandoc también puede producir
una salida en formato PDF: consulte la sección de creación de un PDF, más
abajo.

Pandoc incluye una biblioteca Haskell y un programa de línea de comandos
independiente.
La biblioteca incluye módulos separados para cada formato de
entrada y salida, por lo que para añadir un nuevo formato de entrada o salida
sólo hay que añadir un nuevo módulo.
--->


Pandoc es software libre, publicado bajo la GPL. Copyright 2006-2022 John MacFarlane.


### Generar este documento

Un ejemplo de como utilizar estas herramientas es
el mismo repositorio 
con el cual es

Ejecutando el siguiente comando se obtiene un documento grafico en formato PDF 
a partir del LINK de este mismo texto cuya fuente es el markdown

```console
pandoc README.md --mathjax \
   -F pandoc-crossref -F mermaid-filter --citeproc \
   --template=plantilla --pdf-engine-opt=-shell-escape \
   -s --toc --toc-depth=3 --number-sections --columns=80 \
   -o README.pdf
```

## Texto plano

El texto plano beneficia a todos los usuarios, deben poder encontrar lo que
necesitan, comprender lo que encuentran y usarlo para realizar tareas @das.

<!---
[]:Powerful, extensible, and feature-packed academic publishing toolkit. Build and
[]:customize with Pandoc, utilize prebuilt a typesetting system (TeX) and
[]:components, and bring projects to life with powerful filters.
--->


<!---
[]:# Citas y referencias bibliogáficas 
[]:# BibLATEX – Sophisticated Bibliographies in LATEX
--->

## BibLATEX - Bibliografías sofisticadas en LATEX

Pandoc incluye un potente sistema de citas y bibliografías automáticas. Esto
significa que puede escribir una cita como

[véase @doe99, pp. 33-35; también @smith04, cap. 1]

y pandoc la convertirá en una cita con el formato adecuado utilizando
cualquiera de los cientos de estilos CSL (incluyendo estilos de nota al pie,
estilos numéricos y estilos autor-fecha), y añadirá una bibliografía con el
formato adecuado al final del documento. Los datos bibliográficos pueden estar
en formato BibTeX, BibLaTeX, CSL JSON o CSL YAML. Las citas funcionan en todos
los formatos de salida.

Este es el ejemplo de referencia @moolenaar2000.

Una referencia con paginas [@knuth1986texbook, p.12-23].

## MathJax

Las matemáticas de LaTeX (e incluso las macros) pueden utilizarse en los
documentos de markdown. Se proporcionan varios métodos diferentes para
representar las matemáticas en HTML, incluyendo MathJax y la traducción a
MathML. Las matemáticas de LaTeX se convierten (según lo requiera el formato de
salida) en unicode, objetos de ecuación nativos de Word, MathML o roff eqn.

When $a \ne 0$, there are two solutions to \(ax^2 + bx + c = 0\) and they are
$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$

## Gráficos y diagramas

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


# Markdown 

La versión mejorada de Markdown de Pandoc incluye sintaxis para tablas, listas
de definiciones, bloques de metadatos, notas a pie de página, citas,
matemáticas y mucho más. Véase más abajo en Markdown de Pandoc.

Pandoc comprende una serie de extensiones útiles de la sintaxis de markdown,
como los metadatos del documento (título, autor, fecha); las notas al pie; las
tablas; las listas de definiciones; los superíndices y subíndices; la
tachadura; las listas ordenadas mejoradas (el número de inicio y el estilo de
numeración son significativos); las listas de ejemplos en ejecución; los
bloques de código delimitados con resaltado de sintaxis; las comillas
inteligentes, los guiones y las elipses; el markdown dentro de bloques HTML; y
el LaTeX en línea. Si se desea una compatibilidad estricta con markdown, todas
estas extensiones pueden desactivarse.

<!---
Pandoc tiene un diseño modular: consta de un conjunto de lectores, que analizan
el texto en un formato determinado y producen una representación nativa del
documento (un árbol sintáctico abstracto o AST), y un conjunto de escritores,
que convierten esta representación nativa en un formato de destino. Así, para
añadir un formato de entrada o de salida basta con añadir un lector o un
escritor. Los usuarios también pueden ejecutar filtros personalizados de pandoc
para modificar el AST intermedio.
--->

Dado que la representación intermedia de un documento por parte de pandoc es
menos expresiva que muchos de los formatos entre los que convierte, no hay que
esperar conversiones perfectas entre todos los formatos. Pandoc intenta
conservar los elementos estructurales de un documento, pero no los detalles de
formato, como el tamaño de los márgenes. Y algunos elementos del documento,
como las tablas complejas, pueden no encajar en el modelo de documento simple
de pandoc. Mientras que las conversiones del Markdown de pandoc a todos los
formatos aspiran a ser perfectas, las conversiones de formatos más expresivos
que el Markdown de pandoc pueden tener pérdidas.

Hay muchas maneras de personalizar pandoc para que se adapte a sus necesidades,
incluyendo un sistema de plantillas y un potente sistema para escribir filtros.

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

### Link

[Markdown Guide](https://www.markdownguide.org)

### Image

![alt text](https://www.markdownguide.org/assets/images/tux.png)

## Extended Syntax

These elements extend the basic syntax by adding additional features. Not all Markdown applications support these elements.
[extended syntax](https://www.markdownguide.org/extended-syntax).

### Table

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
