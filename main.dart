import 'package:flutter/material.dart';
import 'package:flutter_lab/screen/detail/DetailScreen.dart';
import 'package:flutter_lab/screen/dio/DioTestScreen.dart';
import 'package:flutter_lab/screen/event/EventScreen.dart';
import 'package:flutter_lab/screen/main/MainScreen.dart';
import 'package:flutter_lab/screen/myinfo/MyInfoScreen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

//앱의 화면정보를 일관되게 등록..
//화면 조건과 화면의 widget
//실제 화면전환 처리 및 전환의 스택관리는 MaterialApp 의 역활..
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => MainScreen()),
    GoRoute(
      path: '/myinfo/:id',
      builder: (context, state){
        //GoRouter에서 파라미터 추출해서 위젯에 전달..
        String? id = state.pathParameters['id'];
        String? keyword = state.uri.queryParameters['q'];
        String? page = state.uri.queryParameters['page'];
        var extraData = state.extra as Map<String, dynamic>;
        return MyInfoScreen(
          id: id,
          keyword: keyword,
          page: page,
          extra: extraData
        );
      }
    ),
    GoRoute(
        path: '/event/:id',
        name: 'event',//name(별칭)으로 화면 전환 요청이 가능..
        //path 는 생략 불가하고.. path 에 path parameter 가 있다면 꼭 전달해야 한다..
        builder: (context, state){
          return EventScreen();
        }
    ),
    GoRoute(
        path: '/detail',
        builder: (context, state){
          return DetailScreen();
        }
    ),
    GoRoute(
        path: '/dio',
        builder: (context, state){
          return DioTestScreen();
        }
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
