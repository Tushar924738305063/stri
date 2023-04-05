import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stri/widgets/home_widgets/safewebview.dart';

import '../../utils/quotes.dart';

class CustomCarouel extends StatelessWidget {
  const CustomCarouel({super.key});

  void navigateToRoute(BuildContext context, Widget route) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: List.generate(
          imageSliders.length,
          (index) => Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    if (index == 0) {
                      navigateToRoute(
                          context,
                          SafeWebView(
                              url:
                                  "https://blog.mygov.in/her-story-the-women-of-india/"));
                    } else if (index == 1) {
                      navigateToRoute(
                          context,
                          SafeWebView(
                              url:
                                  "https://blog.mygov.in/her-story-the-women-of-india/"));
                    } else if (index == 2) {
                      navigateToRoute(
                          context,
                          SafeWebView(
                              url:
                                  "https://blog.mygov.in/her-story-the-women-of-india/"));
                    } else {
                      navigateToRoute(
                          context,
                          SafeWebView(
                              url:
                                  "https://blog.mygov.in/her-story-the-women-of-india/"));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(imageSliders[index]))),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent
                        ]),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8, left: 8),
                          child: Text(
                            articleTitle[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
    ));
  }
}

// custom carousel slider se apan slider bana sakte hai 
// lekin usme bhi box decoration karna hi padta hai

