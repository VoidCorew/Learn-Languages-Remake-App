import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_langs_app/data/lessons_data.dart';
import 'package:learn_langs_app/data/topics_data.dart';
import 'package:learn_langs_app/providers/theme_provider.dart';
import 'package:learn_langs_app/screens/lesson_screen.dart';
import 'package:provider/provider.dart';

class TopicsScreen extends StatelessWidget {
  final String language;
  final String level;
  const TopicsScreen({super.key, required this.language, required this.level});

  @override
  Widget build(BuildContext context) {
    final topics = topicsData['${language}_$level'] ?? [];
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$language - $level Topics',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10.0),
        itemCount: topics.length,
        separatorBuilder: (_, __) => const SizedBox(height: 6),
        itemBuilder: (context, index) {
          final isFirst = index == 0;
          final isLast = index == topics.length - 1;
          final topic = topics[index];

          return Material(
            color: Colors.transparent,
            elevation: 10,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isFirst ? 20 : 8),
              topRight: Radius.circular(isFirst ? 20 : 8),
              bottomLeft: Radius.circular(isLast ? 20 : 8),
              bottomRight: Radius.circular(isLast ? 20 : 8),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                final key = '${language}_${level}_$topic';
                final lesson = lessonsData[key];
                if (lesson != null) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => LessonScreen(lesson: lesson),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Урок не найден',
                        style: TextStyle(fontFamily: 'Nunito'),
                      ),
                    ),
                  );
                }
              },
              splashColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: 0.2),
              highlightColor: Colors.transparent,
              child: ListTile(
                tileColor: themeProvider.isDark
                    ? Colors.grey[850]
                    : Colors.deepOrange[50],
                title: Text(
                  topics[index],
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          );
        },
      ),

      // ListView.builder(
      //   itemCount: topics.length,
      //   itemBuilder: (context, index) {
      //     final topic = topics[index];
      //     return ListTile(
      //       title: Text(topic, style: TextStyle(fontFamily: 'Nunito')),
      //       onTap: () {
      //         final key = '${language}_${level}_$topic';
      //         final lesson = lessonsData[key];
      //         if (lesson != null) {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (_) => LessonScreen(lesson: lesson),
      //             ),
      //           );
      //         } else {
      //           ScaffoldMessenger.of(
      //             context,
      //           ).showSnackBar(SnackBar(content: Text('Урок не найден')));
      //         }
      //       },
      //     );
      //   },
      // ),
    );
  }
}
