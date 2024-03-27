
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perm_game_app/core/presentation/widgets/skeleton.dart';
import 'package:perm_game_app/di/injection_container.dart';
import 'package:perm_game_app/test_page/data/answer.dart';
import 'package:perm_game_app/test_page/data/question.dart';
import 'package:perm_game_app/test_page/presentation/bloc/answers_cubit.dart';

class QAView extends StatefulWidget {
  final Question question;
  final void Function() correctAnswer;
  final void Function() incorrectAnswer;

  const QAView({super.key, required this.question, required this.correctAnswer, required this.incorrectAnswer});

  @override
  State<QAView> createState() => _QAViewState();
}

class _QAViewState extends State<QAView> {
  late final AnswersCubit _answersCubit;

  @override
  void initState() {
    super.initState();
    _answersCubit = locator.get<AnswersCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _answersCubit.fetchAnswers(widget.question.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                    child: Text(
                  "10:00",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 40),
                )),
                Expanded(
                    child: Text(
                  widget.question.questionText!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 40),
                )),
              ],
            )),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.center,
            child: BlocBuilder<AnswersCubit, AnswersState>(
              bloc: _answersCubit,
              builder: (context, state) {
                switch (state) {
                  case AnswersInit():
                  case AnswersLoading():
                    return _buildShimmers();
                  case AnswersError():
                    return const Center(
                      child: Text('error'),
                    );
                  case AnswersSuccess():
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            _buildAnswerButton(state.answers[0]),
                            _buildAnswerButton(state.answers[1]),
                          ],
                        ),
                        Row(
                          children: [
                            _buildAnswerButton(state.answers[2]),
                            _buildAnswerButton(state.answers[3]),
                          ],
                        )
                      ],
                    );
                }
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAnswerButton(Answer answer){
    return Expanded(
                                child: TextButton(
                              child: Text(
                                answer.answerText!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 40),
                              ),
                              onPressed: () {
                                if(answer.getIsCorrect){
                                  widget.correctAnswer.call();
                                } else {
                                  widget.incorrectAnswer.call();
                                }
                              },
                            ));
  }

  Widget _buildShimmers() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 80,
          child: Row(
            children: [Expanded(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Skeleton(),
            )), Expanded(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Skeleton(),
            ))],
          ),
        ),
        SizedBox(
          height: 80,
          child: Row(
            children: [Expanded(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Skeleton(),
            )), Expanded(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Skeleton(),
            ))],
          ),
        ),
      ],
    );
  }
}
