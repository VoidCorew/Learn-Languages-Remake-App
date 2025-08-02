enum TaskType { multipleChoice, voiceRecording, listeningWriting }

class Task {
  // final String id;
  final String question;
  final List<String>? options;
  final TaskType type;
  final String? answer;
  final String? imagePath;

  const Task({
    // required this.id,
    required this.question,
    this.options,
    required this.type,
    required this.answer,
    this.imagePath,
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

class Course {
  final String language;
  final String level;
  final List<Lesson> lessons;

  const Course({
    required this.language,
    required this.level,
    required this.lessons,
  });
}
