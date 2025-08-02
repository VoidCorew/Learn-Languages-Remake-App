import 'package:flutter/material.dart';
import 'package:learn_langs_app/providers/theme_provider.dart';
import 'package:learn_langs_app/screens/select_screen.dart';
import 'package:learn_langs_app/screens/select_screen_remake.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SelectScreen(),
    );
  }
}
