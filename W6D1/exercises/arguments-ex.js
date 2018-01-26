const sum = function(){
  let argArray = Array.from(arguments);
  let result = 0;
  for ( let i=0; i < argArray.length; i++ ){
    result += argArray[i];
  }
  return result;
};

const sum2 = function(...args){
  let result = 0;
  for (let i = 0; i < args.length; i++ ){
    result += args[i];
  }

  return result;
};

Function.prototype.myBind = function(ctx, ...bindArgs) {
  return (...ctArgs) => this.apply(ctx, bindArgs.concat(ctArgs));
};

Function.prototype.myBind2 = function(ctx) {
  let bindArray = Array.prototype.slice.call(arguments, 1);
  let something = this;
  return function() {
    let callArray = Array.from(arguments);
    console.log(callArray);
    return something.apply(ctx, bindArray.concat(callArray));
  };
};

function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum (num) {
    numbers.push(num);
    if(numbers.length >= numArgs) {
      let result = 0;
      for(let i =0; i< numbers.length; i++) {
        result += numbers[i];
      }
      return result;
    } else {

      return _curriedSum;
    }
  }
  return _curriedSum;
}

const cSum = curriedSum(4);
console.log(cSum(4)(5)(1)(2));
console.log(cSum(3));



Function.prototype.curry = function(numArgs){
  let array = [];
  let func = this;
  function _curry(obj) {
    array.push(obj);
    if (array.length === numArgs) {
      return func.apply(func, array);
    } else {
      return _curry;
    }
  }
  return _curry;
};

function testSum(...args) {
  let result = 0;

  for (let i =0; i< args.length; i++){
    result+= args[i];
  }
  return result;
}

Function.prototype.curry2 = function(numArgs) {
  let array = [];
  let func = this;
  function _curry(obj) {
    array.push(obj);
    if (array.length === numArgs) {
      return func(...array);
    } else {
      return _curry;
    }

  }
  return _curry;
};

// const tSum = testSum.curry2(4);
// console.log(tSum());
// console.log(tSum(4)(5)(1)(2));
