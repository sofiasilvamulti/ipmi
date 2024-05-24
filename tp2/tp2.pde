//Silva Sofia
//tp2 comision 2
import processing.sound.*;

String estadoActual = "pantalla1";
int segundos;
PImage pantalla1,pantalla2,pantalla3,logo;
String intro,intro2,intro3,intro4;
int tam;
int maxTam = 25;
PFont fuente, fuente2;
int py, py2,py3;
int velocidadTexto = 3;

int botonX, botonY, botonAncho, botonAlto;
int botonTransparencia;

SoundFile musica;
void setup(){
  size(640,480);
 
  //pantallas
  
  estadoActual ="pantalla1";
  pantalla1= loadImage("the last of us 2.jpg");
  pantalla2= loadImage("the last of us 3.jpg");
  pantalla3= loadImage("the last of us 4.jpg");
  logo= loadImage("logo.png");
  //fuentes
  py = height;
  py2 = height;
  py3 = height;
  fuente= loadFont("EbrimaBold.vlw");
  fuente2= loadFont("TahomaBold.vlw");
  intro = "BASADA EN UN\nVIDEOJUEGO";
  intro2 = "DIRECTORES\nCraig Mazin y Neil Druckmann";
  intro3 = "ELLIE\nBella Ramsey";
  intro4 = "JOEL\nPedro Pascal";
  tam = 5;
  
  // Configuración del botón
  botonAncho = 100;
  botonAlto = 40;
  botonX = (520);
  botonY = (20);
  botonTransparencia = 200;
  
  //Música
  musica = new SoundFile(this, "intro the last of us.mp3");
  musica.play(1);
}
void draw(){
  background(255);

  if( estadoActual.equals("pantalla1")){
    image(pantalla1,0,0,width,height);
    image(logo, 0, 120, 300, 300);
    float tono= map(py, height,50, 0, 255 );
    fill(255,255,255,tono);
    textAlign(CENTER);
    textFont(fuente, 25);
    text(intro, 240, py, 440, 400);
  if (py>45) {
    py -= velocidadTexto;
    py -= velocidadTexto;
  }
} else if(estadoActual.equals("pantalla2")){
    image(pantalla2,0,0,width,height);
    if( tam < maxTam){
    tam += 1;
    println(tam);
  }
    fill(255,255,255);
    textAlign(CENTER,CENTER);
    textFont(fuente2);
    textSize (tam);
    text(intro2,320, 400);
} else if(estadoActual.equals("pantalla3")){
    image(pantalla3,0,0,width,height);
    textFont(fuente2, 20);
    textAlign(CENTER);
    text(intro4, 160, py2);
  if (py2> 400) {
    py2 -= velocidadTexto;
  }
    textFont(fuente2,20);
    textAlign(CENTER);
    text(intro3, 516, py3);
  if (py3> 400) {
    py3 -= velocidadTexto;
  }
    fill(66,73,73, botonTransparencia);
    rect(botonX, botonY, botonAncho, botonAlto);
    fill(255);
  }

 if (frameCount%40 == 0) {
    segundos++;
  }
 if (segundos<3) {
    estadoActual = "pantalla1";
  }
 else if (segundos>=3 && segundos<= 6) {
    estadoActual = "pantalla2";
  } 
 else if (segundos > 6 && segundos <9) {
    estadoActual = "pantalla3";
  }
  }
void mousePressed(){
  if (estadoActual.equals("pantalla3") &&
    mouseX >= botonX && mouseX <= botonX + botonAncho &&
    mouseY >= botonY && mouseY <= botonY + botonAlto){
    estadoActual = "pantalla1";
    segundos = 0;
    py = height;
    py2 = height;
    py3 = height;
    tam = 12;
  musica.stop();
  musica.play();
 }
}
