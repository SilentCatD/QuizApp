import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/logic/questions_bloc/questions_bloc.dart';

import '../../data/question_model.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key, required this.question}) : super(key: key);
  final Question question;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                question.text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              ...question.answers
                  .asMap()
                  .map((index, answer) {
                    return MapEntry(
                        index,
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: ElevatedButton(
                            child: Text(answer.text),
                            onPressed: () {
                              context.read<QuestionsBloc>().add(QuestionSelected(answerIndex: index));
                            },
                          ),
                        ));
                  })
                  .values
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
