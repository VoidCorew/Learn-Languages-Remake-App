import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_langs_app/components/build_button.dart';
import 'package:learn_langs_app/components/build_dropdown.dart';
import 'package:learn_langs_app/screens/levels_screen.dart';
import 'package:learn_langs_app/screens/settings_screen.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  String? selectedLanguage;

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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            icon: Icon(FluentIcons.settings_24_regular),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'What do you want to learn?',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 60),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: BuildButton(
                text: 'Start Learning',
                onPressed: () {
                  if (selectedLanguage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Вы не выбрали язык!',
                          style: TextStyle(fontFamily: 'Nunito'),
                        ),
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          LevelsScreen(language: selectedLanguage!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
