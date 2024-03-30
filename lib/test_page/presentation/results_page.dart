import 'package:flutter/material.dart';
import 'package:perm_game_app/core/presentation/app_ui.dart';

enum TestResult{
  veryBad,
  notBad,
  good,
  theBest
}

extension TestResultExt on TestResult{

  String get getTitle{
    switch(this){
      case TestResult.veryBad:
        return 'лютый';
      case TestResult.notBad:
        return 'немного читали о городе';
      case TestResult.good:
        return 'знаток';
      case TestResult.theBest:
        return 'сам, своего рода, пермяк';
    }
  }
  
  String get getDescription{
    switch(this){
      case TestResult.veryBad:
        return 'Вы либо совсем не знаете свой город либо вы иностранный специалист.';
      case TestResult.notBad:
        return 'Вы немного знаете свой город, но недостаточно хорошо. Советую вам хотя бы иногда читать книги про Пермь.';
      case TestResult.good:
        return 'Вы хорошо знаете историю своего города, но не настолько, чтобы впечатлить людей своими познаниями. Советую вам преисполниться в своем познании получше';
      case TestResult.theBest:
        return 'Вы очень хорошо знаете историю Перми, даже слишком хорошо. Так держать!';
    }
  }

  String get getImagePath{
    switch(this){
      case TestResult.veryBad:
        return AppUI.badResult;
      case TestResult.notBad:
        return AppUI.notbadResult;
      case TestResult.good:
        return AppUI.goodResult;
      case TestResult.theBest:
        return AppUI.theBestResult;
    }
  }
}

class ResultsPage extends StatelessWidget {
  const ResultsPage({ Key? key, required this.score }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context){
    final TestResult result = getResultByScore(score);
    return Scaffold(
      appBar: AppBar(title: const Text('Результат'),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Ваш результат $score из 10, вы ${result.getTitle}", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 40),),
            Image.asset(result.getImagePath, width: 300, height: 300, fit: BoxFit.contain,),
            Text(result.getDescription, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 25),),
            
          ],
        ),
      ),
    );
  }

  TestResult getResultByScore(int score){
    switch(score){
      case < 2:
        return TestResult.veryBad;
      case >=2 && < 5:
        return TestResult.notBad;
      case >=5 && < 7:
        return TestResult.good;
      case >=7:
        return TestResult.theBest;
    }
    return TestResult.veryBad;
  }
}