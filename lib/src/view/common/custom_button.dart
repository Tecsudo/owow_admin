import 'package:flutter/material.dart';

class CustomGradientElevatedButton extends StatelessWidget {
  const CustomGradientElevatedButton({
    super.key,
    required this.minimumSize,
    required this.buttonText,
    required this.onPressed,
    this.decoration,
    this.colors = const [Color(0xFF76A968), Color(0xFF4E8649)],
  });
  final Size minimumSize;
  final List<Color> colors;
  final Widget buttonText;
  final Function() onPressed;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 10,
      shadowColor: Colors.black,
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(1.00, 0.00),
              end: const Alignment(-1, 0),
              colors: colors,
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: minimumSize,
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: onPressed,
          child: buttonText,
        ),
      ),
    );
  }
}

class CustomSolidElevatedButton extends StatelessWidget {
  const CustomSolidElevatedButton({
    super.key,
    required this.minimumSize,
    required this.buttonText,
    required this.onPressed,
    required this.backgroundColor,
  });
  final Size minimumSize;
  final Widget buttonText;
  final Function() onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 10,
      shadowColor: Colors.black,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: minimumSize,
          backgroundColor: backgroundColor,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onPressed,
        child: buttonText,
      ),
    );
  }
}
