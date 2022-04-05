import 'package:flutter/material.dart';
import 'package:ui_test/constants/app_fonts.dart';
import 'package:ui_test/views/widgets/custom_button.dart';

class AppUtils {
  static const int animDuration = 400;

  static void showDetails(BuildContext context, dynamic initController,
      AnimationController controller) {
    const minutes = [20, 25, 30, 35, 40];
    showModalBottomSheet(
        backgroundColor: Colors.white,
        transitionAnimationController: controller,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.36),
          ),
        ),
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 2,
                  width: 30,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(96)),
                ),
                Text(
                  'Reminder',
                  style: AppFonts.text.copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF383E53),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: minutes.length,
                    itemBuilder: (BuildContext context, int index) {
                      final min = minutes[index];
                      return GestureDetector(
                        onTap: () {},
                        child: AnimatedContainer(
                          duration: const Duration(
                              milliseconds: AppUtils.animDuration),
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: min == 30
                                      ? BorderSide(
                                          color: Colors.grey.withOpacity(0.1))
                                      : BorderSide.none)),
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          margin: const EdgeInsets.only(right: 8),
                          child: Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: min == 30 ? 60 : 0),
                              child: Text(
                                '$min ${min == 30 ? '   min' : ''}',
                                style: AppFonts.text.copyWith(
                                  color: min == 30
                                      ? const Color(0xFF383E53)
                                      : const Color(0xFF939295),
                                  fontSize: min == 30 ? 24 : 20,
                                  fontWeight: min == 30
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CustomButton(
                    onTap: () => Navigator.of(context).pop(), text: 'Done'),
              ],
            ),
          );
        }).whenComplete(() => initController());
  }
}
