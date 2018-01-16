Array.prototype.myEach = function(callback) {
  for(let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

let numArr = [1, 2, 3];
numArr.myEach(el => console.log(el));

console.log(numArr);

Array.prototype.myMap = function(callback) {
  let newArray = [];
  this.myEach(el => newArray.push(callback(el)));
  return newArray;
};

let array2 = numArr.myMap(el => el*2);
console.log(array2);
console.log(numArr);

Array.prototype.myReduce = function(callback, initialValue) {
  let newArr = this;
  if (!initialValue) {
    initialValue = this[0];
    newArr = this.slice(1, this.length);
  }
  let sum = initialValue;
  newArr.myEach(function(el) {
    sum = callback(sum, el);
  });
  return sum;
};

console.log([1,2,3].myReduce(function(acc, el) {
  return acc * el;
}, 2) );
