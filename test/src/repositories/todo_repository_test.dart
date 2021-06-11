import 'package:app_todo_mvc/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = TodoRepository();
  test('deve trazer uma lista de TodoModel', () async {
    final list = await repository.fetchAll();
    expect(list[1].title, "quis ut nam facilis et officia qui");
  });
}
