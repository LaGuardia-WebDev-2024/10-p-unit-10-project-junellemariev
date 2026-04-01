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

var label = mouseX + "," + mouseY;
fill(40,40,40)
textSize(30);
text(label, 50, 100);


  //kuromi's grocery store
  if(backgroundImage1 == 1) {

var milkX = 218;
  while(milkX < 368){
    textSize(50);
    text("🧋",milkX,290);
    milkX += 30;
  }

var candyX = 5
  for(candyX=5; candyX<205; x+=20){
    textSize(50);
    text("🍭",candyX,400,candyX);
  }

}

}

var backgroundImage1 = 0;

//change scene
mouseClicked = function(){
  check(mouseX, mouseY);
  console.log("clicked");
  if(mouseY>435 && mouseY<493 && mouseX>407 && mouseX<490){
      console.log("clicked here");
      backgroundImage1 = 1;
  }

  //kuromi's grocery store
  if(backgroundImage1 == 1) {
   planet = ".";
   star = ".";
  }

}




//heart being clicked
var check = function(xClick, yClick){
  for(var i = 0; i < planetXPos.length; i++){
    if(dist(xClick - 5, yClick - 5, planetXPos[i], planetYPos[i])<15){
      planetXPos.splice(i, 1);
      planetYPos.splice(i, 1);
      planetFound++;
    }
  }
}

var funImage = loadImage("https://s.tmimgcdn.com/scr/800x500/124800/interior-retail-shelf-store-illustration_124877-original.jpg");

var display = function(){
  background(100,100,100,0);

  if(backgroundImage1 ==1){
    image(funImage ,0, 0, width, height)
  }

  fill(200,200,0);
  textSize(20);

  for(var i = 0; i < planetXPos.length; i ++){
    text(planet, planetXPos[i], planetYPos[i]);
  }

  for(var i = 0; i < starXPos.length; i ++){
    text(star, starXPos[i], starYPos[i]);
  }

//text box
  fill(173,208,179);
  noStroke();
  rect(0,570,790,70);
  fill(255,255,255);
  text("Find The " + planet + "s   |   " + planet + " " + planetFound + "/" + planetTotal, 50, 595);

  if(planetFound == planetTotal){
    fill(38, 153, 38);
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

//position of stars and hearts
  for(var i = 0; i < starTotal; i++){
    starXPos.push(random(30,750));
    starYPos.push(random(40,570));
  }

  for(var i = 0; i < planetTotal; i++){
    planetXPos.push(random(30,750));
    planetYPos.push(random(40,550));
  }
}