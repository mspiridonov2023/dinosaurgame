class BigCactus {
  float xpos;
  float ypos;
  float speed;
  PImage bigcactus;

  BigCactus(float tempxpos, float tempypos, float tempspeed, PImage tempbigcactus) {
    xpos=tempxpos;
    ypos=tempypos;
    speed=tempspeed;
    bigcactus=tempbigcactus;
  }
  void display() {
    image(bigcactus, xpos, ypos);
  }
  void scroll() {
    if (deadtimer<1) {
      xpos=xpos+speed;
      speed=speed-0.000525;
    }
    if (xpos<0) {
      xpos=800;
      score=score+1;
      if (score>highscore) {
        highscore=highscore+1;
      }
    }
  }
}
