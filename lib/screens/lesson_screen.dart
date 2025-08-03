import 'package:flutter/material.dart';
import 'package:learn_langs_app/components/build_appbar.dart';
import 'package:learn_langs_app/models/models.dart';
import 'package:learn_langs_app/widgets/listen_writing_task.dart';
import 'package:learn_langs_app/widgets/multiple_choice_task.dart';
import 'package:learn_langs_app/widgets/voice_recording_task.dart';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;
  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _currentTaskIndex = 0;

  void _goToNextTask() {
    if (_currentTaskIndex < widget.lesson.tasks.length - 1) {
      setState(() {
        _currentTaskIndex++;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _onAnswer(bool isCorrect) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isCorrect ? '✅ Correct!' : '❌ Wrong!')),
    );

    Future.delayed(const Duration(seconds: 1), _goToNextTask);
  }

  @override
  Widget build(BuildContext context) {
    final currentTask = widget.lesson.tasks[_currentTaskIndex];

    return Scaffold(
      appBar: BuildAppBar(
        currentTask: _currentTaskIndex + 1,
        totalTasks: widget.lesson.tasks.length,
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: _buildTaskType(currentTask),
    );
  }

  Widget _buildTaskType(Task task) {
    switch (task.type) {
      case TaskType.multipleChoice:
        return MultipleChoiceTask(task: task, onAnswer: _onAnswer);
      case TaskType.voiceRecording:
        return VoiceRecordingTask(task: task, onAnswer: _onAnswer);
      case TaskType.listeningWriting:
        return ListenWritingTask(currentTaskIndex: _currentTaskIndex);
    }
  }
}
