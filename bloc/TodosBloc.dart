import 'package:bloc/bloc.dart';
import './event/TodosEvent.dart';
import './state/TodoState.dart';

//이벤트를 감지하고.. 상태를 발생시키는 역할..
//<자신들이 받아들이는 이벤트 타입, 자신들이 발행하는 상태 타입>
class TodosBloc extends Bloc<TodosEvent, TodosState>{
  //필수.. 생성자..
  TodosBloc(): super(TodosState([])){//상위 생성자에게 상태 초기값 전달..
    //이벤트 콜백 등록..
    //event : 발생한 이벤트 정보..
    //emit : 상태 발행 함수..
    on<AddTodoEvent>((event, emit){
      //state : 이벤트가 발생하기 전 자신들의 상태.
      List<Todo> newTodos = List.from(state.todos)
          ..add(event.todo);
      emit(TodosState(newTodos));
    });

    on<DeleteTodoEvent>((event, emit){
      List<Todo> newTodos = List.from(state.todos)
          ..remove(event.todo);
      emit(TodosState(newTodos));
    });

    on<ToggleCompletedTodoEvent>((event, emit){
      List<Todo> newTodos = List.from(state.todos);
      int index = newTodos.indexOf(event.todo);
      newTodos[index].toggleCompleted();
      emit(TodosState(newTodos));
    });
  }
}