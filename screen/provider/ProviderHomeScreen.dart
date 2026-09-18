import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../provider/TodosModel.dart';
import './widgets/TodoList.dart';
import 'ProviderAddScreen.dart';

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

      //상위 누군가가 공개한 provider 데이터로 화면 구성..
      body: Consumer<TodosModel>(
          builder: (context, model, child){//두번째 매개변수에 상태가 전달된다..
            return TabBarView(
              controller: controller,//TabBar 와  TabBarView 가 동일 controller 로 등록되면 알아서 이벤트 처리
              children: [
                TabScreen(model.todos),
                TabScreen(model.todos.where((todo) => !todo.completed).toList()),
                TabScreen(model.todos.where((todo) => todo.completed).toList()),
              ],
            );
          }
      ),



    );
  }
}