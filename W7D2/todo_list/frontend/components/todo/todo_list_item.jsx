import React from 'react';
import ReactDOM from 'react-dom';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor(props){
    super(props);


    this.props = props;
    this.handleDelete = this.handleDelete.bind(this);
    this.toggleTodo = this.toggleTodo.bind(this);
  }

  handleDelete(event) {
    event.preventDefault();
    const todo = merge({}, this.state, { id: event.target.id });
    this.props.destroyTodo(todo);
  }

  toggleTodo(event) {
    event.preventDefault();
    const todo = merge({}, this.state, { id: event.target.id, done: !this.props.listItem.done });
    this.props.updateTodo(todo);
  }

  render(){
    const { listItem } = this.props;
    let buttonTxt = "";
    if (listItem.done) {
      buttonTxt = "UNDO";
    } else {
      buttonTxt = "DONE";
    }
    return (
      <li>
        { listItem.title }
        <button onClick={ this.handleDelete } id={listItem.id}>Delete Todo</button>
        <button onClick={ this.toggleTodo } id={listItem.id}>{buttonTxt}</button>
      </li>
    );
  }

}

export default TodoListItem;
