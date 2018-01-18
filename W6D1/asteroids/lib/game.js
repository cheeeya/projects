const MovingObject = require ('./moving_object.js');
const Asteroid = require('./asteroid.js');
const Ship = require('./ship.js');
const Bullet = require('./bullet.js');
const Util = require('./utils.js');

console.log("HELLO!!!!");

let mo = new MovingObject({ pos: [1,1], vel: [1,1], radius: 5, color: 'blue' });
console.log(mo);

const asteroids = [];
const NUM_ASTEROIDS = 10;
const DIM_X = 400;
const DIM_Y = 400;


const Game = function () {
  this.xDim = DIM_X;
  this.yDim = DIM_Y;
  this.addAsteroids(NUM_ASTEROIDS);
};


Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.xDim, this.yDim);

  console.log(asteroids);
  asteroids.forEach( function(obj) {
    obj.draw(ctx);
  });
};

// Game.prototype.start = function(ctx) {
//   this.draw(ctx);
// };

Game.prototype.addAsteroids = function(numAsteroid) {
  for(let i = 0; i < numAsteroid; i++) {
    let a = new Asteroid({pos: this.randomPosition(), game: this });
    asteroids.push(a);
  }
};

Game.prototype.randomPosition = function() {

  let x = DIM_X * Math.random();
  let y = DIM_Y * Math.random();
  return [x, y];
};

Game.prototype.moveObjects = function() {
  for (let i = 0; i < asteroids.length; i++){
    asteroids[i].move();
  }
};

Game.prototype.wrap = function(pos) {
  if (pos[0] > DIM_X) {
    pos[0] = pos[0] - DIM_X;
  } else if (pos[0] < 0) {
    pos[0] = pos[0] + DIM_X;
  }
  if(pos[1] > DIM_Y) {
    pos[1] = pos[1] - DIM_Y;
  } else if (pos[1] < 0){
    pos[1] = pos[1] + DIM_X;
  }
  return pos;
};

module.exports = Game;
