import 'package:flutter/material.dart';

class RequestPlayer extends StatefulWidget {
  @override
  State<RequestPlayer> createState() => _RequestPlayerState();
}

class _RequestPlayerState extends State<RequestPlayer> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 100),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              pageIndex = 0;
                            });
                          },
                          child: Text(
                            'Accepted',
                            style: TextStyle(fontFamily: 'Jost'),
                          )),
                      Container(
                          height: 2,
                          width: 70,
                          color: pageIndex == 0 ? Colors.black : Colors.white)
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              pageIndex = 1;
                            });
                          },
                          child: Text('Pending',
                              style: TextStyle(fontFamily: 'Jost'))),
                      Container(
                          height: 2,
                          width: 60,
                          color: pageIndex == 1 ? Colors.black : Colors.white)
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 8, 14, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3.0),
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
                                              Text(
                                                'Hammad Habib',
                                                style: TextStyle(
                                                    fontFamily: 'Jost',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text('Session Name',
                                                  style: TextStyle(
                                                      fontFamily: 'Jost',
                                                      fontSize: 12)),
                                            ],
                                          ),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
