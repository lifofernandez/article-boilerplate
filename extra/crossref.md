
# Apendice B: Crossref {#sec:apendixB}

This is a demo file for pandoc-crossref. With this filter, you can
cross-reference figures (see [@fig:figure1;@fig:figure2;@fig:figure3]), display
equations (see @eq:eqn1), tables (see [@tbl:table1])
<!--
and sections ([@sec:sec1;
@sec:sec2; @sec:caption-attr; @sec:table-capts; @sec:wrapping-div])
-->
.

For immediate example, see @fig:figure0

![A figure](img/img1.jpg){#fig:figure0}

There is also support for code blocks, for example, [@lst:captionAttr;
@lst:tableCaption; @lst:wrappingDiv]

It's possible to capitalize reference prefixes, like this: [@Fig:figure1].

In case of multiple references, capitalization is determined by first
reference. [@Fig:figure1; @fig:figure2] is capitalized, while [@fig:figure2;
@Fig:figure1] is not.

It is also possible to mix different references, like [@fig:figure1;
@tbl:table1; @lst:captionAttr; @lst:tableCaption; @fig:figure2; @fig:figure3],
which will be grouped in order they are specified. You can even intermix this
with regular citations, although it's not recommended: [@fig:figure1;
@tbl:table1]

You can also have custom chapter reference labels, like @sec:custlabs

Subfigures are supported, see [@fig:subfigures; @fig:subfigureB]

## Figures {.unlisted .unnumbered #sec:sec1}

![First figure](img/img1.jpg){#fig:figure1}

![Second figure](img/img2.jpg){#fig:figure2}

![Third figure](img/img3.jpg){#fig:figure3}

![Unlabelled image](img/img1.jpg)

<div id="fig:subfigures">
![Subfigure a](img/img1.jpg)

![Subfigure b](img/img1.jpg){#fig:subfigureB}

Subfigures caption
</div>

## Equations {.unlisted .unnumbered #sec:sec2} 

Display equations are labelled and numbered

$$ P_i(x) = \sum_i a_i x^i $$ {#eq:eqn1}

Since 0.1.6.0 those can also appear in the middle of paragraph
$$a x^2 + b x^2 + c = 0$$ {#eq:quadr} like this.

## Tables {.unlisted .unnumbered}

| First Header | Second Header |
|:-------------|:--------------|
| Content Cell | Content Cell  |
| Content Cell | Content Cell  |

: Table example {#tbl:table1}

## Table example {.unlisted .unnumbered} 


Table without caption:

| First Header | Second Header |
|:-------------|:--------------|
| Content Cell | Content Cell  |
| Content Cell | Content Cell  |


## Code blocks {.unlisted .unnumbered}

There are a couple options for code block labels. Those work only if code block id starts with `lst:`, e.g. `{#lst:label}`

### `caption` attribute {#sec:caption-attr .unlisted .unnumbered}

`caption` attribute will be treated as code block caption. If code block has both id and `caption` attributes, it will be treated as numbered code block.

```{#lst:captionAttr .haskell caption="Listing caption"}
main :: IO ()
main = putStrLn "Hello World!"
```

### Table-style captions{.unlisted .unnumbered #sec:table-capts}

Enabled with `codeBlockCaptions` metadata option. If code block is immediately
adjacent to paragraph, starting with `Listing: ` or `: `, said paragraph will
be treated as code block caption.

Listing: Listing caption

```{#lst:tableCaption .haskell}
main :: IO ()
main = putStrLn "Hello World!"
```

### Wrapping div {.unlisted .unnumbered}

Wrapping code block without label in a div with id `lst:...` and class, starting with `listing`, and adding paragraph before code block, but inside div, will treat said paragraph as code block caption.

<div id="lst:wrappingDiv" class="listing">
Listing caption
```{.haskell}
main :: IO ()
main = putStrLn "Hello World!"
```
</div>

## Unnumbered chapter.  {.unlisted .unnumbered}

This chapter doesn't change chapter prefix of referenced elements, instead keeping number of previous chapter, e.g.
$$ S(x) = \int_{x_1}^{x_2} a x+b \  \mathrm{d}x $$ {#eq:eqn2}

## Reference lists {.unlisted .unnumbered}

It's also possible to show lists of figures and tables, like this:

\listoffigures

\listoftables

\listoflistings

<!--
## Custom labels {.unnumbered .unlisted}

### This section will have custom label {.unnambered #sec:custlabs label=CustLabs}
-->
