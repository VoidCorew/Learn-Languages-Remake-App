import 'package:flutter/material.dart';
import 'package:learn_langs_app/providers/theme_provider.dart';
import 'package:learn_langs_app/screens/select_screen.dart';
import 'package:learn_langs_app/screens/select_screen_remake.dart';
import 'package:learn_langs_app/screens/test/my_home_page.dart';
import 'package:learn_langs_app/widgets/voice_recording_task.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const LearnLanguagesApp(),
    ),
  );
}

class LearnLanguagesApp extends StatelessWidget {
  const LearnLanguagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.currentTheme,
      home: SelectScreen(),
    );
  }
}
