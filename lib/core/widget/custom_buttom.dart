import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    
    super.key,
    this.borderRadius,
    required this.text,
    this.onPressed,
    this.textcolor = Colors.white,
    required this.backgroundColor,
  });
  final BorderRadius? borderRadius;
  final String text;
  final Color backgroundColor;
  final Color textcolor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: Styles.textStyle20.copyWith(
            fontSize: 23,
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
