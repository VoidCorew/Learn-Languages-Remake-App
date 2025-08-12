import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_langs_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(FluentIcons.arrow_left_24_regular),
        ),
        title: const Text('Settings', style: TextStyle(fontFamily: 'Nunito')),
      ),
      // backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'General',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(5),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                    bottom: Radius.circular(5),
                  ),
                ),
                tileColor: themeProvider.isDark
                    ? Colors.grey[850]
                    : Colors.amber[100],
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
                subtitle: const Text(
                  'Turn on dark mode',
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
                trailing: CupertinoSwitch(
                  value: themeProvider.isDark,
                  onChanged: (bool value) {
                    themeProvider.toggleTheme();
                  },
                ),
                // Switch(
                //   value: _isActive,
                //   onChanged: (bool value) {
                //     setState(() {
                //       _isActive = value;
                //     });
                //   },
                // ),
                // onTap: () {},
              ),
            ),
            const SizedBox(height: 5),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(5),
                bottom: Radius.circular(20),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(5),
                    bottom: Radius.circular(20),
                  ),
                ),
                tileColor: themeProvider.isDark
                    ? Colors.grey[850]
                    : Colors.amber[100],
                title: const Text(
                  'Language',
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
                subtitle: const Text(
                  'Select display language',
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(FluentIcons.arrow_down_24_regular),
                ),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            //   child: const Text('fsd'),
            // ),
            // Expanded(
            //   child: ListView.separated(
            //     // padding: const EdgeInsets.all(16),
            //     itemCount: items.length,
            //     separatorBuilder: (_, __) => const SizedBox(height: 6),
            //     itemBuilder: (context, index) {
            //       final isFirst = index == 0;
            //       final isLast = index == items.length - 1;

            //       return Material(
            //         color: Colors.transparent,
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(isFirst ? 20 : 8),
            //           topRight: Radius.circular(isFirst ? 20 : 8),
            //           bottomLeft: Radius.circular(isLast ? 20 : 8),
            //           bottomRight: Radius.circular(isLast ? 20 : 8),
            //         ),
            //         clipBehavior: Clip.antiAlias,
            //         child: InkWell(
            //           onTap: () {
            //             debugPrint('Tapped: ${items[index]}');
            //           },
            //           splashColor: Theme.of(
            //             context,
            //           ).primaryColor.withValues(alpha: 0.2), // цвет ripple
            //           highlightColor: Colors.transparent, // убираем "залипание"
            //           child: ListTile(
            //             tileColor: Colors.amber[200],
            //             title: Text(items[index]),
            //             trailing: const Icon(Icons.chevron_right),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
