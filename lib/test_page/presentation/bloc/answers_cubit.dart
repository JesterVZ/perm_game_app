import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perm_game_app/test_page/data/answer.dart';
import 'package:perm_game_app/test_page/domain/usecase/get_answers_usecase.dart';

class AnswersCubit extends Cubit<AnswersState>{
  AnswersCubit({required this.getAnswersUseCase}):super(AnswersInit());

  final GetAnswersUseCase getAnswersUseCase;

  Future<void> fetchAnswers(int questionId) async {
    emit(AnswersLoading());
    try{
      final result = await getAnswersUseCase.getAnswers(questionId);
      emit(AnswersSuccess(answers: result));
    }catch(e){
      emit(AnswersError());
    }

  }
}

sealed class AnswersState{}

class AnswersInit extends AnswersState{}

class AnswersLoading extends AnswersState{}

class AnswersError extends AnswersState{}

class AnswersSuccess extends AnswersState{
  final List<Answer> answers;
  AnswersSuccess({required this.answers});
}