class Answer {
  int? id;
  String? answerText;
  int? questionId;
  int? isCorrect;

  Answer({this.id, this.answerText, this.questionId, this.isCorrect});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answerText = json['answer_text'];
    questionId = json['question_id'];
    isCorrect = json['is_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer_text'] = answerText;
    data['question_id'] = questionId;
    data['is_correct'] = isCorrect;
    return data;
  }

  bool get getIsCorrect => isCorrect == 1;
}