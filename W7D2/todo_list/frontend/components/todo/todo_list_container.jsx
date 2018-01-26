import TodoList from './todo_list.jsx';
import { connect } from 'react-redux';
import allTodos from '../../reducers/selectors';
import * as TodoActions from '../../actions/todo_actions';
// import { receiveTodo, destroyTodo, fetchTodos, createTodo, updateTodo } from '../../actions/todo_actions';


const mapStateToProps = (state) => {
  return {
    todos: allTodos(state),
    errors: state.errors
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    destroyTodo: (todo) => dispatch(TodoActions.destroyTodo(todo)),
    fetchTodos: () => dispatch(TodoActions.fetchTodos()),
    createTodo: (todo) => dispatch(TodoActions.createTodo(todo)),
    updateTodo: (todo) => dispatch(TodoActions.updateTodo(todo))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
