const range = (start, end) => {
  if (start >= end) {
    return [];
  }
  let rArr = range(start, end - 1);
  rArr.push(end - 1);
  return rArr;
};

console.log(range(1,3));

const sumRec = (arr) => {
  if (arr.length === 0) {
    return 0;
  }
  return arr[0] + sumRec(arr.slice(1, arr.length));
};

console.log(sumRec([1,2,3,4,5]));

const exponent = (base, exp) => {
  if (exp === 0) {
    return 1;
  }
  return base * exponent(base, exp - 1);
};

const exponent2 = (base, exp) => {
  if (exp === 0) {
    return 1;
  }
  if (exp === 1) {
    return base;
  }
  if (exp % 2 === 0){
    return exponent(base, exp/2) * exponent(base, exp/2);
  } else {
    return base * exponent(base, (exp - 1)/2) * exponent(base, (exp - 1)/2);
  }
};

console.log(exponent(2,4));
console.log(exponent2(2,5));

const fibonacci = (n) => {
  if (n === 1) {
    return [0];
  } else if (n === 2) {
    return [0, 1];
  }
  let arr = fibonacci(n - 1);
  arr.push(arr[n - 3] + arr[n - 2]);
  return arr;
};

console.log(fibonacci(8));

const deepDup = function(arr) {
  let newArray = [];
  for(let i = 0; i < arr.length; i++) {
    if (getType(arr[i]) === "[object Array]") {
      newArray.push(deepDup(arr[i]));
    } else {
      newArray.push(arr[i]);
    }
  }
  return newArray;
};

var getType = function (elem) {
  return Object.prototype.toString.call(elem);
};

let nestedArray = [1, 2, [3, 4]];
let nestedArray2 = deepDup(nestedArray);
console.log(nestedArray2);
console.log(nestedArray === nestedArray2);

const binarySearch = (array, target) => {
  if (array.length === 0) return -1;
  let pos = Math.floor(array.length / 2);

  if (array[pos] === target) {
    return pos;
  } else if (array[pos] > target) {
    return binarySearch(array.slice(0, pos), target);
  } else {
    if (binarySearch(array.slice(pos + 1, array.length), target) === -1) {
      return -1;
    } else {
      return (pos + 1) + binarySearch(array.slice(pos + 1, array.length), target);
    }
  }
};

let bArray = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(binarySearch(bArray, 1));
console.log(binarySearch(bArray, 2));
console.log(binarySearch(bArray, 3));
console.log(binarySearch(bArray, 4));
console.log(binarySearch(bArray, 5));
console.log(binarySearch(bArray, 6));
console.log(binarySearch(bArray, 7));
console.log(binarySearch(bArray, 8));
console.log(binarySearch(bArray, 9));

const merge = (left, right) => {
  let merged = [];
  while (left.length > 0 && right.length > 0){
    left[0] < right[0] ? merged.push(left.shift()) :
      merged.push(right.shift());
  }
  merged.concat(left, right);
  return merged;
};

const mergesort = (arr) => {
  if (arr.length < 2) {
    return arr;
  } else {
  const mid = Math.floor(arr.length / 2);
  const leftArrSorted = mergesort(arr.slice(0, mid));
  const rightArrSorted = mergesort(arr.slice(mid));

  return merge(leftArrSorted, rightArrSorted);
  }
};

let mergesortTest = [3,1,5,8,2,4,10,3];
console.log(mergesort(mergesortTest));
