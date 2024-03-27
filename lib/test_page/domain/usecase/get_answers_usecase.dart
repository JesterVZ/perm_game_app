import 'package:perm_game_app/test_page/data/answer.dart';
import 'package:perm_game_app/test_page/domain/repository/test_repository.dart';

abstract interface class GetAnswersUseCase{
  Future<List<Answer>> getAnswers(int questionId);
}

class GetAnswersUseCaseImpl implements GetAnswersUseCase{
  final TestRepository repository;
  GetAnswersUseCaseImpl({required this.repository});
  @override
  Future<List<Answer>> getAnswers(int questionId) async => await repository.getAnswers(questionId: questionId);
  
}