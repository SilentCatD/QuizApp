class DataProvider {
  DataProvider._privateConstructor();
  static final DataProvider _instance = DataProvider._privateConstructor();
  static DataProvider get instance => _instance;
  var _connected = false;
  Future<void> connect() async {
    if(_connected) return;
    await Future.delayed(const Duration(seconds: 2));
    _connected = true;
    print("db connected");
  }

  Stream<Map<String, dynamic>> questionStream(){
    throw UnimplementedError();
  }

  Future<List<Map<String, dynamic>>> getQuestions() async{
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1},
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 3},
          {'text': 'Snake', 'score': 11},
          {'text': 'Elephant', 'score': 5},
          {'text': 'Lion', 'score': 9},
        ],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': [
          {'text': 'Max', 'score': 1},
          {'text': 'Max', 'score': 1},
          {'text': 'Max', 'score': 1},
          {'text': 'Max', 'score': 1},
        ],
      },
    ];
  }

  Future<void> addQuestions() async{

  }

  Future<void> removeQuestions() async{

  }

}