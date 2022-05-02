import './data_provider.dart';
import './question_model.dart';

class DataRepository{
  late final DataProvider _dataProvider;
  DataRepository({required DataProvider dataProvider}){
    _dataProvider = dataProvider;
  }

  Future<List<Question>> getQuestions() async{
    final results = <Question>[];
    final questionsData = await _dataProvider.getQuestions();
    for (var currentQuestion in questionsData) {
      final answers = <Answer>[];
      final questionText = currentQuestion['questionText'];
      for (var answer in currentQuestion['answers']){
        answers.add(Answer(text: answer['text'], points: (answer['score'] as int).toDouble()));
      }
      results.add(Question(text: questionText, answers: answers));
    }
    return results;
  }

}