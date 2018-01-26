import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';


const initialState = {};

const todosReducer = (state = initialState, action) => {
  let newState = {};
  Object.freeze(state);
  switch(action.type) {

    case RECEIVE_TODOS:
      action.todos.forEach((todo) => {
        newState[todo.id] = todo;
      });
      return newState;

    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo;
      return merge({}, state, newState);

    case REMOVE_TODO:
      newState = merge({}, state);
      delete newState[action.todo.id];
      return newState;

    default:
      return state;
  }
};

export default todosReducer;
