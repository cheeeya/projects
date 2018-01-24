import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import rootReducer from './reducers/root_reducers.js';
import Root from './components/root';


import { receiveTodos, receiveTodo, removeTodo } from './actions/todo_actions';
import allTodos from './reducers/selectors';






document.addEventListener("DOMContentLoaded", function(){
  const store = configureStore();
  window.store = store;
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.allTodos = allTodos;
  ReactDOM.render( <Root store={ store }/>, document.getElementById('content'));
});
