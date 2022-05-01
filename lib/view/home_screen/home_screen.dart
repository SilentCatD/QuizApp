import 'package:flutter/material.dart';

import '../question_screen/question_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("To question"),
          onPressed:() => Navigator.of(context).pushNamed(QuestionScreen.routeName),
        ),
      ),
    );
  }
}
