import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SafeHome extends StatelessWidget {
  showModelSafeHome(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.4,
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),

          // width: MediaQuery.of(context).size.width * 0.7,
        );
      },
    );
  }

  const SafeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModelSafeHome(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Send Location',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Share Location'),
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/route.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
