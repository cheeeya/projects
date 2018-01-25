import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return(
      <ul>
        {
          this.props.pokemon.map(poke => <li key={poke.id}><img src={poke.image_url} height='20px' width='20px'></img>{poke.name}</li>)
        }
      </ul>
    );
  }
}

export default PokemonIndex;
