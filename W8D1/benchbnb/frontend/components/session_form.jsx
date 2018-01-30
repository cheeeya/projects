import React from 'react';
import { Link } from 'react-router-dom';
import { withRouter, Redirect } from 'react-router';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
    this.state = {
      username: "",
      password: ""
    };
    this.handlePassword = this.handlePassword.bind(this);
    this.handleUsername = this.handleUsername.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleUsername(event) {
    event.preventDefault();
    this.setState({ username: event.target.value });
  }

  handlePassword(event) {
    event.preventDefault();
    this.setState({ password: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    console.log(this.state);
    this.props.processForm(this.state);
  }

  render() {
    const { formType, loggedIn, errors } = this.props;
    let header = "Log in";
    let link = '/signup'
    if (formType === '/signup') {
      header = "Sign up";
      link = '/login';
    }
    if (loggedIn) {
      return <Redirect to="/"/>
    }
    let errorsList = (
      <ul>
        {
          errors.map((error, idx) => <li key={idx}>{error} </li>)
        }
      </ul>
    )
    return(
      <div>
        <h2>{header}</h2>
        {errorsList}
        <form onSubmit={this.handleSubmit}>
          <label>
            Username:
            <input type="text" value={this.state.username} onChange={this.handleUsername}/>
          </label>
          <label>
            Password:
            <input type="password" value={this.state.password} onChange={this.handlePassword}/>
          </label>
          <button>{header}</button>
        </form>
        <Link to={link} />
      </div>
    );
  }

}

export default withRouter(SessionForm);
