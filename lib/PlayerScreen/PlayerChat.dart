import 'package:flutter/material.dart';
import 'CustomNav_Player.dart';
import 'PlayerChat_Screen.dart';

class PlayerChat extends StatelessWidget {
  const PlayerChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CustomNavPlayer();
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
                      "Chat",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(right: 12),
                  width: double.infinity,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(35.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Search Here',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PlayerChatScreen();
                    }));
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
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
                                    BoxShadow(
                                        blurRadius: 10, color: Colors.grey)
                                  ]),
                              width: double.infinity,
                              height: 70,
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
                                            Text('12:23',
                                                style: TextStyle(fontSize: 12)),
                                            Text(
                                              'Hammad Habib',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        CircleAvatar(
                                            backgroundColor: Colors.yellow,
                                            radius: 25,
                                            child: Text('2')),
                                      ],
                                    ),
                                  ),
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
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
