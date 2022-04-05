class Day {
  final int id;
  final String text;

  const Day({
    required this.id,
    required this.text,
  });
}

class Days {
  static const List<Day> items = [
    Day(
      id: 1,
      text: 'M',
    ),
    Day(
      id: 2,
      text: 'T',
    ),
    Day(
      id: 3,
      text: 'W',
    ),
    Day(
      id: 4,
      text: 'T',
    ),
    Day(
      id: 5,
      text: 'F',
    ),
    Day(
      id: 6,
      text: 'S',
    ),
    Day(
      id: 7,
      text: 'S',
    ),
  ];
}
