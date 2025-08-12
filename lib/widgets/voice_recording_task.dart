import 'package:flutter/material.dart';
import 'package:learn_langs_app/components/build_button.dart';
import 'package:learn_langs_app/components/build_mic_button.dart';
import 'package:learn_langs_app/components/build_skip_button.dart';
import 'package:learn_langs_app/models/models.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceRecordingTask extends StatefulWidget {
  final Task task;
  final void Function(bool isCorrect) onAnswer;
  final VoidCallback onSkipPressed;
  const VoiceRecordingTask({
    super.key,
    required this.task,
    required this.onAnswer,
    required this.onSkipPressed,
  });

  @override
  State<VoiceRecordingTask> createState() => _VoiceRecordingTaskState();
}

class _VoiceRecordingTaskState extends State<VoiceRecordingTask> {
  int? selectedIndex;
  final List<String> answers = ['Carotte', 'Pomme', 'Banane', 'Tomate'];
  final String correctAnswer = 'Carotte';

  late stt.SpeechToText _speech;
  bool _speechEnabled = false;
  bool _isListening = false;
  String _recognizedText = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    _speechEnabled = await _speech.initialize();
    setState(() {});
  }

  void _startListening() async {
    if (!_speechEnabled) {
      debugPrint('Speech not initialized yet');
      return;
    }
    _speech.listen(
      onResult: (result) {
        setState(() {
          _recognizedText = result.recognizedWords;
        });
        if (result.finalResult) {
          _checkAnswer(_recognizedText);
          _stopListening();
        }
      },
      localeId: 'ja_JP',
      pauseFor: Duration(seconds: 2),
      listenFor: Duration(seconds: 10),
    );
    setState(() {
      _isListening = true;
    });
  }

  void _stopListening() async {
    await _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  void _checkAnswer(String userAnswer) {
    final normalizedUser = userAnswer.toLowerCase();
    final normalizedCorrect = correctAnswer.toLowerCase();

    final isCorrect = normalizedUser == normalizedCorrect;

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(isCorrect ? 'Правильно' : 'Неправильно'),
    //     backgroundColor: isCorrect ? Colors.green : Colors.red,
    //     duration: const Duration(seconds: 2),
    //   ),
    // );

    // if (isCorrect) {
    //   Future.delayed(const Duration(seconds: 1), () {
    //     widget.onAnswer(true);
    //   });
    // }

    if (isCorrect) {
      widget.onAnswer(true);
    } else {
      widget.onAnswer(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  color: Colors.deepOrange[300],
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      children: [
                        Text(
                          widget.task.question!,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        ClipOval(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Image.asset(
                                widget.task.imagePath ??
                                    'assets/placeholders/image_placeholder.png',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // const SizedBox(height: 30),
                        // GridView.builder(
                        //   shrinkWrap: true,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   itemCount: answers.length,
                        //   itemBuilder: (context, index) {
                        //     final isSelected = selectedIndex == index;
                        //     return Material(
                        //       color: Colors.transparent,
                        //       borderRadius: BorderRadius.circular(20),
                        //       child: InkWell(
                        //         borderRadius: BorderRadius.circular(20),
                        //         onTap: () {
                        //           setState(() {
                        //             if (selectedIndex == index) {
                        //               selectedIndex = null;
                        //             } else {
                        //               selectedIndex = index;
                        //             }
                        //           });
                        //         },
                        //         child: Container(
                        //           padding: const EdgeInsets.all(10),
                        //           decoration: BoxDecoration(
                        //             color: isSelected
                        //                 ? Colors.grey[200]
                        //                 : Colors.white,
                        //             borderRadius: BorderRadius.circular(20),
                        //             border: isSelected
                        //                 ? Border.all(
                        //                     color: Colors.black54,
                        //                     width: 2,
                        //                   )
                        //                 : null,
                        //           ),
                        //           child: Text(
                        //             'Carotte',
                        //             textAlign: TextAlign.center,
                        //             style: TextStyle(
                        //               fontFamily: 'Nunito',
                        //               fontSize: 18,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   gridDelegate:
                        //       SliverGridDelegateWithFixedCrossAxisCount(
                        //         crossAxisCount: 2,
                        //         mainAxisSpacing: 10,
                        //         crossAxisSpacing: 10,
                        //         childAspectRatio: 3,
                        //       ),
                        // ),
                        const SizedBox(height: 60),
                        // Text(
                        //   _recognizedText.isEmpty
                        //       ? 'Say Word'
                        //       : 'You said: $_recognizedText',
                        //   style: TextStyle(
                        //     fontFamily: 'Nunito',
                        //     fontSize: 18,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 20,
                bottom: 20,
                child: BuildSkipButton(
                  // onPressed: () {
                  //   final isCorrect =
                  //       _recognizedText == widget.task.correctAnswer;
                  //   widget.onAnswer(isCorrect);
                  // },
                  onPressed: _showDialog,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildMicSoundButton(
                isListening: _isListening,
                onTap: _isListening ? _stopListening : _startListening,
              ),
              const SizedBox(width: 20),
              Text(
                _isListening ? 'Listening...' : 'Tap to say',
                style: TextStyle(fontSize: 20, fontFamily: 'Nunito'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.skip_next),
        title: Text(
          'Skip',
          style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Do you actually want to skip this task?',
          style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
        ),
        actions: [
          BuildButton(
            text: 'No',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          BuildButton(text: 'Yes', onPressed: widget.onSkipPressed),
        ],
      ),
    );
  }
}
