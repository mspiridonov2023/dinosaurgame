boolean[] keys=new boolean[1024];

Dinosaur dinosaur;
SmallCactus sc;
BigCactus bc;
Angel angel;
Bird bird;
PImage desert;
int level;
int score;
int highscore;
int attempt;
int deadtimer;
void setup() {
  size(500, 500);
  imageMode(CORNER);
  colorMode(HSB, 360, 100, 100);
  dinosaur = new Dinosaur(250, 250, 0, 0, false, false, loadImage("dinosaur.png"), loadImage("crouch.png"), loadImage("dead.png"),loadImage("shiny.png"),loadImage("crouchshiny.png"));
  sc= new SmallCactus(500, 460, -4, loadImage("smallcactus.png"));
  bc= new BigCactus(900, 425, -4, loadImage("bigcactus.png"));
  angel= new Angel(210, -80, 1, false, loadImage("angel.png"));
  bird = new Bird(1500, 440, -4, 1);
  desert=loadImage("desert.png");
  level=0; // 0=home 1=game 2=gameover 3=controls
  score=0;
  highscore=0;
  attempt=1;
  deadtimer=0;
}

void draw() {
  background(0, 0, 0);

  if (level==0) {
    background(0,0,0);
    image(dinosaur.dinosaur,dinosaur.xpos,dinosaur.ypos);
    if(keys['w']){
      dinosaur.ypos=dinosaur.ypos-5;
    }
    if(keys['s']){
      dinosaur.ypos=dinosaur.ypos+5;
    }
    if(keys['a']){
      dinosaur.xpos=dinosaur.xpos-5;
    }
    if(keys['d']){
      dinosaur.xpos=dinosaur.xpos+5;
    }
    stroke(0, 0, 100);
    if (mouseX>75 && mouseX<175 && mouseY>200 && mouseY<225) {
      stroke(270, 100, 100);
      if (mousePressed) {
        level=1;
        sc.xpos=500;
        bc.xpos=900;
        dinosaur.dead=false;
        dinosaur.jumpcounter=0;
        dinosaur.jump=false;
        dinosaur.ypos=475;
        dinosaur.xpos=150;
        score=0;
        attempt=attempt+1;
        angel.active=false;
        angel.xpos=210;
        angel.ypos=-80;
        bird.xpos=5500;
        bird.speed=-4;
        bc.speed=-4;
        sc.speed=-4;
      }
    }
    fill(0, 0, 0);
    rect(75, 200, 100, 25);
    fill(0, 0, 100);
    textSize(20);
    text("Play", 100, 220);
    textSize(30);
    fill(180, 100, 100);
    text("WELCOME to Dinosaur Game", 20, 100);
    stroke(0, 0, 100);
    if (mouseX>325 && mouseX<425 && mouseY>200 && mouseY<225) {
      stroke(270, 100, 100);
      if (mousePressed) {
        level=3;
      }
    }
    fill(0, 0, 0);
    rect(325, 200, 100, 25);
    fill(0, 0, 100);
    textSize(20);
    text("Controls", 335, 220);
  }
  if (level==1) {
    image(desert, 0, 0);
    dinosaur.display();
    dinosaur.jump();
    dinosaur.hitbox();
    sc.display();
    bc.display();
    sc.scroll();
    bc.scroll();
    angel.display();
    angel.move();
    bird.display();
    bird.hitbox();
    bird.scroll();
    textSize(20);
    fill(0, 0, 0);
    stroke(270, 100, 100);
    text("Score: "+ score, 200, 100);
    if (highscore==score && attempt>2) {
      fill(270, 100, 100);
    }
    text("High Score: "+highscore, 200, 75);
  }
  if (level==2) {
    textSize(30);
    text("Dang bro u really just dyied. GG", 20, 300);
    if (attempt>9) {
      fill(270, 100, 100);
      stroke(270, 100, 100);
      text("LOL why r u still playing", 20, 350);
    }
    image(dinosaur.deadd, 250, 200);
    stroke(0, 0, 100);

    if (mouseX>20 && mouseX<120 && mouseY>450 && mouseY<475 || keys['r']) {
      stroke(270, 100, 100);
      if (mousePressed) {
        level=0;
      }
    }
    noFill();
    strokeWeight(1);
    rect(20, 450, 100, 25);
    fill(0, 0, 100);
    textSize(15);
    text("Play Agane", 30, 470);
    textSize(25);
    text("Your Score: "+score, 100, 100);
    text("Your High Score: "+highscore, 100, 150);
  }
  if (level==3) {
    fill(0, 0, 100);
    text("Back", 65, 445);
    noFill();
    stroke(0, 0, 100);


    if (mouseX>50 && mouseX<125 && mouseY>425 && mouseY<450) {
      stroke(270, 100, 100);
      if (mousePressed) {
        level=0;
        dinosaur.xpos=250;
        dinosaur.ypos=250;
      }
    }
    rect(50, 425, 75, 25);
    fill(0, 0, 100);
    textSize(25);
    text("Space to jump", 50, 100);
    text("Shift to crouch", 50, 150);
    text("Jump over the cacti;", 50, 200);
    text("Crouch under the 'bird'", 50, 250);
  }
}
void keyPressed(){
  if(!(key==CODED)){
    keys[key]=true;
  }
}
void keyReleased(){
  if(!(key==CODED)){
    keys[key]=false;
  }
}
