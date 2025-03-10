import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home/home.dart';
import 'services/character_store.dart';
import 'theme.dart';

void main() => runApp(ChangeNotifierProvider(create: (context) => CharacterStore(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner: false, theme: primaryTheme, home: const Home());
}
