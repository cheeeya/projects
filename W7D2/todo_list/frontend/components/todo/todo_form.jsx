import React from 'react';
import ReactDOM from 'react-dom';
import uniqueId from '../../util/util';
import merge from 'lodash/merge';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleTitleInput = this.handleTitleInput.bind(this);
    this.handleBodyInput = this.handleBodyInput.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();
    const todo = merge({}, this.state, { id: uniqueId() });
    this.props.createTodo({todo}).then(
      () => this.setState({ title: '', body: '' })
    );
  }

  handleTitleInput(event) {
    event.preventDefault();
    const title = event.target.value;
    this.setState({ title });
  }

  handleBodyInput(event) {
    event.preventDefault();
    const body = event.target.value;
    this.setState({ body });
  }

  render() {
    return (
      <div>
        <ul>
          { this.props.errors.map( (error,idx) => <li key={idx}> {error} </li>) }
        </ul>
        <form className="todo-form" onSubmit={ this.handleSubmit }>
          <label>Title:</label>
          <input type="text" onChange={this.handleTitleInput} value={this.state.title}></input>
          <br />
          <label>Body:</label>
          <textarea onChange = {this.handleBodyInput} value={this.state.body}></textarea>
          <label></label>
          <input type="submit"></input>
        </form>
      </div>
    );
  }
}


export default TodoForm;
