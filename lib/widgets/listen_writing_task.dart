import 'package:flutter/material.dart';
import 'package:learn_langs_app/components/build_mic_button.dart';

class ListenWritingTask extends StatefulWidget {
  final int currentTaskIndex;
  const ListenWritingTask({super.key, required this.currentTaskIndex});

  @override
  State<ListenWritingTask> createState() => _ListenWritingTaskState();
}

class _ListenWritingTaskState extends State<ListenWritingTask> {
  final bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Введите то, что вы услышали',
                style: TextStyle(fontSize: 25, fontFamily: 'Nunito'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              BuildMicSoundButton(isListening: _pressed, onTap: () {}),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(20),
              //     border: Border.all(color: Colors.black, width: 2),
              //   ),
              //   child: InkWell(
              //     child: Padding(
              //       padding: const EdgeInsets.all(16.0),
              //       child: Icon(Icons.volume_up_rounded),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.note_alt_rounded),
                  hint: const Text(
                    'Введите текст...',
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
