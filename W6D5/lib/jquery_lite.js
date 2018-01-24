/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(elements) {
    this.elements = elements;
    this.listeners = {};
  }

  html(string) {
    if (string !== undefined) {
      this.elements.forEach(el => {
        el.innerHTML = string;
      });
    } else {
      return this.elements[0].innerHTML;
    }
  }

  empty() {
    this.elements.forEach(el => {
      el.innerHTML = "";
    });
  }

  append(itemThing) {
    if (itemThing instanceof DOMNodeCollection) {
      this.elements.forEach(el => {
        itemThing.elements.forEach(el2 => {
          el.appendChild(el2);
        });
      });
    } else if (typeof itemThing === 'string') {
      this.elements.forEach(el => {
        el.innerHTML += itemThing;
      });
    } else if (itemThing instanceof HTMLElement) {
      this.elements.forEach(el => {
        el.appendChild(itemThing.cloneNode(true));
      });
    }
  }

  attr(name, value) {
    if (!value) {
      return this.elements[0].getAttribute(name);
    } else {
      this.elements.forEach(element => {
        element.setAttribute(name, value);
      });
    }
  }

  addClass(classes) {
    if (!classes) {
      return;
    }

    this.elements.forEach(element => {
      if (element.className) {
        element.className += ' ';
      }

      element.className += `${classes}`;
    });
  }

  removeClass(classes) {
    if (classes === undefined) {
      this.elements.forEach(element => {
        element.className = '';
      });
    } else {
      let remove = classes.split(' ');
      this.elements.forEach(element => {
        remove.forEach(klass => {
          if (element.className.includes(klass)) {
            let classNames = element.className.split(' ');
            let index = classNames.indexOf(klass);
            classNames.splice(index, 1);
            element.className = classNames.join(' ');
          }
        });
      });
    }
  }

  children() {
    let childrenArr = [];
    this.elements.forEach(element => {
      childrenArr = childrenArr.concat(Array.from(element.children));
    });
    return new DOMNodeCollection(childrenArr);
  }

  parent(){
    let parentArr = [];
    this.elements.forEach(element => {
      let pNode = element.parentNode;
      if (!parentArr.includes(pNode)){
        parentArr.push(pNode);
      }
    });
    return new DOMNodeCollection(parentArr);
  }

  find(selector) {
    let selected = [];
    this.elements.forEach(element => {
      let array = Array.from(element.querySelectorAll(selector));
      selected = selected.concat(array);
    });
    return new DOMNodeCollection(selected);
  }

  remove() {
    this.elements.forEach(element => {
      element.remove();
    });
    this.elements = [];
  }

  on(action, callback){
    this.listeners[action] = callback;
    this.elements.forEach(element => {
      element.addEventListener(action, callback);
    });
  }

  off(action) {
    if (this.listeners[action]){
      this.elements.forEach(element => {
        element.removeEventListener(action, this.listeners[action]);
      });
      delete this.listeners[action];
    }
  }

  
}


module.exports = DOMNodeCollection;


/***/ })
/******/ ]);