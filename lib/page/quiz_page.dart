import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quiz/contollers/question_controller.dart';
import 'package:my_quiz/page/widgets/quiz_page/body_quiz_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              _controller.nextQuestion();
            },
            child: Text(
              'Skip',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
