import 'package:flutter/material.dart';
import './dto/EventDto.dart';
import './widgets/EventCard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//PageView 에서 내부적으로 상태 유지되고 그 상태값 변경에 의해 화면 갱신되어야 한다.
class EventScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EventScreenState();
  }
}

class EventScreenState extends State<EventScreen> {
  List<EventDto> datas = [
    EventDto('assets/images/main_australia.jpg', '호주', '시드니+멜버른+브리즈번', '2.14(금) ~ 2.23(일)',
        '20%'),
    EventDto('assets/images/main_georgia.jpg', '조지아', '나리칼라+게르게티',
        '2.14(금) ~ 2.29(토)', '15%'),
    EventDto(
        'assets/images/main_hawaii.jpg', '하와이', '호놀룰루+마우이', '2.15(토) ~ 2.20(목)', '20%'),
    EventDto('assets/images/main_mongolia.jpg', '몽골', '울란바토르+알타이', '2.17(월) ~ 2.23(일)',
        '20%'),
    EventDto('assets/images/main_nepal.jpg', '네팔', '카트만두+ABC', '2.21(금) ~ 3.8(일)', '15%'),
  ];

  List<EventCard> makePageWidgets() {
    return datas.map((dto){
      return EventCard(dto);
    }).toList();
  }

  //pageview 제어자.. pageview 설정, 유저의 이벤트 정보 획득..
  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.9,//현재 화면의 왼쪽 오른쪽 화면을 같이 얼마나 보여줄것인가.. 1.0 : 현재화면만..
  );

  @override
  void dispose() {
    super.dispose();
    //pagecontroller 에게 계속 이벤트 상황 알려줄 필요 없다..
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF3899DD,),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: makePageWidgets(),
              ),
            ),
            SmoothPageIndicator(
                controller: controller, //PageView 와 동일 controller 지정..
                count: 5,
                effect: WormEffect(
                  dotColor: Colors.white,
                  activeDotColor: Colors.yellow,
                ),
                onDotClicked: (index){},
            ),
            SizedBox(height: 32.0,),
          ],
        ),
      ),
    );
  }
}






