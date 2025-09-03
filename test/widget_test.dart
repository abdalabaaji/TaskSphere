import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tasksphere/main.dart';

void main() {
  group('TaskSphere App Tests', () {
    testWidgets('App starts with correct title', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TaskSphereApp());

      // Verify that the app title is displayed
      expect(find.text('TaskSphere - Task Management'), findsOneWidget);
      expect(find.text('Welcome to TaskSphere!'), findsOneWidget);
    });

    testWidgets('Task counter starts at zero', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TaskSphereApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });

    testWidgets('Task counter increments when button is pressed', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TaskSphereApp());

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Multiple task additions work correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TaskSphereApp());

      // Tap the '+' icon multiple times
      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pump();

      // Verify that our counter shows 3
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('Add Task button works', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TaskSphereApp());

      // Find and tap the elevated button
      await tester.tap(find.text('Add Task'));
      await tester.pump();

      // Verify that counter incremented
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('UI elements are present', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TaskSphereApp());

      // Verify that key UI elements are present
      expect(find.byIcon(Icons.task_alt), findsOneWidget);
      expect(find.text('Tasks Created:'), findsOneWidget);
      expect(find.text('Your productivity companion for task management'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.text('Add Task'), findsOneWidget);
    });
  });
}