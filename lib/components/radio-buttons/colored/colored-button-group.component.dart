import 'package:flutter/material.dart';
import 'package:local_bands_client/components/radio-buttons/colored/colored-option-button.component.dart';

class ColorButtonGroup extends StatelessWidget {
  final List<String> colors;
  final int selectedIndex;
  final Function(int) onColorSelected;
  const ColorButtonGroup(
      {super.key,
      required this.colors,
      required this.selectedIndex,
      required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        size: const Size.fromHeight(64),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return ColorButtonOption(
              hex: colors[index],
              isSelected: selectedIndex == index,
              onColorSelected: () {
                onColorSelected(index);
              },
            );
          },
        ));
  }
}
