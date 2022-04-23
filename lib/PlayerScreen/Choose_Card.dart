import 'package:flutter/material.dart';
import 'CustomNav_Player.dart';
import 'AddCard.dart';
import 'Trainer_info.dart';

class ChooseCard extends StatelessWidget {
  const ChooseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Six()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CustomNavPlayer();
                      }));
                    },

                    // ignore: unnecessary_new
                    child: new Text(
                      "Choose Card",
                      style: TextStyle(fontSize: 20),
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
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0XFFF5F5F5),
                                boxShadow: [
                                  BoxShadow(blurRadius: 10, color: Colors.grey)
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

                                          child: Image.asset(
                                              "assets/images/Image 45.png")),
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
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('4323 XXXX XXXX XXXX',
                                              style: TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              color: Color(0XFF258D51),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            'Edit',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )),
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
                SizedBox(
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MySample();
                      }));
                    },
                    minWidth: double.infinity,
                    color: Color(0XFF215388),
                    height: 50,
                    child: Text(
                      "Add New",
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
              ],
            ),
          ),
        ));
  }
}
