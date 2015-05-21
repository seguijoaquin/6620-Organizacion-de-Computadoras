#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <getopt.h>
#include "invertirEImprimir.h"

//Funcion que imprime el manual del TP0
void printManual(){
	printf("Usage:\n tp0 -h\n");
	printf(" tp0 -V\n");
	printf(" tp0 [file...]\n");
	printf("Options:\n");
	printf(" -V, --version 	Prints version information.\n");	
	printf(" -h, --help  	Prints usage information.\n");
	printf("Examples:\n");
	printf(" tp0 foo.txt bat.txt\n");
	printf(" tp0 gz.txt\n");
}

// Escribe al revez linea a linea todos los archivos pasados por parametro.
int main(int argc, char *argv[]) {

    int next_option;
    const char* const short_options = "hV";
    const struct option long_options[] = {
	    { "help",    	0, NULL, 'h' },
	    { "version",    0, NULL, 'V' },
	    { NULL,         0, NULL, 0   } //Necesario al final del array
    };

//Procesamiento de los parametros de entrada.
    do {
	    next_option = getopt_long(argc, argv, short_options, long_options, NULL);
	    switch (next_option){
		    case 'h':   // -h, --help
			    printManual();
			    exit(EXIT_SUCCESS);
			    break;
		    case 'V':   // -V, --version
			    printf(" Version 1.0 del TP0\n");
			    exit(EXIT_SUCCESS);
			    break;
		    case -1:   // Se terminaron las opciones 
			    break;
		    default:    // Opcion incorrecta 
			    fprintf(stderr, "Error, el programa se cerrara.\n");
			    printManual(); 
			    exit(EXIT_FAILURE);
	    }
    } while (next_option != -1);

// Por cada archivo se ejecuta tac
    int salida = EXIT_FAILURE;
    int i;

    if (argc == 1) {
	salida = InvertirEImprimir(stdin);
    }

    for ( i = 1 ;i < argc;i++) {
       // Carga el archivo en memoria
        FILE *datos;
	if ((datos = fopen(argv[i],"r"))) {
                salida = InvertirEImprimir(datos);
                fclose(datos);
	} else {
		fprintf(stderr, "No se pudo abrir el archivo: %s\n",argv[i]);
	return(EXIT_FAILURE);
	}   
    }
    return salida;
}
