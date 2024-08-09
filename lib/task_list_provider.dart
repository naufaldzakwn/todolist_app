import 'package:flutter/material.dart';
import 'task_model.dart';
import 'api_service.dart';

class TaskListProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  bool _isLoading = true;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  final ApiService apiService = ApiService();

  TaskListProvider() {
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tasks = await apiService.fetchTasks();
    } catch (e) {
      // Handle error here
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTask(Task task) async {
    try {
      final newTask = await apiService.addTask(task);
      _tasks.add(newTask);
      notifyListeners();
    } catch (e) {
      // Handle error here
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await apiService.updateTask(task);
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = task;
        notifyListeners();
      }
    } catch (e) {
      // Handle error here
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await apiService.deleteTask(id);
      _tasks.removeWhere((task) => task.id == id);
      notifyListeners();
    } catch (e) {
      // Handle error here
    }
  }
}