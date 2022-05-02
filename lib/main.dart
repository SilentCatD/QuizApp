import 'package:flutter/material.dart';
import 'package:quiz_app/app.dart';
import 'package:quiz_app/data/data_provider.dart';

void main() async {
  final dataProvider = DataProvider.instance;
  await dataProvider.connect();
  final app = QuizApp(dataProvider: dataProvider,);
  runApp(app);
}