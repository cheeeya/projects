import React from 'react';
import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }

  componentDidMount() {
    this.props.fetchBenches();
  }

  render() {
    const { benches } = this.props;
    return(
      <div>
        <ul>
          {
            Object.values(benches).map(bench => <BenchIndexItem bench={bench} key={bench.id}/>)
          }
        </ul>
      </div>
    );
  }

}

export default BenchIndex;
