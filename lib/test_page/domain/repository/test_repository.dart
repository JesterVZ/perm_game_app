import 'package:perm_game_app/test_page/data/question_response.dart';

abstract interface class TestRepository{
  Future<QuestionResponse> getQuestion();
}