
PImage furby;

float xPos;
float yPos;

float xSpeed;
float ySpeed;

boolean furbyBrush = false;
boolean paint = false;

void setup() {
  size(displayWidth, displayHeight);
  
  //loading the image into our PImage
  furby = loadImage("furby.png");
  background(0);
  imageMode(CENTER);
  
  xPos = random(furby.width/2+1, width - furby.width/2+1);
  yPos = random(furby.height/2+1, height- furby.height/2+1);
  
  xSpeed = 5;
  ySpeed = 5;
  
  for (int i = 0; i < 100; i++) {
    image(furby, random(width), random(height), 30, 30);
  }
  println(furby.width/2);
}


void draw() {
  text("press q for furby, press w for spray paint" ,10, 20 );
  xPos = xPos + xSpeed;
  yPos = yPos + ySpeed;
  image(furby, width/2, height/2, mouseX, furby.height/2);
  
  image(furby, xPos, yPos);
  
  if(xPos <= furby.width/2 || xPos >= width - furby.width/2){
    xSpeed = -xSpeed;
  }
  
  if(yPos <= furby.height/2 || yPos >= height - furby.height/2){
    ySpeed = -ySpeed;
  }
  
  if(mouseX > width/2){
    strokeWeight(10);
    stroke(0, 255,0);
    fill(255, 40, 180);
  } else {
    fill(255);
    stroke(255);
    strokeWeight(10);
  }
  ellipse(200, 300, 200, 200);

  if(furbyBrush == true){
   furbyBrush(); 
  }
  
  if(paint == true){
    paint();
  }
  
  
}


void keyPressed(){
   println("pressed");
    if(key == 's' || key == 'S'){
      //saves an image of sketch
      saveFrame("furbyAnimation-######.png");
    }
    
    if(key == 'q'){
      furbyBrush = true;
      paint = false;
    }
    
    if(key == 'w'){
      furbyBrush = false;
      paint = true;
    }
}

void furbyBrush(){
  image(furby, mouseX, mouseY, 40, 40);
}

void paint(){
  noStroke();
  for(int i = 0; i < 20; i++ ){
    ellipse(random(mouseX -30, mouseX + 30), random(mouseY -30, mouseY+30), 5, 5);  
  }
}
