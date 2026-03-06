import java.sql.Time;
import java.util.Random;
float radius = 42;
PVector location = new PVector (random(radius, width - radius ), random(radius, height - radius));

int GameScore;
boolean showtitle;
boolean target_hit;
boolean update_timer;
boolean game_over;
int score;
int time;

void setup() {
  size(1400, 800);
  showtitle = true;
  game_over = false;
  //update_timer = false;
  GameScore = 0;
  time = 1800; //each second is 60 counts
}

void draw() {
  if (showtitle == true) {
    background(0);
    fill(255);
    textSize(55); 
    text("The Clicker Game", 450, 75);
    textSize(75);
    text("Click on as many targets", 500, 200);
    text("in 30 Seconds!!", 550, 350);
    textSize(100);
    text("*Click To Start", 200, 600);
    ellipse(85, 100, 75, 75);
    ellipse(200, 400, 75, 75);
    ellipse(300, 200, 75, 75);
    ellipse(650, 700, 75, 75);
    ellipse(650, 700, 75, 75);
    ellipse(200, 900, 75, 75);
    ellipse(1000, 450, 75, 75);
    ellipse(1200, 550, 75, 75);
    ellipse(1300, 350, 75, 75);
  } else if (game_over == true) {
      background(0);
      fill(255);
      text("Game Over!", 150, 150);
      text("Your Final Score is " +  GameScore, 150, 300);
      textSize(100);
  } else {
 
    time--;
    
    background(0);
    fill(255);
    text("Time left:" +  ((time/60)+1) , 0, 75);
    text("Score:" +  GameScore, 0, 150);
    textSize(50);
    circle(location.x, location.y, radius*2);
    
    if (target_hit == true) {
      do {
        location = new PVector( random(radius, width - radius ), random(radius, height - radius) );
      } while ( (location.x > 1100) || (location.x < 200) || (location.y > 1100) || (location.y < 200));

      //circle(location.x, location.y, radius*2);
    }
    
    if (time <= 0){
      game_over = true;
    }


    target_hit = false;
  }
}
void mousePressed() {
  if (mousePressed == true) {
    if (showtitle == true) {
      target_hit = true;
    }
    showtitle = false;
  }
}
void mouseClicked() {
  if (dist(mouseX, mouseY, location.x, location.y) <= radius) {
    target_hit = true;
    GameScore ++;
  }
}
