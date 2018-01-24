import React from 'react';
import ReactDOM from 'react-dom';

class TodoListItem extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      id: ""
    };

    this.props = props;
    this.removeTodo = this.props.removeTodo;
    this.handleDelete = this.handleDelete.bind(this);
  }

  handleDelete(event) {
    event.preventDefault();
    const id = event.target.id;
    this.setState({ id });
    this.removeTodo(this.state);
  }

  render(){
    const { listItem } = this.props;
    return (
      <li>
        { listItem.title }
        <button onClick={ this.handleDelete }>Delete Todo</button>
      </li>
    );
  }

}

export default TodoListItem;
