
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/data/data_respository.dart';
import 'package:quiz_app/data/question_model.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {

  late final DataRepository _dataRepository;

  QuestionsBloc({required DataRepository dataRepository}) : super(QuestionsInitial()) {
    _dataRepository = dataRepository;
    on<QuestionsLoadRequested>(_onQuestionsLoadRequested);
    on<QuestionSelected>(_onQuestionSelected);
  }

  void _onQuestionsLoadRequested(QuestionsLoadRequested event, Emitter emit) async{
    emit(QuestionsLoading());
    try{
      final questions = await _dataRepository.getQuestions();
      if(questions.isEmpty){
        emit(QuestionsEmpty());
        return;
      }
      emit(QuestionsLoaded(questions: questions, currentQuestionIndex: 0, currentScore: 0));
    }catch (err){
      emit(QuestionsError(message: err.toString()));
    }
  }

  void _onQuestionSelected(QuestionSelected event, Emitter emit) {
    if(state is QuestionsLoaded){
      final currentState = state as QuestionsLoaded;
      final selectedScore = currentState.questions[currentState.currentQuestionIndex].answers[event.answerIndex].points;
      final totalScore = currentState.currentScore + selectedScore;
      if(currentState.currentQuestionIndex == currentState.questions.length - 1){
        emit(QuestionComplete(score: totalScore));
        return;
      }
      emit(QuestionsLoaded(questions: currentState.questions, currentQuestionIndex: currentState.currentQuestionIndex + 1, currentScore: totalScore));
    }else{
      emit(const QuestionsError(message: "Question is not loaded"));
    }
  }

}
