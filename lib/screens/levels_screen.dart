import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_langs_app/data/levels_data.dart';
import 'package:learn_langs_app/providers/theme_provider.dart';
import 'package:learn_langs_app/screens/topics_screen.dart';
import 'package:provider/provider.dart';

class LevelsScreen extends StatelessWidget {
  final String language;
  const LevelsScreen({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    final levels = levelsData[language]!;
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$language - Levels',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10.0),
        itemCount: levels.length,
        separatorBuilder: (_, __) => const SizedBox(height: 6),
        itemBuilder: (context, index) {
          final isFirst = index == 0;
          final isLast = index == levels.length - 1;
          final level = levels[index];

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
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        TopicsScreen(language: language, level: level),
                  ),
                );
              },
              splashColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: 0.2),
              highlightColor: Colors.transparent,
              child: ListTile(
                // tileColor: Colors.red,
                tileColor: themeProvider.isDark
                    ? Colors.grey[850]
                    : Colors.deepOrange[50],
                title: Text(
                  levels[index],
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          );
        },
      ),

      // ListView.builder(
      //   itemCount: levels.length,
      //   itemBuilder: (context, index) {
      //     final level = levels[index];
      //     return ListTile(
      //       leading: const Icon(Icons.leak_remove_outlined),
      //       title: Text(level, style: TextStyle(fontFamily: 'Nunito')),
      //       trailing: const Icon(Icons.arrow_forward_ios_rounded),
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           CupertinoPageRoute(
      //             builder: (context) =>
      //                 TopicsScreen(language: language, level: level),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
