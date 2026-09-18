import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  String title;
  bool completed;

  Todo({required this.title, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}

//상태를 변경하기 위한 함수를 가지는 역할..
//개발자 notifier 클래스를 만들었다면 NotifierProvider 로 등록..
class TodosNotifier extends Notifier<List<Todo>>{
  @override
  List<Todo> build() {
    return [];//상태 초기값..
  }

  void addTodo(Todo todo){
    print('0000000000000000');
    state = [...state, todo];
    print('111 : ${state.length}');
  }
  void toggleTodo(Todo todo){
    state = [
      for(final i in state)
        if(i == todo)
          Todo(title: i.title, completed: !i.completed)
        else
          i,
    ];
  }
  void deleteTodo(Todo todo){
    state = state.where((t) => t != todo).toList();
  }
}

//Provider 로 등록해야 한다.. 등록하는 위치는 아무 파일이나..
//top level 에 선언되어 있어야 한다..
final todosProvider = NotifierProvider<TodosNotifier, List<Todo>>(
  TodosNotifier.new, //() => TodosNotifier() 의 축약형..
);

