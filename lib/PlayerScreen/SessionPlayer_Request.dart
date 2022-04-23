import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'CustomNav_Player.dart';

class SessionPlayerRequest extends StatefulWidget {
  const SessionPlayerRequest({Key? key}) : super(key: key);

  @override
  State<SessionPlayerRequest> createState() => _SessionPlayerRequestState();
}

class _SessionPlayerRequestState extends State<SessionPlayerRequest> {
  int pageIndex = 0;
  String _date = "Not set";
  String _time = "Not set";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CustomNavPlayer();
                      }));
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return CustomNav();
                      // }));
                    },
                    // ignore: unnecessary_new
                    child: new Text("Sessions",
                        style: TextStyle(
                            fontFamily: 'Jost',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  )
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
                            style: TextStyle(
                              fontFamily: 'Jost',
                            ),
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
                          child: Text(
                            'Pending',
                            style: TextStyle(
                              fontFamily: 'Jost',
                            ),
                          )),
                      Container(
                          height: 2,
                          width: 60,
                          color: pageIndex == 1 ? Colors.black : Colors.white)
                    ],
                  ),
                ],
              ),
              Padding(
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
                      itemCount: 5,
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
                                height: 270,
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
                                                'Tariner Name',
                                                style: TextStyle(
                                                    fontFamily: 'Jost',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text('Fitness Trainer',
                                                  style: TextStyle(
                                                      fontFamily: 'Jost',
                                                      fontSize: 12)),
                                            ],
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0XFFFFB743),
                                                      size: 16,
                                                    ),
                                                    Icon(Icons.star,
                                                        color:
                                                            Color(0XFFFFB743),
                                                        size: 16),
                                                    Icon(Icons.star,
                                                        color:
                                                            Color(0XFFFFB743),
                                                        size: 16),
                                                    Icon(Icons.star,
                                                        color:
                                                            Color(0XFFFFB743),
                                                        size: 16),
                                                    Icon(Icons.star,
                                                        color:
                                                            Color(0XFFFFB743),
                                                        size: 16),
                                                  ],
                                                ),
                                                Text(
                                                  '5km Away',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Session Title Here',
                                        style: TextStyle(
                                            fontFamily: 'Jost',
                                            fontSize: 17,
                                            color: Color(0XFF215388)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                                        "sed do eiusmod tempor incididunt ut labore et dolore "
                                        "magna aliqua. Ut enim ad minim veniam,"
                                        " quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,"
                                        " sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                        style: TextStyle(
                                            fontFamily: 'Jost', fontSize: 10),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 4, 4, 0),
                                      child: InkWell(
                                        onTap: () {
                                          DatePicker.showDatePicker(
                                            context,
                                            theme: DatePickerTheme(
                                                containerHeight: 210.0,
                                                backgroundColor:
                                                    Color(0XFF215388)),
                                            showTitleActions: true,
                                            minTime: DateTime(2000, 1, 1),
                                            maxTime: DateTime(2022, 12, 31),
                                            onConfirm: (date) {
                                              print('confirm $date');
                                              _date =
                                                  '${date.year} - ${date.month} - ${date.day}';
                                              setState(() {});
                                            },
                                            currentTime: DateTime.now(),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Date',
                                              style: TextStyle(
                                                  fontFamily: 'Jost',
                                                  color: Color(0XFF215388),
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              '$_date',
                                              style: TextStyle(
                                                  fontFamily: 'Jost',
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                        height: 10, color: Color(0XFF215388)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 4, 4, 0),
                                      child: InkWell(
                                        onTap: () {
                                          DatePicker.showTimePicker(context,
                                              theme: DatePickerTheme(
                                                containerHeight: 210.0,
                                              ),
                                              showTitleActions: true,
                                              onConfirm: (time) {
                                            print('confirm $time');
                                            _time =
                                                '${time.hour} : ${time.minute} : ${time.second}';
                                            setState(() {});
                                          },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.en);
                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Time',
                                              style: TextStyle(
                                                  color: Color(0XFF215388),
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              '$_time',
                                              style: TextStyle(
                                                  color: Color(0XFF215388),
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
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
