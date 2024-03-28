import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perm_game_app/test_page/data/question_response.dart';
import 'package:perm_game_app/test_page/domain/usecase/get_question_usecase.dart';

/// Кубит, который берет данные по вопросам и ответам
class QuestionsCubit extends Cubit<QuestionsState>{
  QuestionsCubit({required this.getQuestionUseCase}):super(QuestionsInit());

  final GetQuestionUseCase getQuestionUseCase;


  Future<void> fetchQuestion() async {
    emit(QuestionsLoading());
    try{
      final result = await getQuestionUseCase.getQuestion();
      emit(QuestionsSuccess(question: result));
    } catch(e){
      emit(QuestionsError());
    }
  }

}

sealed class QuestionsState{}

class QuestionsInit extends QuestionsState{}

class QuestionsLoading extends QuestionsState{}

class QuestionsError extends QuestionsState{}

class QuestionsSuccess extends QuestionsState{
  final QuestionResponse question;
  QuestionsSuccess({required this.question});
}