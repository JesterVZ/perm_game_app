class QuestionResponse {
  List<Questions>? questions;
  List<Answers>? answers;

  QuestionResponse({this.questions, this.answers});

  QuestionResponse.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  String? questionText;

  Questions({this.id, this.questionText});

  Questions.fromJson(Map<String, dynamic> json) {
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

class Answers {
  int? id;
  String? answerText;
  int? questionId;
  int? isCorrect;

  Answers({this.id, this.answerText, this.questionId, this.isCorrect});

  Answers.fromJson(Map<String, dynamic> json) {
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