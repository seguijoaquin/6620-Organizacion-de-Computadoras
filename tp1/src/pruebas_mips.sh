#!/bin/bash
clear
printf "Compilo\n"
make

printf "\n\n Las pruebas se pueden realizar manualmente mediante ./tp0.out < test_files/test#.txt\n"
printf "\n\nCaso exitoso test1\n"
./tp1.out < test_files/test1.txt
