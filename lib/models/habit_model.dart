import 'package:ui_test/constants/app_images.dart';

class Habit {
  final int id;
  final String text;
  final String icon;

  const Habit({
    required this.id,
    required this.text,
    required this.icon,
  });
}

class Habits {
  static const List<Habit> goodItems = [
    Habit(
      id: 1,
      text: 'Set bedtime and wake up',
      icon: AppImages.bedtime,
    ),
    Habit(
      id: 2,
      text: 'Take a walk',
      icon: AppImages.walk,
    ),
    Habit(
      id: 3,
      text: 'Stay hydrated',
      icon: AppImages.bottle,
    ),
    Habit(
      id: 4,
      text: 'Call parents',
      icon: AppImages.call,
    ),
    Habit(
      id: 5,
      text: 'Donate to charity',
      icon: AppImages.donate,
    ),
  ];

  static const List<Habit> badItems = [
    Habit(
      id: 1,
      text: 'Can’t wake up',
      icon: AppImages.bedtime,
    ),
    Habit(
      id: 2,
      text: 'Getting lazy for workout',
      icon: AppImages.walk,
    ),
    Habit(
      id: 3,
      text: 'Forgetting to drink water',
      icon: AppImages.bottle,
    ),
    Habit(
      id: 4,
      text: 'Spending on credit cards',
      icon: AppImages.donate,
    ),
  ];
}
