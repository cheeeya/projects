import React from 'react';


class ItemDetail extends React.Component {
  constructor (props) {
    super(props);
    this.props = props;
  }

  render () {
    const { item } = this.props;



    return (
      <section className="item-detail selected">
        <h3>{item.name}</h3>
        <span>{"Happiness: " + item.happiness}</span>
        <span>{"Price: $" + item.price}</span>
      </section>
    );
  }

}

export default ItemDetail;
