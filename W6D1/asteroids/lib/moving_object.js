

const MovingObject = function(options) {
  this.position = options['pos'];
  this.velocity = options['vel'];
  this.radius = options['radius'];
  this.color = options['color'];
  this.game = options['game'];
};


MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(this.position[0], this.position[1], this.radius, 0, 2*Math.PI, true);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.position[0] += this.velocity[0];
  this.position[1] += this.velocity[1];
  this.position = this.game.wrap(this.position);
};

module.exports = MovingObject;
