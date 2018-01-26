import React from 'react';
import { Link, Route } from 'react-router-dom';
import ItemDetailContainer from './item_detail_container';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    let newId = newProps.match.params.pokemonId;
    if (this.props.match.params.pokemonId != newId){
      this.props.requestSinglePokemon(newId);
    }
  }

  render() {
    const { pokemon, items } = this.props;

    if (!pokemon) {
      return <h1>Loading</h1>;
    }

    const moves = pokemon.moves || [];

    return(
      <section className="pokemon-details">
        <img className="pokemon-image" src={pokemon.image_url}></img>
        <h3>{pokemon.name}</h3>
        <span>{'Type: ' + pokemon.poke_type}</span>
        <span>{'Attack: ' + pokemon.attack}</span>
        <span>{'Defense: ' + pokemon.defense}</span>
        <span>{'Moves: ' + moves.join(", ")}</span>
        <section className="items-section">Items:
          <div className="items-div">
            {
              items.map(item => (
                <Link to={"/pokemon/" + pokemon.id + "/item/" + item.id} key={item.id} className="item-link">
                  <img className="item-image" src={item.image_url}></img>
                </Link>
              ))
            }
          </div>
          <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
        </section>
      </section>
    );
  }
}

export default PokemonDetail;
