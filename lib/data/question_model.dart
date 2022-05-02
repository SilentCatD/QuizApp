class Answer {
  String text;
  double points;
  Answer({required this.text, required this.points});
}

class Question{
  String text;
  List<Answer> answers;
  Question({required this.text, required this.answers});
}