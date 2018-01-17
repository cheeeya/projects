Array.prototype.uniq = function() {
  let arr = [];
  for(let i = 0; i < this.length; i++) {
    if (!this.slice(0, i).concat(this.slice(i+1, this.length)).includes(this[i])) {
      arr.push(this[i]);
    }
  }
  return arr;
};

Array.prototype.uniq2 = function() {
  let arr = [];
  this.forEach(function(el) {
    if (!arr.includes(el)){
      arr.push(el);
    }
  });
  return arr;
};

let array = [-8, 1, 2, -2, 3, 3, 8, 8];
console.log(array.uniq());
console.log(array.uniq2());

Array.prototype.twoSum = function() {
  let arr = [];
  for (let i = 0; i < this.length - 1; i++) {
    let el1 = this[i];
    for (let j = i + 1; j < this.length; j++) {
      let el2 = this[j];
      if (el1 + el2 === 0) {
        arr.push([i, j]);
      }
    }
  }
  return arr;
};

console.log(array.twoSum());

Array.prototype.transpose = function() {
  let transposed = [];

  for (let i = 0; i < this[0].length; i++) {
    let new_arr = [];
    for (let j = 0; j <this.length; j++) {
      new_arr.push(this[j][i]);
    }
    transposed.push(new_arr);
  }
  return transposed;
};

let arr1 = [[0,1,2], [2,3,4]];
console.log(arr1.transpose());
