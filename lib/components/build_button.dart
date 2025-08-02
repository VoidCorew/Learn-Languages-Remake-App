import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_langs_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class BuildButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;

  const BuildButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.onLongPress,
  });

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  bool _pressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() => _pressed = true);
    HapticFeedback.lightImpact();
  }

  void _handleTapUp(TapUpDetails details) async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => _pressed = false);
    widget.onPressed();
  }

  void _handleTapCancel() {
    setState(() => _pressed = false);
  }

  // void _handleLongPress() {
  //   if (widget.onLongPress != null) {
  //     HapticFeedback.heavyImpact();
  //     widget.onLongPress!();
  //   }
  // }

  void _handleLongPressStart(LongPressStartDetails details) {
    setState(() => _pressed = true);
    HapticFeedback.heavyImpact();
    widget.onLongPress?.call();
  }

  void _handleLongPressEnd(LongPressEndDetails details) {
    setState(() => _pressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      // onLongPress: _handleLongPress,
      onLongPressStart: _handleLongPressStart,
      onLongPressEnd: _handleLongPressEnd,
      child: AnimatedContainer(
        transform: _pressed
            ? Matrix4.translationValues(0, 4, 0)
            : Matrix4.identity(),
        duration: Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: _pressed
              ? (themeProvider.isDark ? Colors.red[400]! : Colors.red[600]!)
              : (themeProvider.isDark ? Colors.red[900] : Colors.red),
          borderRadius: BorderRadius.circular(20),
          boxShadow: _pressed
              ? []
              : [
                  BoxShadow(
                    color: themeProvider.isDark
                        ? Colors.red[400]!
                        : Colors.red[900]!,
                    offset: Offset(0, 4),
                  ),
                ],
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
