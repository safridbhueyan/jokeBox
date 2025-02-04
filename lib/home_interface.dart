import 'package:flutter/material.dart';
import 'package:jokeapi/services/joke_api.dart';
import 'package:jokeapi/services/mybutton.dart';
import 'package:provider/provider.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JokeApi>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 48, 82, 110),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: RichText(
            text: const TextSpan(
              text: "joke",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'Trajan Pro',
                fontSize: 35,
              ),
              children: [
                TextSpan(
                  text: "Box",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Trajan Pro',
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    height: 350,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.black12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(5.5, 8.5),
                          blurRadius: 15.5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    height: 290,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color.fromARGB(255, 236, 227, 230),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            provider.joke!.setup.toString() ??
                                "No joke available",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                              provider.joke!.delivery.toString() ??
                                  "keep waiting",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ]),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Wrap(
                spacing: 10,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: const [
                  Mybutton(text: "Dark"),
                  Mybutton(text: "Racist"),
                  Mybutton(text: "NfSW"),
                  Mybutton(text: "Political"),
                ],
              ),
              const SizedBox(height: 25),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Mybutton(text: "Pun"),
                    SizedBox(width: 15),
                    Mybutton(text: "Spooky"),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: Mybutton2(
                  text: "get the joke",
                  ontap: () {
                    provider.getJoke();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
