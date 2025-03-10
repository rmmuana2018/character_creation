import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/character_store.dart';
import '../../widgets/styled_button.dart';
import '../../widgets/styled_text.dart';
import '../create/create.dart';
import 'character_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle('Your Characters'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          // list of characters
          Expanded(child: Consumer<CharacterStore>(builder: (context, value, child) => ListView.builder(itemCount: value.characters.length, itemBuilder: (_, index) => CharacterCard(value.characters[index])))),
          StyledButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => const CreateScreen())), child: const StyledHeading('Create New')),
        ]),
      ),
    );
  }
}
