import 'package:flutter/material.dart';
import './src/intro/intro.dart';
import './src/auth/login.dart';

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
        '/': (context) => Intro(),
        '/login': (context) => const LoginScreen(),
        // '/profile': (context) => const Profile(),
        // 'profile-edit': (context) => const ProfileEdit(),
      },
      // home: Intro(),
    );
  }
}
