class Dinosaur {
  float xpos;
  float ypos;
  int jumpcounter;
  boolean jump;
  boolean dead;
  PImage dinosaur;
  PImage crouch;
  PImage deadd;
  PImage shiny;
  PImage crouchshiny;
  int dinomode; //0=alive,1=crouch,2=dead
  Dinosaur(float tempxpos, float tempypos, int tempjumpcounter, int tempdinomode, boolean tempjump, boolean tempdead, PImage tempdinosaur, PImage tempcrouch, PImage tempdeadd, PImage tempshiny, PImage tempcrouchshiny) {
    xpos=tempxpos;
    ypos=tempypos;
    jumpcounter=tempjumpcounter;
    dinomode=tempdinomode;
    jump=tempjump;
    dead=tempdead;
    dinosaur=tempdinosaur;
    crouch=tempcrouch;
    deadd=tempdeadd;
    shiny=tempshiny;
    crouchshiny=tempcrouchshiny;
  }

  void display() {
    dinomode=0;
    if (keyPressed && keyCode==SHIFT && dead==false) {
      dinomode=1;
    }
    if (dead==true) {
      dinomode=2;
    }
    if (dinomode==0) {
      if(score<50){
      image(dinosaur, xpos, ypos-25);
      }
      if(score>=50){
       image(shiny,xpos,ypos-25); 
      }
    }
    if (dinomode==1) {
      if(score<50){
      image(crouch, xpos, ypos);
      }
      if(score>=50){
       image(crouchshiny,xpos,ypos); 
      }
    }
    if (dinomode==2) {
      image(deadd, xpos, ypos-35);
    }
  }
  void jump() {
    if (keys[' '] && jumpcounter==0 && jump==false && dead==false) {
      jumpcounter=1;
      jump=true;
    }
    if (jumpcounter==0) {
      jump=false;
    }
    if (jumpcounter>25) {
      jumpcounter=-26;
    }
    if (jumpcounter>0 &&( jumpcounter<=8 || jumpcounter==8)) {
      ypos=ypos-8; 
      jumpcounter=jumpcounter+1;
    }
    if (jumpcounter>8) {
      ypos=ypos-5;
      jumpcounter=jumpcounter+1;
    }
    if (jumpcounter<0 && jumpcounter>-8) {
      ypos=ypos+12;
      jumpcounter=jumpcounter+1;
    }
    if (jumpcounter<-8 || jumpcounter==-8) {
      ypos=ypos+8;
      jumpcounter=jumpcounter+1;
    }
    if (ypos>475) {
      ypos=475;
    }
  }
  void hitbox() {
    if (xpos+40>sc.xpos && xpos<sc.xpos+30 && ypos+30>sc.ypos && ypos<sc.ypos+40) {
      dead=true;
    }
    if (xpos+40>bc.xpos && xpos<bc.xpos+25 && ypos+25>bc.ypos+35 && ypos<bc.ypos+75) {
      dead=true;
    }
    if (dead==true) {
      deadtimer=deadtimer+1;
    }
    if (deadtimer>=200) {
      deadtimer=0;
      level=2;
      dead=false;
    }
  }
}
