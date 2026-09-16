import 'package:flutter/material.dart';
import 'package:flutter_lab/screen/event/EventScreen.dart';
import 'package:flutter_lab/screen/myinfo/MyInfoScreen.dart';

import './dto/DestinationDto.dart';
import './wigets/DestinationCard.dart';

class MainScreen extends StatelessWidget {
  //여행지 상품 가상의 데이터..
  final List<DestinationDto> destinations = [
    DestinationDto(
      id: 1,
      image: 'assets/images/main_swiss.jpg',
      destination: '스위스',
      discount: '최대 20% 할인',
    ),
    DestinationDto(
      id: 2,
      image: 'assets/images/main_australia.jpg',
      destination: '호주',
      discount: '최대 10% 할인',
    ),
    DestinationDto(
      id: 3,
      image: 'assets/images/main_georgia.jpg',
      destination: '조지아',
      discount: '최대 20% 할인',
    ),
    DestinationDto(
      id: 4,
      image: 'assets/images/main_mongolia.jpg',
      destination: '몽골',
      discount: '최대 20% 할인',
    ),
    DestinationDto(
      id: 5,
      image: 'assets/images/main_nepal.jpg',
      destination: '네팔',
      discount: '최대 15% 할인',
    ),
    DestinationDto(
      id: 6,
      image: 'assets/images/main_hawaii.jpg',
      destination: '하와이',
      discount: '최대 5% 할인',
    ),
  ];

  //데이터 갯수 만큼 화면 출력 위젯을 만드는 개발자 함수..
  List<Widget> makeDestinationGrid() {
    return destinations.map((destination){
      return DestinationCard(destination);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainScreen'),
      ),
      //화면에 여러 위젯을 나열하다가.. 화면을 벗어나게 되면..
      //경고 패턴 (노란색/검정색) 출력된다..
      //스크롤 신경써야 한다..
      //SingleChildScrollView - 위젯 하나만..
      //ListView - 여러 위젯을..
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(//화면이 나오는 특정 영역 설정(padding, size, background..)
              width: double.infinity,//최대치..
              constraints: BoxConstraints(maxHeight: 300),//사이즈에 대한 제약조건..
              //300을 넘어서 출력될 수 없다..
              child: Image.asset(
                'assets/images/main_bg_1.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '특가 여행지',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: (){
                      //화면전환..
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen()));
                    },
                    icon: Icon(Icons.arrow_drop_down, size: 20,),
                    label: Text('특가 여행지 보기'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3899DD),
                      foregroundColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.count(
                shrinkWrap: true,//너네 컨텐츠를 뿌릴 정도의 사이즈만 차지하라.. 기본이 무한 차지여서
                //GridView 는 자체 스크롤 능력이 있다.. 무시하라.. 화면 전체 스크롤에 따라라..
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.85,//가로:세로 비율..
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: makeDestinationGrid(),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoScreen()));
                },
                child: Text('Go MyInfo'),
            ),
          ],
        ),
      ),

    );
  }
}











