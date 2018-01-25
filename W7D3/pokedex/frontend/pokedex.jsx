import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import * as APIUtil from './util/api_util'
import * as PokemonActions from './actions/pokemon_actions';
import { selectAllPokemon } from './reducers/selectors';


document.addEventListener('DOMContentLoaded', () => {

  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.receiveAllPokemon = PokemonActions.receiveAllPokemon;
  window.requestAllPokemon = PokemonActions.requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;

  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex!!</h1>, rootEl);
});
