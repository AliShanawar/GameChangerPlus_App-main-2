import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Select_Trainer.dart';
import 'CustomNav_Player.dart';
import 'package:http/http.dart' as http;

class Fourth extends StatefulWidget {
  // Fourth({required this.id});
  //
  // final int id;

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> with SingleTickerProviderStateMixin {
  List data = [];
var img = 'https://gamechanger.amaaizfamilymart.com/public/images/';
  Future selectSports() async {
    // url to registration php script
    var APIURLSport = "https://gamechanger.amaaizfamilymart.com/api/sports";

    //json maping user entered details
    //send  data using http post to our php code
    http.Response reponse = await http.get(Uri.parse(APIURLSport), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });

    //getting response from php code, here
    var resdata = jsonDecode(reponse.body);

    setState(() {
      data = resdata;
    });
    print(data);
  }

  late TabController _controller;
  int _selectedIndex = 0;
  CollectionReference users =
      FirebaseFirestore.instance.collection('parking_location');
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  List park = [];

  Future<QuerySnapshot?> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await _fireStore.collection('parking_location').get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //for a specific field
    // final allData =
    // querySnapshot.docs.map((doc) => doc.get('fieldName')).toList();
    setState(() {
      park = allData;
    });

    print(allData);
  }

  List<Widget> list = [
    Tab(
        child: Text(
      'Men',
      style: TextStyle(color: Colors.white),
    )),
    Tab(
        child: Text(
      'Women',
      style: TextStyle(color: Colors.white),
    )),
    Tab(
      child: Container(),
    ),
    Tab(
      child: Container(),
    ),
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
    selectSports();
    //getData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF215388),
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              'assets/images/Image 12.png',
            ),
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(120, 50, 0, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image(
                  image: AssetImage(
                    'assets/images/Group 721.png',
                  ),
                  fit: BoxFit.cover,
                  height: 130,
                ),
                Image(
                  image: AssetImage(
                    'assets/images/GameChanger+.png',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 240, 0, 0),
            child: Column(
              children: [
                Text(
                  'Select your Sports',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
              child: Column(
                children: [
                  DefaultTabController(
                    length: list.length,
                    child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        controller: _controller,
                        indicatorColor: Colors.white,
                        //   onTap: (index){
                        //   _controller.animateTo(_selectedIndex += 1);
                        // },
                        tabs: list),
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: _controller,
                      children: [
                        tabOption(),
                        tabOption(),
                        Container(),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<List?> press() async {
    FirebaseFirestore.instance
        .collection("parking_location")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        data.add(result.data());
        print(result.data());
      });
    });
    return data;
  }

  tabOption() {
    return GridView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fifth()));
                },
                child: Image.asset(
                  'assets/images/Group 5.png',
                ),
              ),
              Text(
                data[index]['sport_name'],
                style: TextStyle(color: Colors.white),
              ),
            ],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ));
  }
}
