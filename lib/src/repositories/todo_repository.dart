import 'package:app_todo_mvc/src/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchAll() async {
    final response = await http.get(Uri.parse(url));
    final list = response.body as List;
    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
