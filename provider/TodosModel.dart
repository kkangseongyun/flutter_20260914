//TodosModel
//provider 로 등록해서 이용하기 위한 상태 객체..
import 'package:flutter/material.dart';

class Todo {
  String title;
  bool completed;

  Todo({required this.title, this.completed = false});

  void toggleCompleted(){
    completed = !completed;
  }
}

class TodosModel extends ChangeNotifier {
  final List<Todo> todos = [];//앱 전역에서 사용해야 하는 상태..
  //상태 값을 변경하기 위한 함수(추가, 제거, 수정)

  void addTodo(Todo todo){
    todos.add(todo);
    //변경사항 반영하라..
    notifyListeners();
  }

  void toggleTodo(Todo todo){
    final index = todos.indexOf(todo);
    todos[index].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Todo toto){
    todos.remove(toto);
    notifyListeners();
  }
}