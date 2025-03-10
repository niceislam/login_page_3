import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login_page_3/screen/Controller.dart';

import 'homePage.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool Textoff = false;
  final mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: mykey,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "read"
                  "",
                  style: TextStyle(
                      color: Color(0xFF00147B),
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                Text("/nest",
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 40,
                        fontWeight: FontWeight.w600))
              ],
            ),
            SizedBox(
              height: 60,
            ),
            TextFormField(
                controller: mailController,
                cursorHeight: 20,
                decoration: InputDecoration(
                  hintText: "Account",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.grey.withAlpha(30),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value == "") {
                    return "field can't be empty.";
                  }
                  if (!value.contains("@") || !value.contains(".")) {
                    return "Wrong email.";
                  }
                  ;
                }),
            SizedBox(
              height: 35,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: Textoff,
              cursorHeight: 20,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    Textoff = !Textoff;
                    setState(() {});
                  },
                  child: Textoff == true
                      ? Icon(
                          Icons.visibility_off,
                        )
                      : Icon(
                          Icons.visibility,
                        ),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.grey.withAlpha(30),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value == "") {
                  return "field can't be empty.";
                } else if (value.length < 8) {
                  return "Password not secure.";
                }
              },
            ),
            SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: ()async{

                EasyLoading.show();
                bool status = await DataController.niceData(
                    mail: '${mailController.text}',
                    password: '${passwordController.text}');
                log("============${status}");
                if(status){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=> HomeNextScreen()));
                }



              },
              child: Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pinkAccent,
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
