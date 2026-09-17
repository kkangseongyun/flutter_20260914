import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/TodosModel.dart';
import './widgets/TodoList.dart';
import 'AddTodoScreen.dart';

class TabScreen extends StatelessWidget {

  List<Todo> todos;
  TabScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodoList(this.todos ),
    );
  }
}


class ProviderHomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProviderHomeScreen>
    with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);//animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todos'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                context.push("/provider-add");
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



    );
  }
}