import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perm_game_app/test_page/data/question_response.dart';

class QACubit extends Cubit<QAState> {
  QACubit() : super(QAInitial());

  void initQuestionsAndAnswers(List<Questions> questions, List<Answers> answers) {
    emit(QADataLoaded(questions: questions, answers: answers, index: 0));
  }

  void answerSelected(Answers answer, int currentIndex, int totalQuestions) {
    if (answer.getIsCorrect) {
      if (currentIndex < totalQuestions - 1) {
        emit(QADataLoaded(questions: (state as QADataLoaded).questions, answers: (state as QADataLoaded).answers, index: currentIndex + 1));
      } else {
        emit(QAFinished());
      }
    } else {
      // Handle incorrect answer logic here
    }
  }
}

sealed class QAState {}

class QAInitial extends QAState {}

class QADataLoaded extends QAState {
  final List<Questions> questions;
  final List<Answers> answers;
  final int index;

  QADataLoaded({required this.questions, required this.answers, required this.index});
}

class QAFinished extends QAState {}
