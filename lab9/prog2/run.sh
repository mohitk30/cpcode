#!/bin/bash
# /run with command ./run.sh
function run() {
	flex prog2.l && bison -d prog2.y && gcc lex.yy.c prog2.tab.c -lm && ./a
 
	sleep 100  # for sleep for some time
}


run 
