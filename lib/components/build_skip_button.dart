import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildSkipButton extends StatefulWidget {
  final VoidCallback onPressed;
  const BuildSkipButton({super.key, required this.onPressed});

  @override
  State<BuildSkipButton> createState() => _BuildSkipButtonState();
}

class _BuildSkipButtonState extends State<BuildSkipButton> {
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
        // customBorder: const CircleBorder(),
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onLongPressEnd: _handleLongPressEnd,
        onLongPressStart: _handleLongPressStart,
        onTap: () {},
        child: AnimatedContainer(
          transform: _pressed
              ? Matrix4.translationValues(5, 5, 0)
              : Matrix4.identity(),
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: _pressed
                ? []
                : [BoxShadow(color: Colors.red, offset: Offset(5, 5))],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.skip_next_rounded,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
      ),
    );
  }
}
