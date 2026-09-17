import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class DioTestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     return DioTestScreenState();
  }
}

class DioTestScreenState extends State<DioTestScreen> {
  //서버 데이터 가정..
  List datas = [];

  //ListView 에 추가, ListView에서의 유저 스크롤 정보를 활용하겠다면..
  ScrollController controller = ScrollController();

  //데이터를 변경시키면서 서버에 전달할 데이터..
  int page = 1;
  int seed = 1;

  //호출되면 네트워킹을 하는 함수..
  Future<List<dynamic>> dioTest() async {
    try{
      var dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          }
        )
      );
      //네트워킹 시도..
      Response<dynamic> response = await dio.get(
        "https://randomuser.me/api/?seed=${seed}&page=${page}&results=20"
      );
      return response.data['results'];
    }catch (e){
      print(e);
    }
    return [];
  }

  //ListView 스크롤 이벤트 콜백..
  _scrollListener() async {
    //마지막까지 스크롤이 된 것인지 판단..
    if(controller.offset >= controller.position.maxScrollExtent && !controller.position.outOfRange){
      //페이지번호를 증가시켜서.. 다시 네트워킹..
      page++;
      List result = await dioTest();
      setState(() {
        datas.addAll(result);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //스크롤 이벤트 등록..
    controller.addListener(_scrollListener);
    //초기 데이터 획득.
    dioTest().then((value){
      setState(() {
        datas = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  //refresh event callback..
  Future<void> _refresh() async {
    page = 1;
    seed++;
    List result = await dioTest();
    setState(() {
      datas= result;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dio'),
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.separated(
            controller: controller,
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Text(
                    "${datas[position]["name"]["first"]} ${datas[position]["name"]["last"]}"),
                subtitle: Text(datas[position]["email"]),
                leading: CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child:
                    Image.network(datas[position]["picture"]['thumbnail']),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int position) {
              return Divider(
                color: Colors.black,
              );
            },
          ),
        )
    );
  }
}