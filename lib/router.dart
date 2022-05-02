import 'package:flutter/material.dart';
import 'package:quiz_app/data/data_provider.dart';
import 'package:quiz_app/data/data_respository.dart';
import 'package:quiz_app/logic/questions_bloc/questions_bloc.dart';
import 'package:quiz_app/utils/interface/disposable.dart';
import 'package:quiz_app/view/view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter implements IDisposable {
  late final DataProvider _dataProvider;
  late final DataRepository _dataRepository;
  AppRouter({required DataProvider dataProvider}) {
    _dataProvider = dataProvider;
    _dataRepository = DataRepository(dataProvider: _dataProvider);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        final screen = MaterialPageRoute(builder: (BuildContext context) {
          return const HomeScreen();
        });
        return screen;
      case QuestionScreen.routeName:
        final screen = MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => QuestionsBloc(dataRepository: _dataRepository)..add(QuestionsLoadRequested()),
            child: const QuestionScreen(),
          );
        });
        return screen;
      default:
        return null;
    }
  }

  @override
  void dispose() {}
}