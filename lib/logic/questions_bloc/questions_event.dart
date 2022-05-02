part of 'questions_bloc.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class QuestionsLoadRequested extends QuestionsEvent{
  @override
  List<Object?> get props => [];
}

class QuestionSelected extends QuestionsEvent{
  final int answerIndex;
  const QuestionSelected({required this.answerIndex});
  @override
  List<Object?> get props => [answerIndex];
}