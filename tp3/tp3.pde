//Silva Sofia
//tp2 comision 1
//https://youtu.be/HTOHZWjdsg8 (profe si sube la calidad del video, se va a ver mejor :))
PImage fondo;
int cant = 6;
color color1;
color color2;
color color3;
boolean cambiarColor = false;
int numCirculos = 10;
float[] posX = new float[numCirculos];
float[] posY = new float[numCirculos];
float[] diametros = new float[numCirculos];
color[] colores = new color[numCirculos];

int botonX = 700;
int botonY = 10;
int botonAncho = 90;
int botonAlto = 30;

void setup() {
  size(800, 400);
  fondo = loadImage("opArt.jpg");
  color1 = color(0, 0, 0);
  color2 = color(255, 255, 255);
  color3 = color(244, 67, 54);
  generarCirculosAleatorios();
}

void draw() {
  background(255);
  image(fondo, 0, 0, 400, 400); 
  GrillaCuadrados();
  GrillaAdelante();
  dibujoExtraAdelante();
  LineasCostadoIzquierdo();
  LineasCostadoDerecho();
  LineasArriba();
  LineasAbajo();
  dibujaCirculos(posX, posY, diametros, colores);

  // Dibuja el botón de reinicio
  fill(200); // Color gris para el botón
  rect(botonX, botonY, botonAncho, botonAlto);
  fill(0); // Texto negro
  textAlign(CENTER, CENTER);
  text("Reiniciar", botonX + botonAncho/2, botonY + botonAlto/2);
  
  if (cambiarColor) {
    fill(color3);
  } else {
    fill(color2);
  }
}

void GrillaCuadrados() {
  for(int i=0; i<cant; i++){
    int x = 400 + i * 35;
    int y = i * 30;
    int width = 400 - i * 65;
    int height = 400 - i * 60;
    stroke(0);
    rect(x, y, width, height);
  }
}

void GrillaAdelante() {
  for(int i=0; i<cant; i++) {
    int x = 400 + i * 35;
    int y = i * 30;
    int w = 400 - i * 65;
    int h = 400 - i * 60;
    stroke(0);
    strokeWeight(15);
    rect(x, y, w, h);
  }
}

void dibujoExtraAdelante() {
  stroke(0);
  strokeWeight(15);
  rect(590, 165, 45, 70);
  fill(0);
  rect(611, 190, 4, 20);
  fill(255);
}

void LineasCostadoIzquierdo() {
  int[] xPositions = {575, 555, 540, 520, 505, 485, 470, 450, 435, 415, 400};
  for (int i = 0; i < xPositions.length; i++) {
    if (i % 2 == 0) {
      stroke(255);
      rect(xPositions[i], 165, 0, 70);
    } else {
      stroke(0);
      rect(xPositions[i], 165, 5, 70);
    }
  }
}

void LineasCostadoDerecho() {
  for (int i = 0; i < 16; i++) {
    if (i % 2 == 0) {
      stroke(255);
      rect(650 + i * 15, 165, 0, 70);
    } else {
      stroke(0);
      rect(650 + i * 15, 165, 5, 70);
    }
  }
}

void LineasArriba() {
  for (int i = 150; i >= 0; i -= 15) {
    if ((150 - i) % 30 == 0) {
      stroke(255);
      rect(590, i, 45, 2);
    } else {
      stroke(0);
      rect(590, i, 45, 0);
    }
  }
}

void LineasAbajo() {
  for (int i = 250; i <= 400; i += 15) {
    if ((i - 250) % 30 == 0) {
      stroke(255);
      rect(590, i, 45, 0);
    } else {
      stroke(0);
      rect(590, i, 45, 0);
    }
  }
}

// Función que genera posiciones y tamaños aleatorios para los círculos
void generarCirculosAleatorios() {
  for (int i = 0; i < numCirculos; i++) {
    posX[i] = random(400, 800); // Posiciones aleatorias en el lado derecho
    posY[i] = random(0, 400); // Posiciones aleatorias en la altura total
    diametros[i] = random(10, 50); // Tamaño aleatorio de los círculos
    if (random(1) < 0.5) {
      colores[i] = color(0); // Color negro
    } else {
      colores[i] = color(255); // Color blanco
    }
  }
}

// Función que dibuja los círculos usando las posiciones y colores generados
void dibujaCirculos(float[] x, float[] y, float[] d, color[] c) {
  for (int i = 0; i < x.length; i++) {
    fill(c[i]);
    noStroke();
    ellipse(x[i], y[i], d[i], d[i]);
  }
}

// Función que calcula la distancia entre dos puntos
float calcularDistancia(float x1, float y1, float x2, float y2) {
  return dist(x1, y1, x2, y2);
}

// Evento que maneja el clic del mouse
void mousePressed() {
  // Verificar si se hizo clic en el botón de reinicio
  if (mouseX >= botonX && mouseX <= botonX + botonAncho &&
      mouseY >= botonY && mouseY <= botonY + botonAlto) {
    // Reiniciar todas las variables al estado original
    color1 = color(0, 0, 0);
    color2 = color(255, 255, 255);
    color3 = color(244, 67, 54);
    generarCirculosAleatorios();
    cambiarColor= false;
  }
}

// Evento que maneja la tecla presionada
void keyPressed() {
  // Generar nuevos círculos al presionar la tecla '+'
  if (key == '+') {
    generarCirculosAleatorios();
  }
  if (key == '-') {
    cambiarColor = !cambiarColor;
  }
}
