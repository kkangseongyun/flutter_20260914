//entry point...
//함수 선언시. 리턴타입 생략가능..생략하면 dynamic
main(){

  //다트의 모든 변수는 객체이다..
  int data1 = 10;
  print(data1.isEven);

  //자동 캐스팅 안된다. int, double 은 상하위 관계의 클래스가 아니다..
  double data2 = data1.toDouble();
  int data3 = 10.0.toInt();

  //String <-> int
  String data4 = '10';
  int data5 = int.parse(data4);
  String data6 = data5.toString();

  //var, dynamic...
  var data7 = 10;//선언과 동시에 대입되는 값에 의해 타입은 고정된다..
  // data7 = true;//error..

  dynamic data8 = 10;
  data8 = true;
  data8 = 'hello';

  //null safety..............................
  int a1 = 10;//int && non - null
  int? a2 = 10;//int && nullable

  // a1 = null;//error
  a2 = null;//ok...

  a1.isEven;
  bool? result = a2?.isEven;
  bool result2 = a2?.isEven as bool;
}