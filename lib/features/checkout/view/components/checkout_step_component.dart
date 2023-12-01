
import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';

class StepRow extends StatelessWidget {
  const StepRow({super.key, required this.step});
  final int step;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundContainer(isCompleted: step >= 1, stepNum: 1),
          SizedBox(
            width: size.width * 0.2,
            child: const Divider(),
          ),
          RoundContainer(isCompleted: step >= 2, stepNum: 2),
          SizedBox(
            width: size.width * 0.2,
            child: const Divider(),
          ),
          const RoundContainer(
            isCompleted: false,
            stepNum: 3,
          ),
        ],
      ),
    );
  }
}

class RoundContainer extends StatelessWidget {
  const RoundContainer(
      {super.key, required this.isCompleted, required this.stepNum});
  final bool isCompleted;
  final int stepNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCompleted ? AppTheme.whiteColor : AppTheme.blueColor,
          border: Border.all(color: AppTheme.blueColor)),
      child: isCompleted
          ? const Icon(
              Icons.check,
              color: AppTheme.blueColor,
            )
          : Center(
              child: Text(
                "$stepNum",
                style: txt14White,
              ),
            ),
    );
  }
}
