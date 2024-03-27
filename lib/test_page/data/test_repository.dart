import 'package:perm_game_app/core/data/perm_api_client.dart';
import 'package:perm_game_app/test_page/data/answer.dart';
import 'package:perm_game_app/test_page/data/question.dart';
import 'package:perm_game_app/test_page/domain/repository/test_repository.dart';

class TestRepositoryImpl implements TestRepository{
  final PermApiClient permApiClient;
  TestRepositoryImpl({required this.permApiClient});
  @override
  Future<Question> getQuestion() async => await permApiClient.getQuestion();

  @override
  Future<List<Answer>> getAnswers({required int questionId}) async => await permApiClient.getAnswers(questionId);

}