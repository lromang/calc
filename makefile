train: train.l train.y; bison -d train.y; flex train.l; cc -o $@ train.tab.c lex.yy.c -lfl -lm
