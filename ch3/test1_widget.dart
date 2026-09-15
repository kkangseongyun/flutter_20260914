//material design 에 입각한 위젯을 제공
//cupertino.dart import - ios 스타일의 위젯..
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//화면단위 위젯을 Stateful로 만드는 것은 바람직하지 않다. 불필요하게 너무 많은 위젯 객체가 생성될 가능성 있다..
class MyApp extends StatelessWidget {
  //화면 출력을 위해서 자동 호출.. 리턴되는 객체가 화면 정보 위젯 객체..
  @override
  Widget build(BuildContext context) {
    //필수는 아니지만.. 앱이 실행되면서 최초로 출력되는 위젯의 계층 최 상위는 MaterialApp
    //MaterilApp(앱 전체 테마설정, 라우팅 등록)
    return MaterialApp(
      //필수는 아니지만 페이지 단위 위젯에 일반적으로..
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test1'),
        ),
        body: Column(//위아래로 나열..
          children: [
            MyStatelessWidget(),
            MyStatefulWidget(),
          ],
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  //상태를 가지지 않는다는 것이지, 변수를 못가진다는 이야기는 아니다..
  bool favorited = false;
  int favoriteCount = 10;

  //상태 변경에 의한 화면 re-rendering 이 안되는 것이지.. 정상적인 알고리즘에 의한 함수 가능..
  void toggleFavorite(){
    print('Stateless.. toggleFavorite()...');
    if(favorited){
      favoriteCount -= 1;
      favorited = false;
    }else {
      favoriteCount += 1;
      favorited = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Stateless... build....');
    return Row(//여러 위젯 가로방향 나열..
      children: [
        IconButton(
            onPressed: toggleFavorite,
            icon: favorited ? Icon(Icons.star) : Icon(Icons.star_border),
            color: Colors.red,
        ),
        Text('$favoriteCount'),
      ],
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<MyStatefulWidget>{
  bool favorited = false;
  int favoriteCount = 10;

  void toggleFavorite(){
    print('Stateful.. toggleFavorite()...');
    //Stateful 은 상태를 가지고 상태값 변경에 의한 화면 re-rendering 을 목적으로 한다.
    //Stateful 의 모든 변수가 상태인가?
    //상태값이 변경되었다고 화면이 갱신되는 것이 아니라.. 화면 갱신이 필요하면.. 상태를 변경하면서 setState() 호출
    //setState() 함수에 의한 build 함수 다시 호출.. 화면 갱신은 비동기적으로 처리된다.
    //상태값이 변경되기 전에 build 함수가 호출될 수 있다.
    //setState() 의 매개변수 - 함수.. 이 함수를 먼저 호출하고.. 호출이 끝나면.. build 함수 호출..
    //상태값 변경은 setState() 의 매개변수 함수에서 하는 것이 좋다..
    setState(() {
      if(favorited){
        favoriteCount -= 1;
        favorited = false;
      }else {
        favoriteCount += 1;
        favorited = true;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    print('Stateful... build....');
    return Row(//여러 위젯 가로방향 나열..
      children: [
        IconButton(
          onPressed: toggleFavorite,
          icon: favorited ? Icon(Icons.star) : Icon(Icons.star_border),
          color: Colors.red,
        ),
        Text('$favoriteCount'),
      ],
    );
  }
}