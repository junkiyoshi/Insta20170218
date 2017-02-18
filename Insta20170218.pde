import de.voidplus.leapmotion.*;
import java.util.*;

PImage img;
ArrayList<En> ens;
float noise_value;

LeapMotion leap;

void setup()
{
  size(800, 800);
  frameRate(30);
  colorMode(HSB);
  
  ens = new ArrayList<En>();
  noise_value = random(10);
  
  leap = new LeapMotion(this).allowGestures();
  
  background(0);
}

void leapOnCircleGesture(CircleGesture g, int state)
{
  float speed = random(10, 20); 
  if(g.getDirection() == 0) { speed *= -1; }
  
  if(state == 2 && random(100) > 50)
  {
    ens.add(new En(50, random(360), random(25, 50), speed));
  }
}

void draw()
{
  //background(0);

  fill(color(0, 0, 0), 16);
  noStroke();
  rect(0, 0, width, height);
 
  Iterator<En> it = ens.iterator();
  while(it.hasNext())
  {
    En e = it.next();
    e.run();
    if(e.isDead())
    {
      it.remove();
    }
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}