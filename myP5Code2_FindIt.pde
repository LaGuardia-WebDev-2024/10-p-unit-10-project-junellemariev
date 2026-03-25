var starXPos = [];
var starYPos = [];
var star = "✨";
var starTotal = 100;

var planetXPos = [];
var planetYPos = [];
var planet = "💛";
var planetTotal = 3;
var planetFound = 0;

setup = function() {
   size(790, 610);
   background(0,0,0,0); 

   reset();
}

draw = function(){   

   if(keyPressed){
    if(key == 'r'){
      reset();
    }
   }

  display();
}


mouseClicked = function(){
  check(mouseX, mouseY);
}

var check = function(xClick, yClick){
  for(var i = 0; i < planetXPos.length; i++){
    if(dist(xClick - 5, yClick - 5, planetXPos[i], planetYPos[i])<15){
      planetXPos.splice(i, 1);
      planetYPos.splice(i, 1);
      planetFound++;
    }
  }
}

var display = function(){
  background(100,100,100,0);

  fill(200,200,0);
  textSize(20);

  for(var i = 0; i < planetXPos.length; i ++){
    text(planet, planetXPos[i], planetYPos[i]);
  }

  for(var i = 0; i < starXPos.length; i ++){
    text(star, starXPos[i], starYPos[i]);
  }

  fill(173,208,179);
  noStroke();
  rect(0,570,790,70);
  fill(255,255,255);
  text("Find The " + planet + "s   |   " + planet + " " + planetFound + "/" + planetTotal, 50, 595);

  if(planetFound == planetTotal){
    fill(47,76,57);
    textSize(50);
    text("Press 'r' to restart the game", 50, 200);
  }
}

var reset = function(){
  starXPos = [];
  starYPos = [];
  planetXPos = [];
  planetYPos = [];
  planetFound = 0;


  for(var i = 0; i < starTotal; i++){
    starXPos.push(random(0,600));
    starYPos.push(random(0,400));
  }

  for(var i = 0; i < planetTotal; i++){
    planetXPos.push(random(0,600));
    planetYPos.push(random(0,400));
  }
}