import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:jokeapi/firebase_options.dart';
import 'package:jokeapi/home_interface.dart';
import 'package:jokeapi/services/allprovider.dart';
import 'package:jokeapi/services/firebaseAuth.dart';

import 'package:jokeapi/services/joke_api.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JokeApi()),
        ChangeNotifierProvider(create: (_) => Allprovider()),
        ChangeNotifierProvider(create: (_) => Fya()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Myhomepage(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
