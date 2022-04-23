import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game/screens/location.dart';
import 'package:http/http.dart' as http;

class selectSports extends StatefulWidget {
  selectSports({required this.id,required this.name,
    required this.mail,
    required this.dob,
    required this.gender,
    required this.image});

  final int id;
  final String name;
  final String mail;
  final String dob;
  final String gender;
  var image;
  @override
  State<selectSports> createState() => _selectSportsState();
}

class _selectSportsState extends State<selectSports> {
  List data = [];
  List datatwo = [];

  Future selectSports() async {
    // url to registration php script
    var APIURLSport = "https://gamechanger.amaaizfamilymart.com/api/sports";
    var APIURLPOSTION =
        "https://gamechanger.amaaizfamilymart.com/api/positions";

    //json maping user entered details
    //send  data using http post to our php code
    http.Response reponse = await http.get(Uri.parse(APIURLSport), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    http.Response reponsepos = await http.get(Uri.parse(APIURLPOSTION),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    //getting response from php code, here
    var resdata = jsonDecode(reponse.body);
    var respos = jsonDecode(reponsepos.body);
    setState(() {
      data = resdata;
      datatwo = respos;
    });
    print(data);
    print(datatwo);
  }

  String dropdownvalue = 'abc';
  String dropdownvalueone = 'Test2';
  String _date = "Not set";
  String _time = "Not set";

  // List of items in our dropdown menu
  @override
  void initState() {
    selectSports();
    super.initState();
  }

  // var items =data['sport_name'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Image 14.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                // color: Colors.black
                width: MediaQuery.of(context).size.width,
                height: 700,
                padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Group 722.png",
                    ),
                    Image.asset(
                      "assets/images/GameChanger.png",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                            child: Text('Select sport',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF215388))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            // Initial Value
value: dropdownvalue,
                            validator: (val) {
                              if (val==null) {
                                return "Please enter Date of Birth";
                              }
                              return null;
                            },
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: data.map((items) {
                              return DropdownMenuItem(
                                value: items['id'].toString(),
                                child: Text(
                                  items['sport_name'].toString(),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 180, 0),
                            child: Text('Select Position',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF215388))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            // Initial Value

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: datatwo.map((items) {
                              return DropdownMenuItem(
                                value: items['positions_id'].toString(),
                                child: Text(
                                  items['position_name'].toString(),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalueone = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocationMap(
                            id:widget.id,
                            name: widget.name,
                            mail: widget.mail,
                            dob: widget.dob,
                            gender: widget.dob,
                            image: widget.image,
                            drop: dropdownvalue,
                            dropped: dropdownvalueone,
                          )),
                        );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      color: Color(0XFF215388),
                      elevation: 0,
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
