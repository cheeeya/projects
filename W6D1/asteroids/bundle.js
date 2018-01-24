/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {



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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

const Util = {
  inherits: function(childClass, parentClass) {
    const Surrogate = function() {};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate;
    childClass.prototype.constructor = childClass;
  },

  randomVec: function(length) {
    const deg = 2 * Math.PI *Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  scale: function(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Util;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__(3);

document.addEventListener("DOMContentLoaded", function(){
  const gameCanvas = document.getElementById("myCanvas");
  const ctx = gameCanvas.getContext("2d");
  const gv = new GameView(ctx);
  gv.start();
});


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(4);


const GameView = function(ctx){
  this.game = new Game();
  this.ctx = ctx;

};

GameView.prototype.start = function() {
  setInterval( () => {
    this.game.moveObjects();
    this.game.draw(this.ctx);
  }, 20);
};

module.exports = GameView;


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObject = __webpack_require__ (0);
const Asteroid = __webpack_require__(5);
const Ship = __webpack_require__(6);
const Bullet = __webpack_require__(7);
const Util = __webpack_require__(1);

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


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObject = __webpack_require__(0);
const Util = __webpack_require__(1);

const Asteroid = function(options) {

  options['radius'] = 15;
  options['color'] = 'blue';
  options['vel'] = Util.randomVec(10);

  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;


/***/ }),
/* 6 */
/***/ (function(module, exports) {

const Ship = function() {

};

module.exports = Ship;


/***/ }),
/* 7 */
/***/ (function(module, exports) {

const Bullet = function() {

};

module.exports = Bullet;


/***/ })
/******/ ]);