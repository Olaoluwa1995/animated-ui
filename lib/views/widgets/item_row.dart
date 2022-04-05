import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemRow extends StatelessWidget {
  const ItemRow({
    Key? key,
    required this.icon,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final String icon;
  final String firstText;
  final Widget secondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          fit: BoxFit.cover,
          height: 20,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstText,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Color(0xFF939295),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: secondText,
            )
          ],
        )
      ],
    );
  }
}
