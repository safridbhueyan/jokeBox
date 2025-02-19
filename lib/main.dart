import 'package:flutter/material.dart';
import 'package:jokeapi/home_interface.dart';
import 'package:jokeapi/services/joke_api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JokeApi()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Myhomepage(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
