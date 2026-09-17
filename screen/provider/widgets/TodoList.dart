import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/TodosModel.dart';

class TodoListItem extends StatelessWidget {
  Todo todo;

  TodoListItem(this.todo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked) {
          //provider 의 상태 함수 호출해서.. 상태 변경되게..
          Provider.of<TodosModel>(context, listen: false).toggleTodo(todo);
        },
      ),
      title: Text(todo.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          Provider.of<TodosModel>(context, listen: false).deleteTodo(todo);
        },
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  List<Todo> todos;

  TodoList(this.todos);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTodos(),
    );
  }

  List<Widget> getChildrenTodos() {
    return todos.map((todo) => TodoListItem(todo)).toList();
  }
}
