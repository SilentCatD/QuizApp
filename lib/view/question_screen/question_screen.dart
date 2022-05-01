import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  static const routeName = '/question-screen';
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions"),
      ),
    );
  }
}
