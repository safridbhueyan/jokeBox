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
        debugShowCheckedModeBanner: true,
        home: const JokeScreen(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<JokeApi>().getJoke());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<JokeApi>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error.isNotEmpty) {
            return Center(
                child: Text(provider.error,
                    style: const TextStyle(color: Colors.red)));
          }
          return Myhomepage();
        },
      ),
    );
  }
}

// class confetch extends StatelessWidget {
//   const confetch({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Consumer<JokeApi>(
//         builder: (context, jokeApi, child) {
//           if (jokeApi.isLoading) {
//             return const CircularProgressIndicator();
//           }
//           if (jokeApi.error.isNotEmpty) {
//             return Text('Error: ${jokeApi.error}');
//           }
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   jokeApi.joke?.joke ?? 'No joke loaded',
//                   style: const TextStyle(fontSize: 18),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () => jokeApi.getJoke(),
//                 child: const Text('Get New Joke'),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
