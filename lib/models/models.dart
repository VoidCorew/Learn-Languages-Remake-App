enum TaskType { multipleChoice, voiceRecording, listeningWriting }

class Task {
  // final String id;
  final String? question;
  final List<String>? options;
  final TaskType type;
  final String? answer;
  final String? imagePath;
  final String? correctMicAnswer;

  const Task({
    // required this.id,
    this.question,
    this.options,
    required this.type,
    required this.answer,
    this.imagePath,
    this.correctMicAnswer,
  });
}

class Lesson {
  final String title;
  final String topic;
  final String level;
  final String language;
  final List<Task> tasks;

  const Lesson({
    required this.title,
    required this.topic,
    required this.level,
    required this.language,
    required this.tasks,
  });
}
