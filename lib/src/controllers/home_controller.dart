import 'package:app_todo_mvc/src/models/todo_model.dart';
import 'package:app_todo_mvc/src/repositories/todo_repository.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([TodoRepository repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchAll();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, sucess, error }
