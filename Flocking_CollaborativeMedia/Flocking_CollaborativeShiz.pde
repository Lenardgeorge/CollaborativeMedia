import processing.serial.*;

/**
 * Flocking 
 * by Daniel Shiffman.  
 * 
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on 
 * rules of avoidance, alignment, and coherence.
 * 
 * Click the mouse to add a new boid.
 */

Serial myPort ;
String val ; //data recieved from the serial port

Flock flock;
int numberOfTouchPoints = 5;


void setup() {
  fullScreen();
  //size(1200, 750);
  flock = new Flock();
  
  initialiseSerialPort();
  
  
  // Add an initial set of boids into the system
  for (int i = 0; i < 10; i++) {
    flock.addBoid(new Boid(width/2,height/2, 0,0,0));
  }
  
  
  
}

void draw() {
  background(0);
  flock.run();

  drawCapacitivePoints(100,300);
  drawCapacitivePoints(250,400);
  drawCapacitivePoints(400,200);
  drawCapacitivePoints(500,400);
  drawCapacitivePoints(650,650);
  drawCapacitivePoints(800,250);
  drawCapacitivePoints(1100,150);
  drawCapacitivePoints(1000,550);
 //generateBoids();
 generateWithKey();
}

/*
void generateBoids(){
 
   // for capacitivePoint(100,300) & RGB (244, 66, 86)
  if((mouseX >= 50 && mouseX <=150) && (mouseY >= 250 && mouseY <= 350))
  {
      flock.addBoid(new Boid(100,300,244,66,86));
  }
  
  // for capacitivePoint(250, 400) & RGB (255, 250, 0)
  if((mouseX >= 200 && mouseX <= 300) && (mouseY >= 350 && mouseY <= 450))
  {
      flock.addBoid(new Boid(250,400,255, 250, 0));
  }
  
  // for capacitivePoint(400,200) & RGB (65, 106, 244)
  if((mouseX >= 350 && mouseX <=450) && (mouseY >= 150 && mouseY <= 250))
  {
      flock.addBoid(new Boid(400,200, 65, 106, 244));
  }
  
  // for capacitivePoint(500,400)
  if((mouseX >= 450 && mouseX <=550) && (mouseY >= 350 && mouseY <= 450))
  {
      flock.addBoid(new Boid(500,400, 41, 173, 70));
  }
  
   if((mouseX >= 450 && mouseX <=550) && (mouseY >= 350 && mouseY <= 450))
  {
    //  flock.removeBoids();
  }
  
  
}
*/

void generateWithKey() {
  
  if (key == '1') {
      flock.addBoid(new Boid(100,300,244,66,86));
  }
  if (key == '2') {
      flock.addBoid(new Boid(250,400,255, 250, 0));

  } 
  else if (key == '3') {
      flock.addBoid(new Boid(400,200, 65, 106, 244));

  } 
  else if (key == '4') {
      flock.addBoid(new Boid(500,400, 41, 173, 70));

  } 
  else if (key == '5') {
      flock.removeBoids();
  } 
  else if (key == '6') {

  } 
  else if (key == '7') {
  
  } 
  else if (key == '8') {

  }
  else {
  
  }
}


void keyReleased(){
 key = 0 ;
}
/*

// Add a new boid into the System
void mousePressed() {
  
  // for capacitivePoint(100,300)
  if((mouseX >= 50 && mouseX <=150) && (mouseY >= 250 && mouseY <= 350))
  {
      flock.addBoid(new Boid(100,300));
  }
  
  // for capacitivePoint(250, 400)
  if((mouseX >= 200 && mouseX <= 300) && (mouseY >= 350 && mouseY <= 450))
  {
      flock.addBoid(new Boid(250,400));
  }
  
  // for capacitivePoint(400,200)
  if((mouseX >= 350 && mouseX <=450) && (mouseY >= 150 && mouseY <= 250))
  {
      flock.addBoid(new Boid(400,200));
  }
  
  // for capacitivePoint(500,400)
  if((mouseX >= 450 && mouseX <=550) && (mouseY >= 350 && mouseY <= 450))
  {
      flock.addBoid(new Boid(500,400));
  }

 }
 
 
*/

void initialiseSerialPort(){

  //printArray(Serial.list());
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);

}

void drawCapacitivePoints(int xAxis, int yAxis){
  fill(255);
  ellipse(xAxis, yAxis, 50, 50 );
}