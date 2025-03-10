import 'package:flutter/material.dart';

import '../../models/character.dart';
import '../../theme.dart';
import '../../widgets/styled_button.dart';
import '../../widgets/styled_text.dart';
import 'skill_list.dart';
import 'stats_table.dart';

class Profile extends StatelessWidget {
  final Character character;

  const Profile({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // basic info - image, vocation, description
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset('assets/images/vocations/${character.vocation.image}', width: 140, height: 140),
                  const SizedBox(width: 20),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [StyledHeading(character.vocation.title), StyledText(character.vocation.description)]))
                ],
              ),
            ),
            // weapon and ability
            const SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeading('Weapon of Choice'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeading('Unique Ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            // stats & skills
            Container(alignment: Alignment.center, child: Column(children: [StatsTable(character), SkillList(character)])),
            // save button
            StyledButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const StyledHeading('Character saved.'), showCloseIcon: true, backgroundColor: AppColors.secondaryColor, duration: const Duration(seconds: 2))),
              child: const StyledHeading('save character'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
