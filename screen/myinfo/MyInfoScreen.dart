import 'package:flutter/material.dart';

class MyInfoScreen extends StatefulWidget {

  String? id;
  String? keyword;
  String? page;
  Map<String, dynamic>? extra;

  MyInfoScreen({this.id, this.keyword, this.page, this.extra});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {

  //유저 입력 데이터 저장 변수..
  String? email = '';
  String? phone = '';
  String _userImage = 'assets/images/user_basic.jpg';

  //Form 에 지정할 키. 필요한 순간 FormState 를 획득하기 위해서..
  //State 획득을 목적으로 키를 사용하면 꼭 GlobalKey 로 만들어야..
  final _formKey = GlobalKey<FormState>();

  //최종 데이터를 저장하기 위해서 호출되는 개발자 함수..
  //Future, async.. 비동기.
  Future<void> _saveData() async {
    print('$email, $phone, $_userImage');
  }

  @override
  void initState() {
    super.initState();
    //State 의 위젯이 가지는 데이터 획득..
    print('${widget.id}, ${widget.keyword}, ${widget.page}, ${widget.extra}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
        actions: [
          TextButton(
              onPressed: (){
                //키로 FormState 획득.
                final form = _formKey.currentState;
                if(form?.validate() ?? false){//전체 유효하다면..
                  form?.save();//onSaved() 함수 호출하라..
                  _saveData();
                }
              },
              child: Text('저장'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              // 원형 프로필 이미지
              Card(
                elevation: 0,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(_userImage, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 24),
              // Gallery 버튼
              ElevatedButton(
                onPressed: (){},
                child: Text('Gallery App'),
              ),
              SizedBox(height: 24),
              // Camera 버튼
              ElevatedButton(onPressed: (){}, child: Text('Camera App')),
              SizedBox(height: 30),

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Form 과 상호 연동에 의한 유효성검증, 데이터 저장을 위해서는 TextField 는 안된다.
                    TextFormField(
                      decoration: InputDecoration(labelText: "Email"),
                      //FormState 의 validate() 호출시 자동 호출..
                      //매개변수가 현재 유저가 입력한 데이터다.
                      validator: (value){
                        if(value?.isEmpty ?? false){
                          return "input email";//invalid, 에러 메시지
                        }
                        return null;//valid...
                      },
                      //FormState 의 save() 함수 호출시점..
                      onSaved: (value) => setState(() {
                        email = value;
                      }),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Phone"),
                      validator: (value){
                        if(value?.isEmpty ?? false){
                          return "input phone";//invalid, 에러 메시지
                        }
                        return null;//valid...
                      },
                      onSaved: (value) => setState(() {
                        phone = value;
                      }),
                    ),
                  ],
                ),
              ),

		
            ],
          ),
        ),
      ),
    );
  }
}
