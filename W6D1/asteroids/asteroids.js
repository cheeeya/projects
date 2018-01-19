const GameView = require('./lib/game_view.js');

document.addEventListener("DOMContentLoaded", function(){
  const gameCanvas = document.getElementById("myCanvas");
  const ctx = gameCanvas.getContext("2d");
  const gv = new GameView(ctx);
  gv.start();
});
