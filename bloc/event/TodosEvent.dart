import '../state/TodoState.dart';

//Bloc 에 발생시킬 이벤트 선언..
//타입으로 식별되거나.. 약간의 데이터를 포함하거나..

abstract class TodosEvent {}

class AddTodoEvent extends TodosEvent {
  Todo todo;
  AddTodoEvent(this.todo);
}
class DeleteTodoEvent extends TodosEvent {
  Todo todo;
  DeleteTodoEvent(this.todo);
}
class ToggleCompletedTodoEvent extends TodosEvent {
  Todo todo;
  ToggleCompletedTodoEvent(this.todo);
}