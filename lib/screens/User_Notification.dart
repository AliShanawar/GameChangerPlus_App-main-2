import 'package:flutter/material.dart';
import 'custom_nav.dart';

class UserNotification extends StatelessWidget {
  const UserNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 40, 14, 10),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CustomNav();
                    }));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  // ignore: unnecessary_new
                  child: new Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Jost',
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Color(0XFF215388),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit.",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '3 Hours Ago',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Jost',
                            fontSize: 14),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit.",
                    style: TextStyle(color: Color(0XFF215388), fontSize: 14),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '3 Hours Ago',
                        style: TextStyle(
                            color: Color(0XFF215388),
                            fontFamily: 'Jost',
                            fontSize: 14),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit.",
                    style: TextStyle(color: Color(0XFF215388), fontSize: 14),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '3 Hours Ago',
                        style: TextStyle(
                            color: Color(0XFF215388),
                            fontFamily: 'Jost',
                            fontSize: 14),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit.",
                    style: TextStyle(color: Color(0XFF215388), fontSize: 14),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '3 Hours Ago',
                        style: TextStyle(
                            color: Color(0XFF215388),
                            fontFamily: 'Jost',
                            fontSize: 14),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet consectetur adipisicing elit Lorem ipsum dolor sit amet consectetur adipisicing elit.Lorem ipsum dolor sit amet consectetur adipisicing elit.",
                    style: TextStyle(color: Color(0XFF215388), fontSize: 14),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '3 Hours Ago',
                        style: TextStyle(
                            color: Color(0XFF215388),
                            fontFamily: 'Jost',
                            fontSize: 14),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
