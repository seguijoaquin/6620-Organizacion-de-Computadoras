#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <getopt.h>

//Funcion que imprime el manual del TP0
void printManual(){
	printf("Usage:\n tp0 -h\n");
	printf(" tp0 -V\n");
	printf("tp0 < in_file > out_file\n", );
	printf("Options:\n");
	printf(" -V, --version 	Print version and quit.\n");
	printf(" -h, --help  	Print this information and quit.\n");
	printf("Examples:\n");
	printf(" tp0 < in.txt > out.txt\n");
	printf("cat in.txt | tp0 > out.txt\n", );
}

void parsearOpciones() {
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
}

int reservoMemoriaMatriz(float*** matriz, int filas, int columnas) {
	(*matriz) = (float**)malloc(filas*sizeof(float*));
	if (!(*matriz)) {
		fprintf(stderr, "Fallo en malloc\n", );
		return EXIT_FAILURE;
	}
	int i; //Recorre filas
	int j; //Recorre columnas
	for(i=0;i<filas;i++){
		(*matriz[i]) = (float*)malloc(columnas*sizeof(float));
		//Si falla el malloc, libero todo lo reservado anteriormente
		if(!(*matriz[i])) {
			int j;
			for (j=0;j<i;j++) {
				free((*matriz[j]));
			}
			free((*matriz));
			fprintf(stderr, "Fallo en malloc\n", );
			return EXIT_FAILURE;
		}
	}
	return EXIT_SUCCESS;
}

int procesarEntrada(float*** matriz) {
	int fila;
	int columna;
	char separador;
	//Si no leo tres argumentos [dimension][separador][dimension] salgo
	if (scanf("%i%c%i ",&fila,&separador,&columna) != 3)
		return EXIT_FAILURE;
	int salida;
	salida = reservoMemoriaMatriz(matriz,fila,columna);
	if (salida) {
		int i;
		int j;
		int count = 0;
		while (scanf("%g ",matriz[i][j])&&(i<fila)) {
			j++;
			count++;
			if (j==columna) {
				j=0;
				i++;
			}
		}
		if (count < ((i+1)*(j+1))) {
			salida = EXIT_FAILURE;
		}
	}
	return salida;
}

int main(int argc, char *argv[]) {
    parsearOpciones();
    int salida_1;
		float** matriz_1;
		salida_1 = procesarEntrada(&matriz_1);
		if(salida_1) return EXIT_FAILURE;

		float** matriz_2;
		int salida_2;
		salida_2 = procesarEntrada(&matriz_2);
		if (salida_2) return EXIT_FAILURE;
		//Verificar dimensiones
		//Multiplicar
		//Repetir
    return EXIT_SUCCESS;
}
