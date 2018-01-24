import { RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/error_actions';

const errorsReducer = (state = [], action) => {
  let newState = [];
  Object.freeze(state);
  switch(action.type){

    case RECEIVE_ERRORS:
      return newState.concat(action.errors);

    case CLEAR_ERRORS:
      return newState;

    default:
      return state;
  }
};

export default errorsReducer;
