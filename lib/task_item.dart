import 'package:flutter/material.dart';
import 'task_model.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: task.description != null ? Text(task.description!) : null,
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (bool? value) {
          // Update status tugas
          // Akan diimplementasikan di bagian provider
        },
      ),
      onLongPress: () {
        // Implementasikan penghapusan tugas jika diinginkan
      },
    );
  }
}