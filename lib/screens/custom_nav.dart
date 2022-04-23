import "package:flutter/material.dart";
import 'package:game/screens/User_Notification.dart';
import 'session_request.dart';
import 'Request_Player.dart';
import 'User_Notification.dart';
import 'chat.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Edit_Profile.dart';
import 'Trainer_Account.dart';

class CustomNav extends StatefulWidget {
  const CustomNav({Key? key}) : super(key: key);

  @override
  State<CustomNav> createState() => _CustomNavState();
}

class _CustomNavState extends State<CustomNav> {
  int pageIndex = 0;

  final pages = [
    SessionRequest(),
    Chat(),
    RequestPlayer(),
    UserNotification(),
    // TrainerAccount(),

    // const Page3(),
    // const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0XFF215388),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SessionRequest();
              }));
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  )
                : const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.wechat_outlined,
                    color: Colors.white,
                    size: 30,
                  )
                : const Icon(
                    Icons.wechat_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 30,
                  )
                : const Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  )
                : const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 4;
              });
            },
            icon: pageIndex == 4
                ? const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  )
                : const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
        ],
      ),
    );
  }
}
