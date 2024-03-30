import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perm_game_app/test_page/presentation/results_page.dart';
import 'package:perm_game_app/test_page/presentation/test_page.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/background.png"),
                fit: BoxFit.cover)),
        child: Row(
          children: [Expanded(
            child: Column(
              children: [
                Flexible(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "Игра про Пермь",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 105, fontWeight: FontWeight.bold),
                      ),
                    )),
                    Flexible(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(child: Align(alignment: Alignment.bottomLeft, child: Image.asset('assets/img/vovan_1.png'))),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 141),
                                child: OutlinedButton(
                                  style:  OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(50),
                                
                                    side: const BorderSide(width: 8, color: Colors.white)),
                                  onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const ResultsPage(score: 7),), ), child: Text("Начать игру", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 39, fontWeight: FontWeight.bold),),),
                              ),
                            ),
                          ),
                          Expanded(child: Align(alignment: Alignment.bottomRight, child: Image.asset('assets/img/vovan_2.png'))),
                        ],
                      ),
                    ))
              ],
            ),
          ),],
        ),
      ),
    );
  }
}
