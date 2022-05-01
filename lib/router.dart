import 'package:flutter/material.dart';
import 'package:quiz_app/utils/interface/disposable.dart';
import 'package:quiz_app/view/view.dart';
class AppRouter implements IDisposable{
  const AppRouter();
  Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case HomeScreen.routeName:
        final screen = MaterialPageRoute(builder: (BuildContext context) {
          return const HomeScreen();
        });
        return screen;
      case QuestionScreen.routeName:
        final screen = MaterialPageRoute(builder: (BuildContext context) {
          return const QuestionScreen();
        });
        return screen;
      default:
        return null;
    }
  }

  @override
  void dispose() {}
}