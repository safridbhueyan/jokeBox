import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final Function()? ontap;
  const Mybutton({
    super.key,
    required this.text,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        // height: 36,
        // width: 80,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  offset: Offset(5.5, 8.5),
                  blurRadius: 15.5),
            ]),
        child: Center(
          child: Text(
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class Mybutton2 extends StatelessWidget {
  final String text;
  final Function()? ontap;
  const Mybutton2({
    super.key,
    required this.text,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  offset: Offset(5.5, 8.5),
                  blurRadius: 15.5),
            ]),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
