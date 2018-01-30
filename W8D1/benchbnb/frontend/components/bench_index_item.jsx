import React from 'react';

class BenchIndexItem extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }

  render() {
    const { bench } = this.props;
    return (<li>{bench.description}</li>);
  }
}

export default BenchIndexItem;
