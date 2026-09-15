class User {
  String? name;
  int? age;
  //생성자 매개변수로 멤버 초기화...
  //java 스타일 가능하다..
  // User(String name, int age){
  //   this.name = name;
  //   this.age = age;
  // }

  //위의 코드를 아래처럼 줄여서 작성 가능...
  // User(this.name, this.age);

  //위 코드를 아래처럼
  //생성자에 한해서는 (일반 함수는 불가능) 선언영역에 초기화 영역을 가질 수 있다.
  //초기화 영역에서 멤버 초기화.. 매개변수로 약간의 알고리즘 실행.. 실행 값으로 멤버 초기화 할때
  //최기화 영역에 멤버 초기화 혹은 다른 생성자 호출 이외에 다른 구문 못들어간다..
  User(String name, int age): this.name = name.toUpperCase(), this.age = age * 2;

  //오버로딩 지원하지 않는다. 생성자를 여러개 선언하려면.. 이름을 추가해서 named constructor 로
  User.one(){}
  User.two(String name){}
  //다른 생성자 호출구분, this(), super() 는 초기화 영역에, 생성자 바디는 불가..
  User.three(): this('kim',20);
  //named constructor 도 호출 가능
  User.four(): this.one();
}

class Singleton {
  int? data;
  //객체 생성시 호출될 생성자는 외부 노출을 안하고..
  Singleton._privateConstructor();
  static final Singleton _instance = Singleton._privateConstructor();
  factory Singleton(){
    //factory 생성자 내에서 코드로 꼭 자신 클래스 타입의 객체가 return 되어야 한다.
    return _instance;
  }
}

main(){
  User('kim', 30);
  User.one();

  Singleton obj1 = Singleton();
  Singleton obj2 = Singleton();
  obj1.data = 10;
  obj2.data = 20;
  print('${obj1.data}, ${obj2.data}');//20, 20
}






