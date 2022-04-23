import 'dart:convert';

import 'package:flutter/material.dart';
import 'SignUp_Player.dart';
import 'Select_Sports.dart';
import 'Forget_Password.dart';
import 'package:http/http.dart' as http;

class LogInPlayer extends StatefulWidget {
  const LogInPlayer({Key? key}) : super(key: key);

  @override
  State<LogInPlayer> createState() => _LogInPlayerState();
}

class _LogInPlayerState extends State<LogInPlayer> {
  bool isLoading = true;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var APIURL = "https://gamechanger.amaaizfamilymart.com/api/login";
  List data = [];

  Future login() async {
    // url to registration php script
    var APIURL = "https://gamechanger.amaaizfamilymart.com/api/RegisterPlayer";

    //json maping user entered details
    Map mapeddate = {
      'email': _email.text,
      'password': _password.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),
        body: mapeddate,
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    //getting response from php code, here
    data = jsonDecode(reponse.body.toString());
    setState(() {
      data = this.data;
    });
    print("DATA: ${data}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                  height: 800,
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
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 26,
                                  color: Color(0XFF215388),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter  email";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return "Please enter valid email";
                          }
                          return null;
                        },
                        onSaved: (email) {},
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          }

                          return null;
                        },
                        controller: _password,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      MaterialButton(
                        onPressed: () {
                          login();
                        },
                        minWidth: double.infinity,
                        color: Color(0XFF215388),
                        height: 50,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SignUpPlayer();
                                }));
                              },
                              child: Text("Don't have an account? ")),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SignUpPlayer();
                                }));
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgetPassword();
                          }));
                        },
                        child: Text(
                          'Forgot Password?',
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
