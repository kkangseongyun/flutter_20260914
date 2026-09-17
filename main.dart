import 'package:flutter/material.dart';
import 'package:flutter_lab/screen/detail/DetailScreen.dart';
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
      path: '/myinfo',
      builder: (context, state){
        return MyInfoScreen();
      }
    ),
    GoRoute(
        path: '/event',
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
