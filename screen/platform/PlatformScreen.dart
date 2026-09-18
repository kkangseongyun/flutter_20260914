import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformScreen extends StatefulWidget {
  @override
  PlatformScreenState createState() => PlatformScreenState();
}

class PlatformScreenState extends State<PlatformScreen> {


  String? resultMessage;
  String? receiveMessage;

  Future<Null> onPlatformChannel() async {
    //channel 준비. native 와 이름이 동일..
    //Codec 을 변경해서 다른 타입의 데이터를 전달 가능..
    //MethodChannel 을 사용하지 않고 MessageChannel 을 이용하는 경우는 Codec 조정 목적이 크다..
    const channel = BasicMessageChannel<String>('myMessageChannel', StringCodec());
    //native 에 데이터 전달해서 동작하게 하고.. 결과를 받는다..
    String? result = await channel.send('Hello, I am Dart');
    setState(() {
      resultMessage = result;
    });

    //native 에 데이터를 받기 위한 콜백 등록..
    channel.setMessageHandler((String? message) async {
      setState(() {
        receiveMessage = message;
      });
      return 'Dart return';
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Channel Test")),
        body: Center(
          child: Column(
            children: (<Widget>[
              Text('result : $resultMessage'),
              Text('receive : $receiveMessage'),
              ElevatedButton(
                  onPressed: onPlatformChannel,
                  child: Text('platform channel')
              ),
            ]),
          ),
        )
    );
  }
}