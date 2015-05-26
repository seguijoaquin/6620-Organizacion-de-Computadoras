#include "invertirEImprimir.h"

// Toma un archivo o la entrada estandar y lo escribe al revez linea a linea por stdout.
// Devuelve EXIT_FAILURE si fallo.
int InvertirEImprimir(FILE *datos) {
    // Se crea una pila auxiliar para apilar los caracteres y una general para todo el texto
    pila_t *pilaAux = CrearPila();
    pila_t *pilaGeneral = CrearPila();
    if (pilaGeneral == NULL || pilaAux == NULL) { //linea 44
        if (pilaGeneral == NULL && pilaAux == NULL) { //askAmbasNull
            DestruirPila(pilaGeneral);
            DestruirPila(pilaAux);
        } else if (pilaGeneral == NULL) {
           	DestruirPila(pilaGeneral);
        	} else {
            	DestruirPila(pilaAux);
        	}
        return EXIT_FAILURE;
    }

    // Se apila el caracter en la pila auxiliar hasta llegar al final de la linea, luego esta
    // pila pasa a la pila general, de manera de quedar ordenada.
    while(!feof(datos)){ 
        int caracter = fgetc(datos); //Se declara int para incluir al byte 0x00
        if (caracter != EOF) {
            if (!Apilar(pilaAux,caracter)) {
                DestruirPila(pilaGeneral);
                DestruirPila(pilaAux);
                return EXIT_FAILURE;
            }
            if (caracter == '\n') {
                if (!CambiarDePila(pilaGeneral,pilaAux)) {
                    DestruirPila(pilaGeneral);
                    DestruirPila(pilaAux);
                    return EXIT_FAILURE;
                }
            }
        }
    }

    if (!PilaEstaVacia(pilaAux)) { //Ask pila vacia
        if (!CambiarDePila(pilaGeneral,pilaAux)) {
                DestruirPila(pilaGeneral);
                DestruirPila(pilaAux);
                return EXIT_FAILURE;
        }
    }

    DestruirPila(pilaAux);

    // Se desapila de la pila general que contiene todas las caracteres al revez y se imprime
    // por pantalla.
    while (!PilaEstaVacia(pilaGeneral)) {
        int aux = Desapilar(pilaGeneral);
        if (putchar(aux) == EOF) {
            DestruirPila(pilaGeneral);
            return EXIT_FAILURE;
        }
    }
    DestruirPila(pilaGeneral);

    return EXIT_SUCCESS;
}
