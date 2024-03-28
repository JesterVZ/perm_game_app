
import 'package:dio/dio.dart';
import 'package:perm_game_app/test_page/data/question_response.dart';
import 'package:retrofit/http.dart';

part 'perm_api_client.g.dart';

@RestApi()
abstract class PermApiClient{
  factory PermApiClient(Dio dio) = _PermApiClient;

  @GET('/question')
  Future<QuestionResponse> getQuestion();
}