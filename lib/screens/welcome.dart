// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'login.dart';
import '/PlayerScreen/SignUp_Player.dart';
import 'chat_screen.dart';

class WelCome extends StatelessWidget {
  // get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF215388),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Image 11.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              // color: Colors.black
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/images/Group 721.png",
                  ),
                  Image.asset(
                    "assets/images/GameChanger+.png",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Select Your Opiton",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Jost',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUp();
                        }));
                      },
                      child: Text(
                        'Trainer',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Jost'),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpPlayer();
                        }));
                      },
                      child: Text(
                        'Player',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Jost',
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
