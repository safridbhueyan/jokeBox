import 'package:flutter/material.dart';
import 'package:jokeapi/services/bottomsheet.dart';
import 'package:jokeapi/services/firebaseAuth.dart';
import 'package:jokeapi/services/joke_api.dart';
import 'package:jokeapi/services/mybutton.dart';
import 'package:provider/provider.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimController = TextEditingController();
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
    final fyacall = context.read<Fya>();

    void login() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        print("Please enter both email and password");
        return;
      }

      await fyacall.login(email, password);
    }

    void register() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        print("Please enter both email and password");
        return;
      }
      @override
      // ignore: unused_element
      void dispose() {
        emailController.clear();
        passwordController.clear();
        confrimController.clear();
      }

      await fyacall.register(email, password);
    }

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
                    height: 15,
                  ),
                  // Mybutton2(text: "Get premium access")
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ), // Shrinks touch area
                          onPressed: () {
                            showbottomSheet(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text,
                              confrim: confrimController.text,
                              ontap: register,

                              //  () async {
                              //   if (passwordControlle.text ==
                              //           confrimController &&
                              //       passwordControlle.text.isNotEmpty) {
                              //     if (fyacall.isLoading) {
                              //       return;
                              //     }
                              //     await fyacall.register(emailController.text,
                              //         passwordControlle.text);

                              //     if (!fyacall.isLoading) {
                              //       showDialog(
                              //         context: context,
                              //         builder: (context) => AlertDialog(
                              //           title: Text("Your set to go 🦇✔"),
                              //           backgroundColor:
                              //               Color.fromARGB(255, 147, 190, 214),
                              //         ),
                              //       );
                              //     }
                              //   } else {
                              //     showDialog(
                              //         context: context,
                              //         builder: (context) => AlertDialog(
                              //               title: Text(
                              //                   "passWOrd and yo bitch ass doesnt match biyatch"),
                              //               backgroundColor: Color.fromARGB(
                              //                   255, 147, 190, 214),
                            );
                          },
                          child: Text(
                            "Get premium access",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFFFFFF),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFFFFFFF)),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ), // Shrinks touch area
                        onPressed: () {
                          showbottomSheet2(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                            ontap: login,

                            // ?  showDialog(
                            //           context: context,
                            //           builder: (context) => AlertDialog(
                            //                 title: Text(
                            //                     "Now what ??? 👀🤣🤣🤷‍♂️"),
                            //                 backgroundColor: Color.fromARGB(
                            //                     255, 147, 190, 214),
                            //               )):

                            //     showDialog(
                            //         context: context,
                            //         builder: (context) => AlertDialog(
                            //               title: Text(
                            //                   "Fill yo bitchh ass up biggah😤"),
                            //               backgroundColor: Color.fromARGB(
                            //                   255, 147, 190, 214),
                            //             )):
                          );
                        },

                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
