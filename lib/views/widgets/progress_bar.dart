import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 6,
          width: size.width * 0.5,
          decoration: BoxDecoration(
            color: const Color(0xFFE9E9E9),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        Container(
          height: 6,
          width: size.width * 0.125,
          decoration: BoxDecoration(
            color: const Color(0xFFFFB706),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ],
    );
  }
}
