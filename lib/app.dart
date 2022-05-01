import 'package:flutter/material.dart';
import 'package:quiz_app/router.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late AppRouter  _appRouter;
  @override
  void initState() {
    super.initState();
    _appRouter = const AppRouter();
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
