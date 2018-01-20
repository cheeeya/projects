const DOMNodeCollection = require('./dom_node_collection');

const _queueLoad = [];
let _ready = false;

window.$l = (selector) => {
  if (typeof selector === 'string') {
    let elements = Array.from(document.querySelectorAll(selector));
    return new DOMNodeCollection(elements);
  } else if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  }
  if (typeof selector === 'function') {
    if (document.readState === "complete") {
      selector();
    } else {
      _queueLoad.push(selector);
    }
  }
};

$l.extend = (...object) => {
  console.log(object);
  let origin = object[0];
  let remains = object.slice(1);
  remains.forEach(obj => {
    for (let key in obj) {
      if (obj[key]){
        origin[key] = obj[key];
      }
    }
  });
  return origin;
};

$l.ajax = (options) => {
  let defaults = {
    type: 'GET',
    url: window.location.href,
    data: {},
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    dataType: 'html',
    success: (data) => {
      console.log(data);
    }, error: (errMsg) => {
      console.log(errMsg);
    }
  };
  console.log('here');
  let mergedOptions = $l.extend(defaults, options);
  console.log(mergedOptions.type);
  const xhr = new XMLHttpRequest();
  xhr.open(mergedOptions.type, mergedOptions.url);
  xhr.onload = function() {
    const reg = /2\d\d/;
    if (reg.test(xhr.status)) {
      mergedOptions.success(xhr.response);
    } else {
      mergedOptions.error(xhr.response);
    }
  };

  xhr.send(mergedOptions.data);
};


document.addEventListener('DOMContentLoaded', () => {
  _ready = true;
  _queueLoad.forEach(func => {
    func();
  });
});
