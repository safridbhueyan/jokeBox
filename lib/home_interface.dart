import 'package:flutter/material.dart';
import 'package:jokeapi/services/bottomsheet.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<JokeApi>(context, listen: false).fetxh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JokeApi>(context, listen: true);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 82, 110),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              RichText(
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
              const SizedBox(height: 40),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      margin: const EdgeInsets.all(25),
                      height: 290,
                      width: MediaQuery.of(context).size.width * 0.86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color.fromARGB(255, 236, 227, 230),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Center(
                        child: provider.isloading!
                            ? const CircularProgressIndicator(
                                color: Color.fromARGB(255, 3, 73, 114),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Text(
                                      provider.joke?.setup ??
                                          "No joke available",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Text(
                                      provider.joke?.delivery ?? "Keep waiting",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                // runSpacing: 20,
                // alignment: WrapAlignment.center,
                children: [
                  Mybutton(
                    text: "Dark",
                    ontap: () => provider.steFlage("sexist"),
                  ),
                  Mybutton(
                    text: "Racist",
                    ontap: () => provider.steFlage("racist"),
                  ),
                  Mybutton(
                    text: "NfSW",
                    ontap: () => provider.steFlage("nfsw"),
                  ),
                  Mybutton(
                    text: "Political",
                    ontap: () => provider.steFlage("political"),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Mybutton(
                      text: "Pun",
                      ontap: () => provider.steFlage("religious"),
                    ),
                    const SizedBox(width: 15),
                    Mybutton(
                      text: "Spooky",
                      ontap: () => provider.steFlage("explicit"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Center(
                child: Column(children: [
                  Mybutton2(
                    text: "Get the joke",
                    ontap: () {
                      provider.fetxh();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Mybutton2(text: "Get premium access")
                  TextButton(
                      onPressed: () {
                        showbottomSheet(context: context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
                      },
                      child: Text(
                        "Get premium access",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFFFFFFFF)),
                      )),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
