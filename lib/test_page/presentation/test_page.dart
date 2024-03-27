import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perm_game_app/di/injection_container.dart';
import 'package:perm_game_app/test_page/presentation/bloc/questions_cubit.dart';
import 'package:perm_game_app/test_page/presentation/widgets/QA_view.dart';

class TestPage extends StatefulWidget {
  const TestPage({ Key? key }) : super(key: key);

  @override
  State createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late final QuestionsCubit questionsCubit;
  @override
  void initState() {
    questionsCubit = locator.get<QuestionsCubit>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      questionsCubit.fetchQuestion();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ТЕСТ")),
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        bloc: questionsCubit,
        builder: (context, state) {
          switch(state){
            case QuestionsInit():
              return const Center(child: CircularProgressIndicator(),);
            case QuestionsLoading():
              return const Center(child: CircularProgressIndicator(),);
            case QuestionsError():
              return const Center(child: Text('Ошибка получения текств вопроса'));
            case QuestionsSuccess():
              return QAView(question: state.question, correctAnswer: () { 
                questionsCubit.fetchQuestion();
               }, incorrectAnswer: () {  },);
          }
        },),
    );
  }
}