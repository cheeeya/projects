import React from 'react';
import { Link } from 'react-router-dom';

class PokemonIndexItem extends React.Component {
  constructor (props) {
    super(props);
    this.props = props;
  }

   render () {
     const { pokemon } = this.props;
     return(
       <li>
         <Link to={'/pokemon/' + pokemon.id}>
           <img src={pokemon.image_url} height='20px' width='20px'></img>
           {pokemon.name}
         </Link>
        </li>
     );
   }
}

export default PokemonIndexItem;
