class SmallCactus {
  float xpos;
  float ypos;
  float speed;
  PImage smallcactus;

  SmallCactus(float tempxpos, float tempypos, float tempspeed, PImage tempsmallcactus) {
    xpos=tempxpos;
    ypos=tempypos;
    speed=tempspeed;
    smallcactus=tempsmallcactus;
  }
  void display() {
    image(smallcactus, xpos, ypos);
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
