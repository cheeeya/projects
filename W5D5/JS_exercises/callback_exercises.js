class Clock {
  constructor() {
    // 1. Create a Date object.
    let today = new Date();
    this.hour = today.getHours();
    this.min = today.getMinutes();
    this.sec = today.getSeconds();
    this.printTime();
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  }

  printTime() {
    // Format the time in HH:MM:SS
    let time = `${this.hour}:${this.min}:${this.sec}`;
    // Use console.log to print it.
    console.log(time);
  }

  _tick() {
    setInterval(() => {
      this.sec++;
      if (this.sec === 60) {
        this.sec = 0;
        this.min++;
        if (this.min===60){
          this.min = 0;
          this.hour++;
        }
      }
      this.printTime();
    }, 1000);
  }
}

// const clock = new Clock();
// clock._tick();

var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const addNumbers = (sum,  numsLeft, completionCallback) => {
  if (numsLeft > 0) {
    reader.question("Enter a number: ", function(input){
      let num = parseInt(input);
      sum += num;
      console.log(`current sum: ${sum}`);
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  } else {
    completionCallback(sum);
    reader.close();
  }
};

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

const absurdBubbleSort = (arr, sortCompletionCallback) => {
  const outerBubbleSortLoop = (madeAnySwaps) => {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  };
  outerBubbleSortLoop(true);
};

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} > ${el2}?`, input => {
    if (input === 'yes'){
      callback(true);
    } else {
      callback(false);
    }
  });
}

// askIfGreaterThan(4,2, truthy => console.log(truthy));

function innerBubbleSortLoop(arr, i ,madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], (isGreaterThan) => {
      if (isGreaterThan) {
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
        innerBubbleSortLoop(arr, i+1, true, outerBubbleSortLoop);
      } else {
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
      }
    } );
  } else {
    console.log(arr);
    outerBubbleSortLoop(madeAnySwaps);
  }
}
reader.close();
// absurdBubbleSort([3, 2, 1], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

Function.prototype.myBind = function(context) {
  return () => {
    this.apply(context);
  };
};

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
   console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"
