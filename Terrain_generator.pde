//initailizing global variables
int cols, rows;
int scl = 20;
int w = 1200;
int h = 1000;

//float for generating the "flying" animation
float flying = 0;

float[][] terrain;

//setting up the scene where the animation will take place
void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
}

void draw(){
 //changing the value of flying to simulate flying each loop
 flying -= 0.08; 
 float yoff = flying;
 //loop through each row and collumn
 for (int y = 0; y < rows; y++) { 
   float xoff = 0;
   for (int x = 0; x < cols; x++) {
     //change the x and y values based off of Perlin noise
     terrain[x][y] = map(noise(xoff,yoff), 0, 1, -50, 50);
     xoff += 0.2;
 }
   yoff += 0.2;
 }
 //draw the background, set the stroke to nothing and fill the trangle strip with green to simulate grass
 background(0);
 //  stroke(0);
   fill(27,145,25);
  //tilting the board and centering it
  translate(width/2,height/2);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  
  //loop through to draw the trangle strip
 for (int y = 0; y < rows-1; y++) { 
   beginShape(TRIANGLE_STRIP);
   for (int x = 0; x < cols; x++) {
     vertex(x*scl, y*scl, terrain[x][y]);
     vertex(x*scl, (y+1)*scl, terrain[x][y+1]);

   }
 endShape();
 }
}
