import { RECEIVE_CURRENT_USER} from '../actions/session_actions';
import { merge } from 'lodash';

const _nullState = {
  currentUser: null,
};


const sessionReducer = (state = _nullState, action) => {
  Object.freeze(state);
  let newState = {};
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      newState = merge({}, { currentUser: action.user });
      return newState;
    case null:
      return _nullState;
    default:
      return state;
  }
};

export default sessionReducer;
