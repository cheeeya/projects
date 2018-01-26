import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super();
    this.state = {
      selected: 0,
      prev: 1
    };

    this.handleClick = this.handleClick.bind(this);
    this.selectTab = this.selectTab.bind(this);
  }

  render() {
    const index = this.state;
    return(
      <div className="tabs-div">
        <ul>
          {
            this.props.tabInfo.map( (el, idx) => {
              const tabId = "tab"+idx;
              return (
                <li className="tab-li" key={idx} id={tabId} onClick={this.handleClick}>
                  <header>
                    <h1>{el.title}</h1>
                  </header>
                  <article>{el.content}</article>
                </li>
              );
            })
          }
        </ul>
      </div>
    );
  }

  componentDidMount() {
    this.selectTab(this.state.selected);
  }

  selectTab (id) {
    const prevTab = document.getElementById("tab"+this.state.selected);
    const selectedTab = document.getElementById("tab"+id);
    prevTab.className = "tab-li";
    selectedTab.className = "tab-li selected";
    prevTab.querySelector('article').className = "";
    selectedTab.querySelector('article').className = "selected";
    this.setState({prev: this.state.selected, selected: id});
  }

  handleClick(e) {
    e.preventDefault();
    this.selectTab(e.currentTarget.id.slice(3));
  }


}



export default Tabs;
