class Task {
  final String name;
  bool isChecked;

  Task({this.name, this.isChecked});

  toggle() => isChecked = !isChecked;
}
