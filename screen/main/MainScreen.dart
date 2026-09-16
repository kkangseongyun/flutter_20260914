import 'package:flutter/material.dart';

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
      body: Column(
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
          )
        ],
      ),
    );
  }
}











