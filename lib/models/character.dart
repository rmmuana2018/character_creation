import 'skill.dart';
import 'stats.dart';
import 'vocation.dart';

class Character with Stats {
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name, slogan, id;
  bool _isFav = false;

  Character({required this.name, required this.slogan, required this.vocation, required this.id});

  get isFav => _isFav;

  void toggleIsFav() => _isFav = !_isFav;

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

// dummy character data
List<Character> characters = [
  Character(id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Kapumf!'),
  Character(id: '2', name: 'Jonny', vocation: Vocation.junkie, slogan: 'Light me up...'),
  Character(id: '3', name: 'Crimson', vocation: Vocation.raider, slogan: 'Fire in the hole!'),
  Character(id: '4', name: 'Shaun', vocation: Vocation.ninja, slogan: 'Alright then gang.'),
];
