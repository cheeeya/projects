Array.prototype.bubbleSort = function() {
  let swapped = true;
  while (swapped) {
    swapped = false;
    for(let i = 0; i < this.length - 1; i++) {
      let el1 = this[i];
      let el2 = this[i + 1];
      if (el1 > el2) {
        this[i] = el2;
        this[i + 1] = el1;
        swapped = true;
      }
    }
  }
};

let arr = [3, 5, 1];
arr.bubbleSort();
console.log(arr);

String.prototype.substrings = function() {
  let stringArray = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length + 1; j++){
      stringArray.push(this.slice(i, j));
    }
  }
  return stringArray;
};

let string = "log";
console.log(string.substrings());
