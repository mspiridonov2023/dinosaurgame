class Angel {
  float xpos;
  float ypos;
  float xspeed;
  boolean active;
  PImage angel;

  Angel(float tempxpos, float tempypos, float tempxspeed, boolean tempactive, PImage tempangel) {
    xpos=tempxpos;
    ypos=tempypos;
    xspeed=tempxspeed;
    active=tempactive;
    angel=tempangel;
  }
  void display() {
    image(angel, xpos, ypos);
  }
  void move() {
    if (dinosaur.dead==true) {
      active=true;
    }
    if (active==true) {
      xpos=xpos+xspeed;
      ypos=ypos+3;
      if (xpos>230 || xpos<190) {
        xspeed=-xspeed;
      }
    }
  }
}
