# Producción académica con Pandoc

Este proyecto propone la confección de escritos académicos o de complejidad
considerable, sin la necesidad de interfaces gráficas. Promover el uso formatos
no codificados o de alta legibilidad beneficia a todos los usuarios, que deben
poder encontrar facilmente lo que necesitan, comprender lo que encuentran y
usarlo para realizar tareas @caleb.

El objetivo de este trabajo es un entorno de autoría textos en el cual _Pandoc_
es la pieza central que actúa como interprete del sistema de composición
tipográfica y preparación de documentos de alta calidad _LaTeX_, estándar de
facto para la comunicación y publicación de documentos académicos [@macfarlane;
@knuth1986texbook].

Mediante integraciones sencillas se consigue una infraestructura robusta con
funciones diseñadas para gestionar exposición de extensas biblografías,
múltiples citas y referencias a diferentes fuentes, notación matemática,
generación gráficos y diagramas, entre otras capacidades avanzadas, necesarias
en la producción de documentación técnica y científica, todo el proceso es
controlado mediante linea de comandos sin depender de interfaces captivas,
promoviendo la transparencia, claridad y reproducción [@gancarz2003linux
p.88-97].

## Interfaz de usuario textual
 
La principal característica de las herramientas y formatos involucrados en este
proyecto es que están preparadas para interpretar instrucciones textuales. De
los beneficios que trabajar de este modo habilita se destacan cuestiones de
accesibilidad y la posibilidad de gestionar la exposición de conocimiento de la
misma manera que se produce software [@hunt1999pragmatic; @das;
@moolenaar2000].

Separar contenido, referencias, estilos y procesos, en un contexto de
organizaciones con actividades relacionadas a la publicación, donde la
complejidad no solo reside en los documentos sino que también en la tarea, dado
que involucra a múltiples agentes (autores, correctores y editores, entre
otros) y devuelve el control de estilo a la organización, garantizando unidad
en estética en la composición gráfica resultante de diversos productos.

Esta formación introducirá en la fuerza de trabajo una nueva capacidad con una
inclinación arraigada y fundamental hacia la investigación reproducible
@Baumer_Udwin_2015. El lenguaje sigue siendo la mejor interfaz que se ha
utilizado. Es sencillo, componible y ubicuo, está disponible en
todos los sistemas. Es fácil de mantener, automatizar y ampliar @scale.

## Pandoc

_Pandoc_ es una biblioteca de _Haskell_  para convertir de un formato de
marcado ligero a otro, y una herramienta de línea de comandos que accede a las
funciones en esta biblioteca para convertir entre formatos y procesar textos
@marlow2010haskell.

El diseño de _Pandoc_ es modular, esta conformado por un conjunto de lectores,
que analizan el texto en un formato determinado y producen una representación
nativa del documento en un árbol de sintaxis abstracta (Abstract Syntax Tree -
AST) y un conjunto de escritores, que convierten esta representación a un
formato de destino [@ASTImpl2003; @Neamtiu05understandingsource].

## Markdown

_Markdown_ es una sintaxis  de formato de texto plano.  El formato de texto es
el marcado que se aplica a un texto simple para añadir datos de estilo más allá
de la semántica de los elementos: colores, estilos, pesos tamaño, y
características especiales (como hipervínculos).  Al texto resultante se le
conoce como texto formateado, texto con estilos, o texto enriquecido @gruber.

Lo que distingue a _Markdown_ de muchas otras sintaxis de marcado ligero, es su
énfasis en la legibilidad.  El objetivo prinsipal del diseño de la sintaxis de
formato de _Markdown_ es hacerla lo más legible posible. La idea es que un
documento con formato _Markdown_ sea publicable tal cual, como texto plano, sin
que parezca que ha sido marcado con etiquetas o instrucciones de formato.

_Pandoc_ comprende una serie de extensiones útiles de la sintaxis de markdown,
como los metadatos del documento (título, autor, fecha); las notas al pie; las
tablas; las listas de definiciones; los superíndices y subíndices; la
tachadura; las listas ordenadas mejoradas (el número de inicio y el estilo de
numeración son significativos); las listas de ejemplos en ejecución; los
bloques de código de software delimitados con resaltado de sintaxis; las
comillas inteligentes, los guiones y las elipses; el _Markdown_ dentro de
bloques HTML; y el _LaTeX_ en línea.

# Metodotología 

En este capitulo se describe el método propuesto y utilizado para producir el
presente documento.

Primero se describe la integración de diferentes piezas de software, algunas
distribuidas junto con _Pandoc_ y otras aportes independientes de la comunidad.
Seguido se presenta sistema de diagramación y generación gráficos que permite crear
visualizaciones utilizando texto y código. Luego se expone el sistema citas
y referencias bibliográficas. Para concluir este capitulo se exponen cuestiones
relacionadas a la notación matemática.

## Integración

El diseño de _Pandoc_ es modular: consta de un conjunto de lectores, que
analizan el texto en un formato determinado y producen una representación
nativa del documento (Abstract Sintactic Three - AST), y un conjunto de
registros, que convierten esta representación nativa en un formato de destino.

Ademas, incluye un potente sistema para escribir filtros, para incluir un
formato de entrada o de salida basta con añadir un lector o un escritor.
También es posible crear filtros personalizados para modificar el AST
intermedio.

De los múltiples maneras de personalizar _Pandoc_ para que se adapte a los
requisitos de cada proyecto, se destaca el uso de un sistema de plantillas, un
potente sistema de citas y bibliografías automáticas y la generación de
gráficos mediante código.

## Gráficos y diagramas

La diagramación conlleva tiempo a los investigadores y desarrolladores, los
gráficos producidos suelen quedar obsoletos rápidamente. Pero no tener
diagramas o documentación arruina la productividad y perjudica el aprendizaje
de la organización.

Se destina esta tarea a _pandoc-plot_, un filtro de _Pandoc_ para generar
figuras a partir de bloques de código en los documentos @pandocplot.
Al actual, _pandoc-plot_ es compatible con el siguiente conjunto de
herramientas de trazado: matplotlib; _plotly_python, plotly_r, matlabplot,
mathplot, octaveplot, ggplot2, gnuplot, graphviz, bokeh, plotsjl_ y _plantuml_.

En este trabajo se implementan dos de ellas, _Matplotlib_ y _PlantUML_
[@matplotlib; @plantuml]. En los apartados a continuación se exponen gráficos
generados con dichas herramientas partir del condigo incluido en el fichero
_Markdown_ original, para que demostrar las posibilidades de esta herramienta.


### Matplotlib

```{.matplotlib }
import numpy as np
import matplotlib.pyplot as plt

theta = np.arange(0, 2 * np.pi, .01)[1:]
r = theta - np.pi
positive_r = r >= 0

fig, (ax1, ax2) = plt.subplots(ncols=2, figsize=(10, 5), subplot_kw={'polar': True})

for ax in (ax1, ax2):
  if ax == ax2:
    # change negative r values to positive, rotating theta by 180º
    theta = np.where(r >= 0, theta, theta + np.pi)
    r = np.abs(r)
  ax.plot(theta[positive_r], r[positive_r], color='skyblue')
  ax.plot(theta[~positive_r], r[~positive_r], color='tomato')
ax1.set_title('Default: negative $r$\non same side as $theta$')
ax2.set_title('Negative $r$ on other side')

```

```{.matplotlib}
import numpy as np
import matplotlib.pyplot as plt

r = np.arange(0, 2, 0.01)
theta = 2 * np.pi * r
fig, ax = plt.subplots(
  subplot_kw = {'projection': 'polar'} 
)
ax.plot(theta, r)
ax.set_rticks([0.5, 1, 1.5, 2])
ax.grid(True)
plt.title('This is an example figure')
```

```{.matplotlib}
import numpy as np
import matplotlib.pyplot as plt

np.random.seed(23)

# Compute areas and colors
N = 150
r = 2 * np.random.rand(N)
theta = 2 * np.pi * np.random.rand(N)
area = 200 * r**2
colors = theta

fig = plt.figure()
ax = fig.add_subplot(111, projection='polar')
c = ax.scatter(theta, r, c=colors, s=area, cmap='hsv', alpha=0.75)
plt.title('This is an example figure')
```

### PlantUML

```{.plantuml}
@startuml
!theme plain

package "Some Group" {
  HTTP - [First Component]
  [Another Component]
}

node "Other Groups" {
  FTP - [Second Component]
  [First Component] --> FTP
}

cloud {
  [Example 1]
}


database "MySql" {
  folder "This is my folder" {
    [Folder 3]
  }
  frame "Foo" {
    [Frame 4]
  }
}


[Another Component] --> [Example 1]
[Example 1] --> [Folder 3]
'[Folder 3] --> [Frame 4]

@enduml
```

```{.plantuml}
@startuml
robust "DNS Resolver" as DNS
robust "Web Browser" as WB
concise "Web User" as WU

@0
WU is Idle
WB is Idle
DNS is Idle

@+100
WU -> WB : URL
WU is Waiting
WB is Processing

@+200
WB is Waiting
WB -> DNS@+50 : Resolve URL

@+100
DNS is Processing

@+300
DNS is Idle
@enduml
```

<!---
Citas y referencias bibliogáficas 
BibLATEX – Sophisticated Bibliographies in LATEX
--->
## Citas, referencias y bibliografía

Para citar, enlazar a referencias y exposición de bibliografía consultada se
emplea _BibLaTeX_, una herramienta y un formato de archivo que se utilizan para
describir y procesar listas de referencias, sobre todo en combinación con
documentos _LaTeX_.

Los datos bibliográficos de entrada pueden estar en formato BibTeX, BibLaTeX,
CSL JSON o CSL YAML. Las citas funcionan en todos los formatos de salida.

### BibLaTeX 

_BibLaTeX_ una reimplementación completa de las facilidades bibliográficas
proporcionadas por _LaTeX_. Esto significa, por ejemplo que al declarar una
referencia como `@moolenaar2000` o también `[@knuth1986texbook p.3-9]` _Pandoc_
las convertirá en una cita con el formato predefinido, utilizando cualquiera de
los cientos de Lenguajes de Estilo de Cita (Citation Style Language - CSL),
incluyendo estilos de nota al pie, numéricos y autoría, fuente y fechas; y
añadirá a la referencia bibliografía con el formato adecuado al final del
documento.

El formato de la bibliografía está totalmente controlado por las macros de
_LaTeX_, y un conocimiento práctico de _LaTeX_ debería ser suficiente para
diseñar nuevos estilos de bibliografía y citación. _BibLaTeX_ tiene muchas
características que rivalizan o superan a otros sistemas bibliográficos.

### Lenguaje de Estilo de Citación

La referencias son una pieza clave en la comunicación académica, ya que
proporcionan la atribución, enlazan referentes.  Sin embargo, formatear
manualmente las referencias puede llevar mucho tiempo, especialmente cuando se
trata de múltiples publicaciones con diferentes estilos de citación.

El software de gestión de referencias no sólo ayuda a gestionar bibliotecas de
investigación, sino que también pueden generar automáticamente citas y
bibliografías. Pero para formatear las referencias en el estilo deseado, estos
programas necesitan descripciones de cada estilo de citación en un lenguaje que
el ordenador pueda entender, el Lenguaje de Estilo de Citación (Citation Style
Languaje - CSL) es el descriptor utilizado es un formato basado en XML para
describir el formato de citas, notas y bibliografías @zellecitation.

### Pandoc crossref

_pandoc-crossref_ es un filtro de para numerar figuras, ecuaciones, tablas y
referencias cruzadas a las mismas @crossref. En Apéndice B @sec:apendixB, se expone 
el documento oficial de demostración las capacidades de esta herramienta,
incluido en la cadena de procesos de estos proyectos.

## Notación matemática

Las matemáticas de _LaTeX_ (e incluso las macros) pueden utilizarse en los
documentos de _Markdown_. Las matemáticas de _LaTeX_ se convierten (según lo
requiera el formato de salida) en unicode, objetos de ecuación nativos de Word,
MathML o roff eqn.

Se proporcionan varios métodos diferentes para representar las matemáticas
incluyendo sintaxis _MathJax_ y la traducción a _MathML_.

Cuando $a \ne 0$, hay dos soluciones a \(ax^2 + bx + c = 0\) las cuales son $$x
= {-b \pm \sqrt{b^2-4ac} \over 2a}.$$

**Transformación de contenidos:** EpubMathJax
proporciona herramientas para transformar sus contenidos de fuentes impresas
tradicionales en contenidos web y ePubs modernos y accesibles.

**Tipografía de alta calidad:** MathJax utiliza fuentes SVG, en lugar de de
imágenes de mapa de bits, por lo que las ecuaciones se escalan con el
texto circundante.

**Modular la entrada y la salida:** MathJax es altamente modular en la entrada
y la salida. Utiliza MathML, TeX, y ASCIImath como entrada y MathML como
salida.

**Accesible y reutilizable:** MathJax funciona con lectores de pantalla y
proporciona zoom de expresión y exploración interactiva. También puede copiar
ecuaciones en Office, LaTeX, wikis y otro software.




# Resultados

El resultado de este proyecto es la integración de diferentes piezas de
software y andamiaje necesario para reproducir este proyecto: fuentes de
entrada, configuraciones, estructura, filtros, plantillas (_LaTeX_, CLSs,
resaltado de sintaxis) y un ejemplo flujo de trabajo acciones integración
remota automatizada.

<!--
Notación matemática, gestión de referencias, citas y generación de gráficos.
Entre otras configuraciones generales involucradas en el proceso, la
profundidad la tabla de contenidos.  y archivo de entrada y de salida.
-->

Para recrear este proceso, principalmente hay 2 opciones:

La mas directa es realizar un _fork_ el repositorio en el cual esta alojado el
contenido en linea [@fork, @repo]. Después de realizar modificaciones necesarias,
esto dispara acciones en el repositorio y genera este documento.

Para trabajar en una copia local es necesario clonar el contenido,
es necesario ejecutar los siguientes comando en un terminal de sistema [^1].

```console
$ git clone https://github.com/lifofernandez/article-boilerplate.git
$ cd article-boilerplate
$ sudo make install
$ pandoc README.md \
    -F pandoc-plot --metadata-file=metadata.yaml --mathjax \
    -F pandoc-crossref --citeproc \
    --highlight-style pygments.theme \
    --template=plantilla --pdf-engine-opt=-shell-escape \
    -s --toc --toc-depth=2 --number-sections --columns=80 \
    -o README.pdf
```

[^1]: Conseguir una instalación funcional de _pandoc_ y sus dependecias es
condicionante el sistema en el que se ejecute. Para instrucciones especificas
consultar las indicaciones su autor @installPandoc.

## Sintaxis extendida de _Markdown_

Hay un aspecto en el que los objetivos de _Pandoc_ difieren de los originales
de _Markdown_. Mientras que _Markdown_ fue diseñado para la generación de HTML en
mente, _Pandoc_ está preparado para producir múltiples formatos de salida.

En Apéndice A (@sec:apendixA) expone la versión mejorada de _Markdown_ de
_Pandoc_ que comprende una versión ampliada y ligeramente revisada de la
sintaxis original[^2]. Incluye sintaxis para tablas, listas de definiciones,
bloques de metadatos, notas a pie de página, citas y matemáticas y entre otros
@pandocmd.

## Numeración y referencias cruzadas


Para consultar una lista completa de las funcionalidades avanzadas de
_pandoc-crossref_ el módulo de _pandoc_ para realizar referencias cruzadas.
Acompaña este artículo la demostración de su autor en Apéndice B
(@sec:apendixB).

[^2]: El contenido de los apéndices se encuentran en su idioma original.


# Conclusión

<!--- contar lo que se hizo Tenga en cuenta que en la entrega final, deberá
realizar una conclusión donde se tendrán que detallar las futuras líneas de
trabajo. Hablar del capitulo --->

Este capítulo concluye el estudio.
El objetivo de es investigar el proceso de producción de documentos con herramientas rudimentales.
En primer lugar, se responde a las preguntas de investigación.
El segundo subcapítulo presenta la contribución de esta tesis,
y los dos últimos subcapítulos presentan las limitaciones del estudio
y las sugerencias para desarrollos futuros, respectivamente.

## Objetivos

Se consigue un cadena de producción 

Características generales: un formato libre y abierto, componentes isolados,
compactos y robustos; amplia compatibilidad con requisitos de estilo, miles de
estilos disponibles predefinidos por la comunidad, etiquetas de bibliografía
altamente personalizable y fuentes de datos remotas para publicaciones
frecuentes con información dinámico.

Citas y citas: localización automática de estilos, infraestructura para la
distribución y actualización de estilos, compleja modificación de datos sobre
la en producción y basada en macros sin cambiar las fuentes de datos.


<!--- Reglas de herencia de fuentes de datos altamente personalizables Un modo
de herramienta para transformar las fuentes de datos bibliográficos Por bibtext
algunos: Soporte completo de Unicode Recodificación automática de datos
bibliográficos (UTF-9 -> latin1, macros LATEX -> UTF-8, etc.) Sistema de
desambiguación automática de nombres y listas de nombres altamente sofisticado
acceso directo mediante sistemas rudimentales.  --->

## Aporte

Es intención que este proyecto que sirva como plantilla para proyectos
similares, patrones de diseño y guia de  buenas practicas para la producción de
documentos gráficos de alta complejidad.

Si bien que este proyecto está enfocado a la producción de literatura
académica, esta misma cadena puede ser considerada en en el desarrollo de
cualquier sistemas de gestión documental, registros médicos, documentos
legales, certificados, etc.

Donde productos gráficos imprimibles se generan mediante rutinas directamente
de bases de datos, una capa codificada extra que opaca la relación con el
interprete el y el contenido, se recomienda un proceso similar al descripto de
respaldo del la información en contenedores de formato simple y legible, sin
codificar u opacar habilitando ser manipulados con herramientas obicuas, con

Pero en una implementación organizacional esto puede ser solucionado ejecutando
en servidor públicos donde con acceso web como un servicio de preparación de
documentos gráficos, tanto preparando para impresión o para ser consumidos
mediante exploradores de internet solamente se carguen como insumos los
ficheros de contenido o

Aunque los escuadrones son autónomos, es importante que los especialistas (por
ejemplo, los desarrolladores de) se alineen en las mejores prácticas.

## Limitaciones

Dado que la representación intermedia de un documento por parte de _Pandoc_ es
menos expresiva que muchos de los formatos entre los que convierte, no hay que
esperar conversiones exactas entre todos los formatos.  Mientras que las
conversiones de _Markdown_ de _Pandoc_ a todos los formatos aspiran a ser
perfectas, las conversiones de formatos más expresivos que _Markdown_ de _Pandoc_
pueden tener diferencias.

_Pandoc_ intenta conservar los elementos estructurales de un documento, pero no
los detalles de formato, como el tamaño de los márgenes.  Y algunos elementos
del documento, como por ejemplo tablas complejas, pueden no encajar en el
modelo de documento simple de _Pandoc_. 

Los módulos empleados maduraron y se incluyen en la la distribución principal
de _Pandoc_ cambiar configuraciones agregar funcionalidades y rutinas puede
variar y depender de versiones de las herramientas en las diferente
distribuciones y sistemas operativos puede inferir en la integración y
operaciones.

<!--- esto puede mitigar con trabajos encauzados mediante matrices  de SOs --->


## Futuras lineas de trabajo

Se señala como áreas de desarrollo 

### Operaciones remotas automáticas

https://pandoc.org/installing.html#github-actions

disponible el repositorio con

[![Build remoto](https://github.com/lifofernandez/thesis-sandbox/actions/workflows/main.yml/badge.svg)](https://github.com/lifofernandez/thesis-sandbox/actions/workflows/main.yml)

Integracion continua
https://about.gitlab.com/features/continuous-integration/


### Revisión sistemática de literatura

Para revisiones de literatura que comprometen múltiples bibliografías y
@Kitchenham2006

Que deben de información bibliográfica en el mismo documento con diferente
ordenación:

- Ordenación altamente personalizable mediante el Algoritmo de Cotejo Unicode (Unicode Collation Algorithm - UCA) (https://www.unicode.org/reports/tr10/)
- Adaptación de CLDR (https://cldr.unicode.org/)
- Bibligrafías jeraquizadas por capítulo, sección, etc.
- Soporte de poliglosia para el cambio automático de idioma de las entradas y citas bibliográficas
- Modelo de datos altamente personalizable para que los usuarios puedan definir sus propios tipos de datos bibliográficos
- Validación de los datos bibliográficos con respecto a un modelo de datos
