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