Function.prototype.inherits = function(Parent) {
  const Surrogate = function() {};
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate;
  this.prototype.constructor = this;
};

Function.prototype.inherits2 = function(Parent) {
  this.prototype = Object.create(Parent.prototype);
  this.prototype.constructor = this;
};

function MovingObject (name) {

  this.speed = 10;
  this.name = name;

}

MovingObject.prototype.fly = function() {
  console.log("I'm flying");
};

function Ship (name, color) {
  MovingObject.call(this, name);
  this.color = color;

}
Ship.inherits2(MovingObject);
Ship.prototype.shoot = function() {
  console.log("pew pew pew");
};

function Asteroid (name, size) {
  MovingObject.call(this, name);
  this.size = size;
}
Asteroid.inherits2(MovingObject);
Asteroid.prototype.sayHi = function() {
  console.log(`${this.name} says hi`);
};

let ship1 = new Ship("bob", "green");
console.log(ship1.name);
let aster1 = new Asteroid("bigRock", 100);
ship1.fly();
ship1.shoot();
aster1.sayHi();
aster1.fly();

// aster1.shoot();
