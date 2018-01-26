import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import rootReducer from './reducers/root_reducers.js';
import Root from './components/root';


document.addEventListener("DOMContentLoaded", function(){
  const store = configureStore();
  ReactDOM.render( <Root store={ store }/>, document.getElementById('content'));
});
