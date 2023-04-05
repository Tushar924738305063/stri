import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:stri/widgets/emergencies/WomenDistress.dart';
import 'package:stri/widgets/emergencies/FirebrigadeEmergency.dart';

import '../emergencies/AmbulanceEmergency.dart';
import '../emergencies/PoliceEmergency.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
          AmbulanceEmergency(),
          FirebrigadeEmergency(),
          WomenDistress()
        ],
      ),
    );
  }
}
