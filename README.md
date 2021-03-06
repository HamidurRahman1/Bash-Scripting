# Bash-Scripting

---

[Credits](#credits)

## <a name="index">Index</a>

* [Unix Commands - Link 1](http://www.mathcs.emory.edu/~valerie/courses/fall10/155/resources/unix_cheatsheet.html)
* [Unix Commands - Link 2](https://predictivehacks.com/unix-commands-cheatsheet/)
---
* [Shebang](#shebang)
* [Comments](#comments)
* [Variables](#variables)
* [Inputs](#inputs)
* [If-Else](#ifelse)
* [Case statement](#case)
* [Conditional Commands](#conditional-cmds)
* [Command Line Arguments](#cmdargs)
* [Array](#array)
* [Loops](#loops)
* [Function](#function)
* [Arithmetic](#arithmetic)

---

## <a name="shebang">Shebang</a>
The `#!` syntax used in scripts to indicate an interpreter for execution under UNIX / Linux operating systems. <br>
 **`#!/bin/sh` or `#!/usr/bin/sh` or `#!/bin/bash` or `#!/usr/bin/env [shell]`**

[go to index](#index)

---

## <a name="comments">Comments</a>
* <b>Single Line Comment:</b> A single line that starts with `#` will be treated as a comment to the end of the line. <br>
  **`# This is a single line comment`**

* <b>Multi Line Comment:</b> A multi-line starts with `: '` and end with `'` will be treated as a multi-line comment. <br>
```shell
: '
  This is the line 1 of multi-line comment.
  this is the line 2 of multi-line comment.
'
``` 

[go to index](#index)

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
   
 * A `readonly` variable with `unset` command or reassignment will cause an error during execution.

 * [variable scope](#variablescope)

[go to index](#index)

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

 * <b>Input with options:</b> `read` can be used with options like `-p` allows a prompt where `-sp` allows silent prompts 
   (inputs not visible).
    ```shell
      read -p "Username: " uservar
      read -sp "Password: " passvar
      echo "Username: $uservar and Password: $passvar"
    ```

[go to index](#index)

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

 * <b>Only`if` branch:</b>
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

 * <b>`if-else` branch:</b>
```shell
if [[ CONDITION ]]; then
  statement(s)
else
  statement(s)
fi
```
   
 * <b>`if..elif..else` branch:</b>
```shell
if [[ CONDITION ]]; then
  statement(s)
elif [[ CONDITION ]]; then
  statement(s)
else
  statement(s)
fi
```

[go to index](#index)

---

## <a name="case">Case Statement</a>
 * <b>Syntax:</b>
```shell
case EXPRESSION in

  PATTERN_1)
    STATEMENTS
    ;;

  PATTERN_2)
    STATEMENTS
    ;;

  PATTERN_N)
    STATEMENTS
    ;;

  *)
    STATEMENTS
    ;;
esac
```
1. Each `case` statement starts with the `case` keyword, followed by the case expression and the `in` keyword. 
   The statement ends with the `esac` keyword.
2. Multiple patterns can be matched by the `|` operator. The `)` operator terminates a pattern list.
3. Each clause must be terminated with `;;`.
4. The commands corresponding to the first pattern that matches the expression are executed.
5. It is a common practice to use the wildcard asterisk symbol `*` as a final pattern to define the default case. 
   This pattern will always match.
6. If no pattern is matched, the return status is zero. Otherwise, the return status is the exit status of the executed 
   commands.

Ex - 
```shell
echo -n "Enter the name of a country: "
read COUNTRY

echo -n "The official language of $COUNTRY is "

case $COUNTRY in

  Lithuania)
    echo -n "Lithuanian"
    ;;

  Romania | Moldova)
    echo -n "Romanian"
    ;;

  Italy | "San Marino" | Switzerland | "Vatican City")
    echo -n "Italian"
    ;;

  *)
    echo -n "unknown"
    ;;
esac
```

[go to index](#index)

---

## <a name="conditional-cmds">Conditional Commands</a>
 * <b>String and Numeric conditions:</b>

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

 * <b>Logical conditions:</b>

| Condition | Description
| :--- | :---:      
| [[ ! COND1 ]] | negate the expression `COND1` 
| [[ COND1 && COND2 ]] | applies logical `and` on `COND1` and `COND2`
| [[ COND1 &#124;&#124; COND2 ]] | applies logical `or` on `COND1` and `COND2`

 * <b>File conditions:</b>

| Condition | Description
| :--- | :---:      
| [[ -e $FILE ]] | true if `FILE` exists and is a file regardless of the type (node, directory etc), false otherwise
| [[ -f $FILE ]] | true if `FILE` exists and is a regular file (not a directory or device), false otherwise
| [[ -h $FILE ]] | true if `FILE` exists and is a symbolic link, false otherwise
| [[ -s $FILE ]] | true if `FILE` exists and its size is > 0 bytes, false otherwise
| [[ -d $FILE ]] | true if `FILE` exists and is a directory, false otherwise
| [[ -r $FILE ]] | true if `FILE` exists and is readable, false otherwise
| [[ -w $FILE ]] | true if `FILE` exists and is writable, false otherwise
| [[ -x $FILE ]] | true if `FILE` exists and is executable, false otherwise

[go to index](#index)

---

## <a name="cmdargs">Command Line Arguments</a>
* Command line args can be passed as - `[shell] [filename] arg1 arg2 ... argN`

* <b>Special vars associated with command line args:</b>
    1. `$#` - total number of arguments passed.
    2. `$0` - filename as it was called with.
    3. `$1` through `$9` - can be used to access first 9 parameters passed to the CMD.
    4. `$@` -  all parameters passed to the CMD.
    5. `$*` - Similar to `$@` but does not preserve the whitespaces and quotes ex. "Arg with space" becomes
       "Arg" "with" "space". Usage of `$*` is discouraged.
       
* <b>Command line args with flags:</b> Using flags is a common way of passing input to a script. When passing input to the 
  script, there???s a flag (usually a single letter) starting with a hyphen (-) before each argument. A flag followed by 
  `:` requires a value. Flags can be used in any order.
```shell
while getopts lu: flag
do
    case "${flag}" in
        u) username=${OPTARG};;

        l)
          for v in `ls -R`; do
            echo "=>"$v
          done ;;

        *) echo "invalid flag provided" ;;
    esac
done
echo "Username: $username";
```

Execution: `[shell] [filename] -l -u hamidurrahman` or `[shell] [filename] -u hamidurrahman -l`

[go to index](#index)

---

## <a name="array">Array</a>
 * Array can be declared as below:

1. 
```shell
Fruits=( 'Apple' 'Banana' 'Ground Cherry' 'Orange' 'Star fruit' )
```
 Quotes can be omitted if the array elements does not have spaces in between them. Quotes must be present if one of the 
 element has space in it. Ex -
```shell
Fruits=( Apple Banana 'Ground Cherry' Orange 'Star fruit' )
```

2.
```shell
Fruits[0]="Apple"
Fruits[1]="Banana"
Fruits[2]="Orange"
```

 * <b>Array Commands:</b>
```shell
echo ${Fruits[0]}           # element at 0 index
echo ${Fruits[-1]}          # element at last index
echo ${Fruits[@]}           # all elements, space-separated
echo ${#Fruits[@]}          # number of elements
echo ${#Fruits}             # string length of the 1st element
echo ${#Fruits[3]}          # string length of the 4th element / 3rd index
echo ${Fruits[@]:2:4}       # slice starting from 2 (inclusive) and next 3
echo ${!Fruits[@]}          # indexes of all elements, space-separated
```

 * <b>Array operations:</b>
```shell
Fruits=("${Fruits[@]}" "Watermelon")    # push to the end
Fruits+=('Watermelon')                  # also push to the end
Fruits=("Watermelon" "${Fruits[@]}")    # push to the front
Fruits=( ${Fruits[@]/Appl*/} )          # remove by regex match
unset Fruits[2]                         # remove by index but does not change the length, assign null to index 2
Fruits=( "${Fruits[@]:0:2}" "${Fruits[@]:3}" )  # remove by slicing
Fruits=("${Fruits[@]}")                 # duplicate of the array
Fruits=("${Fruits[@]}" "${Veggies[@]}") # concatenate two arrays
lines=(`cat "file"`)                    # read from file to array
```

 * <b>Iteration:</b>
```shell
for FRUIT in "${Fruits[@]}"; do
  echo $FRUIT
done
```

[go to index](#index)

---

## <a name="loops">Loops</a>
* <b>3-types of loops:</b>
* <b>`for` loops:</b>
   1. <b>Standard Bash `for` loop:</b> This style of loop takes either an array, series of string separated by spaces,
    a range of numbers, output of a command etc. If an array variable is used then the variable must be quoted for safety
    in case one of the element has a space in it.
        ```shell
        FRUITS=( Apple Banana 'Ground Cherry' Orange 'Star fruit' )
        for element in "${FRUITS[@]}"; do
          echo $element
        done
        ```
   2. <b>Loop over a range of numbers:</b> The range is specified like `{START..END}`, `START` and `END` both inclusive. This 
      example prints number from 0 to 10.
        ```shell
        for i in {0..10}; do
          echo $i
        done
        ```
   3. <b>Loop over a range of numbers with steps:</b> The range is specified like `{START..END..INCREMENT}`, `START` and `END` 
      both inclusive. This example prints number from 0 to 10 with an increment of 2.
        ```shell
        for i in {0..10..2}; do
          echo $i
        done
        ```
   4. <b>`C`-style loop:</b> The range is specified like `{START..END..INCREMENT}`, `START` and `END`
      both inclusive. This example prints number from 0 to 10 with an increment of 2.
        ```shell
        for (( i=0; i<${#FRUITS[@]}; i++ )); do
          echo ${FRUITS[$i]}
        done
        ```

* <b>`while` loop:</b> while-loop is used to execute commands as long as the condition evaluates to true. This example prints 
  0-5.
```shell
i=0
while [[ $i -le 5 ]]; do
  echo $i
  ((i++))
done

# infinite loop
while true; do
  # commands
done
```

* <b>`until` loop:</b> `until` loop is used to execute commands as long as the condition evaluates to false. This example will 
  print 0-5 as the condition evaluates to false.
```shell
i=0
until [ $i -gt 5 ]
do
  echo $i
  ((i++))
done

# or, prints 0-4 as the condition is negated

i=0
until [ ! $i -lt 5 ]
do
  echo $i
  ((i++))
done
```

[go to index](#index)

---

## <a name="function">Function</a>
 * Bash functions are regular programming languages functions with some limitations.

 * Syntax for declaring a function:
```shell
name () {
  echo "Hello world! from function name: ${FUNCNAME[0]}"
}

#or

: '
function foo () {
}
parenthesis are optional with `function` reserved word.
'
function foo {
  echo "Hello world! from function name: ${FUNCNAME[0]}"
}
```

#### <a name="variablescope">Variable Scope:</a> 
   Global variables are variables that can be accessed from anywhere in the script regardless of the 
   scope. In Bash, all variables by default are defined as global, even if declared inside the function. An already 
   defined global variable's value is changed inside a function then it will be changed to whatever is the function 
   body has set to. See below -
   <br>
   <br>
   Local variables can be declared within the function body with the `local` keyword and can be used only inside that 
   function. You can have local variables with the same name in different functions.
   
```shell
var1='A'
var2='B'

local_func_test () {
  local var1='C'
  var2='D'
  echo "Inside function: var1: $var1, var2: $var2"
}

echo "Before executing function: var1: $var1, var2: $var2"

local_func_test

echo "After executing function: var1: $var1, var2: $var2"
```
<b>output:</b>
```shell
Before executing function: var1: A, var2: B
Inside function: var1: C, var2: D
After executing function: var1: A, var2: D
```

* <b>Return Values:</b>
    1. <b>Via status:</b> Return value of a function is the status of the last executed statement in the function. `0` for success
    and any non-zero number in 1-255 for failure.
    <br>
    <br>
    The return status can be specified by using the return keyword, and it is assigned to the variable <code>$?</code>. 
       The return statement terminates the function.
```shell
test_return_func () {
  echo "inside function, will return 10 and can be accessed via \$? after function is called."
  return 10
}

test_return_func
echo $?
```

   2. <b>Via global variable:</b> Arbitrary return value can be assigned to a global variable and use that after function call to
    extract the return value.
```shell
test_return_func () {
  func_result=( APPLE BANANA ORANGE )
}

test_return_func
echo ${func_result[@]}
```  

   3. <b>Via `echo` command:</b>
```shell
return_func_test () {
  local func_result="returned result"
  echo "$func_result"
}

result="$(return_func_test)"
echo $result
```

[go to index](#index)

---

## <a name="arithmetic">Arithmetic</a>
 * <b>Arithmetic expansion:</b> Arithmetic expansion is done by enclosing any mathematical expression inside double parentheses.
```shell
additon=$((10+5))
echo "Addition of 10 and 5 is : "$additon
echo "Subtraction of 5 from 10 is : "$((10-5))
echo "Multiplication of 10 and 5 is : "$((10*5))
echo "Integer division of 10 and 5 is : "$((10/5))
```
for decimal point see `bc` command below.

 * <b>`expr` command:</b> This allows to do arithmetic operations without enclosing in brackets or quotes. Keep in mind
`\*` must be used in place of `*` only for to avoid syntax error and spaces must be present in between `expr` command 
   and mathematical operators.
```shell
expr 3 + 2
expr 3 - 2
expr 3 \* 2
expr 4 / 2
```

 * <b>`let` command: </b> `let` command is similar to `expr` except it allows the evaluated result to be stored in a 
  variable.
```shell
let additon=5+5
let sub=$additon-3
let mul=$additon*2
let div=100/5
let additon++
let additon--
```

 * <b>`bc` command:</b> Floating number can be resulted by using `bc` command. By default, the `bc` command will 
   produce all results as an integer number. Use `scale=x` to instruct the `bc` command to show real numbers:
```shell
echo 'scale=2; 10.5 / 2.13' | bc
echo 'scale=20; 30.5 / 3.13' | bc
```
output:
```shell
4.92
9.74440894568690095846
```

[go to index](#index)

---

## <a name="credits">Credits:</a> 
Credits to multiple websites on the internet. I lost track of them at some point. If one claim credits, you receive 
credit for whatever you claim.

[go to index](#index)
