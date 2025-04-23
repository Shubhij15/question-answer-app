import 'package:flutter/material.dart';
import 'package:flutter_application_2/question_screen.dart';
import 'package:flutter_application_2/start_screen.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/result_screen.dart';


class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State <Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{    //underscore is used to create private class or properties
 List<String> selectedAnswers = [];
 var activeScreen = 'start - screen';     //Widget? activeScreen;

  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';    //const QuestionScreen();
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question_screen';
    });
  }


  @override
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'question-screen') {
       screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
        );

    }

    if (activeScreen == 'results-screen'){
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers, 
        onRestart: restartQuiz,
        );
    }

   
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                 Color.fromARGB(255, 154, 82, 226),
                 Color.fromARGB(255, 44, 10, 82),
              ],
              begin:Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}