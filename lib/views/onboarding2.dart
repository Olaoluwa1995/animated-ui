import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_test/constants/app_colors.dart';
import 'package:ui_test/constants/app_fonts.dart';
import 'package:ui_test/constants/app_images.dart';
import 'package:ui_test/models/day_model.dart';
import 'package:ui_test/utils/app_utils.dart';
import 'package:ui_test/views/widgets/custom_button.dart';
import 'package:ui_test/views/widgets/days_container.dart';
import 'package:ui_test/views/widgets/item_row.dart';
import 'package:ui_test/views/widgets/rounded_container.dart';

class Onboarding2Screen extends StatefulWidget {
  const Onboarding2Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding2Screen> createState() => _Onboarding2ScreenState();
}

class _Onboarding2ScreenState extends State<Onboarding2Screen>
    with TickerProviderStateMixin {
  bool change = true;
  List<Day> days = [];
  List<int> selectedDays1 = [2, 7];
  List<int> selectedDays2 = [1, 2, 5, 7];

  void toggle() {
    setState(() {
      change = !change;
    });
  }

  bool isDayExist(int id, List<int> dayList) {
    if (dayList.contains(id)) {
      return true;
    } else {
      return false;
    }
  }

  void toggleAdd(int id, List<int> dayList) {
    setState(() {
      if (!isDayExist(id, dayList)) {
        dayList.add(id);
      } else {
        dayList.remove(id);
      }
    });
  }

  late AnimationController controller;
  @override
  initState() {
    super.initState();
    // Initialize AnimationController
    initController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void initController() {
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: AppUtils.animDuration);
    controller.reverseDuration =
        const Duration(milliseconds: AppUtils.animDuration);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    days = Days.items;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: CustomButton(
        onTap: () {},
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.03,
          ),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Column(
          children: [
            Text(
              'Set bedtime and wake up',
              style: AppFonts.text.copyWith(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: toggle,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: AppUtils.animDuration),
                  child: change
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Image.asset(
                            AppImages.clock1,
                            key: const Key('1'),
                            fit: BoxFit.fitHeight,
                            height: 230,
                          ),
                        )
                      : Image.asset(
                          AppImages.clock2,
                          key: const Key('2'),
                          fit: BoxFit.fitHeight,
                          height: 250,
                        ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.bulb,
                  fit: BoxFit.cover,
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: AnimatedSwitcher(
                    duration:
                        const Duration(milliseconds: AppUtils.animDuration),
                    transitionBuilder: (child, animation) => SizeTransition(
                      sizeFactor: animation,
                      child: child,
                    ),
                    child: AnimatedSwitcher(
                      duration:
                          const Duration(milliseconds: AppUtils.animDuration),
                      child: change
                          ? AnimatedDefaultTextStyle(
                              curve: Curves.easeIn,
                              duration: const Duration(
                                  milliseconds: AppUtils.animDuration),
                              style: AppFonts.text.copyWith(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              child: const Text(
                                'Under your sleep goal ( 8hrs )',
                              ),
                            )
                          : Text(
                              'Over your sleep goal ( 8hrs )',
                              style: AppFonts.text.copyWith(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 30.0, left: size.width * 0.03, right: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemRow(
                    icon: AppImages.star,
                    firstText: 'Bedtime',
                    secondText: Text(
                      '12:00 AM',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ItemRow(
                    icon: AppImages.sun,
                    firstText: 'Wake up',
                    secondText: AnimatedSwitcher(
                      duration:
                          const Duration(milliseconds: AppUtils.animDuration),
                      child: change
                          ? AnimatedDefaultTextStyle(
                              curve: Curves.easeIn,
                              duration: const Duration(
                                  milliseconds: AppUtils.animDuration),
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 7.0),
                                child: Text(
                                  '6:30 AM',
                                ),
                              ),
                            )
                          : Text(
                              '11:00 AM',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
            RoundedContainer(
              height: 103,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Repeat days',
                    style: AppFonts.text.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration:
                        const Duration(milliseconds: AppUtils.animDuration),
                    child: change
                        ? DaysContainer(
                            days: days,
                            selectedDays: selectedDays1,
                            toggleAdd: toggleAdd,
                            isDayExist: isDayExist,
                          )
                        : DaysContainer(
                            days: days,
                            selectedDays: selectedDays2,
                            toggleAdd: toggleAdd,
                            isDayExist: isDayExist,
                          ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                AppUtils.showDetails(context, initController, controller);
              },
              child: RoundedContainer(
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Remind me before bed time',
                      style: AppFonts.text.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '30 mins',
                      style: AppFonts.text.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
