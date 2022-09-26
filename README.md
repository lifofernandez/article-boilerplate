# Producción de académica con Pandoc

<!--- Temática que abordará --->

Este proyecto describe la confección de escritos académicos o de
complejidad considerable, sin la necesidad de interfaces gráficas.
Evitar el uso formatos codificados o de poca legibilidad beneficia a todos los
usuarios, que deben poder encontrar lo que necesitan, comprender lo que
encuentran y usarlo para realizar tareas @caleb.

El objetivo de este trabajo es un entorno de autoría textos en el cual _Pandoc_
es la pieza central que actúa como interprete del sistema de composición
tipográfica y preparación de documentos de alta calidad _LaTeX_, estándar de
facto para la comunicación y publicación de documentos académicos [@macfarlane;
@knuth1986texbook].

Mediante integraciones sencillas se consigue una infraestructura robusta con
funciones diseñadas para gestionar exposición de extensas referencias,
múltiples citas y referencias a diferentes fuentes, notación matemática,
generación gráficos y diagramas, entre otras capacidades avanzadas, necesarias
para la producción de documentación técnica y científica, todo el proceso es
controlado mediante linea de comandos sin depender de interfaces captivas
promoviendo la transparencia, la claridad y la reproducción [@gancarz2003linux
p.88-97].

<!--
Se trata de una herramienta de código abierto que puede
utilizarse por sí sola o a través del entorno de desarrollo integrado (IDE)
-->

## Pandoc

_Pandoc_ es una biblioteca de _Haskell_  para convertir de un
formato de marcado ligero a otro, y una herramienta de línea de comandos que
accede a las funciones en esta biblioteca para convertir entre 
formatos y procesar textos @marlow2010haskell.

El diseño de _Pandoc_ es modular, esta conformado por un conjunto de lectores,
que analizan el texto en un formato determinado y producen una representación
nativa del documento en un árbol de sintaxis abstracta (Abstract Syntax Tree -
AST) y un conjunto de escritores, que convierten esta representación a un
formato de destino [@ASTImpl2003; @Neamtiu05understandingsource].

<!---
Por lo tanto, para añadir un formato de entrada o de
salida basta con añadir un lector o un escritor.
Los usuarios también pueden
ejecutar filtros pandoc personalizados para modificar el AST intermedio

La biblioteca incluye módulos separados para cada formato de entrada y salida,
por lo que para añadir un nuevo formato (de entrada o salida) sólo hay que añadir
un nuevo módulo.
--->

<!--- https://explained-from-first-principles.com/number-theory/ --->
<!--- Pandoc incluye una biblioteca Haskell y un programa de línea de comandos
independiente.  --->

<!--- incluyendo, pero sin limitarse a, varios sabores de _Markdown_, HTML, _LaTeX_
y Word docx.
Pandoc es software libre, publicado bajo la GPL.  Copyright 2006-2022 John
MacFarlane.  --->

<!--- Conjunto de herramientas de publicación académica potente, ampliable y
repleto de funciones.
Construya y personalizar con Pandoc, utilizar un sistema de composición
tipográfica (_LaTeX_) y y componentes, y dé vida a los proyectos con potentes
filtros.  --->

### Interfaz 

La principal característica de las herramientas empleadas este proyecto es
que están preparadas para recibir instrucciones alojadas en
archivos de texto. Entre los beneficios que trabajar de este modo habilita se
destacan cuestiones de accesibilidad y la posibilidad de gestionar el
conocimiento de la misma manera que se produce software [@hunt1999pragmatic;
@das; @moolenaar2000].

Separar contenido, referencias, estilos y procesos, en un contexto de
organizaciones con actividades relacionadas a la publicación, donde la
complejidad no solo reside en los documentos sino que también en la tarea, dado
que involucra a múltiples agentes (como autores, correctores y editores, entre
otros); libera al autor de problemas estéticos y devuelve el control de estilo
a la organización garantizando unidad en estética en la composiciones gráfica
resultante de diversos productos.

Esta formación en los estudiantes introducirá en la fuerza de trabajo una nueva
capacidad  con una inclinación arraigada y fundamental hacia la investigación
reproducible @Baumer_Udwin_2015. Ademas de la funcionalidad que se señala como
futura linea de trabajo, la posibilidad de generar documentos como el presente
mediante operaciones remotas automáticas.


### Markdown

_Markdown_ es una sintaxis  de formato de texto plano.
El formato de texto es el marcado que se aplica a un texto simple para añadir
datos de estilo más allá de la semántica de los elementos: colores, estilos, pesos
tamaño, y características especiales (como hipervínculos).
Al texto resultante se le conoce como texto formateado, texto con estilos, o
texto enriquecido @gruber.

Lo que distingue a _Markdown_ de muchas otras sintaxis de marcado ligero, es su
enfasis en la legibilidad.  El objetivo prisipal del diseño de la sintaxis de
formato de _Markdown_ es hacerla lo más legible posible. La idea es que un
documento con formato _Markdown_ sea publicable tal cual, como texto plano, sin
que parezca que ha sido marcado con etiquetas o instrucciones de formato.

_Pandoc_ comprende una serie de extensiones útiles de la sintaxis de markdown,
como los metadatos del documento (título, autor, fecha); las notas al pie; las
tablas; las listas de definiciones; los superíndices y subíndices; la
tachadura; las listas ordenadas mejoradas (el número de inicio y el estilo de
numeración son significativos); las listas de ejemplos en ejecución; los
bloques de código de software delimitados con resaltado de sintaxis; las
comillas inteligentes, los guiones y las elipses; el _Markdown_ dentro de bloques
HTML; y el _LaTeX_ en línea.

# Metodotología 
<!--- describir el proceso -->

En este capitulo se describe el método propuesto y utilizado para producir el
presente documento.

Primero se introduce a la integración de diferentes herramientas, algunas
distribuidas junto con _Pandoc_ y otras aportes independientes de la comunidad.
Luego sistema de diagramación y  generación gráficos que permite crear
visualizaciones utilizando texto y código.  Seguido se expone el sistema citas
y referencias bibliográficas. Para concluir este capitulo se exponen cuestiones
relacionadas a la notación matemática.

<!--- basada en JavaScript
que renderiza definiciones de texto inspiradas en Markdown para crear y
modificar diagramas de forma dinámica.
--->

<!---
Así, para
añadir un formato de entrada o de salida basta con añadir un lector o un
escritor. Los usuarios también pueden ejecutar filtros personalizados de pandoc
para modificar el AST intermedio.
_Pandoc_ funciona como la pieza central que integra
--->

## Integración

El diseño de _Pandoc_ es modular: consta de un conjunto de lectores, que
analizan el texto en un formato determinado y producen una representación
nativa del documento (Abstract Sintactic Three - AST), y un conjunto de
escritores, que convierten esta representación nativa en un formato de destino.
Ademas, incluye  un potente sistema para escribir filtros.

<!--- Además, adjunte un cronograma de presentaciones intermedias, considerando
que se debe realizar, como mínimo, una entrega intermedia antes de la entrega
final.  --->

De los múltiples maneras de personalizar _Pandoc_ para que se adapte a los
requisitos de cada proyecto, se destaca el uso de un sistema de plantillas y un
potente sistema de citas y bibliografías automáticas y la generación de
gráficos mediante código.

## Gráficos y diagramas

La diagramación y conllevan tiempo a los investigadores y desarrolladores y
quedan obsoletas rápidamente. Pero no tener diagramas o documentación arruina
la productividad y perjudica el aprendizaje de la organización.

<!---
### pandoc-plot
--->

Se destina esta tarena a _pandoc-plot_ es un filtro de _Pandoc_ para generar
figuras a partir de bloques de código en documentos.  Los gráficos a
continuación están generados a partir del condigo includo en el fichero
_Markdown_ original utilizando _pandoc-plot_, para que demostrar las
posibilidades de esta herramienta.

https://laurentrdc.github.io/pandoc-plot/
https://the-lum.github.io/puml-themes-gallery/

<!--- Matplotlib --->

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

<!--- plantUML --->

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
### MermaidJS

Mermaid es una herramienta de diagramación y gráficos basada en JavaScript que
utiliza definiciones de texto inspiradas en Markdown y un renderizador para
crear y modificar diagramas complejos. El objetivo principal de Mermaid es
ayudar a que la documentación se ponga al día con el desarrollo.

Mermaid
aborda este problema
permite
crear diagramas
fácilmente modificables,
del código
de piezas de software.

Mermaid permite incluso a los no programadores crear fácilmente diagramas
detallados y a través del Mermaid Live Editor.


~~~mermaid
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
~~~
--->

## Bibliografías sofisticadas

Para la gestison de bliografia Por ejemplo, esto significa que puede escribir
una referencia como `@moolenaar2000` o también `[@knuth1986texbook p.3-9]` y
_Pandoc_ a convertirá en una cita con el formato predefinido, utilizando
cualquiera de los cientos de Lenguajes de Estilo de Cita (Citation Style
Language - CSL) incluyendo estilos de nota al pie, numéricos y autoría, fuente
y fechas), y añadirá una bibliografía con el formato adecuado al final del
documento.



<!---
Citas y referencias bibliogáficas 
BibLATEX – Sophisticated Bibliographies in LATEX
--->

Los datos bibliográficos pueden estar en formato BibTeX, BibLaTeX, CSL JSON o
CSL YAML. Las citas funcionan en todos los formatos de salida.

### BibLaTeX 
BibLaTeX es una reimplementación completa de las facilidades bibliográficas
proporcionadas por LaTeX.
El formato de la bibliografía está totalmente
controlado por las macros de LaTeX, y un conocimiento práctico de LaTeX debería
ser suficiente para diseñar nuevos estilos de bibliografía y citación.

<!--- BibLATEX utiliza su propio programa de respaldo de datos llamado "biber"
para leer y procesar los datos bibliográficos.  --->

Con biber BibLATEX tiene muchas características que rivalizan o superan a otros
sistemas bibliográficos.

### CLS

La
referencias son una pieza clave en la comunicación académica, ya que
proporcionan la atribución, enlazan referentes.
Sin embargo, formatear manualmente
las referencias puede llevar mucho tiempo, especialmente cuando se trata de
múltiples publicaciones con diferentes estilos de citación.

<!--- Programas como Zotero, Mendeley y Papers

https://www.mendeley.com/guides/csl-editor/
--->

El software de gestión de referencias no sólo ayuda a gestionar bibliotecas de
investigación, sino que también pueden generar automáticamente citas y
bibliografías. Pero para formatear las referencias en el estilo deseado, estos
programas necesitan descripciones de cada estilo de citación en un lenguaje que
el ordenador pueda entender, el Lenguaje de Estilos de
Citación (Citation Style Languaje - CSL) es el descriptor utilizado @zellecitation.

https://docs.citationstyles.org/en/stable/specification.html


El Lenguaje de Estilo de Citación (CSL) es un formato basado en XML para
describir el formato de citas, notas y bibliografías, ofreciendo:

https://docs.citationstyles.org/en/stable/primer.html#what-is-csl

Para obtener más documentación, el esquema CSL, los estilos y las
localizaciones, visite la página web del proyecto proyecto CSL,
citationstyles.org.

<!--
Si alguna vez has escrito un trabajo de investigación,
habrás trabajo de investigación,
probablemente has incluido referencias a otros trabajos.
--->


## Notación matemática

MathJax

Las matemáticas de LaTeX (e incluso las macros) pueden utilizarse en los
documentos de _Markdown_. Las matemáticas de LaTeX se convierten (según lo
requiera el formato de salida) en unicode, objetos de ecuación nativos de Word,
MathML o roff eqn.

Se proporcionan varios métodos diferentes para representar las matemáticas en
HTML, incluyendo MathJax y la traducción a MathML.

Cuando $a \ne 0$, hay dos soluciones a \(ax^2 + bx + c = 0\) las cuales son $$x
= {-b \pm \sqrt{b^2-4ac} \over 2a}.$$

**Transformación de contenidos:** Logotipo estilizado de EpubMathJax
proporciona herramientas para transformar sus contenidos de fuentes impresas
tradicionales en contenidos web y ePubs modernos y accesibles.

**Tipografía de alta calidad:** MathJax utiliza CSS con fuentes web o SVG, en
lugar de de imágenes de mapa de bits o Flash, por lo que las ecuaciones se
escalan con el texto circundante en todos los niveles de zoom.

**Modular la entrada y la salida:** MathJax es altamente modular en la entrada
y la salida. Utiliza MathML, TeX, y ASCIImath como entrada y produce HTML+CSS,
SVG, o MathML como salida.

**Accesible y reutilizable:** MathJax funciona con lectores de pantalla y
proporciona zoom de expresión y exploración interactiva. También puede copiar
ecuaciones en Office, LaTeX, wikis y otro software.



# Resultados

El resultado de este proyecto es la integración de diferentes piezas de software y
andamiaje necesario para reproducir este proyecto: configuraciones, estructura,
filtros, plantillas (_LaTeX_, CLSs, resaltado de sintaxis) y ejemplo de 
operaciones remotas automáticas.

Para recrear el proceso que se utilizo para confeccionar este documentos
Un ejemplo de como usar esta herramienta es el mismo comando que sirve para
conseguir este documento desde su fuente en _Markdown_ .
[^1]

[^1]: Como conseguir una instalcion funcional de 
Esta fuera de los alcances de este articulo.

```console
$ pandoc README.md \
  -F pandoc-plot --metadata-file=metadata.yaml --mathjax \
  -F mermaid-filter -F pandoc-crossref --citeproc \
  --highlight-style pygments.theme \
  --template=plantilla --pdf-engine-opt=-shell-escape \
  -s --toc --toc-depth=2 --number-sections --columns=80 \
  -o README.pdf
```

Ejecutar el comando precedente en una sistema con una instancia de _Pandoc_
funcionando produce las este documento y declara: plantillas: General _LaTeX_,
lenguaje de estilo de citas, resaltado de código.  Módulos extra como filtros:
Notación matemática, gestión de Referencias, citas y generación de gráficos.
Entre otras configuraciones generales involucradas en el proceso, la
profundidad la tabla de contenidos.  y archivo de entrada y de salida.

<!--- ### Generar Documentos (PDF) Con una version funcionando en ejecutar en
la terminal del mismo el siguiente sentencia:

```console
pandoc README.md --mathjax \
   -F pandoc-crossref -F mermaid-filter --citeproc \
   --template=plantilla --pdf-engine-opt=-shell-escape \
   -s --toc --toc-depth=3 --number-sections --columns=80 \
   -o README.pdf
```
La salida de este comadno 
produce un documento grafico en formato PDF 
a partir del LINK
de este mismo texto cuya fuente
es el markdown
--->

## Sintaxis extendida de Markdown 

Hay un aspecto en el que los objetivos de _Pandoc_ difieren de los originales
de Markdown. Mientras que _Markdown_ fue diseñado para la generación de HTML en
mente, _Pandoc_ está preparado para producir múltiples formatos de salida.

La versión mejorada de _Markdown_ de _Pandoc_ entiende una versión ampliada y
ligeramente revisada de la sintaxis original de Gruber, incluye sintaxis para
tablas, listas de definiciones, bloques de metadatos, notas a pie de página,
citas, matemáticas y mucho más.

https://github.github.com/gfm/
https://pandoc.org/MANUAL.html#pandocs-markdown

## Numeración y referencias cruzadas

https://github.com/lierdakil/pandoc-crossref/raw/master/docs/demo/output.pdf

<!---
Se acompaña este o
Para ver una lista completa de cada una de estas 
--->


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
