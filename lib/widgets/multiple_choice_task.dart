import 'package:flutter/material.dart';
import 'package:learn_langs_app/components/build_appbar.dart';
import 'package:learn_langs_app/components/build_button.dart';
import 'package:learn_langs_app/models/models.dart';

class MultipleChoiceTask extends StatefulWidget {
  final Task task;
  final void Function(bool isCorrect) onAnswer;
  const MultipleChoiceTask({
    super.key,
    required this.task,
    required this.onAnswer,
  });

  @override
  State<MultipleChoiceTask> createState() => _MultipleChoiceTaskState();
}

class _MultipleChoiceTaskState extends State<MultipleChoiceTask> {
  // final List<String> answers = ['Carotte', 'Pomme', 'Banane', 'Tomate'];
  int? selectedIndex;
  int? pressedIndex;

  @override
  Widget build(BuildContext context) {
    final answers = widget.task.options ?? [];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.task.question!,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 15),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: answers.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                final isPressed = pressedIndex == index;
                final answer = answers[index];

                return GestureDetector(
                  onTapDown: (_) {
                    setState(() => pressedIndex = index);
                  },
                  onTapUp: (_) {
                    if (isSelected) {
                      setState(() => pressedIndex = null);
                    } else {
                      setState(() => pressedIndex = index);
                    }
                  },
                  onTapCancel: () {
                    setState(() => pressedIndex = index);
                  },
                  onTap: () {
                    setState(() {
                      selectedIndex = (selectedIndex == index) ? null : index;
                    });
                  },
                  child: AnimatedContainer(
                    transform: isPressed
                        ? Matrix4.translationValues(5, 5, 0)
                        : Matrix4.identity(),
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      // border: isSelected
                      //     ? Border.all(color: Colors.blueAccent, width: 2)
                      //     : Border.all(color: Colors.transparent, width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: isSelected ? Colors.grey[300] : Colors.grey[350],
                      boxShadow: isPressed
                          ? []
                          : [
                              BoxShadow(
                                color: Colors.grey,
                                // blurRadius: 6,
                                offset: const Offset(5, 5),
                              ),
                            ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          answer,
                          style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: BuildButton(
                text: 'Continue',
                onPressed: selectedIndex == null
                    ? () {}
                    : () {
                        final selectedAnswer =
                            widget.task.options![selectedIndex!];
                        final isCorrect = selectedAnswer == widget.task.answer;
                        widget.onAnswer(isCorrect);
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
