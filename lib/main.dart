import 'package:flutter/material.dart';
import './src/intro/intro.dart';
import './src/auth/login.dart';
import './src/pages/home.dart';
import './src/widgets/pokemon/pokemon_list.dart';
import 'src/auth/login.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Lato',
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginForm(),
        // '/': (context) => const PokemonList(),
        // '/': (context) => Intro(),
        '/login': (context) => const LoginForm(),
        '/home': (context) => const Home(),
      },
    );
  }
}
