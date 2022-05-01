import 'package:flutter/material.dart';
import 'package:quiz_app/utils/interface/disposable.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';

class AppRouter implements IDisposable{
  const AppRouter();
  Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        final screen = MaterialPageRoute(builder: (BuildContext context) {
          return const HomeScreen();
        });
        return screen;
      default:
        return null;
    }
  }

  @override
  void dispose() {}
}