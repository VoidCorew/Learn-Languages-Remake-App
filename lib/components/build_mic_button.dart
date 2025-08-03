import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildMicSoundButton extends StatefulWidget {
  final bool isListening;
  final VoidCallback onTap;
  const BuildMicSoundButton({
    super.key,
    required this.isListening,
    required this.onTap,
  });

  @override
  State<BuildMicSoundButton> createState() => _BuildMicSoundButtonState();
}

class _BuildMicSoundButtonState extends State<BuildMicSoundButton> {
  bool _pressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() => _pressed = true);
    HapticFeedback.lightImpact();
  }

  void _handleTapUp(TapUpDetails details) async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => _pressed = false);
  }

  void _handleTapCancel() {
    setState(() => _pressed = false);
  }

  void _handleLongPressStart(LongPressStartDetails details) {
    setState(() => _pressed = true);
    HapticFeedback.heavyImpact();
  }

  void _handleLongPressEnd(LongPressEndDetails details) {
    setState(() => _pressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onLongPressEnd: _handleLongPressEnd,
        onLongPressStart: _handleLongPressStart,
        // customBorder: const CircleBorder(),
        onTap: widget.onTap,
        child: AnimatedContainer(
          transform: _pressed
              ? Matrix4.translationValues(5, 5, 0)
              : Matrix4.identity(),
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: widget.isListening ? Colors.red : Colors.deepOrange,
            borderRadius: BorderRadius.circular(20),
            // shape: BoxShape.circle,
            boxShadow: _pressed
                ? []
                : [
                    BoxShadow(
                      color: Colors.deepOrange[300]!,
                      offset: Offset(5, 5),
                    ),
                  ],
          ),
          child: Icon(Icons.mic, color: Colors.white),
        ),
      ),
    );
  }
}
