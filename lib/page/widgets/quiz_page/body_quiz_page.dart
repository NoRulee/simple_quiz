import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_quiz/constants.dart';
import 'package:my_quiz/contollers/question_controller.dart';
import 'package:my_quiz/page/widgets/quiz_page/progress_bar.dart';
import 'package:my_quiz/page/widgets/quiz_page/question_card.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/icons/background.svg",
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDeafaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDeafaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDeafaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Question ${_questionController.questionNumber}",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: kSecondaryColor,
                          ),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: kSecondaryColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: kDeafaultPadding),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateQuestNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (contex, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
