# Producción gráfica de documentos Pandoc

<!--- temática que abordará,
intro --->

Este proyecto
describe el uso de
Pandoc como pieza central
en un entorno
de producción
de documentos académicos, de complejidad considerable,
sin interfaz grafica @caleb.

Con el sistema de composición tipográfica
y preparacion de documentos 
de alta calidad LaTeX entre bastidores;
incluye funciones diseñadas
cuenta con las capacidades necesarias
para la producción de documentación técnica y
científica.



<!--- 
LaTeX es el estándar de facto para la comunicación y publicación de documentos
científicos. 
# Justificación
Pandoc es a la los documentos gráficos lo que https://ffmpeg.org/about.html es
para el video.
El texto plano y legible

junto con su justificación y
integración
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
de textos,
<!---
incluyendo, pero sin limitarse a, varios sabores de Markdown, HTML,
LaTeX y Word docx.

Hay muchas maneras de personalizar pandoc para que se adapte a sus necesidades,
--->
incluye un sistema de plantillas
y
un potente sistema para escribir filtros.

Pandoc es software libre, publicado bajo la GPL.
Copyright 2006-2022 John MacFarlane.

## Texto Plano

Evitar el uso
formatos codificados o de poca legibilidad
e interfaces captivas
beneficia a todos los usuarios, que deben poder encontrar lo que
necesitan, comprender lo que encuentran y usarlo para realizar tareas @das.

Separando contenido, referencias y
estilo 

en un contexto
de organizaciones
con actividades relacionadas
a la publicacion

donde no solo los documentos son 
complejos
sino que tambien
la tarea involucra a multimples agentes
autores/supervisores/editores

vuleve el 
el control estetico y unidad en estilo
en la composicion grafica resultante
a multiples productos.

De los beneficios que trabajar con texto plano habilita
se resalta la accesibilidad y la posbilidad de 
producir documentos graficos de la misma manera que se produce software

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

#### pandoc-plot

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




#### MermaidJS

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

#### CLS

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
múltiples puvblicaciones que tienen su propio estilo de citación.

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

El producto de este proyecto
la integracion de diferentes piezas de software

andamiaje necesario para reproducir
este proyecto esto incluye:

- configuraciones
- estructura
- filtros 
- cls
- plantilla latex
- resaltado de codigo
- configuraciones para operaciones remotas

## Generar Documentos (PDF)

Para recrear el
proceso que
se utilizo para confeccionar este documento

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

## Ver Apendice

apendice.pdf

# Conclusion

en cadena de produccion de sof
los documentos graficos 
suele producirce 
mediante rutinas directamente de la base de datos
se recmienda un proceso similar al descripto
donde se repalde el conocimiento en 
contedores de formato simple y legible, sin codificar ni 
opacar
y pueda ser manipulados con procesos rudimentales

En general 

- Un formato libre y abierto
- Componentes isolados, compactos y robustos
- Amplia compatibilidad con requisitos de estilo
- Miles de estilos disponibles gratuitamente (con licencia Creative Commons BY-SA)
- Etiquetas de bibliografía altamente personalizables
- Fuentes de datos remotas para publicaciones frecuentes con informacion dinámico.

Estilos de citas

- Localización automática de estilos
- Infraestructura para la distribución y actualización de estilos
- Compleja modificación de datos sobre la en produccion,
  basada en macros sin cambiar las fuentes de datos


Para revisiones de literatura que comprometan múltiples bibliografías y
listas de información bibliográfica en el mismo documento con diferente ordenación

- Ordenación altamente personalizable mediante el Algoritmo de Cotejo Unicode + adaptación de CLDR
- Bibligrafías jeraquizadas por capítulo, sección, etc.
- Soporte de poliglosia para el cambio automático de idioma de las entradas y citas bibliográficas
- Modelo de datos altamente personalizable para que los usuarios puedan definir sus propios tipos de datos bibliográficos
- Validación de los datos bibliográficos con respecto a un modelo de datos

<!---
- Reglas de herencia de fuentes de datos altamente personalizables
- Un modo de herramienta para transformar las fuentes de datos bibliográficos

Por bibtext algunos:

- Soporte completo de Unicode
- Recodificación automática de datos bibliográficos (UTF-9 -> latin1, macros LATEX -> UTF-8, etc.)
- Sistema de desambiguación automática de nombres y listas de nombres altamente sofisticado

--->
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
pero no los detalles de formato, como el tamaño de los márgenes.

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
Pero en una implemntacion 
empresarial
esto puede ser solucionado 
ejecutando en servidor remoto donde
solamente se carguen como insumos 
los ficheros de contenido 
y las configuraciones y plantillas esten 

<!---
esto puede mitigar con trabajos encauzados mediante 
matrices a las diferentes versiones


Tenga en cuenta que en la entrega final, deberá realizar una conclusión donde se
tendrán que detallar las futuras líneas de trabajo.
--->

contar lo que se hizo

## Operaciones Remotas

Futuras lineas de trabajo

disponible
el repositorio con

### Acciones remoto

[![Build remoto](https://github.com/lifofernandez/thesis-sandbox/actions/workflows/main.yml/badge.svg)](https://github.com/lifofernandez/thesis-sandbox/actions/workflows/main.yml)



# Referencias

<!---
Indique la bibliografía que utilizará a lo largo del desarrollo del trabajo.
--->
