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
