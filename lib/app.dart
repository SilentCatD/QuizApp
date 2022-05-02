import 'package:flutter/material.dart';
import 'package:quiz_app/data/data_provider.dart';
import 'package:quiz_app/router.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key, required this.dataProvider}) : super(key: key);
  final DataProvider dataProvider;
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late AppRouter  _appRouter;
  @override
  void initState() {
    super.initState();
    _appRouter =  AppRouter(dataProvider: widget.dataProvider);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _appRouter.dispose();
  }
}
