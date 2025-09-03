import 'package:flutter_test/flutter_test.dart';
import 'package:tasksphere/models/task.dart';

void main() {
  group('Task Model Tests', () {
    test('Task creation with required fields', () {
      final now = DateTime.now();
      final task = Task(
        id: '1',
        title: 'Test Task',
        createdAt: now,
      );

      expect(task.id, '1');
      expect(task.title, 'Test Task');
      expect(task.description, '');
      expect(task.createdAt, now);
      expect(task.dueDate, null);
      expect(task.priority, TaskPriority.medium);
      expect(task.status, TaskStatus.pending);
    });

    test('Task creation with all fields', () {
      final now = DateTime.now();
      final due = now.add(const Duration(days: 7));
      final task = Task(
        id: '2',
        title: 'Complete Task',
        description: 'A detailed description',
        createdAt: now,
        dueDate: due,
        priority: TaskPriority.high,
        status: TaskStatus.inProgress,
      );

      expect(task.id, '2');
      expect(task.title, 'Complete Task');
      expect(task.description, 'A detailed description');
      expect(task.createdAt, now);
      expect(task.dueDate, due);
      expect(task.priority, TaskPriority.high);
      expect(task.status, TaskStatus.inProgress);
    });

    test('Task copyWith functionality', () {
      final now = DateTime.now();
      final task = Task(
        id: '3',
        title: 'Original Task',
        createdAt: now,
      );

      final updatedTask = task.copyWith(
        title: 'Updated Task',
        status: TaskStatus.completed,
      );

      expect(updatedTask.id, '3');
      expect(updatedTask.title, 'Updated Task');
      expect(updatedTask.status, TaskStatus.completed);
      expect(updatedTask.createdAt, now);
      expect(updatedTask.priority, TaskPriority.medium);
    });

    test('Task JSON serialization and deserialization', () {
      final now = DateTime.now();
      final originalTask = Task(
        id: '4',
        title: 'JSON Task',
        description: 'Test JSON conversion',
        createdAt: now,
        priority: TaskPriority.high,
        status: TaskStatus.completed,
      );

      final json = originalTask.toJson();
      final deserializedTask = Task.fromJson(json);

      expect(deserializedTask.id, originalTask.id);
      expect(deserializedTask.title, originalTask.title);
      expect(deserializedTask.description, originalTask.description);
      expect(deserializedTask.createdAt, originalTask.createdAt);
      expect(deserializedTask.priority, originalTask.priority);
      expect(deserializedTask.status, originalTask.status);
    });

    test('Task equality', () {
      final now = DateTime.now();
      final task1 = Task(id: '5', title: 'Task 1', createdAt: now);
      final task2 = Task(id: '5', title: 'Task 2', createdAt: now);
      final task3 = Task(id: '6', title: 'Task 1', createdAt: now);

      expect(task1 == task2, true); // Same ID
      expect(task1 == task3, false); // Different ID
      expect(task1.hashCode == task2.hashCode, true);
    });

    test('TaskPriority enum values', () {
      expect(TaskPriority.values.length, 4);
      expect(TaskPriority.values, [
        TaskPriority.low,
        TaskPriority.medium,
        TaskPriority.high,
        TaskPriority.urgent,
      ]);
    });

    test('TaskStatus enum values', () {
      expect(TaskStatus.values.length, 4);
      expect(TaskStatus.values, [
        TaskStatus.pending,
        TaskStatus.inProgress,
        TaskStatus.completed,
        TaskStatus.cancelled,
      ]);
    });
  });
}