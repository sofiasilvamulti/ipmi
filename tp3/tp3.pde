//Silva Sofia
//tp3 comision 1
//https://youtu.be/Z99sC-UuxuQ
PImage fondo;
color negro;
color blanco;
color rojo;
boolean cambiarColores = false; //alterna  el ccolor de los réctangulos
boolean colorRojo = false; //cambia el color de los réctangulos a rojo
boolean esPar (int numero){ //determina si un número es par o impar
  return numero % 2 == 0; //devuelve true si el número es par y false si es impar
}
void setup(){
size(800,400);
reiniciarPrograma();
fondo = loadImage ("opArt.jpg");
negro = color(0);
blanco = color(255);
rojo = color(255,0,0);
}

void draw(){
background(255);

//funciones propias
RectangulosdelFondo(400,0,400,11);
RectangulosAdelante(565,165,70,3);
RectangulosdelLadoIzquierdo(553, 168, 11);
RectangulosdelLadoDerecho(647, 168, 11);
RectangulosdeArriba(568,153, 11);
RectangulosdeAbajo(568,247, 11);

Dibujarimagen();


//degrade para el negro
 if (cambiarColores) {
  negro = color(random(255));// asigna un color aleatorio a negro
}else{
 negro = color(0); // asigna al negro como negro fijo
}
}

void Dibujarimagen(){
image(fondo,0,0,400,400);

}
void reiniciarPrograma(){
  cambiarColores = false;
  colorRojo = false;
  negro = color(0);
  rojo = color(255,0,0);
}

void RectangulosdelFondo(int x, int y, int size, int cant){
 
 for(int i = 0; i< cant; i++){
   if(i == 0){
     strokeWeight(22);
   }else{
     strokeWeight(15);
   }
   
   if(i % 2 == 0){
     if (colorRojo){
     stroke(color(255,0,0));//rojo para índices pares si colorRojo es true
   }else{
     stroke(negro);//negro (o color aleatorio) para índices pares
   }
   }else{
     stroke(blanco); //blanco para índices impares
   }
   noFill();
   rect(x,y,size,size);
   
   x  += 15;
   y += 15;
   size -= 30;

}
}

void RectangulosAdelante(int x, int y , int size, int cant){
  for(int i = 0; i<cant; i++){
    if(esPar(i)){
      stroke(negro);
    }else{
      stroke(blanco);
    }
    strokeWeight(15);
    rect(x,y,size,size);
    
    x += 15;
    y += 15;
    size -=30;
  }
}

void RectangulosdelLadoIzquierdo(int x,int y,int cant){
 width = 0;
 height = 64;
 
 for(int i = 0; i<cant; i++){
   if(esPar(i)){
     stroke(blanco);
   }else{
     stroke(negro);
   }
   
   rect(x,y,width,height);
   
   x -=15;
   
 }
}


void RectangulosdelLadoDerecho(int x, int y , int cant){
x = 647;

for(int i =0; i<cant; i++){
  if(esPar(i)){
    stroke(blanco);
  }else{
    stroke(negro);
  }
  rect(x,y,width,height);
  
  x += 15;
}
}
void RectangulosdeArriba(int x , int y, int cant){
x = 568;
y = 153;
width = 64;
height = 0;

for(int i = 0; i<cant; i++){
  if(esPar(i)){
    stroke(blanco);
  }else{
    stroke(negro);
  }
  
  rect(x,y,width,height);
  
  y -= 15;
}
}

void RectangulosdeAbajo(int x, int y, int cant){
y = 247;

for(int i = 0; i<cant; i++){
  if(esPar(i)){
    stroke(blanco);
  }else{
    stroke(negro);
  }
  
  rect(x,y,width,height);
  
  y += 15;
}
}

void keyPressed(){
if (key == 'c'){
  cambiarColores = !cambiarColores; // aleterna entre true y false
}else if (key == '+'){
  colorRojo = !colorRojo; // lo mismo que arriba
}else if (key == 'a'){
  reiniciarPrograma();
  
}
}
