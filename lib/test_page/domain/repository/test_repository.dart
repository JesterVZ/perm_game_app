import 'package:perm_game_app/test_page/data/answer.dart';
import 'package:perm_game_app/test_page/data/question.dart';

abstract interface class TestRepository{
  Future<Question> getQuestion();
  Future<List<Answer>> getAnswers({required int questionId});
}