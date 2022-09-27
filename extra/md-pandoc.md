
# Apendice A: Pandoc's Markdown {.unnumbered}

Pandoc understands an extended and slightly revised version of
John Gruber's [Markdown] syntax. This document explains the syntax,
noting differences from original Markdown.

## Paragraphs{.unlisted .unnumbered}

A paragraph is one or more lines of text followed by one or more blank lines.
Newlines are treated as spaces, so you can reflow your paragraphs as you like.
If you need a hard line break, put two or more spaces at the end of a line.

#### Extension: `escaped_line_breaks` ####{.unlisted .unnumbered}

A backslash followed by a newline is also a hard line break.
Note:  in multiline and grid table cells, this is the only way
to create a hard line break, since trailing spaces in the cells
are ignored.

## Headings{.unlisted .unnumbered}

There are two kinds of headings: Setext and ATX.

### Setext-style headings ###{.unlisted .unnumbered}

A setext-style heading is a line of text "underlined" with a row of `=` signs
(for a level-one heading) or `-` signs (for a level-two heading):

    A level-one heading
    ===================

    A level-two heading
    -------------------

The heading text can contain inline formatting, such as emphasis (see
[Inline formatting], below).


### ATX-style headings ###{.unlisted .unnumbered}

An ATX-style heading consists of one to six `#` signs and a line of
text, optionally followed by any number of `#` signs.  The number of
`#` signs at the beginning of the line is the heading level:

    ## A level-two heading

    ### A level-three heading ###

As with setext-style headings, the heading text can contain formatting:

    # A level-one heading with a [link](/url) and *emphasis*

#### Extension: `blank_before_header` ####{.unlisted .unnumbered}

Original Markdown syntax does not require a blank line before a heading.
Pandoc does require this (except, of course, at the beginning of the
document). The reason for the requirement is that it is all too easy for a
`#` to end up at the beginning of a line by accident (perhaps through line
wrapping). Consider, for example:

    I like several of their flavors of ice cream:
    #22, for example, and #5.

#### Extension: `space_in_atx_header` ####{.unlisted .unnumbered}

Many Markdown implementations do not require a space between the
opening `#`s of an ATX heading and the heading text, so that
`#5 bolt` and `#hashtag` count as headings.  With this extension,
pandoc does require the space.

### Heading identifiers ###{.unlisted .unnumbered}

See also the [`auto_identifiers`
extension](#extension-auto_identifiers) above.

#### Extension: `header_attributes` ####{.unlisted .unnumbered}

Headings can be assigned attributes using this syntax at the end
of the line containing the heading text:

    {#identifier .class .class key=value key=value}

Thus, for example, the following headings will all be assigned the identifier
`foo`:

    # My heading {#foo}

    ## My heading ##    {#foo}

    My other heading   {#foo}
    ---------------

(This syntax is compatible with [PHP Markdown Extra].)

Note that although this syntax allows assignment of classes and key/value
attributes, writers generally don't use all of this information.  Identifiers,
classes, and key/value attributes are used in HTML and HTML-based formats such
as EPUB and slidy.  Identifiers are used for labels and link anchors in the
LaTeX, ConTeXt, Textile, Jira markup, and AsciiDoc writers.

Headings with the class `unnumbered` will not be numbered, even if
`--number-sections` is specified.  A single hyphen (`-`) in an attribute
context is equivalent to `.unnumbered`, and preferable in non-English
documents.  So,

    # My heading {.unlisted .unnumbered}

is just the same as

    # My heading {.unnumbered}

If the `unlisted` class is present in addition to `unnumbered`,
the heading will not be included in a table of contents.
(Currently this feature is only implemented for certain
formats: those based on LaTeX and HTML, PowerPoint, and RTF.)

#### Extension: `implicit_header_references` ####{.unlisted .unnumbered}

Pandoc behaves as if reference links have been defined for each heading.
So, to link to a heading

    # Heading identifiers in HTML

you can simply write

    [Heading identifiers in HTML]

or

    [Heading identifiers in HTML][]

or

    [the section on heading identifiers][heading identifiers in
    HTML]

instead of giving the identifier explicitly:

    [Heading identifiers in HTML](#heading-identifiers-in-html)

If there are multiple headings with identical text, the corresponding
reference will link to the first one only, and you will need to use explicit
links to link to the others, as described above.

Like regular reference links, these references are case-insensitive.

Explicit link reference definitions always take priority over
implicit heading references.  So, in the following example, the
link will point to `bar`, not to `#foo`:

    # Foo

    [foo]: bar

    See [foo]

## Block quotations{.unlisted .unnumbered}

Markdown uses email conventions for quoting blocks of text.
A block quotation is one or more paragraphs or other block elements
(such as lists or headings), with each line preceded by a `>` character
and an optional space. (The `>` need not start at the left margin, but
it should not be indented more than three spaces.)

    > This is a block quote. This
    > paragraph has two lines.
    >
    > 1. This is a list inside a block quote.
    > 2. Second item.

A "lazy" form, which requires the `>` character only on the first
line of each block, is also allowed:

    > This is a block quote. This
    paragraph has two lines.

    > 1. This is a list inside a block quote.
    2. Second item.

Among the block elements that can be contained in a block quote are
other block quotes. That is, block quotes can be nested:

    > This is a block quote.
    >
    > > A block quote within a block quote.

If the `>` character is followed by an optional space, that space
will be considered part of the block quote marker and not part of
the indentation of the contents.  Thus, to put an indented code
block in a block quote, you need five spaces after the `>`:

    >     code

#### Extension: `blank_before_blockquote` ####{.unlisted .unnumbered}

Original Markdown syntax does not require a blank line before a
block quote.  Pandoc does require this (except, of course, at
the beginning of the document). The reason for the requirement
is that it is all too easy for a `>` to end up at the beginning
of a line by accident (perhaps through line wrapping). So,
unless the `markdown_strict` format is used, the following does
not produce a nested block quote in pandoc:

    > This is a block quote.
    >> Nested.


## Verbatim (code) blocks{.unlisted .unnumbered}

### Indented code blocks ###{.unlisted .unnumbered}

A block of text indented four spaces (or one tab) is treated as verbatim
text: that is, special characters do not trigger special formatting,
and all spaces and line breaks are preserved.  For example,

        if (a > 3) {
          moveShip(5 * gravity, DOWN);
        }

The initial (four space or one tab) indentation is not considered part
of the verbatim text, and is removed in the output.

Note: blank lines in the verbatim text need not begin with four spaces.


### Fenced code blocks ###{.unlisted .unnumbered}

#### Extension: `fenced_code_blocks` ####{.unlisted .unnumbered}

In addition to standard indented code blocks, pandoc supports
*fenced* code blocks.  These begin with a row of three or more
tildes (`~`) and end with a row of tildes that must be at least as long as
the starting row. Everything between these lines is treated as code. No
indentation is necessary:

    ~~~~~~~
    if (a > 3) {
      moveShip(5 * gravity, DOWN);
    }
    ~~~~~~~

Like regular code blocks, fenced code blocks must be separated
from surrounding text by blank lines.

If the code itself contains a row of tildes or backticks, just use a longer
row of tildes or backticks at the start and end:

    ~~~~~~~~~~~~~~~~
    ~~~~~~~~~~
    code including tildes
    ~~~~~~~~~~
    ~~~~~~~~~~~~~~~~

#### Extension: `backtick_code_blocks` ####{.unlisted .unnumbered}

Same as `fenced_code_blocks`, but uses backticks (`` ` ``) instead of tildes
(`~`).

#### Extension: `fenced_code_attributes` ####{.unlisted .unnumbered}

Optionally, you may attach attributes to fenced or backtick code block using
this syntax:

    ~~~~ {#mycode .haskell .numberLines startFrom="100"}
    qsort []     = []
    qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++
                   qsort (filter (>= x) xs)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here `mycode` is an identifier, `haskell` and `numberLines` are
classes, and `startFrom` is an attribute with value `100`. Some
output formats can use this information to do syntax
highlighting. Currently, the only output formats that use this
information are HTML, LaTeX, Docx, Ms, and PowerPoint. If
highlighting is supported for your output format and language,
then the code block above will appear highlighted, with numbered
lines. (To see which languages are supported, type `pandoc
--list-highlight-languages`.) Otherwise, the code block above
will appear as follows:

    <pre id="mycode" class="haskell numberLines" startFrom="100">
      <code>
      ...
      </code>
    </pre>

The `numberLines` (or `number-lines`) class will cause the lines
of the code block to be numbered, starting with `1` or the value
of the `startFrom` attribute.  The `lineAnchors` (or
`line-anchors`) class will cause the lines to be clickable
anchors in HTML output.

A shortcut form can also be used for specifying the language of
the code block:

    ```haskell
    qsort [] = []
    ```

This is equivalent to:

    ``` {.haskell}
    qsort [] = []
    ```

This shortcut form may be combined with attributes:

    ```haskell {.numberLines}
    qsort [] = []
    ```

Which is equivalent to:

    ``` {.haskell .numberLines}
    qsort [] = []
    ```

If the `fenced_code_attributes` extension is disabled, but
input contains class attribute(s) for the code block, the first
class attribute will be printed after the opening fence as a bare
word.

To prevent all highlighting, use the `--no-highlight` flag.
To set the highlighting style, use `--highlight-style`.
For more information on highlighting, see [Syntax highlighting],
below.

## Line blocks{.unlisted .unnumbered}

#### Extension: `line_blocks` ####{.unlisted .unnumbered}

A line block is a sequence of lines beginning with a vertical bar (`|`)
followed by a space.  The division into lines will be preserved in
the output, as will any leading spaces; otherwise, the lines will
be formatted as Markdown.  This is useful for verse and addresses:

    | The limerick packs laughs anatomical
    | In space that is quite economical.
    |    But the good ones I've seen
    |    So seldom are clean
    | And the clean ones so seldom are comical

    | 200 Main St.
    | Berkeley, CA 94718

The lines can be hard-wrapped if needed, but the continuation
line must begin with a space.

    | The Right Honorable Most Venerable and Righteous Samuel L.
      Constable, Jr.
    | 200 Main St.
    | Berkeley, CA 94718

Inline formatting (such as emphasis) is allowed in the content,
but not block-level formatting (such as block quotes or lists).

This syntax is borrowed from [reStructuredText].

## Lists{.unlisted .unnumbered}

### Bullet lists ###{.unlisted .unnumbered}

A bullet list is a list of bulleted list items.  A bulleted list
item begins with a bullet (`*`, `+`, or `-`).  Here is a simple
example:

    * one
    * two
    * three

This will produce a "compact" list. If you want a "loose" list, in which
each item is formatted as a paragraph, put spaces between the items:

    * one

    * two

    * three

The bullets need not be flush with the left margin; they may be
indented one, two, or three spaces. The bullet must be followed
by whitespace.

List items look best if subsequent lines are flush with the first
line (after the bullet):

    * here is my first
      list item.
    * and my second.

But Markdown also allows a "lazy" format:

    * here is my first
    list item.
    * and my second.

### Block content in list items ###

A list item may contain multiple paragraphs and other block-level
content. However, subsequent paragraphs must be preceded by a blank line
and indented to line up with the first non-space content after
the list marker.

      * First paragraph.

        Continued.

      * Second paragraph. With a code block, which must be indented
        eight spaces:

            { code }

Exception: if the list marker is followed by an indented code
block, which must begin 5 spaces after the list marker, then
subsequent paragraphs must begin two columns after the last
character of the list marker:

    *     code

      continuation paragraph

List items may include other lists.  In this case the preceding blank
line is optional.  The nested list must be indented to line up with
the first non-space character after the list marker of the
containing list item.

    * fruits
      + apples
        - macintosh
        - red delicious
      + pears
      + peaches
    * vegetables
      + broccoli
      + chard

As noted above, Markdown allows you to write list items "lazily," instead of
indenting continuation lines. However, if there are multiple paragraphs or
other blocks in a list item, the first line of each must be indented.

    + A lazy, lazy, list
    item.

    + Another one; this looks
    bad but is legal.

        Second paragraph of second
    list item.

### Ordered lists ###{.unlisted .unnumbered}

Ordered lists work just like bulleted lists, except that the items
begin with enumerators rather than bullets.

In original Markdown, enumerators are decimal numbers followed
by a period and a space.  The numbers themselves are ignored, so
there is no difference between this list:

    1.  one
    2.  two
    3.  three

and this one:

    5.  one
    7.  two
    1.  three

#### Extension: `fancy_lists` ####{.unlisted .unnumbered}

Unlike original Markdown, pandoc allows ordered list items to be marked
with uppercase and lowercase letters and roman numerals, in addition to
Arabic numerals. List markers may be enclosed in parentheses or followed by a
single right-parenthesis or period. They must be separated from the
text that follows by at least one space, and, if the list marker is a
capital letter with a period, by at least two spaces.[^2]

[^2]:  The point of this rule is to ensure that normal paragraphs
    starting with people's initials, like

        B. Russell was an English philosopher.

    do not get treated as list items.

    This rule will not prevent

        (C) 2007 Joe Smith

    from being interpreted as a list item.  In this case, a backslash
    escape can be used:

        (C\) 2007 Joe Smith

The `fancy_lists` extension also allows '`#`' to be used as an
ordered list marker in place of a numeral:

    #. one
    #. two

#### Extension: `startnum` ####{.unlisted .unnumbered}

Pandoc also pays attention to the type of list marker used, and to the
starting number, and both of these are preserved where possible in the
output format. Thus, the following yields a list with numbers followed
by a single parenthesis, starting with 9, and a sublist with lowercase
roman numerals:

     9)  Ninth
    10)  Tenth
    11)  Eleventh
           i. subone
          ii. subtwo
         iii. subthree

Pandoc will start a new list each time a different type of list
marker is used.  So, the following will create three lists:

    (2) Two
    (5) Three
    1.  Four
    *   Five

If default list markers are desired, use `#.`:

    #.  one
    #.  two
    #.  three

#### Extension: `task_lists` ####{.unlisted .unnumbered}

Pandoc supports task lists, using the syntax of GitHub-Flavored Markdown.

    - [ ] an unchecked task list item
    - [x] checked item

### Definition lists ###{.unlisted .unnumbered}

#### Extension: `definition_lists` ####{.unlisted .unnumbered}

Pandoc supports definition lists, using the syntax of
[PHP Markdown Extra] with some extensions.[^3]

    Term 1

    :   Definition 1

    Term 2 with *inline markup*

    :   Definition 2

            { some code, part of Definition 2 }

        Third paragraph of definition 2.

Each term must fit on one line, which may optionally be followed by
a blank line, and must be followed by one or more definitions.
A definition begins with a colon or tilde, which may be indented one
or two spaces.

A term may have multiple definitions, and each definition may
consist of one or more block elements (paragraph, code block,
list, etc.), each indented four spaces or one tab stop.  The
body of the definition (not including the first line)
should be indented four spaces. However, as with
other Markdown lists, you can "lazily" omit indentation except
at the beginning of a paragraph or other block element:

    Term 1

    :   Definition
    with lazy continuation.

        Second paragraph of the definition.

If you leave space before the definition (as in the example above),
the text of the definition will be treated as a paragraph.  In some
output formats, this will mean greater spacing between term/definition
pairs. For a more compact definition list, omit the space before the
definition:

    Term 1
      ~ Definition 1

    Term 2
      ~ Definition 2a
      ~ Definition 2b

Note that space between items in a definition list is required.
(A variant that loosens this requirement, but disallows "lazy"
hard wrapping, can be activated with `compact_definition_lists`: see
[Non-default extensions], below.)

[^3]:  I have been influenced by the suggestions of [David
  Wheeler](https://justatheory.com/2009/02/modest-markdown-proposal/).

### Numbered example lists ###{.unlisted .unnumbered}

#### Extension: `example_lists` ####{.unlisted .unnumbered}

The special list marker `@` can be used for sequentially numbered
examples. The first list item with a `@` marker will be numbered '1',
the next '2', and so on, throughout the document. The numbered examples
need not occur in a single list; each new list using `@` will take up
where the last stopped. So, for example:

    (@)  My first example will be numbered (1).
    (@)  My second example will be numbered (2).

    Explanation of examples.

    (@)  My third example will be numbered (3).

Numbered examples can be labeled and referred to elsewhere in the
document:

    (@good)  This is a good example.

    As (@good) illustrates, ...

The label can be any string of alphanumeric characters, underscores,
or hyphens.

Note:  continuation paragraphs in example lists must always
be indented four spaces, regardless of the length of the
list marker.  That is, example lists always behave as if the
`four_space_rule` extension is set.  This is because example
labels tend to be long, and indenting content to the
first non-space character after the label would be awkward.


### Ending a list ###{.unlisted .unnumbered}

What if you want to put an indented code block after a list?

    -   item one
    -   item two

        { my code block }

Trouble! Here pandoc (like other Markdown implementations) will treat
`{ my code block }` as the second paragraph of item two, and not as
a code block.

To "cut off" the list after item two, you can insert some non-indented
content, like an HTML comment, which won't produce visible output in
any format:

    -   item one
    -   item two

    <!-- end of list -->

        { my code block }

You can use the same trick if you want two consecutive lists instead
of one big list:

    1.  one
    2.  two
    3.  three

    <!-- -->

    1.  uno
    2.  dos
    3.  tres

## Horizontal rules{.unlisted .unnumbered}

A line containing a row of three or more `*`, `-`, or `_` characters
(optionally separated by spaces) produces a horizontal rule:

    *  *  *  *

    ---------------

We strongly recommend that horizontal rules be separated from
surrounding text by blank lines.  If a horizontal rule is not
followed by a blank line, pandoc may try to interpret the
lines that follow as a YAML metadata block or a table.

## Tables{.unlisted .unnumbered}

Four kinds of tables may be used. The first three kinds presuppose the use of
a fixed-width font, such as Courier. The fourth kind can be used with
proportionally spaced fonts, as it does not require lining up columns.

#### Extension: `table_captions` ####

A caption may optionally be provided with all 4 kinds of tables (as
illustrated in the examples below). A caption is a paragraph beginning
with the string `Table:` (or `table:` or just `:`), which will be stripped
off. It may appear either before or after the table.

#### Extension: `simple_tables` ####{.unlisted .unnumbered}

Simple tables look like this:

      Right     Left     Center     Default
    -------     ------ ----------   -------
         12     12        12            12
        123     123       123          123
          1     1          1             1

    Table:  Demonstration of simple table syntax.

The header and table rows must each fit on one line.  Column
alignments are determined by the position of the header text relative
to the dashed line below it:[^4]

  - If the dashed line is flush with the header text on the right side
    but extends beyond it on the left, the column is right-aligned.
  - If the dashed line is flush with the header text on the left side
    but extends beyond it on the right, the column is left-aligned.
  - If the dashed line extends beyond the header text on both sides,
    the column is centered.
  - If the dashed line is flush with the header text on both sides,
    the default alignment is used (in most cases, this will be left).

[^4]:  This scheme is due to Michel Fortin, who proposed it on the
       [Markdown discussion list](http://six.pairlist.net/pipermail/markdown-discuss/2005-March/001097.html).

The table must end with a blank line, or a line of dashes followed by
a blank line.

The column header row may be omitted, provided a dashed line is used
to end the table. For example:

    -------     ------ ----------   -------
         12     12        12             12
        123     123       123           123
          1     1          1              1
    -------     ------ ----------   -------

When the header row is omitted, column alignments are determined on the basis
of the first line of the table body. So, in the tables above, the columns
would be right, left, center, and right aligned, respectively.

#### Extension: `multiline_tables` ####

Multiline tables allow header and table rows to span multiple lines
of text (but cells that span multiple columns or rows of the table are
not supported).  Here is an example:

    -------------------------------------------------------------
     Centered   Default           Right Left
      Header    Aligned         Aligned Aligned
    ----------- ------- --------------- -------------------------
       First    row                12.0 Example of a row that
                                        spans multiple lines.

      Second    row                 5.0 Here's another one. Note
                                        the blank line between
                                        rows.
    -------------------------------------------------------------

    Table: Here's the caption. It, too, may span
    multiple lines.

These work like simple tables, but with the following differences:

  - They must begin with a row of dashes, before the header text
    (unless the header row is omitted).
  - They must end with a row of dashes, then a blank line.
  - The rows must be separated by blank lines.

In multiline tables, the table parser pays attention to the widths of
the columns, and the writers try to reproduce these relative widths in
the output. So, if you find that one of the columns is too narrow in the
output, try widening it in the Markdown source.

The header may be omitted in multiline tables as well as simple tables:

    ----------- ------- --------------- -------------------------
       First    row                12.0 Example of a row that
                                        spans multiple lines.

      Second    row                 5.0 Here's another one. Note
                                        the blank line between
                                        rows.
    ----------- ------- --------------- -------------------------

    : Here's a multiline table without a header.

It is possible for a multiline table to have just one row, but the row
should be followed by a blank line (and then the row of dashes that ends
the table), or the table may be interpreted as a simple table.

#### Extension: `grid_tables` ####{.unlisted .unnumbered}

Grid tables look like this:

    : Sample grid table.

    +---------------+---------------+--------------------+
    | Fruit         | Price         | Advantages         |
    +===============+===============+====================+
    | Bananas       | $1.34         | - built-in wrapper |
    |               |               | - bright color     |
    +---------------+---------------+--------------------+
    | Oranges       | $2.10         | - cures scurvy     |
    |               |               | - tasty            |
    +---------------+---------------+--------------------+

The row of `=`s separates the header from the table body, and can be
omitted for a headerless table. The cells of grid tables may contain
arbitrary block elements (multiple paragraphs, code blocks, lists,
etc.). Cells that span multiple columns or rows are not
supported. Grid tables can be created easily using Emacs' table-mode
(`M-x table-insert`).

Alignments can be specified as with pipe tables, by putting
colons at the boundaries of the separator line after the
header:

    +---------------+---------------+--------------------+
    | Right         | Left          | Centered           |
    +==============:+:==============+:==================:+
    | Bananas       | $1.34         | built-in wrapper   |
    +---------------+---------------+--------------------+

For headerless tables, the colons go on the top line instead:

    +--------------:+:--------------+:------------------:+
    | Right         | Left          | Centered           |
    +---------------+---------------+--------------------+

##### Grid table foot #####{.unlisted .unnumbered}

A table foot can be defined by enclosing it with separator lines
that use `=` instead of `-`:

     +---------------+---------------+
     | Fruit         | Price         |
     +===============+===============+
     | Bananas       | $1.34         |
     +---------------+---------------+
     | Oranges       | $2.10         |
     +===============+===============+
     | Sum           | $3.44         |
     +===============+===============+

The foot must always be placed at the very bottom of the table.

#### Extension: `pipe_tables` ####

Pipe tables look like this:

    | Right | Left | Default | Center |
    |------:|:-----|---------|:------:|
    |   12  |  12  |    12   |    12  |
    |  123  |  123 |   123   |   123  |
    |    1  |    1 |     1   |     1  |

      : Demonstration of pipe table syntax.

The syntax is identical to [PHP Markdown Extra tables].  The beginning and
ending pipe characters are optional, but pipes are required between all
columns.  The colons indicate column alignment as shown.  The header
cannot be omitted.  To simulate a headerless table, include a header
with blank cells.

Since the pipes indicate column boundaries, columns need not be vertically
aligned, as they are in the above example.  So, this is a perfectly
legal (though ugly) pipe table:

    fruit| price
    -----|-----:
    apple|2.05
    pear|1.37
    orange|3.09

The cells of pipe tables cannot contain block elements like paragraphs
and lists, and cannot span multiple lines.  If any line of the
markdown source is longer than the column width (see `--columns`),
then the table will take up the full text width and the cell
contents will wrap, with the relative cell widths determined by
the number of dashes in the line separating the table header
from the table body. (For example `---|-` would make the first column 3/4
and the second column 1/4 of the full text width.)
On the other hand, if no lines are wider than column width, then
cell contents will not be wrapped, and the cells will be sized
to their contents.

Note:  pandoc also recognizes pipe tables of the following
form, as can be produced by Emacs' orgtbl-mode:

    | One | Two   |
    |-----+-------|
    | my  | table |
    | is  | nice  |

The difference is that `+` is used instead of `|`. Other orgtbl features
are not supported. In particular, to get non-default column alignment,
you'll need to add colons as above.

[PHP Markdown Extra tables]: https://michelf.ca/projects/php-markdown/extra/#table

## Metadata blocks{.unlisted .unnumbered}

#### Extension: `pandoc_title_block` ####{.unlisted .unnumbered}

If the file begins with a title block

    % title
    % author(s) (separated by semicolons)
    % date

it will be parsed as bibliographic information, not regular text.  (It
will be used, for example, in the title of standalone LaTeX or HTML
output.)  The block may contain just a title, a title and an author,
or all three elements. If you want to include an author but no
title, or a title and a date but no author, you need a blank line:

```
%
% Author
```

```
% My title
%
% June 15, 2006
```

The title may occupy multiple lines, but continuation lines must
begin with leading space, thus:

```
% My title
  on multiple lines
```

If a document has multiple authors, the authors may be put on
separate lines with leading space, or separated by semicolons, or
both.  So, all of the following are equivalent:

```
% Author One
  Author Two
```

```
% Author One; Author Two
```

```
% Author One;
  Author Two
```

The date must fit on one line.

All three metadata fields may contain standard inline formatting
(italics, links, footnotes, etc.).

Title blocks will always be parsed, but they will affect the output only
when the `--standalone` (`-s`) option is chosen. In HTML output, titles
will appear twice: once in the document head -- this is the title that
will appear at the top of the window in a browser -- and once at the
beginning of the document body. The title in the document head can have
an optional prefix attached (`--title-prefix` or `-T` option). The title
in the body appears as an H1 element with class "title", so it can be
suppressed or reformatted with CSS. If a title prefix is specified with
`-T` and no title block appears in the document, the title prefix will
be used by itself as the HTML title.

The man page writer extracts a title, man page section number, and
other header and footer information from the title line. The title
is assumed to be the first word on the title line, which may optionally
end with a (single-digit) section number in parentheses. (There should
be no space between the title and the parentheses.)  Anything after
this is assumed to be additional footer and header text. A single pipe
character (`|`) should be used to separate the footer text from the header
text.  Thus,

    % PANDOC(1)

will yield a man page with the title `PANDOC` and section 1.

    % PANDOC(1) Pandoc User Manuals

will also have "Pandoc User Manuals" in the footer.

    % PANDOC(1) Pandoc User Manuals | Version 4.0

will also have "Version 4.0" in the header.

#### Extension: `yaml_metadata_block` ####

A [YAML] metadata block is a valid YAML object, delimited by a line of three
hyphens (`---`) at the top and a line of three hyphens (`---`) or three dots
(`...`) at the bottom.  The initial line `---` must not be followed by a blank
line. A YAML metadata block may occur anywhere in the document, but if
it is not at the beginning, it must be preceded by a blank line.

Note that, because of the way pandoc concatenates input files
when several are provided, you may also keep the metadata in a
separate YAML file and pass it to pandoc as an argument, along
with your Markdown files:

    pandoc chap1.md chap2.md chap3.md metadata.yaml -s -o book.html

Just be sure that the YAML file begins with `---` and ends with `---` or
`...`. Alternatively, you can use the `--metadata-file` option. Using
that approach however, you cannot reference content (like footnotes)
from the main markdown input document.

Metadata will be taken from the fields of the YAML object and added to any
existing document metadata.  Metadata can contain lists and objects (nested
arbitrarily), but all string scalars will be interpreted as Markdown.  Fields
with names ending in an underscore will be ignored by pandoc.  (They may be
given a role by external processors.)  Field names must not be
interpretable as YAML numbers or boolean values (so, for
example, `yes`, `True`, and `15` cannot be used as field names).

A document may contain multiple metadata blocks.  If two
metadata blocks attempt to set the same field, the value from
the second block will be taken.

Each metadata block is handled internally as an independent YAML document.
This means, for example, that any YAML anchors defined in a block cannot be
referenced in another block.

When pandoc is used with `-t markdown` to create a Markdown document,
a YAML metadata block will be produced only if the `-s/--standalone`
option is used.  All of the metadata will appear in a single block
at the beginning of the document.

Note that [YAML] escaping rules must be followed. Thus, for example,
if a title contains a colon, it must be quoted, and if it contains a
backslash escape, then it must be ensured that it is not treated as a
[YAML escape sequence]. The pipe character (`|`) can be used to begin
an indented block that will be interpreted literally, without need for
escaping. This form is necessary when the field contains blank lines
or block-level formatting:

    ---
    title:  'This is the title: it contains a colon'
    author:
    - Author One
    - Author Two
    keywords: [nothing, nothingness]
    abstract: |
      This is the abstract.

      It consists of two paragraphs.
    ...

The literal block after the `|` must be indented relative to the
line containing the `|`.  If it is not, the YAML will be invalid
and pandoc will not interpret it as metadata.  For an overview
of the complex rules governing YAML, see the [Wikipedia entry on
YAML syntax].

Template variables will be set automatically from the metadata.  Thus, for
example, in writing HTML, the variable `abstract` will be set to the HTML
equivalent of the Markdown in the `abstract` field:

    <p>This is the abstract.</p>
    <p>It consists of two paragraphs.</p>

Variables can contain arbitrary YAML structures, but the template must match
this structure.  The `author` variable in the default templates expects a
simple list or string, but can be changed to support more complicated
structures.  The following combination, for example, would add an affiliation
to the author if one is given:

    ---
    title: The document title
    author:
    - name: Author One
      affiliation: University of Somewhere
    - name: Author Two
      affiliation: University of Nowhere
    ...

To use the structured authors in the example above, you would need a custom
template:

    $for(author)$
    $if(author.name)$
    $author.name$$if(author.affiliation)$ ($author.affiliation$)$endif$
    $else$
    $author$
    $endif$
    $endfor$

Raw content to include in the document's header may be specified
using `header-includes`; however, it is important to mark up
this content as raw code for a particular output format, using
the [`raw_attribute` extension](#extension-raw_attribute), or it
will be interpreted as markdown. For example:

    header-includes:
    - |
      ```{=latex}
      \let\oldsection\section
      \renewcommand{\section}[1]{\clearpage\oldsection{#1}}
      ```

Note:  the `yaml_metadata_block` extension works with
`commonmark` as well as `markdown` (and it is enabled by default
in `gfm` and `commonmark_x`).  However, in these formats the
following restrictions apply:

- The YAML metadata block must occur at the beginning of the
  document (and there can be only one).  If multiple files are
  given as arguments to pandoc, only the first can be a YAML
  metadata block.

- The leaf nodes of the YAML structure are parsed in isolation from
  each other and from the rest of the document.  So, for
  example,  you can't use a reference link in these contexts
  if the link definition is somewhere else in the document.

[YAML escape sequence]: https://yaml.org/spec/1.2/spec.html#id2776092
[Wikipedia entry on YAML syntax]:  https://en.wikipedia.org/wiki/YAML#Syntax
