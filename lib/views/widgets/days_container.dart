import 'package:flutter/material.dart';
import 'package:ui_test/constants/app_fonts.dart';
import 'package:ui_test/models/day_model.dart';
import 'package:ui_test/utils/app_utils.dart';

class DaysContainer extends StatelessWidget {
  const DaysContainer({
    Key? key,
    required this.days,
    required this.selectedDays,
    required this.toggleAdd,
    required this.isDayExist,
  }) : super(key: key);

  final List<Day> days;
  final List<int> selectedDays;
  final Function(int, List<int>) toggleAdd;
  final Function(int, List<int>) isDayExist;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 60,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (BuildContext context, int index) {
          final Day day = days[index];
          return GestureDetector(
            onTap: () => toggleAdd(day.id, selectedDays),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: AppUtils.animDuration),
              height: 36,
              width: 36,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              margin: const EdgeInsets.only(right: 8),
              decoration: isDayExist(day.id, selectedDays)
                  ? const BoxDecoration(
                      gradient: LinearGradient(
                        stops: [0, 100],
                        colors: [
                          Color(0xFF7F5BFF),
                          Color(0xFF8338EC),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 7),
                          blurRadius: 5,
                          color: Color(0xFFBDACFB),
                        ),
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 6,
                          spreadRadius: -8,
                          color: Color.fromRGBO(0, 0, 0, 0.37),
                        ),
                        BoxShadow(
                          offset: Offset(3, 1),
                          blurRadius: 10,
                          spreadRadius: -17,
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                        )
                      ],
                      shape: BoxShape.circle,
                    )
                  : const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                        0xFFF6F7FB,
                      ),
                    ),
              child: Center(
                child: Text(
                  day.text,
                  style: AppFonts.text.copyWith(
                    color: isDayExist(day.id, selectedDays)
                        ? Colors.white
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
