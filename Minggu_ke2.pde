PImage img;
PFont font;
float posX, posY, velX, velY, gravity;
boolean isDragging = false;
float offsetX, offsetY;

void setup() {
  size(800, 1000);
  img = loadImage("astronaut.png");
  font = loadFont("Constantia-BoldItalic-48.vlw");
  posX = width / 2; 
  posY = height / 2; 
  velX = 0; 
  velY = 0; 
  gravity = 0.2;
}

void draw () {
  background(255);
  imageMode(CENTER);
  if (isDragging) {
    posX = mouseX - offsetX;
    posY = mouseY - offsetY;
  } else {
    velY += gravity;
    posY += velY;
    if (posY + img.height / 2 >= height) {
      posY = height - img.height / 2;
      velY = -0.8 * velY; 
    }
  }

  image(img, posX, posY);
  fill(240, 128, 128);
  textFont(font);
  textAlign(CENTER, BOTTOM);
  textSize(25);
  text("Muhammad Rezzha RA", width / 2 , height - 120);
  
  fill(240, 128, 128);
  textFont(font);
  textAlign(CENTER, BOTTOM);
  textSize(25);
  text("22.21.1545", width / 2 , height - 100);
}

void mousePressed() {
  if (dist(mouseX, mouseY, posX, posY) < img.width / 2) {
    isDragging = true;
    offsetX = mouseX - posX;
    offsetY = mouseY - posY;
    velX = 0;
    velY = 0;
  }
}

void mouseReleased() {
  isDragging = false;
}
