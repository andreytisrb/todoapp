class Task {
  final String name;
  bool isChecked;

  Task({this.name, this.isChecked});

  toggle() => isChecked = !isChecked;

  Task.fromMappedJson( Map<String, dynamic> json):
      name = json['name'],
      isChecked = json['isChecked'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'isChecked': isChecked,
      };
}
