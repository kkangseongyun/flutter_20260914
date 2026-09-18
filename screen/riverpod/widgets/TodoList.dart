import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../riverpod/RiverpodNotifier.dart';


class TodoListItem extends ConsumerWidget {

  Todo todo;

  TodoListItem(this.todo);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked) {
          // ref.read(todosProvider);//이렇게 하면 상태값 전달.. 단발성. 구독은 아니다..
          ref.read(todosProvider.notifier).toggleTodo(todo);
        },
      ),
      title: Text(todo.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          ref.read(todosProvider.notifier).deleteTodo(todo);
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
