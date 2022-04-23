import 'package:flutter/material.dart';
import './welcome.dart';
import 'custom_nav.dart';
import 'Edit_Profile.dart';
import 'ForgetPassword.dart';
import 'location.dart';

class TrainerAccount extends StatelessWidget {
 // TrainerAccount({required this.id,required this.name,
 //   required this.mail,
 //   required this.dob,
 //   required this.gender,
 //   required this.image,
 //   required this.drop,
 //   required this.dropped});
 // final int id;
 // final String name;
 // final String mail;
 // final String dob;
 // final String gender;
 // final String drop;
 // final String dropped;
 // var image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 70),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 40, 14, 10),
              child: Row(
                children: [
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
                      "Account",
                      style: TextStyle(fontFamily: 'Jost', fontSize: 30),
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
                  height: 25,
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0XFF215388),
                        ),
                        width: double.infinity,
                        height: 80,
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
                                    width: 14,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ramia Gulzar',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Jost',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('abc@gmail.com',
                                          style: TextStyle(
                                              fontFamily: 'Jost',
                                              color: Colors.white,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return EditProfile();
                                      }));
                                    },
                                    child: Image.asset(
                                        "assets/images/Icon awesome-edit.png"),
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
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0XFFd3d3d3)),
                        width: double.infinity,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(23.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                      "assets/images/Icon material-lock-open.png"),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ForgetPasswordTrainer();
                                      }));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Change Password',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
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
                    // ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return Location();
                    // }));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFd3d3d3)),
                          width: double.infinity,
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(23.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/Icon material-location-on.png"),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Change Location',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                      ),

                      MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return WelCome();
                          }));
                        },
                        minWidth: double.infinity,
                        color: Color(0XFFE32525),
                        height: 50,
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              fontFamily: 'Jost',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),

                      // SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
