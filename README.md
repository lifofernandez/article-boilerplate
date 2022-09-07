---
institucion: 'Universidad Nacional de Tecnológica'
departamento: 'Escuela de Posgrado' 
carrera: 'Maestría en Ingeniería en Sistemas de Información'
director: 'Dra. Ma. Florencia Pollo Cattaneo'
programa: 'Herramientas para el desarrollo de Tesis 2021'
#subtitle: 'Herramientas para el desarrollo de Tesis 2021'
tutor: 'Florencia Pollo Cattaneo'
date:  'Octubre 2022'
place: 'Buenos Aires, Argentina'
tags: ['representación', 'texto plano', 'CLI', 'pandoc']
title: Producción gráfica de documentos acádemicos con Pandoc
author: Lisandro Fernández
bibliography: referencias.bib
csl: ieee.csl
abstract: >-

  Pandoc como entorno textutal de producción de documentos académicos.
  El texto llano beneficia a todos los usuarios, deben poder encontrar lo que necesitan,
  comprender lo que encuentran y usarlo para realizar tareas.'
#csl: iso690-author-date-es.csl
#csl: apa-annotated-bibliography.csl
colorlinks: true
---

# Producción gráfica de documentos acádemicos Pandoc


<!--- temática que abordará,
LaTeX A document preparation system
puramente textual
intro --->

Este proyecto describe el uso de
Pandoc como pieza central de un entorno
sin interfaz visual
de producción gráfica
de documentos académicos ó de complejidad considerable @caleb.

Con el sistema de composición tipográfica de alta calidad LaTeX entre bastidores;
incluye funciones diseñadas para la producción de documentación técnica y
científica.

LaTeX es el estándar de facto para la comunicación y publicación de documentos
científicos. 

<!--- 
# Justificación
Pandoc es a la los documentos gráficos lo que https://ffmpeg.org/about.html es para el video.
--->

El texto plano y legible beneficia a todos los usuarios, deben poder encontrar lo que
necesitan, comprender lo que encuentran y usarlo para realizar tareas @das.

<!--- 
junto con su justificación y
enconbineta
--->

## Pandoc

<!---
Pandoc incluye una biblioteca Haskell y un programa de línea de comandos
independiente.

La biblioteca incluye módulos separados para cada formato de
entrada y salida, por lo que para añadir un nuevo formato de entrada o salida
sólo hay que añadir un nuevo módulo.
--->

Pandoc es una biblioteca Haskell para convertir de un formato de markUp a
otro, y una herramienta de línea de comandos que utiliza esta biblioteca.

Pandoc puede convertir entre numerosos formatos de marcado y de procesamiento
de textos, incluyendo, pero sin limitarse a, varios sabores de Markdown, HTML,
LaTeX y Word docx.

Hay muchas maneras de personalizar pandoc para que se adapte a sus necesidades,
incluyendo un sistema de plantillas y un potente sistema para escribir filtros.

Pandoc es software libre, publicado bajo la GPL. Copyright 2006-2022 John MacFarlane.

## Texto Plano

De los beneficios que trabajar con texto plano habilita
se resalta la accesibilidad y la posbilidad de 
producir documentos graficos de la misma manera que se produce softweare
intcluirlo en en un pipeline de desarrollo de software

y viceversa es un learn by example para escritores/editores
puden adquirir capacidade flujo de trabajo 

se señala comom futuras lineas dse trabajo es
facil mente incluible en opperacioones remotas automaticas.

<!---
Powerful, extensible, and feature-packed academic publishing toolkit. Build and
customize with Pandoc, utilize prebuilt a typesetting system (TeX) and
components, and bring projects to life with powerful filters.
--->

<!---
Citas y referencias bibliogáficas 
BibLATEX – Sophisticated Bibliographies in LATEX
--->

### Markdown

Lo que distingue a Markdown de muchas otras sintaxis de marcado ligero,
que suelen ser más fáciles de escribir,
es su legibilidad.

Como escribe Gruber:
El objetivo primordial del diseño de la sintaxis de formato de Markdown es
hacerla lo más legible posible. La idea es que un documento con formato Markdown
sea publicable tal cual, como texto plano, sin que parezca que ha sido marcado
con etiquetas o instrucciones de formato.
(http://daringfireball.net/projects/markdown/)

https://github.github.com/gfm/

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


## Integración

pandoc funciona como la piaza central que integra

mermaidjs
Mermaid le permite crear diagramas y visualizaciones utilizando texto y código.

Se trata de una herramienta de diagramación y graficación basada en JavaScript
que renderiza definiciones de texto inspiradas en Markdown para crear y
modificar diagramas de forma dinámica.

LaTeX is a high-quality typesetting system; it includes features designed for
the production of technical and scientific documentation. LaTeX is the de facto
standard for the communication and publication of scientific documents. LaTeX
is available as free software.

Pandoc incluye un potente sistema de citas y bibliografías automáticas.

Esto significa que puede escribir una cita como véase @moolenaar2000, también
[@knuth1986texbook p.3-9] y pandoc la convertirá en una cita con el formato
adecuado utilizando cualquiera de los cientos de estilos CSL (incluyendo
estilos de nota al pie, estilos numéricos y estilos autor-fecha), y añadirá una
bibliografía con el formato adecuado al final del documento.

Las matemáticas de LaTeX (e incluso las macros) pueden utilizarse en los
documentos de markdown.
Las matemáticas de LaTeX se convierten (según lo requiera el formato de
salida) en unicode, objetos de ecuación nativos de Word, MathML o roff eqn.


### Gráficos y diagramas

Mermaid es una herramienta de diagramación y gráficos basada en JavaScript que
utiliza definiciones de texto inspiradas en Markdown y un renderizador para
crear y modificar diagramas complejos. El objetivo principal de Mermaid es
ayudar a que la documentación se ponga al día con el desarrollo.

La diagramación y la documentación cuestan un tiempo precioso a los
desarrolladores y quedan obsoletas rápidamente. Pero no tener diagramas o
documentación arruina la productividad y perjudica el aprendizaje de la
organización.

Mermaid aborda este problema permitiendo a los usuarios crear diagramas
fácilmente modificables, que también pueden formar parte de los scripts de
producción (y otras piezas de código).

Mermaid permite incluso a los no programadores crear fácilmente diagramas
detallados y a través del Mermaid Live Editor.

Tiene tutoriales en vídeo. Utilice Mermaid con sus aplicaciones favoritas,
consulte la lista de integraciones y usos de Mermaid.

<!--- 
Además, adjunte un cronograma de presentaciones intermedias,
considerando que se debe realizar, como mínimo,
una entrega intermedia antes de la entrega final.
--->

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


### BibLATEX - Bibliografías sofisticadas en LATEX

Los datos bibliográficos pueden estar en formato BibTeX, BibLaTeX, CSL JSON o
CSL YAML. Las citas funcionan en todos los formatos de salida.

BibLATEX es una reimplementación completa de las facilidades bibliográficas
proporcionadas por LATEX. El formato de la bibliografía está totalmente
controlado por las macros de LATEX, y un conocimiento práctico de LATEX debería
ser suficiente para diseñar nuevos estilos de bibliografía y citación.

<---!s
BibLATEX
utiliza su propio programa de respaldo de datos llamado "biber" para leer y
procesar los datos bibliográficos. 
--->

Con biber BibLATEX tiene muchas características que rivalizan o superan a otros
sistemas bibliográficos.

#### CLS

El Lenguaje de Estilo de Citación (CSL) es un formato basado en XML para
describir el formato de citas, notas y bibliografías, ofreciendo:

https://docs.citationstyles.org/en/stable/primer.html#what-is-csl

Para obtener más documentación, el esquema CSL, los estilos y las
localizaciones, visite la página web del proyecto proyecto CSL,
citationstyles.org.

Si alguna vez has escrito un trabajo de investigación, habrás trabajo de
investigación, probablemente has incluido referencias a otros trabajos. La
página web referencias son importantes en la comunicación académica, ya que
proporcionan la atribución y enlazan la atribución y enlazan la investigación
publicada.
Sin embargo, formatear manualmente
las referencias puede llevar mucho tiempo, especialmente cuando se trata de
múltiples múltiples revistas que tienen su propio estilo de citación.

Por suerte, el software de gestión de referencias puede ayudar. Programas como
Zotero, Mendeley y Papers no sólo te ayudan a gestionar tu biblioteca de
investigación, sino que también pueden generar automáticamente citas y
bibliografías. Pero para formatear las referencias en el estilo deseado, estos
programas necesitan descripciones de cada estilo de citación en un lenguaje que
el ordenador pueda entender. Como habrás adivinado, el Lenguaje de Estilos de
Citación (LEC) es ese lenguaje

https://docs.citationstyles.org/en/stable/specification.html

### MathJax

Se proporcionan varios métodos diferentes para representar las matemáticas en
HTML, incluyendo MathJax y la traducción a MathML.

Cuando $a \ne 0$, hay dos soluciones a \(ax^2 + bx + c = 0\) las cuales son
$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$

**Transformación de contenidos:** Logotipo estilizado de EpubMathJax proporciona
herramientas para transformar sus contenidos de fuentes impresas tradicionales
en contenidos web y ePubs modernos y accesibles.

**Tipografía de alta calidad:** MathJax utiliza CSS con fuentes web o SVG, en
lugar de de imágenes de mapa de bits o Flash, por lo que las ecuaciones se
escalan con el texto circundante en todos los niveles de zoom.

**Modular la entrada y la salida:** MathJax es altamente modular en la entrada y
la salida. Utiliza MathML, TeX, y ASCIImath como entrada y produce HTML+CSS,
SVG, o MathML como salida.

**Accesible y reutilizable:** MathJax funciona con lectores de pantalla y proporciona
zoom de expresión y exploración interactiva. También puede copiar ecuaciones en
Office, LaTeX, wikis y otro software.

# Resultados

El producto de este proyecto son una conjunto de diferentes piezas de software
integradas  el repositorio del codigo y andamiaje necesario para reproducir
estem proyecto esto incluye:

- configuraciones
- estructura
- filtros 
- cls
- plantilla latex
- resaltado de codigo
- configuraciones para operaciones remotas

## Generar Portable Document Format (PDF)

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

## Ver Apendice

apendice.pdf

# Conclusion

cls
- Un formato abierto
- Estilos compactos y robustos
- Amplia compatibilidad con los requisitos de estilo
- Localización automática de estilos
- Infraestructura para la distribución y actualización de estilos
- Miles de estilos disponibles gratuitamente (con licencia Creative Commons BY-SA)

Por bibtext algunos:

- Soporte completo de Unicode
- Ordenación altamente personalizable mediante el Algoritmo de Cotejo Unicode + adaptación de CLDR
- Etiquetas de bibliografía altamente personalizables
- Compleja modificación de datos sobre la marcha basada en macros sin cambiar las fuentes de datos
- Un modo de herramienta para transformar las fuentes de datos bibliográficos
- Múltiples bibliografías y listas de información bibliográfica en el mismo documento con diferente ordenación
- Reglas de herencia de fuentes de datos altamente personalizables
- Soporte de poliglosia y babel para el cambio automático de idioma de las entradas y citas bibliográficas
- Recodificación automática de datos bibliográficos (UTF-9 -> latin1, macros LATEX -> UTF-8, etc.)
- Fuentes de datos remotas
- Sistema de desambiguación automática de nombres y listas de nombres altamente sofisticado
- Modelo de datos altamente personalizable para que los usuarios puedan definir sus propios tipos de datos bibliográficos
- Validación de los datos bibliográficos con respecto a un modelo de datos
- Bibligrafías subdivididas y/o filtradas, bibliografías por capítulo, sección, etc.


<!---
Tenga en cuenta que en la entrega final, deberá realizar una conclusión donde se
tendrán que detallar las futuras líneas de trabajo.
--->

contar lo que se hizo

## Futuras lineas de trabajo

### Build remoto

[![Build remoto](https://github.com/lifofernandez/thesis-sandbox/actions/workflows/main.yml/badge.svg)](https://github.com/lifofernandez/thesis-sandbox/actions/workflows/main.yml)

## Debilidades

Dado que la representación intermedia de un documento por parte de pandoc es
menos expresiva que muchos de los formatos entre los que convierte, no hay que
esperar conversiones perfectas entre todos los formatos. Pandoc intenta
conservar los elementos estructurales de un documento, pero no los detalles de
formato, como el tamaño de los márgenes. Y algunos elementos del documento,
como las tablas complejas, pueden no encajar en el modelo de documento simple
de pandoc. Mientras que las conversiones del Markdown de pandoc a todos los
formatos aspiran a ser perfectas, las conversiones de formatos más expresivos
que el Markdown de pandoc pueden tener pérdidas.

HTML vs PDF


# Referencias

<!---
Indique la bibliografía que utilizará a lo largo del desarrollo del trabajo.
--->
