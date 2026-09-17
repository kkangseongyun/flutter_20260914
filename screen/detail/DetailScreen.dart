import 'package:flutter/material.dart';
import 'package:flutter_lab/screen/main/dto/DestinationDto.dart';
import 'package:go_router/go_router.dart';
import './widgets/DetailMainWidget.dart';
import './widgets/DetailNewsWidget.dart';

class DetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen>{
  int selectedIndex = 0;//tab 버튼 index..

  //tab 화면에 나와야 하는 위젯들..
  List<Widget> widgets = [
    DetailMainWidget(),
    DetailNewsWidget(),
  ];

  //tab button 이벤트 콜백..
  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    //GoRouter 는 내부적으로 화면전환과 관련된 상태 정보를 유지한다..
    final state = GoRouterState.of(context);
    final extra = state.extra as Map<String, dynamic>;
    DestinationDto dto = extra['destination'] as DestinationDto;

    return Scaffold(
      //AppBar, body 로 화면 상단을 다양하게 꾸밀수 있기는 하지만..
      //body 에서 스크롤이 발생했을 때 화면 상단을 접히게 할 수 없다..
      //유저 스크롤 이벤트가 발생하는 곳은 body 부분이다.. 스크롤 정보가 appbar 에도 전달되어야 접힌다..
      //스크롤 정보 중계자가 필요하다..
      //body 에서 발생한 스크롤 정보를 headerSliverBuilder 에 전달..
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return [
              //AppBar 로는 안되고 SliverAppBar 를 이용해야 한다. NestedScrollView 에서 전달하는
              //스크롤 정보를 받을 준비가 되어 있어야 한다..
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,//접혔다가 거꾸로 스크롤 할때 처음부터 나올것인가?(true), 맨 마지막에 끌려 나올것인가?
                //false
                pinned: true,//스크롤 되어 접힐 때 한줄은 남길 것인가?(true) 다 사라질 것인가?
                backgroundColor: Color(0xFF3899DD),
                //접히는 부분의 ui
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                      // '스위스',
                      dto.destination,
                      style: TextStyle(color: Colors.white),
                  ),
                  titlePadding: EdgeInsets.only(left: 56, bottom: 16,),
                  expandedTitleScale: 1.0,//확장 되었을때 타이틀의 크기 배율..
                  background: Image.asset(
                    'assets/images/detail_main.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: widgets.elementAt(selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,//탭 버튼 클릭시 탭 버튼의 애니메이션 효과, fixed
        items: <BottomNavigationBarItem>[//tab button
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
            backgroundColor: Color(0xFF3899DD),//이 버튼이 선태되었을 때 전체 bar 의 background
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'News',
            backgroundColor: Colors.red,//이 버튼이 선태되었을 때 전체 bar 의 background
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber,//선택된 탭의 색상..
        onTap: onItemTapped,
      ),
    );
  }
}








