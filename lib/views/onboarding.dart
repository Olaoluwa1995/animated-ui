import 'package:flutter/material.dart';
import 'package:ui_test/constants/app_colors.dart';
import 'package:ui_test/constants/app_fonts.dart';
import 'package:ui_test/constants/app_images.dart';
import 'package:ui_test/models/habit_model.dart';
import 'package:ui_test/views/onboarding2.dart';
import 'package:ui_test/views/widgets/custom_button.dart';
import 'package:ui_test/views/widgets/habit_card.dart';
import 'package:ui_test/views/widgets/progress_bar.dart';
import 'package:ui_test/views/widgets/tab_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _controller;
  int selectedIndex = 0;
  int selectedItem = 1;
  int selectedBadItem = 1;

  @override
  void initState() {
    _tabController = TabController(
        length: 2, animationDuration: const Duration(seconds: 2), vsync: this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      value: 1,
    );

    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void select(int id) {
    setState(() {
      selectedItem = id;
    });
  }

  void selectBad(int id) {
    setState(() {
      selectedBadItem = id;
    });
  }

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const goodHabits = Habits.goodItems;
    const badHabits = Habits.badItems;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: CustomButton(
        onTap: () {
          Navigator.of(context).push(createRoute(const Onboarding2Screen()));
        },
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          margin: const EdgeInsets.only(top: 15),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          color: AppColors.backgroundColor,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const ProgressBar(),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.1),
                    child: Text('1 of 4', style: AppFonts.text),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'What’s your main goal?',
                  style: AppFonts.text.copyWith(
                    color: const Color(0xFF383E53),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Let’s start with one of these habits.',
                  style: AppFonts.text.copyWith(
                    color: const Color(0xFF383E53),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TabBar(
                  controller: _tabController,
                  // isScrollable: true,
                  indicatorColor: AppColors.primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3,
                  onTap: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                    _controller.forward(from: 0.2);
                  },
                  labelStyle: AppFonts.text
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: const Color(0xFF939295),
                  tabs: [
                    Tab(
                      child: TabItem(
                        text: 'Start a good habit',
                        image: selectedIndex == 0
                            ? AppImages.coloredLeaf
                            : AppImages.leaf,
                      ),
                    ),
                    Tab(
                      child: TabItem(
                        text: 'Break a bad habit',
                        image: selectedIndex == 1
                            ? AppImages.coloredFlash
                            : AppImages.flash,
                      ),
                    ),
                  ],
                ),
              ),
              FadeTransition(
                opacity: _controller,
                child: SizedBox(
                  height: 500,
                  child: TabBarView(controller: _tabController, children: [
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                          itemCount: goodHabits.length,
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 30),
                          itemBuilder: (BuildContext context, int index) {
                            final Habit habit = goodHabits[index];
                            return GestureDetector(
                              onTap: () => select(habit.id),
                              child: HabitCard(
                                  habit: habit, selectedItem: selectedItem),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                          itemCount: badHabits.length,
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 30),
                          itemBuilder: (BuildContext context, int index) {
                            final Habit habit = badHabits[index];
                            return GestureDetector(
                              onTap: () => selectBad(habit.id),
                              child: HabitCard(
                                  habit: habit,
                                  selectedItem: selectedBadItem,
                                  isBad: true),
                            );
                          }),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
