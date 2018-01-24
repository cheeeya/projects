import React from 'react';
import ReactDOM from 'react-dom';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component{
  constructor(props){
    super(props);
    this.props = props;
  }

  componentDidMount() {
    this.props.fetchTodos();
  }


  render(){
    const { todos, destroyTodo, createTodo, errors, updateTodo } = this.props;
    const todoItems = todos.map((todo) => {
      return (
        <TodoListItem
        listItem={ todo }
        key={ todo.id }
        destroyTodo={ destroyTodo }
        updateTodo={ updateTodo }/>
      );
    });

    return (
      <div>
        <h3>Todo List</h3>
        <ul>
            { todoItems }
        </ul>
          <TodoForm createTodo={ createTodo } errors={ errors }/>
      </div>
    );
  }
}

export default TodoList;
