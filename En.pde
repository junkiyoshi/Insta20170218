class En
{
  float radius;
  float angle;
  float len;
  float noise_value;
  float speed;
  float color_value;
  color body_color;
  
  En(float r, float a, float l, float s)
  {
    radius = r;
    angle = a;
    len = l;
    noise_value = random(10);
    speed = s;
    color_value = random(255);
    body_color = color(color_value, 255, 255);
  }
  
  void run()
  {
    noFill();
    stroke(body_color);
    strokeWeight(6);
   
    arc(width / 2, height / 2, radius, radius, radians(angle), radians(angle + len)); 

    float tmp_speed = speed;
    if(speed < 0)
    {
      tmp_speed *= -1;
    }
    
    radius += tmp_speed ;
    angle += speed;
    
    color_value = (color_value + tmp_speed) % 255;
    body_color = color(color_value, 255, 255);
  }
  
  boolean isDead()
  {
    if(radius < 0 || radius > width * 1.5)
    {
      return true;
    }   
    return false;
  }
}