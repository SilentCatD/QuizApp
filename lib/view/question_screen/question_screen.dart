import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/logic/questions_bloc/questions_bloc.dart';
import 'package:quiz_app/view/question_screen/question_widget.dart';

class QuestionScreen extends StatelessWidget {
  static const routeName = '/question-screen';

  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions"),
      ),
      body: BlocBuilder<QuestionsBloc, QuestionsState>(
        builder: (context, state) {
          if (state is QuestionsInitial || state is QuestionsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is QuestionsLoaded) {
            return QuestionWidget(
                question: state.questions[state.currentQuestionIndex]);
          }
          if (state is QuestionsError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          if (state is QuestionComplete) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Score: ${state.score}"),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, child: const Text("Return to home screen")),
                ],
              ),
            );
          }
          throw UnimplementedError();
        },
      ),
    );
  }
}
