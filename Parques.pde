//0. coordenada en x
//1. coordenada en y
//2. casilla segura
//3. bloqueo
//4. fichas que hay
//5. color de la ficha en la casilla


int [][] tablero = {{435, 555, 1, 0, 0, 0}, {435, 525, 0, 0, 0, 0}, {435, 495, 0, 0, 0, 0}, {435, 465, 0, 0, 0, 0}, {465, 435, 0, 0, 0, 0}, {495, 435, 0, 0, 0, 0}, {525, 435, 0, 0, 0, 0}, {555, 435, 1, 0, 0, 0}, {585, 435, 0, 0, 0, 0}, {615, 435, 0, 0, 0, 0}, {645, 435, 0, 0, 0, 0}, {675, 435, 0, 0, 0, 0}, {675, 345, 1, 0, 0, 0}, {675, 255, 0, 0, 0, 0}, {645, 255, 0, 0, 0, 0}, {615, 255, 0, 0, 0, 0}, {585, 255, 0, 0, 0, 0}, 
  {555, 255, 1, 0, 0, 0}, {525, 255, 0, 0, 0, 0}, {495, 255, 0, 0, 0, 0}, {465, 255, 0, 0, 0, 0}, {435, 225, 0, 0, 0, 0}, {435, 195, 0, 0, 0, 0}, {435, 165, 0, 0, 0, 0}, {435, 135, 1, 0, 0, 0}, {435, 105, 0, 0, 0, 0}, {435, 75, 0, 0, 0, 0}, {435, 45, 0, 0, 0, 0}, {435, 15, 0, 0, 0, 0}, {345, 15, 1, 0, 0, 0}, {255, 15, 0, 0, 0, 0}, {255, 45, 0, 0, 0, 0}, {255, 75, 0, 0, 0, 0}, {255, 105, 0, 0, 0, 0}, 
  {255, 135, 1, 0, 0, 0}, {255, 165, 0, 0, 0, 0}, {255, 195, 0, 0, 0, 0}, {255, 225, 0, 0, 0, 0}, {225, 255, 0, 0, 0, 0}, {195, 255, 0, 0, 0, 0}, {165, 255, 0, 0, 0, 0}, {135, 255, 1, 0, 0, 0}, {105, 255, 0, 0, 0, 0}, {75, 255, 0, 0, 0, 0}, {45, 255, 0, 0, 0, 0}, {15, 255, 0, 0, 0, 0}, {15, 345, 1, 0, 0, 0}, {15, 435, 0, 0, 0, 0}, {45, 435, 0, 0, 0, 0}, {75, 435, 0, 0, 0, 0}, {105, 435, 0, 0, 0, 0}, 
  {135, 435, 1, 0, 0, 0}, {165, 435, 0, 0, 0, 0}, {195, 435, 0, 0, 0, 0}, {225, 435, 0, 0, 0, 0}, {255, 465, 0, 0, 0, 0}, {255, 495, 0, 0, 0, 0}, {255, 525, 0, 0, 0, 0}, {255, 555, 1, 0, 0, 0}, {255, 585, 0, 0, 0, 0}, {255, 615, 0, 0, 0, 0}, {255, 645, 0, 0, 0, 0}, {255, 675, 0, 0, 0, 0}, {345, 675, 1, 0, 0, 0}, {435, 675, 0, 0, 0, 0}, {435, 645, 0, 0, 0, 0}, {435, 615, 0, 0, 0, 0}, {435, 585, 0, 0, 0, 0}
};

color[] colores = {#FFFF00, #0000FF, #FF0000, #009245};    //Colores disponibles (amarillo, azul, rojo, verde)
PImage fondo;
Jugador jugador1, jugador2, jugador3, jugador4; 
int NumeroJugadores, Turno, Dado1, Dado2, pares;
int seguro1, seguro2;
String[] JugadorenTurno = {"Amarillo", "Azul", "Rojo", "Verde"};
Boolean turnoActual, MoverDado1, MoverDado2, avanzarComer;

void setup() {
  NumeroJugadores = 4;
  size(990, 690);
  fondo = loadImage("TableroParques.jpg");

  Dado1= 0;                                          //Iniciamos los dados en 0
  Dado2= 0;
  
  seguro1=7;
  seguro2=12;
  
  MoverDado1=true;
  MoverDado2=true;
  turnoActual=true;
  if (NumeroJugadores>=2) {                            //creamos los jugadores necesarios
    jugador1 = new Jugador(1);
    jugador2 = new Jugador(2);
  }
  if (NumeroJugadores>=3) {
    jugador3 = new Jugador(3);
  }
  if (NumeroJugadores==4) {
    jugador4 = new Jugador(4);
  }
  
  avanzarComer = false;
}

void draw() {

  image(fondo, 0, 0, width, height);
  
  jugador1.DibujarFichas();                           //Dibujamos las fichas de los jugadores
  jugador2.DibujarFichas();
  jugador3.DibujarFichas();
  jugador4.DibujarFichas();



  dibujarBloqueo();
  Seguros();
  




  
  Seguros();
  dibujarBloqueo();
  




  if (MoverDado1 == false) {
    fill(#804000);
    square(732, 55, 90);
  }
  if (MoverDado2 == false) {
    fill(#804000);
    square(857, 55, 90);
  }
  
  if (avanzarComer == true){
    push();
    strokeWeight(2);
    fill(#ffffff);
    rect(732, 177, 215, 80);
    fill(0, 0, 0);
    textSize(20);
    text("Selecciona una ficha", 740, 210);
    text("y avanza 20 espacios", 740, 230);
    pop();
  }

  textSize(64);                                       //Escribimos el valor de los dados
  fill(0, 0, 0);
  text( Dado1, 760, 120);
  text( Dado2, 880,120);
  if (turnoActual==true) {
    textSize(60);                                       //Escribimos el color del jugador siguiente
    fill(colores[Turno % NumeroJugadores]);
    text(JugadorenTurno[Turno % NumeroJugadores], 720, 430);
  }
  if (pares != 0) {
    textSize(30);                             
    fill(0, 0, 0);
    text( "Tira de nuevo", 750, 200);
  }
}

void keyPressed() {
  if (key == ENTER) {
    turnoActual=false;
    if ((Turno%31000)==0 && Turno!=0){
      tablero[seguro1][2]=0;
      tablero[seguro2][2]=0;
      tablero[seguro1+17][2]=0;
      tablero[seguro2+17][2]=0;
      tablero[seguro1+34][2]=0;
      tablero[seguro2+34][2]=0;
      tablero[seguro1+51][2]=0;
      tablero[seguro2+51][2]=0;
      seguro1=(int)random(16)+1;  
      seguro2=(int)random(16)+1;



      System.out.println(seguro1);
      System.out.println(seguro2);


      tablero[seguro1][2]=1;
      tablero[seguro2][2]=1;
      tablero[seguro1+17][2]=1;
      tablero[seguro2+17][2]=1;
      tablero[seguro1+34][2]=1;
      tablero[seguro2+34][2]=1;
      tablero[seguro1+51][2]=1;
      tablero[seguro2+51][2]=1;

    }
    if (Turno % NumeroJugadores == 0 ) {                 //Con el módulo del turno entre los jugadores sabemos quien tira los dados 
      jugador1.TirarDados();
    } else if (Turno % NumeroJugadores == 1 ) {
      jugador2.TirarDados();
    } else if (Turno % NumeroJugadores == 2 ) {
      jugador3.TirarDados();
    } else if (Turno % NumeroJugadores == 3 ) {
      jugador4.TirarDados();
    }
  }
}

void mouseReleased() {
  if (Turno % NumeroJugadores == 0 ) {                 //Con el módulo del turno entre los jugadores sabemos quien le toca mover ficha 
    jugador1.moverFicha(pmouseX, pmouseY);
  } else if (Turno % NumeroJugadores == 1 ) {
    jugador2.moverFicha(pmouseX, pmouseY);
  } else if (Turno % NumeroJugadores == 2 ) {
    jugador3.moverFicha(pmouseX, pmouseY);
  } else if (Turno % NumeroJugadores == 3 ) {
    jugador4.moverFicha(pmouseX, pmouseY);
  }
}

void dibujarBloqueo() {
  for (int n = 0; n < 68; n++) {
    if (tablero[n][3] == 1) {
      

      push();
      noStroke();
      fill(#93663A);

      //Casillas Horizontales
      if ((n <= 2) || (n >= 22 & n <= 36) || (n >= 56)) {
        rect(tablero[n][0]-45, tablero[n][1]-15, 90, 30);
      }

      //Casillas Verticales
      else if ((n>=5 && n<=19)||(n>=39 && n<=53)) {
        rect(tablero[n][0]-15, tablero[n][1]-45, 30, 90);
      }

      //Esquinas
      else if (n==3 || n==21) {
        rect(tablero[n][0]-45, tablero[n][1]-15, 60, 30);
        if (n==3) {
          triangle(tablero[n][0]+15, tablero[n][1]-15, tablero[n][0]+15, tablero[n][1]+15, tablero[n][0]+45, tablero[n][1]+15);
        } else if (n==21) {
          triangle(tablero[n][0]+15, tablero[n][1]-15, tablero[n][0]+45, tablero[n][1]-15, tablero[n][0]+15, tablero[n][1]+15);
        }
      } else if (n==37 || n==55) {
        rect(tablero[n][0]-15, tablero[n][1]-15, 60, 30);
        if (n==39) {
          triangle(tablero[n][0]-15, tablero[n][1]+15, tablero[n][0]-15, tablero[n][1]-15, tablero[n][0]-45, tablero[n][1]-15);
        } else if (n==55) {
          triangle(tablero[n][0]-15, tablero[n][1]-15, tablero[n][0]-15, tablero[n][1]+15, tablero[n][0]-45, tablero[n][1]+15);
        }
      } else if (n==4 || n==54) {
        rect(tablero[n][0]-15, tablero[n][1]-45, 30, 60);
        if(n==4){
          triangle(tablero[n][0]+15, tablero[n][1]+15, tablero[n][0]-15, tablero[n][1]+15, tablero[n][0]+15, tablero[n][1]+45);
        } else if (n==54){
          triangle(tablero[n][0]+15, tablero[n][1]+15, tablero[n][0]-15, tablero[n][1]+15, tablero[n][0]-15, tablero[n][1]+45);
        }
      } else if (n==20 || n==38) {
        rect(tablero[n][0]-15, tablero[n][1]-15, 30, 60);
        if(n==20){
          triangle(tablero[n][0]-15, tablero[n][1]-15, tablero[n][0]+15, tablero[n][1]-15, tablero[n][0]+15, tablero[n][1]-45);
        } if(n==38){
          triangle(tablero[n][0]-15, tablero[n][1]-15, tablero[n][0]+15, tablero[n][1]-15, tablero[n][0]-15, tablero[n][1]-45);
        }
      }
      pop();
    }
  }
  jugador1.DibujarFichas();                           //Dibujamos las fichas de los jugadores
  jugador2.DibujarFichas();
  jugador3.DibujarFichas();
  jugador4.DibujarFichas();
} 
