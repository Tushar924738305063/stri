import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stri/widgets/home_widgets/CustomCarouel.dart';
import 'package:stri/widgets/home_widgets/custom_appBar.dart';
import 'package:stri/widgets/home_widgets/emergency.dart';
import 'package:stri/widgets/live_safe.dart';

import 'widgets/safehome/SafeHome.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});
  int qIndex = 0;

  // jab bhi us qoute par click ho random qoute aana chahiye

  getRandomQuote() {
    Random random = Random();
    // qIndex = random.nextInt(10); // object created
    setState(() {
      qIndex = random.nextInt(10);
    });
  }

  @override
  void initState() {
    initState();
    getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomAppBar(
                  quoteIndex: qIndex,
                  onTap: () {
                    getRandomQuote();
                  }),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  CustomCarouel(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Emergency",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Emergency(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Explore LiveSafe",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  LiveSafe(),
                  SafeHome(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}


// stateless widget to  stateful widget karna hai to ctrl +.
//stateless widget se ui par changes nahi atta hai runtime pe 
