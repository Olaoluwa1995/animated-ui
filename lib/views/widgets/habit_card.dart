import 'package:flutter/material.dart';
import 'package:ui_test/constants/app_colors.dart';
import 'package:ui_test/constants/app_fonts.dart';
import 'package:ui_test/models/habit_model.dart';

class HabitCard extends StatefulWidget {
  const HabitCard({
    Key? key,
    required this.habit,
    required this.selectedItem,
    this.isBad = false,
  }) : super(key: key);

  final Habit habit;
  final int selectedItem;
  final bool? isBad;

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: 72,
      width: size.width,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: widget.selectedItem == widget.habit.id
                ? AppColors.primaryColor
                : Colors.transparent,
            width: 1.5),
        color: widget.selectedItem == widget.habit.id
            ? const Color(0xFFF8F3FF)
            : Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            spreadRadius: 4,
            blurRadius: 10,
            color: Color.fromRGBO(24, 39, 75, 0.07),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F3FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: widget.habit.id == 1 ||
                        widget.habit.id == 3 ||
                        widget.habit.id == 5
                    ? 10
                    : !widget.isBad! && widget.habit.id == 4
                        ? 5
                        : widget.isBad! && widget.habit.id == 4
                            ? 10
                            : 0,
                left: widget.habit.id == 1 || widget.habit.id == 3
                    ? 10
                    : !widget.isBad! && widget.habit.id == 4
                        ? 12
                        : 0,
                right: widget.habit.id == 2 ? 10 : 0,
              ),
              child: Image.asset(
                widget.habit.icon,
                fit: BoxFit.contain,
                height: 60,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              widget.habit.text,
              style: AppFonts.text.copyWith(
                color: widget.selectedItem == widget.habit.id
                    ? AppColors.primaryColor
                    : const Color(0xFF383E53),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
