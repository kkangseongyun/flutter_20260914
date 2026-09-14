main() {

  //optional 로 선언하면 호출시 값 대입이 안될 수 있다..
  //nullable 로 선언하던가..
  //default argument를 대입하던가..
  void fun1(bool data1, { String? data2, int data3 = 0 }){ }

  fun1(true);
  // fun1(true, "hello", 10);//error.. 값을 지정하려면 이름 생략 불가하다..
  fun1(true, data2: "hello");
  fun1(true, data3: 10);
  fun1(true, data2: "hello", data3: 10);
  //이름이 명시됨으로 .. 순서는 의미가 없다..
  fun1(true, data3: 10, data2: "hello");



  void fun2(bool data1, [ String? data2, int data3 = 0 ]){ }

  fun2(true);
  // fun2(true, data2: "hello");//error.. positional parameter 이다. 이름 명시 안된다.
  // fun2(true, 10, "hello");//이름이 명시되지 않음으로.. 데이터 순서를 맞추어야 한다..
  fun2(true, "hello", 10);

}