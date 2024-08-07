import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_quiz/constants.dart';
import 'package:my_quiz/contollers/question_controller.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/icons/background.svg',
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                'Score',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                '${_qnController.correctAns * 10}/${_qnController.questions.length * 10}',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
