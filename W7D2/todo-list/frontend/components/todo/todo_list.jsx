import React from 'react';
import ReactDOM from 'react-dom';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component{
  constructor(props){
    super(props);
    this.props = props;
  }


  render(){
    const { todos, receiveTodo, removeTodo } = this.props;
    const todoItems = todos.map((todo) => {
      return (
        <TodoListItem
        listItem={ todo }
        key={ todo.id }
        removeTodo={ removeTodo }/>
      );
    });

    return (
      <div>
        <h3>Todo List</h3>
        <ul>
            { todoItems }
        </ul>
          <TodoForm receiveTodo={ receiveTodo }/>
      </div>
    );
  }
}

export default TodoList;
