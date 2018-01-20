const bubbleSort = function(array, comparator){

  if (typeof comparator !== 'function'){
    comparator = function(x, y) {
      if (x === y) {
        return 0;
      } else if (x > y) {
        return 1;
      } else {
        return -1;
      }
    };
  }


  let swapped = true;
  while (swapped) {
    swapped = false;
    for (let i = 0; i < array.length - 1; i++) {
      for (let j = i + 1; j < array.length; j++) {
        if (comparator(array[i], array[j]) > 0) {
          [array[i], array[j]] = [array[j], array[i]];
          swapped = true;
        }
      }
    }
  }
  return array;
};



const comp = function(x,y) {
  return x - y;
};

// let arr = [3,1,6,2,3,5];
// bubbleSort(arr, comp);
// console.log(arr);

const bSearch = function(array, target) {
  if (array.length < 1) {
    return -1;
  }
  let mid = Math.floor(array.length / 2);
  if (array[mid] === target) {
    return mid;
  } else if (array[mid] > target) {
    let leftArr = array.slice(0, mid);
    return bSearch(leftArr, target);
  } else {
    let rightArr = array.slice(mid + 1, array.length);
    let val = bSearch(rightArr, target);
    if (val === -1){
      return -1;
    } else {
      return mid + 1 + val;
    }
  }
};

// let arr = [0,1,2,3,4,5,6,7,8];
// console.log(bSearch(arr, 7));
// console.log(bSearch(arr, 9));
// console.log(bSearch(arr, -1));


const jumbleSort = function(string, alphabet = "abcdefghijklmnopqrstuvwxyz") {
  alphabet = alphabet.split("").reverse().join("");
  let arr = string.split("");
  return arr.sort((a,b) => alphabet.indexOf(a) - alphabet.indexOf(b)).join("");
//   let swapped = true;
//   while (swapped){
//     swapped = false;
//     for (let i = 0; i < string.length; i++){
//       for (let j = i; j < string.length; j++) {
//         if (alphabet.indexOf(arr[i]) > alphabet.indexOf(arr[j])) {
//           [arr[i], arr[j]] = [arr[j], arr[i]];
//         }
//       }
//     }
// }

};
// let string = "hello";
// console.log(jumbleSort(string));

const quickSort = function(array, comparator) {
  if (array.length < 2) {
    return array;
  }
  if (typeof comparator !== 'function') {
    comparator = function(a,b) {
      return a - b;
    };
  }
  let pivot = array[0];
  let left = [];
  let right = [];
  for (let i = 1; i < array.length; i++) {
    if (comparator(pivot, array[i]) > 0) {
      left.push(array[i]);
    } else {
      right.push(array[i]);
    }
  }
  return quickSort(left, comparator).concat(pivot).concat(quickSort(right, comparator));
};

// let arr = [5,2,17,2,4,12,3,6];
// console.log(quickSort(arr));


const mergeSort = function(array, comparator) {
  if (array.length < 2) {
    return array;
  }
  if (typeof comparator !== 'function') {
    comparator = function(a,b) {
      return a - b;
    };
  }


  let mididx = Math.floor(array.length / 2);
  let sortedLeft = mergeSort(array.slice(0, mididx), comparator);
  let sortedRight = mergeSort(array.slice(mididx), comparator);

  return merge(sortedLeft, sortedRight, comparator);
};

const merge = function(left, right, comparator) {
  let merged = [];
  while (left.length > 0 && right.length > 0) {
    if (comparator(left[0], right[0]) < 0) {
      merged.push(left.shift());
    } else {
      merged.push(right.shift());
    }
  }
  return merged.concat(left).concat(right);
};

let arr = [8,7,6,5,4,3,2,1];
console.log(mergeSort(arr));
