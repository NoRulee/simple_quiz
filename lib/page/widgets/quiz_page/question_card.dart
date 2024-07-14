// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_quiz/constants.dart';
import 'package:my_quiz/contollers/question_controller.dart';
import 'package:my_quiz/models/questions.dart';
import 'package:my_quiz/page/widgets/quiz_page/option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDeafaultPadding),
      padding: const EdgeInsets.all(kDeafaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: kBlackColor,
                ),
          ),
          const SizedBox(height: kDeafaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              text: question.options[index],
              index: index,
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
