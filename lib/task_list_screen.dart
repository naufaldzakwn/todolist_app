import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_list_provider.dart';
import 'task_item.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Consumer<TaskListProvider>(
        builder: (context, taskListProvider, child) {
          if (taskListProvider.tasks.isEmpty) {
            return Center(child: Text('No tasks available'));
          }

          return ListView.builder(
            itemCount: taskListProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskListProvider.tasks[index];
              return TaskItem(task: task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke layar tambah tugas jika diperlukan
        },
        child: Icon(Icons.add),
      ),
    );
  }
}