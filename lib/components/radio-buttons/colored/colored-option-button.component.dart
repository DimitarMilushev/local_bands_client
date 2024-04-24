
import 'package:flutter/material.dart';

class ColorButtonOption extends StatelessWidget {
  final String hex;
  final bool isSelected;
  final VoidCallback? onColorSelected;

  const ColorButtonOption(
      {super.key,
      required this.hex,
      required this.isSelected,
      this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onColorSelected,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                isSelected ? Border.all(color: Colors.black, width: 2.0) : null,
          ),
          padding: const EdgeInsets.all(2),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(int.parse(hex, radix: 16) + 0xFF000000),
            ),
          )),
    );
  }
}