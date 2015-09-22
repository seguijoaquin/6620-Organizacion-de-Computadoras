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

float** alocarMatriz( int filas, int columnas) {
	float** matriz;
	matriz = (float**)malloc(filas*sizeof(float*));
	if (!matriz) {
		return NULL;
	}
	int i; //Recorre filas
	for(i=0;i<filas;i++){
		matriz[i] = (float*)malloc(columnas*sizeof(float));
		//Si falla el malloc, libero todo lo reservado anteriormente
		if(!matriz[i]) {
			int j;
			for (j=0;j<i;j++) {
				free(matriz[j]);
			}
			free(matriz);
			return NULL;
		}
	}
	return matriz;
}

size_t strLength(char* s){
    size_t i;
    for(i = 0; s[i] != 0; i++);
    return i;
}

char* getLine() {
	char buff[100];
	if (!fgets(buff,100, stdin)) {
			return NULL;
	}
	size_t l = strLength(buff);
	if (buff[l-1] == '\n')	{
		if (l > 1)	{
			buff[l-1] = 0;
			}
		char* concat;
		concat = (char*)malloc(l*sizeof(char));
		int i;
		for (i=0;i<l;i++)
			concat[i] = buff[i];
		return concat;
	} else {
		//EN ESTE CASO, EL BUFFER ES MENOR A LA CANTIDAD DE CARACTERES DE LA LINEA
		//DEBO ARMAR UN BUFFER MAS GRANDE Y SEGUIR LEYENDO HASTA ENCONTRAR
		//EL FIN DE LINEA
		/*
		char buff2[100];
		char* concat;
		concat = NULL;
		while (fgets(buff2,100,stdin)) {
			free(concat);
			size_t l2 = strLength(buff2);
			concat = (char*)malloc((l+l2+1)*sizeof(char));
			int i;
			for (i = 0; i < l; i++)
					concat[i] = buff[i];
			for (i = 0; i < l2; i++){
					int j = i + l;
					concat[j] = buff2[i];
					}
			concat[l+l2] = 0;
		}
		return concat;
		*/
	}
	return NULL;
}

int llenarMatriz(float** matriz, int fila, int columna) {
		int i;
		int j;
		int cantidadElementos = 0;
		i = 0;
		j = 0;
		bool exito = true;
		float valor;
		int flag;
		while (exito && i<fila) {
			flag = scanf("%f",&valor);
			if (flag != EOF) {
				matriz[i][j] = valor;
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
		if (cantidadElementos != ((fila)*(columna))) {
			return EXIT_FAILURE;
		}
	return EXIT_SUCCESS;
}

void liberarMatriz(float** matriz, int fila) {
	int i;
	for(i=0;i<fila;++i) {
		free(matriz[i]);
	}
	free(matriz);
}
void multiplicar(float** matriz1, int fila1, int columna1, float** matriz2, int columna2) {
	int i;
	int j;
	int k;
	float accum;
	printf("%ix%i ",fila1,columna2);
	for(i=0;i<fila1;i++) {
		for(j=0;j<columna2;j++) {
			accum = 0;
			for(k=0;k<columna1;k++) {
				accum = accum + (matriz1[i][k] * matriz2[k][j]);
			}
			printf("%g ",accum);
		}
	}
	printf("\n");
}
int main(int argc, char *argv[]) {
  parsearOpciones(argc,argv);
	//Construyo la primera matriz
	float** matriz1;
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
			fprintf(stderr, "Cantidad elementos menor a dimensiones de matriz\n");
			return EXIT_FAILURE;
		}
		//Repito para segunda matriz
		float** matriz2;
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
			fprintf(stderr, "Cantidad elementos menor a dimensiones de matriz\n");
			return EXIT_FAILURE;
		}
		if(columna1 == fila2) {
			//Multiplicar
			multiplicar(matriz1,fila1,columna1,matriz2,columna2);
			liberarMatriz(matriz1,fila1);
			liberarMatriz(matriz2,fila2);
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
