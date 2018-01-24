export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

import * as TodoAPIUtil from '../util/todo_api_util';
import { receiveErrors, clearErrors } from "./error_actions";


export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo
  };
};

export const removeTodo = (todo) => {
  return {
    type: REMOVE_TODO,
    todo
  };

};

export const fetchTodos = () => {
  return (dispatch) => {
    return TodoAPIUtil.fetchTodos().then(todos => {
      dispatch(receiveTodos(todos));
    });
  };
};

export const createTodo = (todo) => {
  return (dispatch) => {
    return TodoAPIUtil.createTodo(todo).then(
      t => {
        dispatch(receiveTodo(t));
        dispatch(clearErrors());
      },
      err => dispatch(receiveErrors(err.responseJSON))
    );
  };
};

export const destroyTodo = (todo) => {
  return (dispatch) => {
    return TodoAPIUtil.destroyTodo(todo).then(t => {
      dispatch(removeTodo(t));
    });
  };
};

export const updateTodo = (todo) => {
  return (dispatch) => {
    return TodoAPIUtil.updateTodo(todo).then(t => {
      dispatch(receiveTodo(t));
      dispatch(clearErrors());
      },
      err => dispatch(receiveErrors(err.responseJSON))
    );
  };
};
