var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.stacks = [[5,4,3,2,1],[],[]];

  }

  promptMove(callback) {
    this.print();
    reader.question("Enter start stack and end stack (start, end):",
      (input) => {
        let array = input.split(",");
        let stack1 = parseInt(array[0]);
        let stack2 = parseInt(array[1]);
        callback.call(this, stack1, stack2);
      });
  }

  // testCallBack(start, end) {
  //   console.log(start);
  //   console.log(end);
  // }
  isValidMove(start, end) {
    let lastIndexEnd = this.stacks[end].length-1;
    let lastIndexStart = this.stacks[start].length-1;
    if (start !== end &&
      this.stacks[end].length === 0 &&
      this.stacks[start].length > 0) return true;
    return (this.stacks[end][lastIndexEnd] > this.stacks[start][lastIndexStart]);
  }

  move(start, end) {
    if (this.isValidMove(start, end)) {
      this.stacks[end].push(this.stacks[start].pop());
      this.print();
      // console.log(this.stacks);
      return true;
    } else {
      // console.log(this.stacks);
      console.log("Invalid Move");
      return false;
    }
  }

  print() {
    for (let i = 0; i < 3; i++){
      console.log(JSON.stringify(this.stacks[i]));
    }
  }

  isWon() {
    return this.stacks[0].length === 0 && (this.stacks[1].length === 0 || this.stacks[2].length === 0);
  }

  run(completionCallback) {
    this.promptMove( (didMove) => {
      if (didMove)
    }
  }
}

let game = new Game;
game.run(function(){ reader.close(); });
