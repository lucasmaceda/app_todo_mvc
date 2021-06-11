import 'dart:convert';
import 'package:http/http.dart' as http;

Future main() async {
  final json = await fetch();
  print(json);
}

Future<Todo> fetch() async {
  var url = "https://jsonplaceholder.typicode.com/todos/1";
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  var todo = Todo.fromJson(json);
  return todo;
}

class Todo {
  final String title;
  final int id;
  final int userId;
  final bool completed;

  Todo({this.title, this.id, this.userId, this.completed});

  // converte json  para map
  factory Todo.fromJson(Map json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  // converte map para json
  Map toJson() {
    return {'id': id, 'title': title, 'completed': completed, 'userId': userId};
  }
}
