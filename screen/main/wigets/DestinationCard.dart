//DestinationCard
import 'package:flutter/material.dart';
import '../dto/DestinationDto.dart';

class DestinationCard extends StatelessWidget{
  final DestinationDto destinationDto;

  const DestinationCard(this.destinationDto);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,//카드가 얼마나 위로 올라와 있게 할것인가?
      //RoundedRectangleBorder(권장), CircleBorder....
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      //카드 부분을 유저가 터치했을 때 이벤트 처리하고 싶다..
      //이벤트 처리 위젯..
      //GestureDetector : 이벤트에 의한 ui 효과 없다..
      //InkWell : 이벤트에 의한 잉크 번짐 ui 효과..
      child: InkWell(
        onTap: () {

        },
        //이 설정이 없으면.. 잉크 번짐 효과가.. 카드의 모서리 둥근 범위를 벗어난 영역까지 진행되어서..
        borderRadius: BorderRadius.circular(10),
        child: Padding(//여백만을 설정..
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(//여백이 발생하면 여백을 다 차지..
                child: Center(
                  child: ClipRRect(//round rect
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      destinationDto.image,
                      width: 150,
                      fit: BoxFit.cover,//데이터 이미지와 화면 출력 사이즈가 대부분은 일치하지 않는다.
                      //어떻게 뿌릴 것인가..
                      //종횡비를 유지한 상태에서 화면에 출력될 수 있게 줄여라..
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4,),//여백만 차지하는 위젯..
              Text(
                destinationDto.destination,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                destinationDto.discount,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}