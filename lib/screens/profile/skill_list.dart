import 'package:flutter/material.dart';

import '../../models/character.dart';
import '../../models/skill.dart';
import '../../theme.dart';
import '../../widgets/styled_text.dart';

class SkillList extends StatefulWidget {
  final Character character;

  const SkillList(this.character, {super.key});

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    availableSkills = allSkills.where((skill) => skill.vocation == widget.character.vocation).toList();
    widget.character.skills.isEmpty ? selectedSkill = availableSkills[0] : selectedSkill = widget.character.skills.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.secondaryColor.withOpacity(0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const StyledHeading('Choose an active skill'),
            const StyledText('Skills are unique to your vocation.'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: availableSkills
                  .map(
                    (skill) => Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(2),
                      color: skill == selectedSkill ? Colors.yellow : Colors.transparent,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          widget.character.updateSkills(skill);
                          selectedSkill = skill;
                        }),
                        child: Image.asset('assets/images/skills/${skill.image}', width: 70),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10),
            StyledText(selectedSkill.name),
          ],
        ),
      ),
    );
  }
}
