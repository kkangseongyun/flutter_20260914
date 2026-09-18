import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



import 'BlocAddScreen.dart';


import '../../bloc/TodoBloc.dart';
import 'widgets/TodoList.dart';
import '../../bloc/state/TodoState.dart';

class TabScreen extends StatelessWidget {

  List<Todo> todos;

  TabScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodoList(
        todos: this.todos,
      ),
    );
  }
}


class BlocHomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BlocHomeScreen>
    with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Todos-Bloc'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              context.push('/bloc-add');
            },
          ),
        ],
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Active'),
            Tab(text: 'Complete'),
          ],
        ),
      ),
      body:
      

    );


  }
}
