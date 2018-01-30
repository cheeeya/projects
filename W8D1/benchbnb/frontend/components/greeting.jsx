import React from 'react';
import { Link, Route}  from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
    this.handleLogout = this.handleLogout.bind(this);
  }

  handleLogout(event){
    event.preventDefault();
    this.props.logout();
  }

  render() {
    const { currentUser } = this.props;
    if (currentUser) {
      return (
        <div className="greeting-div">
          <h3>Welcome {currentUser.username}</h3>
          <button onClick={this.handleLogout}>Logout</button>
        </div>
      )
    } else {
      return (
        <div className="greeting-div">
          <Link to='/signup'>Sign up</Link>
          <Link to='/login'>Login</Link>

      </div>
      )
    }
  }
}

export default Greeting;
