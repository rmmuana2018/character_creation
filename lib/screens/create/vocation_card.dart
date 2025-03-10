import 'package:flutter/material.dart';

import '../../models/vocation.dart';
import '../../theme.dart';
import '../../widgets/styled_text.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({super.key, required this.vocation, required this.onTap, required this.selected});

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(vocation),
      child: Card(
        color: selected ? AppColors.secondaryColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            // vocation image
            Image.asset('assets/images/vocations/${vocation.image}', width: 80, colorBlendMode: BlendMode.color, color: !selected ? Colors.black.withOpacity(0.8) : Colors.transparent),
            const SizedBox(width: 10),
            // vocation name & description
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [StyledHeading(vocation.title), StyledText(vocation.description)])),
          ]),
        ),
      ),
    );
  }
}
