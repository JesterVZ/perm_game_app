import 'package:perm_game_app/test_page/data/question_response.dart';
import 'package:perm_game_app/test_page/domain/repository/test_repository.dart';

abstract interface class GetQuestionUseCase{
  Future<QuestionResponse> getQuestion();
}

class GetQuestionUseCaseImpl implements GetQuestionUseCase{
  final TestRepository repository;
  GetQuestionUseCaseImpl({required this.repository});
  @override
  Future<QuestionResponse> getQuestion() async => await repository.getQuestion();

}