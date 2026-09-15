import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ParentWidget());

//화면단위 위젯을 stateful 로 만드는 것은 권장할만하지 않다..
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParentState();
  }
}
class ParentState extends State<ParentWidget>{
  int _counter = 0;//상위의 상태라는 개념.. 하위에 전파되는 데이터라는 개념...
  void increment(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lifecycle Test'),
        ),
        body: Provider.value(//이 하위부터 자신의 상태를 전파..
          value: _counter,
          //자신의 상태값 변경을 하위에 전파해야 하는가? 를 판단하기 위해서 자동 호출..
          //이 함수에서 true 리턴되면 하위 전파, false 리턴되면 전파 안된다.
          updateShouldNotify: (oldValue, newValue) => true,
          child: Column(
            children: [
              Text('I am parent : $_counter'),
              ElevatedButton(onPressed: increment, child: Text('increment'),),
              ChildWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  ChildWidget(){
    print('ChildWidget constructor...');
  }
  @override
  State<StatefulWidget> createState() {
    return ChildState();
  }
}

//WidgetsBindingObserver - 앱의 라이프사이클.. 화면에 출력되거나 사라지는 순간..
class ChildState extends State<ChildWidget> with WidgetsBindingObserver{
  int counter = 0;//상위의 상태를 저장하기 위한 변수..

  ChildState(){
    print('ChildState constructor...');
  }

  @override
  void initState() {
    super.initState();
    print('ChildState initState...');
    //앱 라이프사이클 이벤트 등록..
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('ChildState didChangeDependencies..');
    counter = Provider.of<int>(context);//상위 상태 획득..
  }
  @override
  Widget build(BuildContext context) {
    print('ChildState build...');
    return Text('I am ChildWidget, $counter');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch(state){
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
        print('app lifecycle resume');
        break;
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        print('app lifecycle paused');
        break;

    }
  }
}
//초기 상태..
//I/flutter (18387): ChildWidget constructor...
// I/flutter (18387): ChildState constructor...
// I/flutter (18387): ChildState initState...
// I/flutter (18387): ChildState didChangeDependencies..
// I/flutter (18387): ChildState build...

//상위 상태 변경상황..
//==> 상위 상태 변경.. 위젯은 불변이다.. 위젯은 무조건 다시 생성
//==>단지.. State 만 초기 생성되고.. 메모리에 누적되어 이용..
//I/flutter (18387): ChildWidget constructor...
// I/flutter (18387): ChildState didChangeDependencies..
// I/flutter (18387): ChildState build...

//앱이 화면에 나오거나.. 안나오거나..
//I/flutter (18387): app lifecycle paused
// I/flutter (18387): app lifecycle paused
//I/flutter (18387): app lifecycle resume