enum TaskType { multipleChoice, voiceRecording, listeningWriting }

class Task {
  final String? question;
  final List<String>? options;
  final TaskType type;
  final String? correctAnswer;
  final String? imagePath;
  final String? audioPath;

  const Task({
    this.question,
    this.options,
    required this.type,
    required this.correctAnswer,
    this.imagePath,
    this.audioPath,
  });
}

class Lesson {
  final String topic;
  final String level;
  final String language;
  final List<Task> tasks;

  const Lesson({
    required this.topic,
    required this.level,
    required this.language,
    required this.tasks,
  });
}
