import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER } from '../actions/session_actions';
import { merge } from 'lodash';


const sessionErrorsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = {};
  switch (action.type) {
    case RECEIVE_ERRORS:
      newState = merge({}, { errors: action.errors });
      return newState;
    case RECEIVE_CURRENT_USER:
      newState = merge({}, state, { errors: [] });
      return newState;
    default:
      return state;
  }
};

export default sessionErrorsReducer;
