#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <getopt.h>
#include <string.h>

//Funcion que imprime el manual del TP0
void printManual(){
	printf("Usage:\n tp0 -h\n");
	printf(" tp0 -V\n");
	printf("tp0 < in_file > out_file\n");
	printf("Options:\n");
	printf(" -V, --version 	Print version and quit.\n");
	printf(" -h, --help  	Print this information and quit.\n");
	printf("Examples:\n");
	printf(" tp0 < in.txt > out.txt\n");
	printf("cat in.txt | tp0 > out.txt\n");
}

void parsearOpciones(int argc, char* argv[]) {
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

double* alocarMatriz( int filas, int columnas) {
	double* matriz;
	matriz = (double*)malloc(filas*columnas*sizeof(double));
	if (!matriz) {
		return NULL;
	}
	return matriz;
}

size_t strLength(char* s){
    size_t i;
    for(i = 0; s[i] != 0; i++);
    return i;
}
/*
fila: cantidad de filas
columna: cantidad de columnas
matriz: el puntero de la matriz
*/
int llenarMatriz(double* matriz, int fila, int columna) {
		int i;
		int j;
		char c;
		int cantidadElementos = 0;
		i = 0;
		j = 0;
		bool exito = true;
		double valor;
		int flag,pos;
		while (exito && i<fila) {
			flag = scanf("%lf%c",&valor,&c);
			if (flag != EOF && flag == 2) {
				//printf("Leo: %lf y %c\n",valor,c);
				pos = (i*columna)+j;
				matriz[pos] = valor;
				cantidadElementos++;
				if (j==columna-1) {
					j=0;
					i++;
				} else {
					j++;
				}
			} else {
				exito = false;
			}
		}
		if (cantidadElementos != ((fila)*(columna)) || (c!='\n')) {
			return EXIT_FAILURE;
		}
	return EXIT_SUCCESS;
}

void mostrarMatriz(double* matriz, int fila, int col)
{
	//printf("La matriz impresa da:\n");
	int i;
	for(i=0; i<fila*col; i++)
	{
		printf("%g ",matriz[i]);
	}
	printf("\n");
}

void liberarMatriz(double* matriz, int fila) {
	/*
	int i;
	for(i=0;i<fila;++i) {
		free(matriz[i]);
	}
	*/
	free(matriz);
}
void multiplicar(double* matriz1, int fila1, int columna1, double* matriz2, int columna2, double* matrizRes) {
	int i;
	int j;
	int k;
	double accum;
	printf("%ix%i ",fila1,columna2);
	for(i=0;i<fila1;i++) {
		for(j=0;j<columna2;j++) {
			accum = 0;
			for(k=0;k<columna1;k++) {
				int pos1 = (i*columna1)+k;
				int pos2 = (k*columna2)+j;
				accum = accum + (matriz1[pos1] * matriz2[pos2]);
			}
			int pos3 = (i*columna2)+j;
			matrizRes[pos3] = accum;
			//printf("%g (en %d)",accum,pos3);
		}
	}
	//printf("\n");
}
int main(int argc, char *argv[]) {
  parsearOpciones(argc,argv);
	//Construyo la primera matriz
	double* matriz1;
	int fila1;
	int columna1;
	int cant;
	cant =	scanf("%i%*c%i ",&fila1,&columna1);
	do {
		if (cant != 2) {
			fprintf(stderr, "Fallo al leer dimensiones\n");
			return EXIT_FAILURE;
		}
		matriz1 =	alocarMatriz(fila1,columna1);
		if (!matriz1) {
			fprintf(stderr, "Fallo en malloc\n");
			return EXIT_FAILURE;
		}
		int llenar;
		llenar = llenarMatriz(matriz1,fila1,columna1);
		if (llenar) {
			liberarMatriz(matriz1,fila1);
			fprintf(stderr, "Cantidad elementos distinta a dimensiones de matriz\n");
			return EXIT_FAILURE;
		}
		//Repito para segunda matriz
		double* matriz2;
		int fila2;
		int columna2;
		cant = scanf("%i%*c%i ",&fila2,&columna2);
		if (cant != 2) {
			liberarMatriz(matriz1,fila1);
			fprintf(stderr, "Fallo al leer dimensiones\n");
			return EXIT_FAILURE;
		}
		matriz2 = alocarMatriz(fila2,columna2);
		if (!matriz2) {
			liberarMatriz(matriz1,fila1);
			fprintf(stderr, "Fallo en malloc\n");
			return EXIT_FAILURE;
		}
		llenar =	llenarMatriz(matriz2,fila2,columna2);
		if (llenar) {
			liberarMatriz(matriz1,fila1);
			liberarMatriz(matriz2,fila2);
			fprintf(stderr, "Cantidad elementos distinta a dimensiones de matriz\n");
			return EXIT_FAILURE;
		}
		if(columna1 == fila2) {
			double* matrizRes = alocarMatriz(fila1,columna2);
			if (!matrizRes)
			{
				liberarMatriz(matriz1,fila1);
				liberarMatriz(matriz2,fila2);
				liberarMatriz(matrizRes,fila1);
			}
			//Multiplicar
			multiplicar(matriz1,fila1,columna1,matriz2,columna2,matrizRes);
			mostrarMatriz(matrizRes,fila1,columna2);
			liberarMatriz(matriz1,fila1);
			liberarMatriz(matriz2,fila2);
			liberarMatriz(matrizRes,fila1);
		} else {
			liberarMatriz(matriz1,fila1);
			liberarMatriz(matriz2,fila2);
			fprintf(stderr, "Dimensiones no compatibles para multiplicar\n");
			return EXIT_FAILURE;
		}
		cant =	scanf("%i%*c%i ",&fila1,&columna1);
	} while(cant != EOF);
		//Repetir
    return EXIT_SUCCESS;
}
