PImage grinch;
PImage grinchFlip;
PImage fish;


void setup()
{
  size(600,600);
  snow2Setup();
  grinch = loadImage("theGrinch.png");
  grinchFlip = loadImage("theGrinchMirror.png");
  fish = loadImage("fish.png");
  fish.resize(50,50);
}

void draw()
{
  backgroundSetup();
  fish();
  grinch();
  snow2();
  words();
  
}
void backgroundSetup() {

  //makes sky
  background(0);
  
  //makes ground
  fill(76, 187, 217);
  stroke(0);
  strokeWeight(1);
  rect(0, 500, 600, 100);
  fill(255);
  ellipse(-100, 550, 1000, 200);
  
  //makes house
  fill(153, 102, 51);
  strokeWeight(2);
  stroke(0);
  rect(50, 350, 200, 200);
  //makes roof
  fill(255);
  triangle(40,345,260,345,150,240);
  strokeWeight(0);
  fill(77);
  triangle(40,350,260,350,150,250);
  //makes door
  fill(179, 0, 0);
  strokeWeight(2);
  rect(75,450,50,100);
  
  
  
}
int xFish = 500;
int yFish = 510;
boolean yDir = false;

void fish() {
  image(fish, xFish, yFish);
  
  //changes bobbing direction
  if (yFish<510)
  yDir=false;
  else if (yFish>535)
  yDir=true;
  
  //moves up or down
  if (yDir)
  yFish--;
  else
  yFish++;
}
int xGrinch = -500;
int yGrinch = 180;
boolean vertDir = true;
boolean horizDir = true;

void grinch() {
  if (horizDir)
  image(grinch, xGrinch, yGrinch);
  else
  image(grinchFlip, xGrinch, yGrinch);
  
  
  //moving up or down
  if (yGrinch>200)
  vertDir=false;
  if (yGrinch<180)
  vertDir=true;
  
  //moving right or left
  if (xGrinch>600)
  horizDir=false;
  if(xGrinch<-500)
  horizDir=true;
  
  //vertical movement
  if (vertDir)
  yGrinch+=2;
  else
  yGrinch-=2;
  
  //horizontal movement
  if (horizDir)
  xGrinch+=2;
  else
  xGrinch-=2;
}
int xWord = -500;
int yWord = 250;
int wordNumber = 1;

void words() {
  
  fill(153, 10, 17);
  textSize(50);
  
  //Happy christhums
  if (wordNumber == 1) {
  text("Happy christhums", xWord, yWord);
  if (xWord<100)
  xWord+=2;
  if (xWord==100)
  yWord+=2;
  //sends method to next word
  if (yWord > 700) {
  wordNumber++;
  xWord = -500;
  yWord = 250;
  }
  }
  
    //It's chrismah
  if (wordNumber == 2) {
  text("It's chrismah", xWord, yWord);
  if (xWord<150)
  xWord+=2;
  if (xWord==150)
  yWord+=2;
  //sends to next word
  if (yWord > 700) {
  wordNumber++;
  xWord = -500;
  yWord = 250;
  }
  }
  
    //Merry chrisis
  if (wordNumber == 3) {
  text("Merry chrisis", xWord, yWord);
  if (xWord<150)
  xWord+=2;
  if (xWord==150)
  yWord+=2;
  //sends to next word
  if (yWord > 700) {
  wordNumber++;
  xWord = -500;
  yWord = 250;
  }
  }
  
    //Happy christhums
  if (wordNumber == 4) {
  text("Merry Chrysler", xWord, yWord);
  if (xWord<130)
  xWord+=2;
  if (xWord==130)
  yWord+=2;
  //sends back to word 1
  if (yWord > 700) {
  wordNumber=1;
  xWord = -500;
  yWord = 250;
  }
  }
}
int[] xSnow2 = new int[200];
int[] ySnow2 = new int[200];
int[] sizeSnow2 = new int[200];
int[] vertSpeedSnow2 = new int[200];
int[] horizSpeedSnow2 = new int[200];



void snow2Setup() {
  for (int i=0; i<200; i++)
  snowflakeMake(i);
}

//sets up a single flake
void snowflakeMake(int i) {
    xSnow2[i] = (int)random(0, width);
    ySnow2[i] = (int)random(-25, height);
    sizeSnow2[i] = (int)random(5,15);
    vertSpeedSnow2[i] = (int)random(1,4);
    horizSpeedSnow2[i] = (int)random(-4,4);
  }
  
//resets flakes after they hit bottom
void snowflakeRemake(int i) {
    xSnow2[i] = (int)random(0, width);
    ySnow2[i] = -25;
    sizeSnow2[i] = (int)random(5,15);
    vertSpeedSnow2[i] = (int)random(1,4);
    horizSpeedSnow2[i] = (int)random(-4,4);
  }
  
void snow2() {
  fill(255);
  for(int i = 0; i<200; i++) {
    
    //draws snow
    ellipse(xSnow2[i], ySnow2[i], sizeSnow2[i], sizeSnow2[i]);
    
    //moves snow vertically
    ySnow2[i] += vertSpeedSnow2[i];
    
    //moves snow horizontally
    xSnow2[i] += horizSpeedSnow2[i];
    
    //sends snow back to the top
    if(ySnow2[i]>height + 25)
    snowflakeRemake(i);
    
}
  
}
