import 'package:flutter/material.dart';

import '../../models/character.dart';
import '../../theme.dart';
import '../../widgets/styled_text.dart';
import '../profile/profile.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(children: [
            Image.asset('assets/images/vocations/${character.vocation.image}', width: 80),
            const SizedBox(width: 20),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [StyledHeading(character.name), StyledText(character.vocation.title)]),
            const Expanded(child: SizedBox()),
            Icon(Icons.arrow_forward, color: AppColors.textColor),
          ]),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => Profile(character: character))),
      ),
    );
  }
}
