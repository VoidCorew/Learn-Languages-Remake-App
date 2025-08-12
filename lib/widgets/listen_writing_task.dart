import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learn_langs_app/components/build_button.dart';
import 'package:learn_langs_app/components/build_sound_button.dart';
import 'package:learn_langs_app/models/models.dart';

class ListenWritingTask extends StatefulWidget {
  final Task task;
  final VoidCallback onPressed;
  const ListenWritingTask({
    super.key,
    required this.task,
    required this.onPressed,
  });

  @override
  State<ListenWritingTask> createState() => _ListenWritingTaskState();
}

class _ListenWritingTaskState extends State<ListenWritingTask> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final bool _pressed = false;
  final TextEditingController _hearController = TextEditingController();

  Future<void> _playSound(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }

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
                widget.task.question!,
                style: TextStyle(fontSize: 25, fontFamily: 'Nunito'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              BuildSoundButton(
                isListening: _pressed,
                onTap: () => _playSound(widget.task.audioPath!),
              ),
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
                controller: _hearController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  hint: const Text(
                    'Enter what you heard...',
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.deepOrange[200]!,
                      width: 3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.deepOrange, width: 3),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: BuildButton(
                  text: 'Confirm',
                  onPressed: () {
                    if (_hearController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text('Вы ничего не ввели!')),
                      );
                      return;
                    }
                    _showDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    final correctAnswer = widget.task.correctAnswer;
    final isCorrect = _hearController.text == correctAnswer;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.task),
        title: Text(
          isCorrect ? 'Correct!' : 'Incorrect',
          style: TextStyle(
            fontFamily: 'Nunito',
            color: isCorrect ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          isCorrect ? 'You are right' : 'Try again',
          style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
        ),
        actions: [
          BuildButton(
            text: 'Try again',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          BuildButton(text: 'Next task', onPressed: widget.onPressed),
        ],
      ),
    );
  }
}
