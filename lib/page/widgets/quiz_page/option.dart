import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_quiz/constants.dart';
import 'package:my_quiz/contollers/question_controller.dart';

class Option extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;

  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return kGreenColor;
              } else if (index == qnController.selectedAns && qnController.selectedAns != qnController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getRigthIcon() {
            return getRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: kDeafaultPadding),
              padding: const EdgeInsets.all(kDeafaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getRightColor()),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1}. $text',
                    style: TextStyle(
                      color: getRightColor(),
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getRightColor() == kGrayColor ? Colors.transparent : getRightColor(),
                      border: Border.all(color: getRightColor()),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: getRigthIcon() == kGrayColor
                        ? null
                        : Icon(
                            getRigthIcon(),
                            size: 16,
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
