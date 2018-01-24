import { destroyTodo } from '../../actions/todo_actions';
import TodoDetailView from './todo_detail_view';
import { connect } from 'react-redux';

const mapDispatchToProps = (dispatch) => {
  return { destroyTodo: (todo) => dispatch(destroyTodo(todo)) };
};

export default connect (null, mapDispatchToProps)(TodoDetailView);
