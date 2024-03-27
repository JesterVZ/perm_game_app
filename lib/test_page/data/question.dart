class Question {
  int? id;
  String? questionText;

  Question({this.id, this.questionText});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['question_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question_text'] = questionText;
    return data;
  }
}