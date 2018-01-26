const MovingObject = require('./moving_object.js');
const Util = require('./utils.js');

const Asteroid = function(options) {

  options['radius'] = 15;
  options['color'] = 'blue';
  options['vel'] = Util.randomVec(10);

  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;
