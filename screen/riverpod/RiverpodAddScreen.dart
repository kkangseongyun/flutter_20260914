import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../riverpod/RiverpodNotifier.dart';



class RiverpodAddScreen extends ConsumerStatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}


class _AddTodoScreenState extends ConsumerState<RiverpodAddScreen> {

  //ConsumerState 내에서는 함수로 ref 가 전달되는 것이 아니라 멤버변수로 선언되어 있다..

  final controller = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onAdd() {
    final String title = controller.text;
    final bool completed = completedStatus;

    if (title.isNotEmpty) {
      print('00000000000002222222222222');
      final Todo todo = Todo(title: title, completed: completed);
      ref.read(todosProvider.notifier).addTodo(todo);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: controller),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                      completedStatus = checked ?? false;
                    }),
                    title: Text('Complete?'),
                  ),
                  ElevatedButton(
                    child: Text('Add'),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}