// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './custom_nav.dart';
import './login.dart';

class SessionRequest extends StatelessWidget {
  const SessionRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 120),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hammad',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Friday,21 Jan',
                          style: TextStyle(fontFamily: 'Jost', fontSize: 12)),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                      backgroundColor: Color(0XFF215388),
                      radius: 25,
                      child: Image(
                        image: AssetImage("assets/images/Mask Group 12.png"),
                      )),
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 12),
                  width: double.infinity,
                  height: 70,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Color(0XFF215388)),
                          SizedBox(width: 4),
                          Text(
                            'Create a Session',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Jost',
                              color: Color(0XFF215388),
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1.0,
                        color: Color(0XFF215388),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Session Requests',
                    style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0XFFF5F5F5),
                                boxShadow: [
                                  BoxShadow(blurRadius: 10, color: Colors.grey)
                                ]),
                            width: double.infinity,
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                          // backgroundColor: Color(0XFF215388),
                                          radius: 25,
                                          child: Image.asset(
                                              "assets/images/Mask Group 12.png")),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hammad Habib',
                                            style: TextStyle(
                                                fontFamily: 'Jost',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('Session Name',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Jost',
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return LogIn();
                                          }));
                                        },
                                        child: Text(
                                          'Reject',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            fontSize: 16,
                                            color: Color(0XFF215388),
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              color: Color(0XFF215388)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(40),
                                                topRight: Radius.circular(40)),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: MaterialButton(
                                          onPressed: () {},
                                          color: Color(0XFF215388),
                                          height: 37,
                                          child: Text(
                                            "Accept",
                                            style: TextStyle(
                                                fontFamily: 'Jost',
                                                fontSize: 12,
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
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '20 Student Enrolled',
                                    style: TextStyle(
                                      fontFamily: 'Jost',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
