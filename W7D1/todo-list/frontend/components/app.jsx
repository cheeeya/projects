import React from 'react';
import ReactDOM from 'react-dom';
import TodoListContainer from './todo/todo_list_container';

class App extends React.Component {
  constructor(){
    super();
  }

  render(){
    return (
      <TodoListContainer />
    );
  }

}

export default App;
