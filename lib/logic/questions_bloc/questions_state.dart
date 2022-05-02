part of 'questions_bloc.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();
}

class QuestionsInitial extends QuestionsState {
  @override
  List<Object> get props => [];
}

class QuestionsLoading extends QuestionsState{
  @override
  List<Object?> get props => [];
}

class QuestionsLoaded extends QuestionsState{
  final List<Question> questions;
  final int currentQuestionIndex;
  final double currentScore;
  const QuestionsLoaded({required this.questions, required this.currentQuestionIndex, required this.currentScore});
  @override
  List<Object?> get props => [questions, currentQuestionIndex, currentScore];
}

class QuestionsEmpty extends QuestionsState{
  @override
  List<Object?> get props => [];
}

class QuestionsError extends QuestionsState{
  final String? message;
  const QuestionsError({this.message});
  @override
  List<Object?> get props => [message];
}

class QuestionComplete extends QuestionsState{
  final double score;
  const QuestionComplete({required this.score});
  @override
  List<Object?> get props => [score];
}