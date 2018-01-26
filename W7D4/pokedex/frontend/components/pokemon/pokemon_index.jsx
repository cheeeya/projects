import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;
    const pokemonItems = pokemon.map(poke => <PokemonIndexItem pokemon={poke} key={poke.id}/>);
    return(
      <section className="pokedex">
        <ol className="pokemon-index">
          {pokemonItems}
        </ol>
        <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer} />
      </section>
    );
  }
}

export default PokemonIndex;
