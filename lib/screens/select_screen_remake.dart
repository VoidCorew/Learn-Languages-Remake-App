import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_langs_app/components/build_button.dart';
import 'package:learn_langs_app/components/build_dropdown.dart';
import 'package:learn_langs_app/widgets/multiple_choice_task.dart';

class SelectScreenRemake extends StatefulWidget {
  const SelectScreenRemake({super.key});

  @override
  State<SelectScreenRemake> createState() => _SelectScreenRemakeState();
}

class _SelectScreenRemakeState extends State<SelectScreenRemake> {
  String? selectedLevel;
  String? selectedTopic;
  String? selectedLanguage;

  List<Map<String, String>> currentLevelsWithIcons = [];

  final Map<String, List<Map<String, String>>> levelsByLanguage = {
    'Japanese': [
      {'name': 'N5', 'icon': 'assets/images/levels/1.png'},
      {'name': 'N4', 'icon': 'assets/images/levels/2.png'},
      {'name': 'N3', 'icon': 'assets/images/levels/3.png'},
      {'name': 'N2', 'icon': 'assets/images/levels/4.png'},
      {'name': 'N1', 'icon': 'assets/images/levels/5.png'},
    ],
    'Chinese': [
      {'name': 'HSK 1', 'icon': 'assets/images/levels/1.png'},
      {'name': 'HSK 2', 'icon': 'assets/images/levels/2.png'},
      {'name': 'HSK 3', 'icon': 'assets/images/levels/3.png'},
      {'name': 'HSK 4', 'icon': 'assets/images/levels/4.png'},
      {'name': 'HSK 5', 'icon': 'assets/images/levels/5.png'},
      {'name': 'HSK 6', 'icon': 'assets/images/levels/6.png'},
    ],
    'Korean': [
      {'name': 'TOPIK 1', 'icon': 'assets/images/levels/1.png'},
      {'name': 'TOPIK 2', 'icon': 'assets/images/levels/2.png'},
      {'name': 'TOPIK 3', 'icon': 'assets/images/levels/3.png'},
      {'name': 'TOPIK 4', 'icon': 'assets/images/levels/4.png'},
      {'name': 'TOPIK 5', 'icon': 'assets/images/levels/5.png'},
    ],
    'German': [
      {'name': 'A1', 'icon': 'assets/images/levels/1.png'},
      {'name': 'A2', 'icon': 'assets/images/levels/2.png'},
      {'name': 'B1', 'icon': 'assets/images/levels/3.png'},
      {'name': 'B2', 'icon': 'assets/images/levels/4.png'},
      {'name': 'C1', 'icon': 'assets/images/levels/5.png'},
      {'name': 'C2', 'icon': 'assets/images/levels/6.png'},
    ],
    'Vietnamese': [
      {'name': 'A1', 'icon': 'assets/images/levels/1.png'},
      {'name': 'A2', 'icon': 'assets/images/levels/2.png'},
      {'name': 'B1', 'icon': 'assets/images/levels/3.png'},
      {'name': 'B2', 'icon': 'assets/images/levels/4.png'},
      {'name': 'C1', 'icon': 'assets/images/levels/5.png'},
      {'name': 'C2', 'icon': 'assets/images/levels/6.png'},
    ],
    'Antarctican': [
      {'name': 'A1', 'icon': 'assets/images/levels/1.png'},
      {'name': 'A2', 'icon': 'assets/images/levels/2.png'},
      {'name': 'B1', 'icon': 'assets/images/levels/3.png'},
      {'name': 'B2', 'icon': 'assets/images/levels/4.png'},
      {'name': 'C1', 'icon': 'assets/images/levels/5.png'},
      {'name': 'C2', 'icon': 'assets/images/levels/6.png'},
    ],
  };

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
              children: [
                BuildDropdown(
                  hint: 'Please select a language',
                  itemsWithIcons: languagesWithIcons,
                  validator: 'You have not selected a language',
                  initialValue: selectedLanguage,
                  onChanged: (String? value) {
                    setState(() {
                      selectedLanguage = value;
                      // selectedLevel = null;
                      // currentLevelsWithIcons = levelsByLanguage[value!] ?? [];
                    });
                  },
                ),
                const SizedBox(height: 20),
                BuildDropdown(
                  hint: 'Please select a level',
                  itemsWithIcons: currentLevelsWithIcons,
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
              ],
            ),

            SizedBox(
              width: double.infinity,
              child: BuildButton(
                text: 'Start Learning',
                onPressed: () {
                  if (selectedLanguage == null ||
                      selectedLevel == null ||
                      selectedTopic == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Вы не выбрали что-то!')),
                    );
                    return;
                  }

                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => MultipleChoiceTask(),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
