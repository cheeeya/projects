export const logger = (store) => (next) => (action) => {
  console.log("before action: ", store.getState());
  console.log("action: ", action);
  next(action);
  console.log("after action: ", store.getState());
};


export const thunk = ({ dispatch, getState }) => (next) => (action) => {
  if (typeof action === 'function') {
    return action(dispatch, getState);
  } else {
    return next(action);
  }
};
