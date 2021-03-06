class Ficha {

  int[] carcel={0, 0};                                       //Coordendas de la carcel
  int casilla_actual;                                        //Casilla actual de la ficha
  int casillas_avanzadas, casillas_coronar;                                    //Casillas avanzadas por la ficha
  int numero_jugador;
  color color_ficha;                                         //Color ficha 
  Boolean ficha_en_carcel, entrada, ficha_coronada, movida;                                   //Estado de la ficha (en la carcel o no) //Estado de casilla en bloqueo

  Ficha(int jugador, int carcelX, int carcelY) {

    ficha_en_carcel = true;                                  //La ficha inicia en la carcel
    color_ficha = colores[jugador-1];                        //Se le asigna el color del jugador
    carcel[0]=carcelX;                                       //Guardamos las coordenadas de la carcel
    carcel[1]=carcelY;
    numero_jugador = jugador;

    //Asigna valores segun el jugador
    switch(jugador) {
    case 1:
      casilla_actual = 0;  //su salida
      break;

    case 2:
      casilla_actual = 17;  //su salida
      break;

    case 3:
      casilla_actual = 34;  //su salida
      break;

    case 4:
      casilla_actual = 51;  //su salida
      break;
    }
    casillas_coronar = 8;
    entrada = false;
  }

  void dibujar(int x, int y) {
    push();
    stroke(0);
    strokeWeight(2);
    fill(color_ficha);
    

    if (x == 0 && y == 0) {
      if (ficha_en_carcel==false) {                                                //Verificamos si la ficha está en juego o en la carcel y se dibuja
        circle(tablero[casilla_actual%68][0], tablero[casilla_actual%68][1], 30);
      } else {
        circle(carcel[0], carcel[1], 30);
        casillas_avanzadas = 0;
      }
    } else {
      circle(x, y, 30);
    }
    pop();
  }


  void mover(int espacios) {
    tablero[casilla_actual%68][4] -= 1;
    if (tablero[casilla_actual%68][4]==0 ) {
      tablero[casilla_actual%68][5] = 0;
    }
    if (tablero[casilla_actual%68][4] < 2) {
      tablero[casilla_actual%68][3] = 0;
    }
    casilla_actual += espacios;
    casillas_avanzadas+=espacios;
    tablero[casilla_actual%68][4] += 1;
    tablero[casilla_actual%68][5] = numero_jugador;
  }

  void entrar(int casillas) {
    if ((casillas_coronar - casillas) >= 0) {
      casillas_coronar -= casillas;
      movida = true;
      if (casillas_coronar == 0) {
        ficha_coronada = true;
      } else {
        ficha_coronada = false;
      }
    } else {
      movida = false;
    }
  }


  // CAMBIAR SEGUROS -- VANE 
  // MOVER (VERIFICAR SI SE PUEDE MOVER, MOVER) CLASE FICHA
  // COMER (MOVER 20 ESPACIOS, MANDAR A LA CARCEL, COMER OBLIGATORIAMENTE) FUNCION POR FUERA -- SEBAS
  // SACAR DE LA CARCEL(COMER LAS FICHAS QUE ESTEN EN LA SALIDA) -- SEBAS
  // ENTRADA Y CORONAR FICHA (MOVER 10 ESPACIOS) -- VANE

  //DADOS (POR FUERA) 

  // CLASE JUGADOR

  //Crear 4 fichas 
  // Seleccionar cuantos espacios mover con cada ficha
  // Manejar el turno
  // CONSTRUCTOR (Color, coordenadas de la carcel, casilla de salida y de entrada)
}
