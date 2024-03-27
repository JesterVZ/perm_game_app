
import 'package:get_it/get_it.dart';
import 'package:perm_game_app/core/data/dio_factory.dart';
import 'package:perm_game_app/core/data/internet_connection_manager.dart';
import 'package:perm_game_app/core/data/perm_api_client.dart';
import 'package:perm_game_app/test_page/data/test_repository.dart';
import 'package:perm_game_app/test_page/domain/repository/test_repository.dart';
import 'package:perm_game_app/test_page/domain/usecase/get_answers_usecase.dart';
import 'package:perm_game_app/test_page/domain/usecase/get_question_usecase.dart';
import 'package:perm_game_app/test_page/presentation/bloc/answers_cubit.dart';
import 'package:perm_game_app/test_page/presentation/bloc/questions_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerSingleton(InternetConnectionManager());
  locator.registerSingleton<DioFactory>(DioFactoryImpl(locator()));
  locator.registerSingleton<PermApiClient>(PermApiClient(locator.get<DioFactory>().create()));
  locator.registerFactory<TestRepository>(() => TestRepositoryImpl(permApiClient: locator()));
  locator.registerFactory<GetQuestionUseCase>(() => GetQuestionUseCaseImpl(repository: locator()));
  locator.registerFactory<GetAnswersUseCase>(() => GetAnswersUseCaseImpl(repository: locator()));
  locator.registerFactory(() => QuestionsCubit(getQuestionUseCase: locator()));
  locator.registerFactory(() => AnswersCubit(getAnswersUseCase: locator()));
}