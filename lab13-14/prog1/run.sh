#!/bin/bash
# /run with command ./run.sh
function run() {
	flex prog1_l.l && bison -d prog1_y.y && gcc lex.yy.c prog1_y.tab.c -lm && ./a test.c
    #  bison -d prog3.y && gcc prog3.tab.c -lm && ./a
	sleep 100  # for sleep for some time
}


run 
