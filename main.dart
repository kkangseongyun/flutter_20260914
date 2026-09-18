import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/bloc/TodosBloc.dart';
import 'package:flutter_lab/provider/TodosModel.dart';
import 'package:flutter_lab/riverpod/RiverpodNotifier.dart';
import 'package:flutter_lab/screen/bloc/BlocAddScreen.dart';
import 'package:flutter_lab/screen/bloc/BlocHomeScreen.dart';
import 'package:flutter_lab/screen/detail/DetailScreen.dart';
import 'package:flutter_lab/screen/dio/DioTestScreen.dart';
import 'package:flutter_lab/screen/event/EventScreen.dart';
import 'package:flutter_lab/screen/main/MainScreen.dart';
import 'package:flutter_lab/screen/myinfo/MyInfoScreen.dart';
import 'package:flutter_lab/screen/platform/PlatformScreen.dart';
import 'package:flutter_lab/screen/provider/ProviderAddScreen.dart';
import 'package:flutter_lab/screen/provider/ProviderHomeScreen.dart';
import 'package:flutter_lab/screen/riverpod/RiverpodAddScreen.dart';
import 'package:flutter_lab/screen/riverpod/RiverpodHomeScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
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
    //일반적으로 상태 등록은 MyApp 상위에 등록해서.. 전역에서 사용가능하게..
    //비슷한 로직의 다른 상태관리 테스트를 위해서.. ShellRoute 로 감싼 부분만 사용하게 한정지은 것이다..
    //ShellRoute - Route 를 중첩(계층)시켜서 등록할 때 사용..
    //ShellRoute 로 감싼 부분의 화면을 위한 스택이 별도로 준비된다..
    ShellRoute(
      builder: (context, state, child){
        return ChangeNotifierProvider(//하위에서 provider 이용하게 등록.. routes 에 등록된 위젯들이 사용가능하다.
          create: (_) => TodosModel(),
          child: child,
        );
      },
      routes: [
        GoRoute(
            path: '/provider-home',
            builder: (context, state){
              return ProviderHomeScreen();
            }
        ),
        GoRoute(
            path: '/provider-add',
            builder: (context, state){
              return ProviderAddScreen();
            }
        ),
      ]
    ),
    ShellRoute(
        builder: (context, state, child){
          return ProviderScope(//전역위치에 선언한 저장소를 그대로 이용할 수 있고, 하위 어디선가 자신들만을
            //위한 저장소를 따로 선언할 수 있다. 그렇게 되면 전역위치의 데이터와 다른 데이터 유지가 된다.
            overrides: [
              //전역위치에 10개의 provider 등록되었다고 가정..
              //하위에서 별도로 저장소 선언.. 하나만 override
              //이 하위에서 provider 를 이용할때.. override 에 선언되지 않은 애들은 전역 저장소에서 찾는다.
              //override 한 애만.. 별도의 저장소 유지..
              todosProvider.overrideWith(TodosNotifier.new),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
              path: '/riverpod-home',
              builder: (context, state){
                return RiverpodHomeScreen();
              }
          ),
          GoRoute(
              path: '/riverpod-add',
              builder: (context, state){
                return RiverpodAddScreen();
              }
          ),
        ]
    ),
    ShellRoute(
        builder: (context, state, child){
          return BlocProvider<TodosBloc>(
            create: (context) => TodosBloc(),
            child: child,
          );
        },
        routes: [
          GoRoute(
              path: '/bloc-home',
              builder: (context, state){
                return BlocHomeScreen();
              }
          ),
          GoRoute(
              path: '/bloc-add',
              builder: (context, state){
                return BlocAddScreen();
              }
          ),
        ]
    ),
    GoRoute(
        path: '/platform',
        builder: (context, state){
          return PlatformScreen();
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
