# Bash-Scripting

## Index:
* [Shebang](#shebang)
* [Comments](#comments)
* [Variables](#variables)
* [Inputs](#inputs)
* [If-Else](#ifelse)
* [Loops](#loops)
* [Array](#array)  
* [Command Line Arguments](#cmdargs)

---

## <a name="shebang">Shebang</a>
The `#!` syntax used in scripts to indicate an interpreter for execution under UNIX / Linux operating systems. <br>
 **`#!/bin/sh` or `#!/usr/bin/sh` or `#!/bin/bash` or `#!/usr/bin/env [shell]`**

---

## <a name="comments">Comments</a>
* Single Line Comment: A single line that starts with `#` will be treated as a comment to the end of the line. <br>
  **`# This is a single line comment`**

* Multi Line Comment: A multi-line starts with `: '` and end with `'` will be treated as a multi-line comment. <br>
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

 * A string variable can be declared without the quotes `"value"` if it does not contain spaces. If there are no spaces 
   then it can be declared as `VAR1=VarValueWithoutSpaces` instead of `VAR1="VarValueWithoutSpaces"`.  

 * A variable can be declared with `read` command.

 * A variable can be made final/constant via `readonly` command.
    ```shell
      TARGET_IP=0.0.0.0
      readonly TARGET_IP 
      or
      readonly TARGET_IP=0.0.0.0 
    ```
   
 * A readonly variable with `unset` command or reassignment will cause an error during execution.

---

## <a name="inputs">Inputs</a>
 * User inputs are received using the `read` command followed by a variable name.

 * Entered input will be wrapped into double quotes `"entered input"` automatically so input with spaces do not get lost.
 
 * Multiple inputs can be used using `read var1 var2 var3`.

 * A variable can be used and declared with `read` command at the same time.

 * ```shell
    echo "What is your name?"  
    read NAME  
    echo "Hello $NAME - hope you are doing well."
    ```

 * Input with options: `read` can be used with options like `-p` allows a prompt where `-sp` allows silent prompts 
   (inputs not visible).
    ```shell
      read -p "Username: " uservar
      read -sp "Password: " passvar
      echo "Username: $uservar and Password: $passvar"
    ```

 * Inputs with flags: TBD.
---

## <a name="ifelse">If-Else</a>
 * Syntax: 
```shell
if [[ CONDITION ]]
then
  STATEMENTS_1
  ...
  STATEMENTS_N
fi
```
 Spaces between `if` and test must be present.

 * Only`if` branch: 
```shell
if [[ CONDITION ]]
then
  statement(s)
fi
```
 Alternatively, `if` can be combined with `then` like -
```shell
if [[ CONDITION ]]; then
  statement(s)
fi
```

 * `if-else` branch: 
```shell
if [[ CONDITION ]]; then
  statement(s)
else
  statement(s)
fi
```
   
 * `if..elif..else` branch:
```shell
if [[ CONDITION ]]; then
  statement(s)
elif [[ CONDITION ]]; then
  statement(s)
else
  statement(s)
fi
```

 * String and Numeric conditions:

| Condition | Description
| :---         |     :---:      
| [[ -z $VAR ]] | true if `VAR` is empty, false otherwise     
| [[ -n $VAR ]] | true if `VAR` is NOT empty (length > 0), false otherwise
| [[ $VAR1 == $VAR2 ]] | true if `VAR1` and `VAR2` are equal, false otherwise
| [[ $VAR1 != $VAR2 ]] | true if `VAR1` and `VAR2` are NOT equal, false otherwise
| [[ $STRING1 =~ $STRING2 ]] | Regexp
| - | - 
| [[ $NUM1 -eq $NUM2 ]] | true if `$NUM1` is equal to `$NUM2`, false otherwise     
| [[ $NUM1 -ne $NUM2 ]] | true if `$NUM1` is NOT equal to `$NUM2`, false otherwise
| [[ $NUM1 -lt $NUM2 ]] | true if `$NUM1` is less than `$NUM2`, false otherwise
| [[ $NUM1 -le $NUM2 ]] | true if `$NUM1` is less than or equal to `$NUM2`, false otherwise
| [[ $NUM1 -gt $NUM2 ]] | true if `$NUM1` is greater than `$NUM2`, false otherwise
| [[ $NUM1 -ge $NUM2 ]] | true if `$NUM1` is greater than or equal to `$NUM2`, false otherwise
| (( $NUM1 < $NUM2 )) | true if `$NUM1` is less than `$NUM2`, false otherwise
| (( $NUM1 > $NUM2 )) | true if `$NUM1` is greater than `$NUM2`, false otherwise

 * File conditions:

| Condition | Description
| :--- | :---:      
| [[ -e $FILE ]] | true if `FILE` exists and is a file, false otherwise

---

## <a name="cmdargs">Command Line Arguments</a>
 * Command line args can be passed as - `[shell] [filename] arg1 arg2 ... argN`

 * Special vars associated with command line args:
    1. `$#` - total number of arguments passed.
    2. `$0` - filename as it was called with.
    3. `$1` through `$9` - can be used access first 9 parameters passed to the CMD.
    4. `$@` -  all parameters passed to the CMD.
    5. `$*` - Similar to `$@` but does not preserve the whitespaces and quotes ex. "Arg with space" becomes 
       "Arg" "with" "space". Usage of `$*` is discouraged.
    
---

