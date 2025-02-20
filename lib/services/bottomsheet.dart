import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:jokeapi/services/allprovider.dart';
import 'package:jokeapi/services/firebaseAuth.dart';
import 'package:jokeapi/services/mybutton.dart';
import 'package:provider/provider.dart';

InputDecoration inputDecoration(
    {String? text1, Widget? icon, void Function()? onTap}) {
  return InputDecoration(
    label: Text(text1!),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(12),
    ),
    labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade400,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    fillColor: Color(0xFFFFFFFF),
    suffixIcon: GestureDetector(onTap: onTap, child: icon),
  );
}

void showbottomSheet({
  required BuildContext context,
  String? email,
  String? password,
  String? confrim,
  dynamic Function()? ontap,
}) {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFFFFFFFF),
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) {
        var getx = context.watch<Allprovider>();

        return Container(
          width: double.infinity,
          height: 460,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: DottedBorder(
              padding: EdgeInsets.all(20),
              borderType: BorderType.RRect,
              radius: Radius.circular(16),
              dashPattern: [6, 3],
              color: Colors.grey.shade400,
              strokeWidth: 2,
              child: Center(
                child: Container(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                    child: Column(
                      children: [
                        Text(
                          "🤡",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Register TO GET PREMIUM STUFFS",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: inputDecoration(
                              text1: "Email🐸",
                              icon: Icon(Icons.email_outlined)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: getx.isVisible,
                          decoration: inputDecoration(
                            text1: "Password💀",
                            icon: getx.isVisible
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined),
                            onTap: getx.toggle,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: confirmPass,
                          obscureText: getx.isVisible,
                          decoration: inputDecoration(
                            text1: "Confirm Passwords💀",
                            icon: getx.isVisible
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined),
                            onTap: () => getx.toggle(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Mybutton3(
                          ontap: ontap,

                          // () async {
                          //   if (password.text == confirmPass &&
                          //       password.text.isNotEmpty) {
                          //     if (fyacall.isLoading) {
                          //       return;
                          //     }
                          //     await fyacall.register(email.text, password.text);

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
                          //               backgroundColor:
                          //                   Color.fromARGB(255, 147, 190, 214),
                          //             ));
                          //   }
                          // },

                          text: "Register",
                          colorx: const Color.fromARGB(255, 48, 82, 110),
                          colory: Color(0xFFFFFFFF),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

void showbottomSheet2({
  required BuildContext context,
  String? email,
  String? password,
  dynamic Function()? ontap,
}) {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFFFFFFFF),
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) {
        var getx = context.watch<Allprovider>();
        // final fyacall = context.watch<Fya>();
        return Container(
          width: double.infinity,
          height: 400,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: DottedBorder(
              padding: EdgeInsets.all(20),
              borderType: BorderType.RRect,
              radius: Radius.circular(16),
              dashPattern: [6, 3],
              color: Colors.grey.shade400,
              strokeWidth: 2,
              child: Center(
                child: Container(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Login to see shit 💀",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: inputDecoration(
                              text1: "Email🐸",
                              icon: Icon(Icons.email_outlined)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: getx.isVisible,
                          decoration: inputDecoration(
                            text1: "Password💀",
                            icon: getx.isVisible
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined),
                            onTap: getx.toggle,
                          ),
                          onTap: ontap,

                          //  () async {
                          //   if (email.text.isNotEmpty &&
                          //       password.text.isNotEmpty) {
                          //     if (fyacall.isLoading) {
                          //       return;
                          //     }
                          //     await fyacall.login(email.text, password.text);
                          //     if (fyacall.isLoading)
                          //       showDialog(
                          //           context: context,
                          //           builder: (context) => AlertDialog(
                          //                 title:
                          //                     Text("Now what ??? 👀🤣🤣🤷‍♂️"),
                          //                 backgroundColor: Color.fromARGB(
                          //                     255, 147, 190, 214),
                          //               ));
                          //   } else {
                          //     showDialog(
                          //         context: context,
                          //         builder: (context) => AlertDialog(
                          //               title: Text(
                          //                   "Fill yo bitchh ass up biggah😤"),
                          //               backgroundColor:
                          //                   Color.fromARGB(255, 147, 190, 214),
                          //             ));
                          //   }
                          // },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Mybutton3(
                          text: "Login",
                          colorx: const Color.fromARGB(255, 48, 82, 110),
                          colory: Color(0xFFFFFFFF),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
