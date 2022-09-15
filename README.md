# Producción gráfica de documentos Pandoc

<!--- temática que abordará, intro --->

Este proyecto describe el proceso de confección de escritos académicos, de
complejidad considerable, sin la necesidad de interfaces gráficas @caleb.
Cuenta con capacidades necesarias para la producción de documentación
técnica y científica, todo el proceso es controlado mediante linea de
comandos evitando así depender de interfaces captivas [@gancarz2003linux p.88-97]

El objetivo de este trabaja es un entorno
el cual _Pandoc "a universal document converter"_ 
es la pieza central, interprete del sistema de composición tipográfica y
preparación de documentos de alta calidad LaTeX, estándar de facto para la
comunicación y publicación de documentos académicos [@macfarlane; @knuth1986texbook].

Mediante integraciones sencillas se consigue una infraestructura robusta con
funciones diseñadas para gestionar exposición de extensas referencias,
múltiples citas y bibliografía a diferentes fuentes; notación matemática,
generación gráficos y diagramas, entre otras capacidades.


<!--- 
creadores de contenido
que con LaTeX entre bastidores; 
sin requerir conocimiento de la sintaxis del mismo
la que puede resultar opaca para la mayoría de 
-->

<!--- 
# Justificación

El texto plano y legible
junto con su justificación y
integración
--->

## Pandoc

_Pandoc_ es una biblioteca _Haskell_ @marlow2010haskell para convertir
de un formato de marcado ligero a
otro, y una herramienta de línea de comandos
que accede a las funciones en 
esta biblioteca
para convertir entre numerosos formatos y de procesamiento
de textos.

La biblioteca incluye módulos separados para cada formato de
entrada y salida,
por lo que para añadir un nuevo formato de entrada o salida
sólo hay que añadir un nuevo módulo.


<!---
Pandoc incluye una biblioteca Haskell y un programa de línea de comandos
independiente.

--->

<!---
incluyendo, pero sin limitarse a, varios sabores de Markdown, HTML,
LaTeX y Word docx.


Pandoc es software libre, publicado bajo la GPL.
Copyright 2006-2022 John MacFarlane.
--->

## Texto Plano

Evitar el uso
formatos codificados o de poca legibilidad
e interfaces captivas
beneficia a todos los usuarios, que deben poder encontrar lo que
necesitan, comprender lo que encuentran y usarlo para realizar tareas @das.
Habilita el separar contenido, referencias y estilo.

En un contexto
de organizaciones
con actividades relacionadas
a la publicación
donde la complejidad no solo de documentos 
sino que también
lo es la tarea ya involucra a múltiples agentes
como 
autores, correctores y editores,

el control estético y da unidad en estilo
en la composición gráfica resultante
de diversos productos.

De los beneficios que trabajar con texto plano habilita
se resalta la accesibilidad y la posibilidad de 
producir documentos gráficos de la misma manera que se produce software

intcluirlo en una cadena de desarrollo de propia de las software factories

y viceversa es un learn by example para escritores/editores
puden adquirir capacidade flujo de trabajo 

se señala comom futuras lineas dse trabajo es
facil mente incluible en operacioones remotas automaticas.

<!---
Conjunto de herramientas de publicación académica potente,
ampliable y
repleto de funciones.
Construya y
personalizar con Pandoc, utilizar un sistema de composición tipográfica (LaTeX) y
y componentes, y dé vida a los proyectos con potentes filtros.
--->


### Markdown


Markdown es una sintaxis
plain text formatting syntax
sitaxis de formato de texto, 



El formato de texto es el marcado que se aplica a un texto simple para añadir
datos de estilo más allá de la semántica de los elementos: colores, estilos
(negrita, itálica), tamaño, y características especiales (como hipervínculos).
Al texto resultante se le conoce como texto formateado, texto con estilos, o
texto enriquecido


https://wires.onlinelibrary.wiley.com/doi/10.1002/wics.1348

This article is categorized under:
Software for Computational Statistics > Software/Statistical Software

El
con enfasis en la legibilidad

de autoria de texto
Lo que distingue a Markdown de muchas otras sintaxis de marcado ligero,
es su legibilidad.

Como escribe Gruber:
El objetivo primordial del diseño de la sintaxis de formato de Markdown es
hacerla lo más legible posible. La idea es que un documento con formato Markdown
sea publicable tal cual, como texto plano, sin que parezca que ha sido marcado
con etiquetas o instrucciones de formato.
(http://daringfireball.net/projects/markdown/)

https://github.github.com/gfm/

La versión mejorada de Markdown de Pandoc
incluye sintaxis para
tablas, listas de definiciones,
bloques de metadatos, notas a pie de página, citas,
matemáticas y mucho más.

Véase más abajo en Markdown de Pandoc.
https://pandoc.org/MANUAL.html#pandocs-markdown

Pandoc
comprende una serie de extensiones útiles de la sintaxis de markdown,
como los metadatos del documento (título, autor, fecha);
las notas al pie; las
tablas; las listas de definiciones; los superíndices y subíndices; la
tachadura; las listas ordenadas mejoradas (el número de inicio y el estilo de
numeración son significativos); las listas de ejemplos en ejecución; los
bloques de código de software delimitados con resaltado de sintaxis; las comillas
inteligentes,
los guiones y las elipses;
el markdown dentro de bloques HTML;
y el LaTeX en línea.

Si se desea una compatibilidad estricta con markdown, todas
estas extensiones pueden desactivarse.


# Medodotología 

<!--- describir el proceso -->
El desarrollo de este trabajo fue realizado
nota al pie: Como conseguir una instalcion funcional de 
Esta fuera de los alcances de este articulo.

<!---
### Generar Documentos (PDF)
Con una version funcionando en ejecutar en la terminal 
del mismo el siguiente sentencia:

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


un potente sistema para escribir filtros.
El diseño modular: consta de un conjunto de lectores,
que analizan
el texto en un formato determinado y producen una representación nativa del
documento (Abstract Sintactic Three - AST), y un conjunto de escritores,
que convierten esta representación nativa en un formato de destino.

<!---
Así, para
añadir un formato de entrada o de salida basta con añadir un lector o un
escritor. Los usuarios también pueden ejecutar filtros personalizados de pandoc
para modificar el AST intermedio.
_Pandoc_ funciona como la pieza central que integra
--->

De los múltiples maneras de personalizar _Pandoc_
para que se adapte a los requisitos de cada proyecto,
se destaca el uso de un sistema de plantillas y
un potente sistema de citas y bibliografías automáticas y la generación de
gráficos mediante código.

## Integración

bibliografia 

Por ejemplo, esto significa que puede escribir una referencia como 
'@moolenaar2000' o también '[@knuth1986texbook p.3-9]' y _Pandoc_ a convertirá
en una cita con el formato predefinido, utilizando cualquiera de los cientos de
Lenguajes de Estilo de Cita (Citation Style Language - CSL) incluyendo estilos
de nota al pie, numéricos y autoría, fuente y fechas), y añadirá una
bibliografía con el formato adecuado al final del documento.

Las matemáticas de LaTeX (e incluso las macros) pueden utilizarse en los
documentos de _Markdown_. Las matemáticas de LaTeX se convierten (según lo
requiera el formato de salida) en unicode, objetos de ecuación nativos de Word,
MathML o roff eqn.

sitema de diagramcion y  generacion graficos 

permite crear diagramas y visualizaciones utilizando texto y código.
Se trata de una herramienta de diagramación y graficación
<!---
basada en JavaScript
--->
que renderiza definiciones de texto inspiradas en Markdown para crear y

modificar diagramas de forma dinámica.

<!--- 
Además, adjunte un cronograma de presentaciones intermedias,
considerando que se debe realizar, como mínimo,
una entrega intermedia antes de la entrega final.
--->

## Gráficos y diagramas

Diagramación y la documentación cuestan un tiempo precioso a los
desarrolladores y quedan obsoletas rápidamente.

Pero no tener diagramas o documentación arruina la productividad y perjudica el
aprendizaje de la organización.

### pandoc-plot

_pandoc-plot_ es un filtro de _Pandoc_ para generar figuras a partir de bloques de
código en documentos.

Esta página está generada a partir de _Markdown_ utilizando
_pandoc-plot_, para que puedas hacerte una idea de lo que es posible.



https://laurentrdc.github.io/pandoc-plot/

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

https://the-lum.github.io/puml-themes-gallery/


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


## BibLATEX - Bibliografías sofisticadas en LATEX


<!---
Citas y referencias bibliogáficas 
BibLATEX – Sophisticated Bibliographies in LATEX
--->

Los datos bibliográficos pueden estar en formato BibTeX, BibLaTeX, CSL JSON o
CSL YAML. Las citas funcionan en todos los formatos de salida.

BibLaTeX es una reimplementación completa de las facilidades bibliográficas
proporcionadas por LaTeX.
El formato de la bibliografía está totalmente
controlado por las macros de LaTeX, y un conocimiento práctico de LaTeX debería
ser suficiente para diseñar nuevos estilos de bibliografía y citación.

<!---
BibLATEX
utiliza su propio programa de respaldo de datos llamado "biber" para leer y
procesar los datos bibliográficos. 
--->

Con biber BibLATEX tiene muchas características que rivalizan o superan a otros
sistemas bibliográficos.

### CLS

https://www.mendeley.com/guides/csl-editor/

El Lenguaje de Estilo de Citación (CSL) es un formato basado en XML para
describir el formato de citas, notas y bibliografías, ofreciendo:

https://docs.citationstyles.org/en/stable/primer.html#what-is-csl

Para obtener más documentación, el esquema CSL, los estilos y las
localizaciones, visite la página web del proyecto proyecto CSL,
citationstyles.org.

Si alguna vez has escrito un trabajo de investigación,
habrás trabajo de investigación,

probablemente has incluido referencias a otros trabajos. La
referencias son importantes en la comunicación académica, ya que
proporcionan la atribución, enlazan referentes.

Sin embargo, formatear manualmente
las referencias puede llevar mucho tiempo, especialmente cuando se trata de
múltiples publicaciones con diferentes estilos de citación.

El software de gestión de referencias puede ayudar.
<!---
Programas como
Zotero, Mendeley y Papers
--->
no sólo ayudan a gestionar bibliotecas de
investigación, sino que también pueden generar automáticamente citas y
bibliografías.
Pero para formatear las referencias en el estilo deseado, estos
programas necesitan descripciones de cada estilo de citación en un lenguaje que
el ordenador pueda entender. Como habrás adivinado, el Lenguaje de Estilos de
Citación (CSL) es ese lenguaje

https://docs.citationstyles.org/en/stable/specification.html

## MathJax

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

El producto de este proyecto
la integracion de diferentes piezas de software
y andamiaje necesario para reproducir
este proyecto esto incluye:
Configuraciones,
estructura ejemplo
filtros,
cls,
plantilla Latex,
resaltado de còdigo,
configuraciones para operaciones remotas

Un ejemplo de como usar esta herramienta
es el mismo comando que sirve para conseguir 
este documento desde su fuente en _Markdown_ @markdown.

```console
$ pandoc README.md \
  -F pandoc-plot --metadata-file=metadata.yaml --mathjax \
  -F mermaid-filter -F pandoc-crossref --citeproc \
  --highlight-style pygments.theme \
  --template=plantilla --pdf-engine-opt=-shell-escape \
  -s --toc --toc-depth=2 --number-sections --columns=80 \
  -o README.pdf
```


Ejecutar el comando precedente 
en una sistema con una instancia de _Pandoc_ funcionando
produce las este documento y declara:
plantillas:
General LaTex,
lenguaje de estilo de citas,
resaltado de código.
Módulos extra como filtros:
Notación matemática,
gestión de Referencias,
citas
y
generación de gráficos.
Entre otras configuraciones generales
involucradas en el proceso,
la profundidad la tabla de contenidos.
archivo de entrada y de salida.




## Cheat Shet and examples 

apendice.pdf


El documento 
y su contraparte 

Para recrear el proceso que
se utilizo para confeccionar este documento


# Conclusión


<!---

contar lo que se hizo

Tenga en cuenta que en la entrega final, deberá realizar una conclusión donde se
tendrán que detallar las futuras líneas de trabajo.
--->


Se consigue un cadena de producción 

Características generales:
un formato libre y abierto,
componentes isolados, compactos y robustos;
amplia compatibilidad con requisitos de estilo,
miles de estilos disponibles predifindos por la comunidad,
etiquetas de bibliografía altamente personalizables
y
fuentes de datos remotas para publicaciones frecuentes con información dinámico.

Citas y citas:
localización automática de estilos,
infraestructura para la distribución y actualización de estilos,
compleja modificación de datos sobre la en producción
y
basada en macros sin cambiar las fuentes de datos.


<!---
Reglas de herencia de fuentes de datos altamente personalizables
Un modo de herramienta para transformar las fuentes de datos bibliográficos
Por bibtext algunos:
Soporte completo de Unicode
Recodificación automática de datos bibliográficos (UTF-9 -> latin1, macros LATEX -> UTF-8, etc.)
Sistema de desambiguación automática de nombres y listas de nombres altamente sofisticado
--->

## Futuras lineas de trabajo

Se señanal algunas areas de desarrollo 


### Operaciones remotas automáticas

https://pandoc.org/installing.html#github-actions

disponible el repositorio con

[![Build remoto](https://github.com/lifofernandez/thesis-sandbox/actions/workflows/main.yml/badge.svg)](https://github.com/lifofernandez/thesis-sandbox/actions/workflows/main.yml)

Integracion continua
https://about.gitlab.com/features/continuous-integration/

### Revisión sistemática de literatura

Para revisiones de literatura que comprometan múltiples bibliografías y
listas de información bibliográfica en el mismo documento con diferente ordenación

- Ordenación altamente personalizable mediante el Algoritmo de Cotejo Unicode (Unicode collation algorithm - UCA) (https://www.unicode.org/reports/tr10/)
- Adaptación de CLDR (https://cldr.unicode.org/)
- Bibligrafías jeraquizadas por capítulo, sección, etc.
- Soporte de poliglosia para el cambio automático de idioma de las entradas y citas bibliográficas
- Modelo de datos altamente personalizable para que los usuarios puedan definir sus propios tipos de datos bibliográficos
- Validación de los datos bibliográficos con respecto a un modelo de datos

## Debilidades

Dado que la representación intermedia de un documento por parte de Pandoc es
menos expresiva que muchos de los formatos entre los que convierte,
no hay que esperar conversiones exactas entre todos los formatos.
Mientras que las conversiones de Markdown de Pandoc a todos los
formatos aspiran a ser perfectas,
las conversiones
de formatos más expresivos
que Markdown de Pandoc pueden tener diferencias.

Pandoc intenta conservar los elementos estructurales de un documento,
pero no los detalles de formato,
como el tamaño de los márgenes.

Y algunos elementos del documento,
como por ejemplo tablas complejas,
pueden no encajar en el modelo de documento simple de Pandoc. 

Si bien los modulos empleados 
maduraron y se dirtribuyen 
dentro con 
empaquetatos
la distribucion principal de Pandoc
cambiar configuraciones
agrerar funcionalidades y rutinas
puede variar 
y depender de 
versiones de las herramientas 
en las diferente distribuciones y sistemas operativos
puede inferir en la integración y operaciones.

Pero en una implementación 
organizacional
esto puede ser solucionado 
ejecutando en servidor remoto donde
como un servicio de 
preparación de documentos gráficos,
tanto preparando para impresión
o para ser consumidos 
mediante exploradores de internet
solamente se carguen como insumos 
los ficheros de contenido 
y las configuraciones y plantillas estén 

<!---
esto puede mitigar con trabajos encauzados mediante 
matrices a las diferentes versiones
--->


## Indicaciones 

Es intencison que este proyecto que sirva como plantilla para proyectos
similares, patrones de diseño y guia de  buenas practicas para 
la produccion de documentos graficos de alta complejidad.

y siendo 
que este proyecto está enfocado a la 
producción de literatura académica ,
esta misma cadena puede ser considerads
en en el desarrollo de cualquier sistemas de gestión documental, 
registros médicos, documentos legales, certificados, etc.

Donde productos gráficos imprimibles se generan mediante rutinas directamente
de bases de datos, una capa codificada extra que opaca la relación con el
interprete el y el contenido, se recomienda un proceso similar al descripto de
respaldo del la información en contenedores de formato simple y legible, sin
codificar u opacar habilitando ser manipulados con herramientas obícuas, con
acceso directo mediante sistemas rudimentales.



<!---
# Referencias
Indique la bibliografía que utilizará a lo largo del desarrollo del trabajo.
--->
