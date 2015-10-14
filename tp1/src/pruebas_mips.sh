#!/bin/bash
clear
printf "Compilo\n"
make

printf "\n\n Las pruebas se pueden realizar manualmente mediante ./tp1.out < test_files/test#.txt\n"
printf "\n\nCaso exitoso test1\n"
./tp1.out < test_files/test1.txt

printf "\n\nCaso exitoso test2\n"
./tp1.out < test_files/test2.txt

printf "\n\nCaso matrices incompatibles test3\n"
./tp1.out < test_files/test3.txt

printf "\n\nCaso cantidad impar de matrices test4\n"
./tp1.out < test_files/test4.txt

printf "\n\nCaso elementos < dimension definida test5\n"
./tp1.out < test_files/test5.txt

printf "\n\nCaso elementos > dimension definida test6\n"
./tp1.out < test_files/test6.txt