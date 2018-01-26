import { values } from 'lodash';

export const selectAllPokemon = state => {
  return values(state.entities.pokemon);
}

export const selectItems = (state, pokemonId) => {
  const items = [];
  values(state.entities.items).forEach(item => {
    if (item.pokemon_id == pokemonId) {
      items.push(item);
    }
  })
  return items;
}

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId];
}
