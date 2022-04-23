// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Select_Sports.dart';
import 'CustomNav_Player.dart';

class ThankYouPage extends StatefulWidget {
  const ThankYouPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

Color themeColor = const Color(0xFF215388);

class _ThankYouPageState extends State<ThankYouPage> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF215388);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/images/card.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Text(
                "Your Session request has been sent successfully.",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "You will be notify once the request is accepted",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CustomNavPlayer();
                  }));
                },
                minWidth: double.infinity,
                color: Color(0XFF215388),
                height: 50,
                child: Text(
                  "Back to home",
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
              ),
            ),

            // Flexible(
            //   child: HomeButton(
            //     title: 'Home',
            //     onTap: () {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
