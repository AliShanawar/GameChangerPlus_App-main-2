import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'Find_Trainer.dart';
import 'PlayerChat.dart';
import 'Choose_Card.dart';
import 'TarinerNearYou.dart';
import 'Choose_Payment.dart';

class Six extends StatefulWidget {
  const Six({Key? key}) : super(key: key);

  @override
  State<Six> createState() => _SixState();
}

class _SixState extends State<Six> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  String _date = "Not set";
  String _time = "Not set";
  List<Widget> list = [
    Tab(
        child: Text(
      'Sessions',
      style: TextStyle(color: Colors.black),
    )),
    Tab(
        child: Text(
      'Info',
      style: TextStyle(color: Colors.black),
    )),
    Tab(
        child: Text(
      'Review',
      style: TextStyle(color: Colors.black),
    )),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 20),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TrainerNearYou();
                      }));
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ],
              ),
            )),
        body: Stack(
          children: [
            Image(
              image: AssetImage(
                'assets/images/Image 13.png',
              ),
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(36.0, 36.0, 36.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/Mask Group 4.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Trainer Name Here',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      color: Color(0XFF215388),
                      fontSize: 18),
                ),
                Text(
                  'Cricket Coach',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      color: Color(0XFF215388),
                      fontSize: 18),
                ),
                Text(
                  'Position',
                  style: TextStyle(
                    fontFamily: 'Jost',
                    color: Color(0XFF215388),
                    fontSize: 18,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      DefaultTabController(
                        length: list.length,
                        child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            controller: _controller,
                            indicatorColor: Colors.black,
                            //   onTap: (index){
                            //   _controller.animateTo(_selectedIndex += 1);
                            // },
                            tabs: list),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      firstTab(context),
                      secondTab(context),
                      thirdTab(context)
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget firstTab(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Session Text Here',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            color: Color(0XFF215388),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                        "sed do eiusmod tempor incididunt ut labore et dolore "
                        "magna aliqua. Ut enim ad minim veniam,"
                        " quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,"
                        " sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(fontFamily: 'Jost', fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: InkWell(
                          onTap: () {
                            DatePicker.showDatePicker(
                              context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                                backgroundColor: Color(0XFF215388),
                              ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  color: Color(0XFF215388),
                                ),
                              ),
                              Text(
                                '$_date',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  color: Color(0XFF215388),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 20,
                        color: Color(0XFF215388),
                      ),
                      InkWell(
                        onTap: () {
                          DatePicker.showTimePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                              ),
                              showTitleActions: true, onConfirm: (time) {
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Time',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                color: Color(0XFF215388),
                              ),
                            ),
                            Text(
                              '$_time',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                color: Color(0XFF215388),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ChooseCard();
                                  }));
                                },
                                color: Color(0XFF215388),
                                height: 45,
                                child: Text(
                                  "Send Request",
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget secondTab(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 12),
              child: Column(
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                    "sed do eiusmod tempor incididunt ut labore et dolore "
                    "magna aliqua. Ut enim ad minim veniam,"
                    " quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,"
                    " sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextStyle(fontFamily: 'Jost', fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PlayerChat();
                              }));
                            },
                            color: Color(0XFF215388),
                            height: 45,
                            child: Text(
                              "Chat",
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
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget thirdTab(BuildContext context) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 3,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/Mask Group 8.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text('Adam Hills',
                                  style: TextStyle(
                                      fontFamily: 'Jost', color: Colors.black)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFE814),
                                    size: 18,
                                  ),
                                  Icon(Icons.star,
                                      color: Color(0xFFFFE814), size: 18),
                                  Icon(Icons.star,
                                      color: Color(0xFFFFE814), size: 18),
                                  Icon(Icons.star,
                                      color: Color(0xFFFFE814), size: 18),
                                  Icon(Icons.star,
                                      color: Color(0xFFFFE814), size: 18)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                      "sed do eiusmod tempor incididunt ut labore et dolore "
                      "magna aliqua. Ut enim ad minim veniam,",
                      style: TextStyle(fontFamily: 'Jost', fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
