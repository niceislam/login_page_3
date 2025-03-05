import 'package:flutter/material.dart';

class HomeNextScreen extends StatefulWidget {
  const HomeNextScreen({super.key});

  @override
  State<HomeNextScreen> createState() => _HomeNextScreenState();
}

class _HomeNextScreenState extends State<HomeNextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text(
          "Next Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.pinkAccent,
        ),
      ),
    );
  }
}
