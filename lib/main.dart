import 'package:flutter/material.dart';
import './src/intro/intro.dart';
import './src/auth/login.dart';
import './src/pages/home.dart';

void main() {
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
        '/': (context) => const Home(),
        // '/': (context) => Intro(),
        '/login': (context) => const LoginForm(),
        // '/home': (context) => const HompePage(),
        // 'profile-edit': (context) => const ProfileEdit(),
      },
      // home: Intro(),
    );
  }
}
