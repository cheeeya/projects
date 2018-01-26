export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const LOGOUT = 'LOGOUT';
import * as SessionAPIUtil from '../util/session_api_util';



export const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});


export const login = (user) => (dispatch) => (
  SessionAPIUtil.login(user)
    .then(
      (u) => dispatch(receiveCurrentUser(u)),
      (e) => dispatch(receiveErrors(e))
    )
);

export const logout = () => (dispatch) => (
  SessionAPIUtil.logout()
    .then(
      () => dispatch(receiveCurrentUser(null)),
      (e) => dispatch(receiveErrors(e))
    )
);
