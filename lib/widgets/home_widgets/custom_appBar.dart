import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stri/utils/quotes.dart';

class CustomAppBar extends StatelessWidget {
  // const CustomAppBar({super.key});

  Function? onTap;
  int? quoteIndex;
  CustomAppBar({
    this.onTap,
    this.quoteIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        child: Text(
          sweetSayings[quoteIndex!],
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}




// inkwell : kisibi widget ko clickable banana  (wrap with widget karke inkwell )
// agar red borders nahi ja rahi hai to ? ya ! symbol ka use karna hai nullsafety ko follow karta hai isliye 
