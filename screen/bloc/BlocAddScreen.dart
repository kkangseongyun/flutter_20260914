import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/TodoBloc.dart';
import '../../bloc/event/TodoEvent.dart';
import '../../bloc/state/TodoState.dart';



class BlocAddScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<BlocAddScreen> {
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
      final Todo todo = Todo(
        title: title,
        completed: completed,
      );


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
