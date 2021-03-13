#!/bin/bash

echo "hello world!"

# a single line comment

: '
This is the line 1 of multi-line comment.
this is the line 2 of multi-line comment.
'

# Variables
INT=10
STRING1="A String Value"
STRING2=StringVarWithoutQuotes
_PI=3.1416
echo "Vars: int: $INT -> string1: $STRING1 -> float: $_PI -> string2: $STRING2"

echo "What is your name?"
read NAME
echo "Hello $NAME - hope you are doing well."