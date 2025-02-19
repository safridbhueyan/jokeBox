import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:jokeapi/services/mybutton.dart';

InputDecoration inputDecoration({
  String? text1,
  Widget? icon,
}) {
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
    suffixIcon: icon,
  );
}

void showbottomSheet({
  required BuildContext context,
  String? email,
  String? password,
  String? confrim,
}) {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
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
                          decoration: inputDecoration(
                              text1: "Password💀",
                              icon: Icon(Icons.visibility_off_outlined)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: confirm,
                          decoration: inputDecoration(
                              text1: "Confirm Passwords💀",
                              icon: Icon(Icons.visibility_off_outlined)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Mybutton3(
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
