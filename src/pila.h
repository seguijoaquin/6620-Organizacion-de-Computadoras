#ifndef PILA_H_
#define PILA_H_

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <mips/regdef.h>
#include <sys/syscall.h>



#define PILA_TAM_INICIAL 30
#define PILA_FACTOR 2
#define PILA_TOPE 0.9

/*
 * Es una pila que contiene datos de tipo char*
 */
typedef struct _pila  {
    char* caracteres;
    size_t tamanio;
    size_t cantidad;
}pila_t;

extern pila_t* CrearPila();
extern void DestruirPila(pila_t* pila);
extern bool RedimensionarPila(pila_t* pila);
extern bool Apilar(pila_t* pila, char valor);
extern bool PilaEstaVacia(const pila_t* pila);
extern char Desapilar(pila_t* pila);
extern bool CambiarDePila(pila_t* pila_destino, pila_t* pila_origen);

#endif /* PILA_H_ */


