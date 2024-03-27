import 'package:perm_game_app/test_page/data/question.dart';
import 'package:perm_game_app/test_page/domain/repository/test_repository.dart';

abstract interface class GetQuestionUseCase{
  Future<Question> getQuestion();
}

class GetQuestionUseCaseImpl implements GetQuestionUseCase{
  final TestRepository repository;
  GetQuestionUseCaseImpl({required this.repository});
  @override
  Future<Question> getQuestion() async => await repository.getQuestion();

}