import React from 'react';
import ReactDOM from 'react-dom';
import uniqueId from '../../util/util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.receiveTodo = this.props.receiveTodo;
    this.state = {
      title: "",
      body: "",
      id: uniqueId(),
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleTitleInput = this.handleTitleInput.bind(this);
    this.handleBodyInput = this.handleBodyInput.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();
    this.receiveTodo(this.state);
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
        <form className="todo-form" onSubmit={ this.handleSubmit }>
          <label>Title:</label>
          <input type="text" onChange={this.handleTitleInput}></input>
          <br />
          <label>Body:</label>
          <textarea onChange = {this.handleBodyInput}></textarea>
          <label></label>
          <input type="submit"></input>
        </form>
    );
  }
}


export default TodoForm;
