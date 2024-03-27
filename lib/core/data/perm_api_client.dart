
import 'package:dio/dio.dart';
import 'package:perm_game_app/test_page/data/answer.dart';
import 'package:perm_game_app/test_page/data/question.dart';
import 'package:retrofit/http.dart';

part 'perm_api_client.g.dart';

@RestApi()
abstract class PermApiClient{
  factory PermApiClient(Dio dio) = _PermApiClient;

  @GET('/question')
  Future<Question> getQuestion();
  @GET('/answers')
  Future<List<Answer>> getAnswers(@Query('question_id') int questionId);
}