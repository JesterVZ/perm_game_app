import 'package:perm_game_app/core/data/perm_api_client.dart';
import 'package:perm_game_app/test_page/data/question_response.dart';
import 'package:perm_game_app/test_page/domain/repository/test_repository.dart';

class TestRepositoryImpl implements TestRepository{
  final PermApiClient permApiClient;
  TestRepositoryImpl({required this.permApiClient});
  @override
  Future<QuestionResponse> getQuestion() async => await permApiClient.getQuestion();


}