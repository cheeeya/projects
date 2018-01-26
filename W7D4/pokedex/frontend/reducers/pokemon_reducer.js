import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import { merge } from 'lodash';

const pokemonReducer = (state = {}, action) => {
  let newState = {};
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      newState = merge(newState, state);
      return merge(action.pokemon, newState);
    case RECEIVE_SINGLE_POKEMON:
      newState = merge(newState, state);
      newState[action.pokemon.id] = action.pokemon;
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
