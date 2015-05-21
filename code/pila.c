#include "pila.h"

// Crea una pila. Devuelve NULL si fallo.
pila_t* CrearPila() {
    pila_t *pila = malloc(sizeof(pila_t));
    if (pila == NULL) {
        fprintf(stderr, "Fallo el malloc.\n");
        return NULL;
    }
    char* aux = malloc(PILA_TAM_INICIAL*sizeof(char));
    if (aux == NULL) {
        fprintf(stderr, "Fallo el malloc.\n");
        free(pila);
        return NULL;
    }
    pila->caracteres = aux;
    pila->tamanio = PILA_TAM_INICIAL;
    pila->cantidad = 0;
    return pila;
}

// Destruye una pila.
void DestruirPila(pila_t *pila) {
    free(pila->caracteres);
    free(pila);
}

// Modifica el tamaño de la pila, para que la cantidad ocupe el 50% del tamaño.
// Devuelve falso si fallo y se libera la memoria ya reservada en la funcion invocante
bool RedimensionarPila(pila_t *pila) {
    size_t nuevo_tam = (pila->cantidad) * PILA_FACTOR;
    char* aux = realloc(pila->caracteres,nuevo_tam*sizeof(char*));
    if (aux == NULL) {
        fprintf(stderr, "Fallo el realloc.\n");
        return false;
    }
    pila->caracteres = aux;
    pila->tamanio = nuevo_tam;
    return true;
}

// Agrega un nuevo caracter a la pila. Si la pila esta mas de un 90% llena y no se puede redimensionar
// devuelve falso.
bool Apilar(pila_t *pila, char valor) {
    pila->caracteres[pila->cantidad] = valor;
    pila->cantidad ++;

    /* Si al apilar la cantidad de elementos supera el 90% del tamaño se pide
    memoria para más elementos.*/
    if (((pila->cantidad)/(pila->tamanio)) >= PILA_TOPE) {
        if (!RedimensionarPila(pila)) {
            return false;
        }
    }
    return true;
}

// Devuelve verdadero si la pila no tiene elementos apilados.
bool PilaEstaVacia(const pila_t *pila) {
    if (pila->cantidad == 0)
        return true;
    return false;
}

// Saca el caracter tope de la pila. Si la pila está vacía, devuelve NULL.
char Desapilar(pila_t *pila) {
    if (pila->cantidad > 0) {
        pila->cantidad --;
        return pila->caracteres[(pila->cantidad)];
    }
    return EOF;
}


// Desapila los caracteres de la pila origen y los apila en la pila destino
// uno por uno hasta que la pila origen este vacia. Si no se puede completar
// la operacion devuelve falso.
bool CambiarDePila(pila_t *pila_destino,pila_t *pila_origen) {
    while (pila_origen->cantidad > 0) {
        char aux = Desapilar(pila_origen);
        if(!Apilar(pila_destino, aux)) {
            return false;
        }
    }
    return true;
}

