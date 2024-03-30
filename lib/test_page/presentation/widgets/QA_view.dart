import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perm_game_app/test_page/data/question_response.dart';
import 'package:perm_game_app/test_page/presentation/results_page.dart';

class QAView extends StatefulWidget {
  final QuestionResponse response;

  const QAView({
    super.key,
    required this.response,
  });

  @override
  State<QAView> createState() => _QAViewState();
}

class _QAViewState extends State<QAView> {
  late List<Questions> questions;
  late List<Answers> answers;

  final PageController pageController = PageController();

  int pageIndex = 0;

  int correctAnswersCount = 0;
  bool isAnswerSelected = false;

  @override
  void initState() {
    super.initState();
    questions = widget.response.questions!;
    answers = widget.response.answers!;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          pageIndex = value;
        });
      },
      controller: pageController,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                        child: Text(
                      widget.response.questions![index].questionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 30),
                    )),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          _buildAnswerButton(answers
                              .where((x) =>
                                  x.questionId ==
                                  widget.response.questions![index].id!)
                              .toList()[0]),
                          _buildAnswerButton(answers
                              .where((x) =>
                                  x.questionId ==
                                  widget.response.questions![index].id!)
                              .toList()[1]),
                        ],
                      ),
                      Row(
                        children: [
                          _buildAnswerButton(answers
                              .where((x) =>
                                  x.questionId ==
                                  widget.response.questions![index].id!)
                              .toList()[2]),
                          _buildAnswerButton(answers
                              .where((x) =>
                                  x.questionId ==
                                  widget.response.questions![index].id!)
                              .toList()[3]),
                        ],
                      )
                    ],
                  )),
            )
          ],
        );
      },
      itemCount: questions.length,
    );
  }

  Widget _buildAnswerButton(Answers answer) {
    return Expanded(
        child: TextButton(
      child: Text(
        answer.answerText!,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 40, color: 
          isAnswerSelected ? answer.getIsCorrect ? const Color.fromARGB(255, 48, 122, 51) : const Color.fromARGB(255, 167, 49, 41): null) 
      ),
      onPressed: () async {
        setState(() {
          isAnswerSelected = true;
        });
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          isAnswerSelected = false;
        });
        if (pageIndex == questions.length - 1) {
          if(mounted){
            Navigator.push(context, CupertinoPageRoute(builder: (context) => ResultsPage(score: correctAnswersCount,),), );
          }
          
        } else {
          if (answer.getIsCorrect) {
            correctAnswersCount++;
          } else {
          }
          pageController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
        }
      },
    ));
  }
}
