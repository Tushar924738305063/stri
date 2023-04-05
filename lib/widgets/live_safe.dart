import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'live_safe/BusStationCard.dart';
import 'live_safe/HospitalCard.dart';
import 'live_safe/PharmacyCard.dart';
import 'live_safe/PoliceStationCard.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({super.key});

  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong call emergency");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceStationCard(
            onMapFunction: openMap,
          ),
          HospitalCard(
            onMapFunction: openMap,
          ),
          PharmacyCard(
            onMapFunction: openMap,
          ),
          BusStationCard(
            onMapFunction: openMap,
          ),
        ],
      ),
    );
  }
}
