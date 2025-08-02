import 'package:learn_langs_app/models/models.dart';

final List<Lesson> n5Lessons = [
  Lesson(
    title: 'Basic Phrases',
    topic: 'Basic Phrases',
    level: 'N5',
    language: 'Japanese',
    tasks: [
      Task(
        question: 'What does "こんにちは" mean?',
        type: TaskType.multipleChoice,
        options: ['Good morning', 'Good evening', 'Hello', 'Goodbye'],
        answer: 'Hello',
      ),
      Task(
        question: 'Say "Thank you" in Japanese',
        type: TaskType.voiceRecording,
        answer: 'ありがとう',
      ),
    ],
  ),
  Lesson(
    title: 'Numbers 1-100',
    topic: 'Numbers',
    level: 'N5',
    language: 'Japanese',
    tasks: [
      Task(
        question: 'Listen and write the number',
        type: TaskType.listeningWriting,
        answer: '五十七',
      ),
      Task(
        question: 'How do you say 42 in Japanese?',
        type: TaskType.multipleChoice,
        options: ['よんじゅうに', 'にじゅうよん', 'しじゅうに', 'よんに'],
        answer: 'よんじゅうに',
      ),
    ],
  ),
];

class JapaneseN5Repository {
  static final Course n5Course = Course(
    language: 'Japanese',
    level: 'N5',
    lessons: [
      Lesson(
        title: 'Basic Phrases',
        topic: 'Basic Phrases',
        level: 'N5',
        language: 'Japanese',
        tasks: [
          Task(
            question: 'What does "こんにちは" mean?',
            type: TaskType.multipleChoice,
            options: ['Good morning', 'Good evening', 'Hello', 'Goodbye'],
            answer: 'Hello',
          ),
          Task(
            question: 'Say "Thank you" in Japanese',
            type: TaskType.voiceRecording,
            answer: 'ありがとう',
          ),
        ],
      ),
      Lesson(
        title: 'Numbers 1-100',
        topic: 'Numbers',
        level: 'N5',
        language: 'Japanese',
        tasks: [
          Task(
            question: 'Listen and write the number',
            type: TaskType.listeningWriting,
            answer: '五十七',
          ),
          Task(
            question: 'How do you say 42 in Japanese?',
            type: TaskType.multipleChoice,
            options: ['よんじゅうに', 'にじゅうよん', 'しじゅうに', 'よんに'],
            answer: 'よんじゅうに',
          ),
        ],
      ),
    ],
  );
}
