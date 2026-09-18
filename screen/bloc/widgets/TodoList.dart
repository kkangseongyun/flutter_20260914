import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/state/TodoState.dart';
import '../../../bloc/event/TodosEvent.dart';
import '../../../bloc/TodosBloc.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  TodoListItem({required this.todo});

  @override
  Widget build(BuildContext context) {

    TodosBloc bloc = BlocProvider.of<TodosBloc>(context);

    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked) {
          //이벤트 발생
          bloc.add(ToggleCompletedTodoEvent(todo));
        },
      ),
      title: Text(todo.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          bloc.add(DeleteTodoEvent(todo));
        },
      ),
    );

  }
}

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTodos(),
    );
  }

  List<Widget> getChildrenTodos() {
    return todos.map((todo) => TodoListItem(todo: todo)).toList();
  }

}
