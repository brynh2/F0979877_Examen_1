#include <stdio.h>
#include<stdlib.h>
#include <time.h>


int analizar_numero(int num);

int main(){
    srand(time(NULL));
    int numeros[15];
    for(int i=0;i<15;i++){
        numeros[i] = rand()%(101);
    }

    for (int i=0; i<15; i++){

        int suma_div = analizar_numero(numeros[i]);
        if(suma_div<numeros[i]){
            printf("%d - Deficiente\n",numeros[i]);
        }
        else if (suma_div>numeros[i])
        {
            printf("%d - Abudante\n",numeros[i]);
        }
        else
            printf("%d - Perfecto\n",numeros[i]);   
    }

}

int analizar_numero(int num){
    int suma_div = 0;
    for(int i=1; i<num;i++){
        if(num%i==0){
            suma_div += i;
        }
    }
    return suma_div;
}