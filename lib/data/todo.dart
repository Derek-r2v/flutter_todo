class Todo {
  String title;
  String memo;
  int color;
  int done;
  String category;
  int date;

  Todo({this.title, this.memo, this.color, this.done, this.category, this.date});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      memo: json['memo'],
      color: json['color'],
      done: json['done'],
      category: json['category'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['memo'] = memo;
    data['color'] = color;
    data['done'] = done;
    data['category'] = category;
    data['date'] = date;
    return data;
  }
}
