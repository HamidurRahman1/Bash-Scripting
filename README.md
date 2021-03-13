# Bash-Scripting

## Index -
* [***Shebang***](#shebang)
* [***Comments***](#comments)
* [***Variables***](#variables)

---

## <a name="shebang">Shebang</a>
The `#!` syntax used in scripts to indicate an interpreter for execution under UNIX / Linux operating systems. \
    **`#!/bin/sh` or `#!/usr/bin/sh` or `#!/bin/bash` or `#!/usr/bin/env [shell]`**

---

## <a name="comments">Comments</a>
* Single Line Comment: A single line that starts with `#` will be treated as a comment to the end of the line. \
    **`# This is a single line comment`**

* Multi Line Comment: A multi-line starts with `: '` and end with `'` will be treated as a multi-line comment. \
    **<pre>`: '
  This is the line 1 of multi-line comment.
  this is the line 2 of multi-line comment.
  '`**</pre>
---

## <a name="variables">Variables</a>
 * Shell supports variables, and they can be strings, integers, real numbers etc without the data type 
declarations. The variables can be accessed by `$VAR_NAME`. A variable declaration MUST be in `VAR_NAME=VAR_VALUE` 
format and MUST NOT have any spaces between like `VAR = VALUE`. A variable name can only contains A-Z, a-z, `_`, 
and 0-9 BUT it cannot be numbers only and cannot start with numbers.

 * A string variable can be declared without the quotes `"value"` if it does not contain spaces. If there are no spaces then
it can be declared as `VAR1=VarValueWithoutSpaces` instead of `VAR1="VarValueWithoutSpaces"`.  

---