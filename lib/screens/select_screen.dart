import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_langs_app/components/build_button.dart';
import 'package:learn_langs_app/components/build_dropdown.dart';
import 'package:learn_langs_app/data/japanese/n5_lessons.dart';
import 'package:learn_langs_app/models/models.dart';
import 'package:learn_langs_app/screens/lesson_screen.dart';
import 'package:learn_langs_app/widgets/listen_writing_task.dart';
import 'package:learn_langs_app/widgets/multiple_choice_task.dart';
import 'package:learn_langs_app/widgets/voice_recording_task.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  String? selectedLevel;
  String? selectedTopic;
  String? selectedLanguage;

  List<String> currentLevels = [];

  final List<String> levels = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'];
  final List<String> japaneseLevels = ['N5', 'N4', 'N3', 'N2', 'N1'];
  final List<String> koreanLevels = [
    'Topik 1',
    'Topik 2',
    'Topik 3',
    'Topik 4',
    'Topik 5',
  ];
  final List<String> chineseLevels = [
    'HSK 1',
    'HSK 2',
    'HSK 3',
    'HSK 4',
    'HSK 5',
    'HSK 6',
  ];
  final List<String> topics = [
    'Basic Phrases',
    'Nouns',
    'Verbs',
    'Fruits',
    'Vegetables',
    'Numbers',
  ];
  final List<String> languages = [
    'Japanese',
    'Chinese',
    'Korean',
    'French',
    'German',
    'Vietnamese',
    'Antarctican',
  ];

  final List<Map<String, String>> levelsWithIcons = [
    {'name': 'Level 1', 'icon': 'assets/images/levels/1.png'},
    {'name': 'Level 2', 'icon': 'assets/images/levels/2.png'},
    {'name': 'Level 3', 'icon': 'assets/images/levels/3.png'},
    {'name': 'Level 4', 'icon': 'assets/images/levels/4.png'},
    {'name': 'Level 5', 'icon': 'assets/images/levels/5.png'},
    {'name': 'Level 6', 'icon': 'assets/images/levels/6.png'},
  ];

  final List<Map<String, String>> topicsWithIcons = [
    {'name': 'Basic Phrases', 'icon': 'assets/images/topics/basic_phrases.png'},
    {'name': 'Nouns', 'icon': 'assets/images/topics/nouns.png'},
    {'name': 'Verbs', 'icon': 'assets/images/topics/verbs.png'},
    {'name': 'Fruits', 'icon': 'assets/images/topics/fruits.png'},
    {'name': 'Vegetables', 'icon': 'assets/images/topics/vegetables.png'},
    {'name': 'Numbers', 'icon': 'assets/images/topics/numbers.png'},
  ];

  List<Map<String, String>> languagesWithIcons = [
    {'name': 'Japanese', 'icon': 'assets/images/flags/japan.png'},
    {'name': 'Chinese', 'icon': 'assets/images/flags/china.png'},
    {'name': 'Korean', 'icon': 'assets/images/flags/korea.png'},
    {'name': 'French', 'icon': 'assets/images/flags/france.png'},
    {'name': 'German', 'icon': 'assets/images/flags/germany.png'},
    {'name': 'Vietnamese', 'icon': 'assets/images/flags/vietnam.png'},
    {'name': 'Antarctican', 'icon': 'assets/images/flags/antarctica.png'},
  ];

  List<Map<String, String>> get currentLevelsWithIcons {
    List<String> baseLevels;

    switch (selectedLanguage) {
      case 'Japanese':
        baseLevels = japaneseLevels; // N5, N4...
        break;
      case 'Korean':
        baseLevels = koreanLevels; // Topik 1, Topik 2...
        break;
      case 'Chinese':
        baseLevels = chineseLevels; // HSK 1...
        break;
      default:
        baseLevels = levels; // A1, A2...
    }

    return baseLevels.asMap().entries.map((entry) {
      int index = entry.key;
      String levelName = entry.value;
      return {
        'name': levelName,
        'icon': 'assets/images/levels/${index + 1}.png',
      };
    }).toList();
  }

  final Map<String, List<Lesson>> lessonsMap = {
    'Japanese_N5': n5Lessons,
    // 'Japanese_N4': n4Lessons,
    // 'Korean_Topik 1': topik1Lessons,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'What do you want to learn?',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BuildDropdown(
                  hint: 'Please select a level',
                  itemsWithIcons: levelsWithIcons,
                  validator: 'You have not selected a level',
                  initialValue: selectedLevel,
                  onChanged: (String? value) {
                    setState(() {
                      selectedLevel = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                BuildDropdown(
                  hint: 'Please select a topic',
                  itemsWithIcons: topicsWithIcons,
                  validator: 'You have not selected a topic',
                  initialValue: selectedTopic,
                  onChanged: (String? value) {
                    setState(() {
                      selectedTopic = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                BuildDropdown(
                  hint: 'Please select a language',
                  itemsWithIcons: languagesWithIcons,
                  validator: 'You have not selected a language',
                  initialValue: selectedLanguage,
                  onChanged: (String? value) {
                    setState(() {
                      selectedLanguage = value;
                    });
                  },
                ),
                // const SizedBox(height: 10),
                // TextButton(
                //   onPressed: () {
                //     debugPrint('Ширина: ${MediaQuery.of(context).size.width}');
                //     debugPrint('Высота: ${MediaQuery.of(context).size.height}');
                //   },
                //   child: const Text('Get Size'),
                // ),
              ],
            ),

            SizedBox(
              width: double.infinity,
              child: BuildButton(
                text: 'Start Learning',
                onPressed: () {
                  if (selectedLevel == null ||
                      selectedTopic == null ||
                      selectedLanguage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Вы не выбрали что-то!')),
                    );
                    return;
                  }

                  dynamic repository;
                  if (selectedLanguage == 'Japanese' &&
                      selectedLevel == 'Level 1') {
                    repository = JapaneseN5Repository.n5Course;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Курс для $selectedLanguage $selectedLevel еще не доступен',
                        ),
                      ),
                    );
                    return;
                  }

                  try {
                    final lesson = repository.lessons.firstWhere(
                      (l) => l.topic == selectedTopic,
                    );

                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => LessonScreen(lesson: lesson),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Урок по теме "$selectedTopic" не найден',
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
