import 'package:flutter/material.dart';
import 'package:ui_test/constants/app_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    this.text = 'Next',
  }) : super(key: key);

  final Function() onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            transform: GradientRotation(315),
            stops: [0, 100],
            colors: [
              Color(0xFF7F5BFF),
              Color(0xFF8338EC),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 10,
              color: Color(0xFFBDACFB),
            ),
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 10,
              color: Color.fromRGBO(0, 0, 0, 0.37),
            ),
            BoxShadow(
              offset: Offset(3, 1),
              blurRadius: 15,
              color: Color.fromRGBO(255, 255, 255, 0.5),
            )
          ],
        ),
        child: Center(
          child: Text(
            text!,
            style: AppFonts.text.copyWith(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
