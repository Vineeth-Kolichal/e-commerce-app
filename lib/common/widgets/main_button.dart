import 'package:ecommerce_machine_test_jurysoft/utils/theme.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color buttonColor;
  final double widthFactor;
  const MainButton({
    super.key,
    required this.label,
    required this.buttonColor,
    required this.onPressed,
    this.widthFactor = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialButton(
      height: 45,
      minWidth: size.width * widthFactor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(width: 0.5, color: AppTheme.lightGreyColor1)),
      color: buttonColor,
      onPressed: onPressed,
      child: Text(
        label,
        style: txt17BlackB,
      ),
    );
  }
}
