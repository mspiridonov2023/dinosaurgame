class Bird {
  float xpos;
  float ypos;
  float speed;
  int resetint;

  Bird(float tempxpos, float tempypos, float tempspeed, int tempresetint) {
    xpos=tempxpos;
    ypos=tempypos;
    speed=tempspeed;
    resetint=tempresetint;
  }
  void display() {
    fill(180, 80, 100);
    ellipse(xpos, ypos, 60, 40);
    fill(0, 0, 0);
    strokeWeight(2);
    stroke(0, 0, 0);
    fill(0, 0, 100);
    ellipse(xpos-20, ypos, 20, 20);
    fill(20, 70, 40);
    strokeWeight(1);
    stroke(0, 0, 0);
    ellipse(xpos-23, ypos, 12, 12);
    stroke(0, 0, 0);
    strokeWeight(2);
    line(xpos, ypos+10, xpos-15, ypos+15);
  }
  void hitbox() {
    if (xpos-30<dinosaur.xpos+25 && xpos+20>dinosaur.xpos && dinosaur.dinomode !=1) {
      dinosaur.dead=true;
    }
  }
    void scroll() {
      xpos=xpos+speed;
      speed=speed-0.000525;
      if(xpos<0 && dinosaur.dead==false && resetint==1){
        xpos=800;
        resetint=round(random(1,5));
      }
      if(xpos<0 && dinosaur.dead==false && resetint==2){
        xpos=1200;
        resetint=round(random(1,5));
      }
      if(xpos<0 && dinosaur.dead==false && resetint==3){
        xpos=1600;
        resetint=round(random(1,5));
      }
      if(xpos<0 && dinosaur.dead==false && resetint==4){
        xpos=2000;
        resetint=round(random(1,5));
      }
      if(xpos<0 && dinosaur.dead==false && resetint==5){
        xpos=2400;
        resetint=round(random(1,5));
      }
    }
  }
